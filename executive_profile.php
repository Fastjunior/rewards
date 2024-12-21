<?php 
session_start();
include "database.php";
include "functions.php";

// Führungskraft ID und Company ID aus URL
$executive_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$company_id = isset($_GET['company_id']) ? intval($_GET['company_id']) : 0;

// Profildaten abrufen mit erweiterter Abfrage (ohne user_online Tabelle)
$profile_query = "SELECT sr.*,
                 (SELECT COUNT(*) FROM superior_review_followers 
                  WHERE superior_review_id = sr.superior_review_id) as followers_count,
                 c.company_title, 
                 c.company_location,
                 u.last_activity,
                 sr.superior_review_experience  # Korrekte Spalte wie im Dashboard
                 FROM superior_review sr
                 JOIN company c ON sr.company_id = c.company_id 
                 LEFT JOIN user u ON sr.user_id = u.user_id
                 WHERE sr.superior_review_id = $executive_id 
                 AND sr.company_id = $company_id";

$profile_result = mysqli_query($con, $profile_query);

if (mysqli_num_rows($profile_result) == 0) {
    header("Location: index.php");
    exit();
}

$profile = mysqli_fetch_assoc($profile_result);

// Online Status prüfen (15 Minuten Timeout)
$is_online = false;
if (!empty($profile['last_activity'])) {
    $is_online = (time() - strtotime($profile['last_activity'])) < 900;
}

// Online Status prüfen (15 Minuten Timeout)
$is_online = false;
if (isset($profile['last_online']) && !empty($profile['last_online'])) {
    $is_online = (time() - strtotime($profile['last_online'])) < 900;
}

// Follow Status prüfen
$is_following = false;
if (isset($_SESSION['user_id'])) {
    $follow_check = mysqli_query($con, "SELECT follower_id 
                                      FROM superior_review_followers 
                                      WHERE superior_review_id = $executive_id 
                                      AND user_id = {$_SESSION['user_id']}");
    $is_following = mysqli_num_rows($follow_check) > 0;
}

// Bewertungen mit Kategorien abrufen
$reviews_query = "SELECT sr.*, 
    sr.superior_review_timestamp,
    (SELECT AVG(srs.superior_review_stars) 
     FROM superior_review_star srs 
     WHERE srs.superior_review_id = sr.superior_review_id) AS star_avg,
    GROUP_CONCAT(
        CONCAT(
            src.superior_review_subcategory_name, 
            ':', 
            srs.superior_review_stars,
            ':', 
            srs.superior_review_text
        ) SEPARATOR '||'
    ) as category_details
FROM superior_review sr
LEFT JOIN superior_review_star srs ON sr.superior_review_id = srs.superior_review_id
LEFT JOIN superior_review_subcategory src ON srs.superior_review_subcategory_id = src.superior_review_subcategory_id
WHERE sr.superior_review_id = $executive_id 
AND sr.review_published = 1
GROUP BY sr.superior_review_id
ORDER BY sr.superior_review_timestamp DESC";

$reviews_result = mysqli_query($con, $reviews_query);
?>

<!DOCTYPE html>
<html lang="de">
<head>
   <?php include "header.php" ?>
    <!-- Falls nicht bereits in header.php enthalten -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Root Variables */
        :root {
            --primary-color: #0a66c2;
            --secondary-color: #057642;
            --text-color: #000000E6;
            --background-light: #f3f2ef;
            --border-color: #00000014;
            --success-color: #057642;
            --online-color: #057642;
        }
* {
        text-transform: none !important;
        font-family: 'Poppins', sans-serif;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    /* Base Styles */
    body {
        background-color: var(--background-light);
        color: var(--text-color);
        font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto;
        margin: 0;
        padding-top: 76px;
    }
        /* Base Styles */
        body {
            background-color: var(--background-light);
            color: var(--text-color);
            font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto;
            margin: 0;
            padding-top: 76px; /* Für fixed navbar */
        }
.claim-profile-button {
    background: var(--success-color);
    color: white;
    border: none;
}

.claim-profile-button:hover {
    background: #046035;
    transform: translateY(-1px);
}
        /* Container Styles */
        .profile-container {
            max-width: 1128px;
            margin: 0 auto;
            padding: 20px 16px;
        }

        /* Card Styles */
        .profile-card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 0 1px var(--border-color);
            margin-bottom: 16px;
            overflow: hidden;
        }

.btn-toggle-details {
    padding: 6px 16px;
    border-radius: 16px;
    font-weight: 600;
    font-size: 16px;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: all 0.2s;
    text-decoration: none;
    background: transparent;
    color: var(--primary-color);
    border: 1px solid var(--primary-color);
    margin-top: 16px;
}

.btn-toggle-details:hover {
    background: rgba(10, 102, 194, 0.1);
    transform: translateY(-1px);
}
        .card-header {
            padding: 16px 24px;
            border-bottom: 1px solid var(--border-color);
        }

        .card-header h2 {
            font-size: 20px;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-body {
            padding: 24px;
        }

        /* Profile Background & Picture */
        .profile-background {
            height: 200px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }

        .profile-info-container {
            padding: 24px;
            position: relative;
        }

        .profile-picture-container {
            position: absolute;
            top: -90px;
            left: 24px;
            border-radius: 50%;
            border: 4px solid #fff;
            width: 160px;
            height: 160px;
            background: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .profile-picture {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Status Indicators */
        .profile-status {
            position: absolute;
            bottom: 5px;
            right: 5px;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            border: 3px solid #fff;
            background: var(--online-color);
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        }

        .profile-status.offline {
            background: #666;
        }

        .job-seeking-badge {
            position: absolute;
            top: 5px;
            right: 5px;
            background: var(--success-color);
            color: #fff;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .hiring-badge {
            background: var(--primary-color);
        }

        /* Profile Content */
        .profile-content {
            margin-left: 190px;
            padding-top: 8px;
        }

        .profile-name {
            font-size: 24px;
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 4px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .profile-headline {
            font-size: 16px;
            color: rgba(0,0,0,0.9);
            margin-bottom: 8px;
        }

        .profile-location {
            font-size: 14px;
            color: rgba(0,0,0,0.6);
            display: flex;
            align-items: center;
            gap: 4px;
            margin-bottom: 16px;
        }

        /* Action Buttons */
        .profile-actions {
            display: flex;
            gap: 12px;
            margin-top: 16px;
            flex-wrap: wrap;
        }

        .action-button {
            padding: 6px 16px;
            border-radius: 16px;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            text-decoration: none;
        }

        .primary-button {
            background: var(--primary-color);
            color: #fff;
            border: none;
        }

        .primary-button:hover {
            background: #004182;
            transform: translateY(-1px);
        }

        .secondary-button {
            background: transparent;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }

        .secondary-button:hover {
            background: rgba(10, 102, 194, 0.1);
            transform: translateY(-1px);
        }

        /* Stats Section */
        .profile-stats {
            display: flex;
            gap: 24px;
            padding: 24px;
            border-top: 1px solid var(--border-color);
            flex-wrap: wrap;
        }

        .stat-item {
            display: flex;
            flex-direction: column;
            min-width: 120px;
        }

        .stat-value {
            font-size: 16px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .stat-label {
            font-size: 14px;
            color: rgba(0,0,0,0.6);
        }

        /* Skills Section */
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .skill-badge {
            background: rgba(10, 102, 194, 0.1);
            color: var(--primary-color);
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 14px;
            font-weight: 500;
        }

        /* Review Styles */
        .review-card {
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
        }

        .review-card:hover {
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .review-meta {
            display: flex;
            gap: 16px;
            color: rgba(0,0,0,0.6);
            font-size: 14px;
        }

        .review-rating {
            display: flex;
            align-items: center;
            gap: 4px;
            color: var(--primary-color);
            font-weight: 600;
        }

        .rating-badge {
            background: rgba(10, 102, 194, 0.1);
            color: var(--primary-color);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        /* Review Details */
        .review-details {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
            border-top: 1px solid var(--border-color);
            margin-top: 16px;
        }

        .category-rating {
            padding: 16px 0;
            border-bottom: 1px solid var(--border-color);
        }

        .category-rating:last-child {
            border-bottom: none;
        }

        .category-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .category-name {
            font-weight: 500;
        }

        .category-stars {
            color: #ffc107;
        }

        .category-text {
            color: rgba(0,0,0,0.6);
            font-size: 14px;
            margin: 0;
        }

        /* Toast Notifications */
        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }

        .toast {
            padding: 12px 24px;
            border-radius: 8px;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            color: var(--text-color);
            animation: slideIn 0.3s ease forwards;
        }

        .toast.success { border-left: 4px solid var(--success-color); }
        .toast.error { border-left: 4px solid #dc3545; }
        .toast.info { border-left: 4px solid var(--primary-color); }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-content {
                margin-left: 0;
                margin-top: 80px;
            }

            .profile-picture-container {
                left: 50%;
                transform: translateX(-50%);
                width: 120px;
                height: 120px;
            }

            .profile-actions {
                justify-content: center;
            }

            .profile-stats {
                justify-content: center;
                text-align: center;
            }
.collapse-icon {
        transition: transform 0.3s ease;
    }
    
    .collapse-icon.collapsed {
        transform: rotate(180deg);
    }
    
    .card-header {
        cursor: pointer;
    }
    
    .card-header:hover {
        background-color: rgba(0,0,0,0.02);
    }
.about-content {
    white-space: normal;
    word-wrap: break-word;
}

.about-content p {
    margin-bottom: 1rem;
    line-height: 1.6;
    color: #333;
}

.about-content .section-title {
    margin-top: 1.5rem;
    margin-bottom: 0.5rem;
    color: var(--primary-color);
    font-size: 1.1em;
}

.about-content br {
    display: block;
    margin: 1rem 0;
    content: "";
}

.card-body {
    padding: 1.25rem;
}
.formatted-text {
    white-space: normal;
    word-wrap: break-word;
}

.formatted-text p {
    margin-bottom: 1rem;
    line-height: 1.6;
}
.profile-picture {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    border: 5px solid #fff;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
    background: #f8f9fa;
    display: flex;
    align-items: center;
    justify-content: center;
}

.profile-picture-container {
    position: relative;
    margin-bottom: 20px;
}

.profile-picture img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 50%;
}
.personality-dimension {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.progress {
    background-color: #e9ecef;
    border-radius: 5px;
    overflow: visible !important;
    position: relative;
}

.progress-bar {
    border-radius: 5px;
}

.average-marker {
    z-index: 3;
    pointer-events: none;
}

.badge-light {
    background-color: rgba(10, 102, 194, 0.1);
    color: var(--primary-color);
    padding: 8px 12px;
    margin-right: 8px;
    margin-bottom: 8px;
}
.review-group {
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1rem;
}

.review-group:last-child {
    border-bottom: none;
}

.review-header {
    cursor: pointer;
}

.rating-stars {
    color: #ffd700;
}

.review-details {
    background-color: var(--background-light);
    padding: 1rem;
    border-radius: 8px;
    margin-top: 0.5rem;
}

.review-item {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
}

.rating-stars {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    margin: 5px 0;
}

.rating-value {
    font-weight: bold;
    margin-right: 8px;
}

.text-warning {
    color: #ffd700 !important;
}

.review-category-box {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 15px;
    height: 100%;
    border: 1px solid #e0e0e0;
}

.category-name {
    font-weight: bold;
    color: #0a66c2;
    margin-bottom: 8px;
}

.category-comment {
    margin-top: 10px;
    font-size: 0.9rem;
    color: #666;
}

.show-more-btn {
    color: #0a66c2;
    text-decoration: none;
    padding: 0;
}

.show-more-btn:hover {
    color: #004182;
    text-decoration: underline;
}

.review-text {
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    margin-bottom: 20px;
    border-left: 4px solid #0a66c2;
}
.badge {
        margin-left: 8px;
        padding: 6px 12px;
        border-radius: 12px;
    }

    .badge i {
        margin-right: 4px;
    }

    .bg-info {
        background-color: #17a2b8;
        color: white;
    }

    .bg-primary {
        background-color: #0a66c2;
        color: white;
    }

    #statusForm .form-check {
        padding: 12px;
        border-radius: 8px;
        background: #f8f9fa;
        margin-bottom: 12px;
        transition: all 0.3s ease;
    }

    #statusForm .form-check:hover {
        background: #e9ecef;
    }

    #statusForm .form-check-input {
        margin-top: 0.3em;
    }

    #statusForm .form-check-label {
        cursor: pointer;
    }

    #statusForm .form-check-label i {
        margin-right: 8px;
        color: #0a66c2;
    }
</style>
</head>
<body>
    <?php 
if (file_exists("nav.php")) {
    include "nav.php";
} elseif (file_exists("navbar.php")) {
    include "navbar.php";
} 
?>

    <div class="profile-container">
        <!-- Profile Card -->
        <div class="profile-card">
            <div class="profile-background"></div>
            <div class="profile-info-container">
                <!-- Profile Picture -->
               <div class="profile-picture-container">
    <?php if (!empty($profile['profile_image_url'])): ?>
        <img src="<?php echo htmlspecialchars($profile['profile_image_url']); ?>" 
             alt="Profilbild" class="profile-picture">
    <?php else: ?>
        <div class="profile-picture">
            <i class="fas fa-user fa-4x" style="color: #666;"></i>
        </div>
    <?php endif; ?>
    
    <div class="profile-status <?php echo $is_online ? '' : 'offline'; ?>" 
         title="<?php echo $is_online ? 'Online' : 'Offline'; ?>">
    </div>
</div>

                <div class="profile-content">
                    <h1 class="profile-name">
                        <?php 
                        $fullName = '';
                        if (isset($profile['superior_review_firstname'])) {
                            $fullName .= $profile['superior_review_firstname'];
                        }
                        if (isset($profile['superior_review_lastname'])) {
                            $fullName .= ' ' . $profile['superior_review_lastname'];
                        }
                        echo htmlspecialchars(trim($fullName)); 
                        ?>
                        <?php if ($is_online): ?>
                            <span class="badge bg-success" style="font-size: 12px;">Online</span>
                        <?php endif; ?>
                        
                        <!-- Neue Status-Badges HIER EINFÜGEN -->
                        <?php if ($profile['open_to_offers']): ?>
                            <span class="badge bg-info" style="font-size: 12px;">
                                <i class="fas fa-briefcase"></i> Offen für Angebote
                            </span>
                        <?php endif; ?>
                        
                        <?php if ($profile['is_hiring']): ?>
                            <span class="badge bg-primary" style="font-size: 12px;">
                                <i class="fas fa-user-plus"></i> Sucht Mitarbeiter
                            </span>
                        <?php endif; ?>
                    </h1>
                    
                    <div class="profile-headline">
                        <?php echo htmlspecialchars($profile['superior_review_position']); ?> bei 
                        <a href="company.php?id=<?php echo $profile['company_id']; ?>" 
                           class="company-link">
                            <?php echo htmlspecialchars($profile['company_title']); ?>
                        </a>
                    </div>
                    
                   <?php if (isset($profile['superior_review_location']) && !empty($profile['superior_review_location'])): ?>
    <div class="profile-location">
        <i class="fas fa-map-marker-alt"></i>
        <?php echo htmlspecialchars($profile['superior_review_location']); ?>
    </div>
<?php endif; ?>

                    <!-- Profile Actions -->
                   <div class="profile-actions">
    <?php if (isset($_SESSION['user_id'])): ?>
        <button class="action-button primary-button" 
                onclick="sendMessage(<?php echo $executive_id; ?>)">
            <i class="fas fa-envelope"></i> Nachricht senden
        </button>
        
        <button class="action-button secondary-button" 
                onclick="followExecutive(<?php echo $executive_id; ?>)" 
                id="followButton">
            <i class="fas fa-<?php echo $is_following ? 'user-minus' : 'user-plus'; ?>"></i>
            <?php echo $is_following ? 'Entfolgen' : 'Folgen'; ?>
        </button>
        
        <?php if (isset($profile['is_hiring']) && $profile['is_hiring']): ?>
            <button class="action-button primary-button" 
                    onclick="window.location.href='apply.php?id=<?php echo $executive_id; ?>'">
                <i class="fas fa-paper-plane"></i> Bewerbung senden
            </button>
        <?php endif; ?>
    <?php else: ?>
        <button class="action-button primary-button" 
                onclick="window.location.href='login.php'">
            <i class="fas fa-sign-in-alt"></i> Anmelden für Interaktion
        </button>
        
        <button class="action-button secondary-button claim-profile-button" 
                onclick="window.location.href='claim_profile.php?id=<?php echo $executive_id; ?>'">
            <i class="fas fa-user-check"></i> Sind Sie das? Profil beanspruchen
        </button>
    <?php endif; ?>
</div>
                </div>
            </div>

            <!-- Profile Stats -->
            <div class="profile-stats">
                <div class="stat-item">
                    <span class="stat-value">
                        <?php echo number_format($profile['followers_count'], 0, ',', '.'); ?>
                    </span>
                    <span class="stat-label">Follower</span>
                </div>
                
                <div class="stat-item">
                    <span class="stat-value">
                        <?php 
                            $avg_rating = mysqli_fetch_assoc(mysqli_query($con, 
                                "SELECT AVG(superior_review_stars) as avg 
                                 FROM superior_review_star 
                                 WHERE superior_review_id = $executive_id"))['avg'];
                            echo number_format($avg_rating, 1);
                        ?>
                    </span>
                    <span class="stat-label">Durchschnittliche Bewertung</span>
                </div>
                
                <div class="stat-item">
                    <span class="stat-value">
                        <?php 
                            echo date('Y', strtotime($profile['superior_review_year_from'])) . ' - ' . 
                                 ($profile['superior_review_year_to'] ? 
                                  date('Y', strtotime($profile['superior_review_year_to'])) : 'heute');
                        ?>
                    </span>
                    <span class="stat-label">Beschäftigungszeitraum</span>
                </div>
            </div>
        </div>
        <!-- About Section -->
<div class="profile-card">
    <div class="card-header d-flex justify-content-between align-items-center" 
         data-bs-toggle="collapse" 
         data-bs-target="#aboutContent" 
         aria-expanded="false" 
         aria-controls="aboutContent">
        <h2><i class="fas fa-user"></i> Über mich</h2>
        <i class="fas fa-chevron-up collapse-icon collapsed"></i>
    </div>
    <div class="collapse" id="aboutContent">
        <div class="card-body">
        <div class="about-content">
            <?php 
            if (!empty($profile['superior_review_experience'])) {
                $text = $profile['superior_review_experience'];
                
                // Entferne die Escape-Sequenzen und konvertiere zu echten Zeilenumbrüchen
                $text = str_replace(['\\r\\n', '\\n', '\\r'], "\n", $text);
                
                // Entferne doppelte Zeilenumbrüche
                $text = preg_replace("/\n{3,}/", "\n\n", $text);
                
                // Teile in Absätze
                $paragraphs = explode("\n", $text);
                
                // Gebe jeden Absatz aus
                foreach ($paragraphs as $paragraph) {
                    $paragraph = trim($paragraph);
                    if (!empty($paragraph)) {
                        // Prüfe ob es eine Überschrift ist (einzelne Zeile ohne Punkt)
                        if (!str_contains($paragraph, '.') && strlen($paragraph) < 50) {
                            echo '<p class="section-title"><strong>' . htmlspecialchars($paragraph) . '</strong></p>';
                        } else {
                            echo '<p>' . htmlspecialchars($paragraph) . '</p>';
                        }
                    } elseif ($paragraph === '') {
                        echo '<br>';
                    }
                }
            } else {
                echo '<p class="text-muted">Keine Beschreibung vorhanden</p>';
            }
            ?>
        </div>
    </div>
</div>

        <!-- Experience Section -->
<div class="profile-card">
    <div class="card-header d-flex justify-content-between align-items-center" 
         data-bs-toggle="collapse" 
         data-bs-target="#experienceContent" 
         aria-expanded="false" 
         aria-controls="experienceContent">
        <h2><i class="fas fa-briefcase"></i> Berufserfahrung</h2>
        <i class="fas fa-chevron-up collapse-icon collapsed"></i>
    </div>
    <div class="collapse" id="experienceContent">
        <div class="card-body">
        <?php if (!empty($profile['superior_review_experience'])): ?>
            <?php 
            $experiences = json_decode($profile['superior_review_experience'], true);
            if (is_array($experiences)): 
                foreach ($experiences as $experience): 
            ?>
                <div class="experience-item">
                    <div class="experience-header">
                        <h3><?php echo htmlspecialchars($experience['title']); ?></h3>
                        <span class="experience-company">
                            <?php echo htmlspecialchars($experience['company']); ?>
                        </span>
                        <span class="experience-date">
                            <?php echo htmlspecialchars($experience['dateRange']); ?>
                        </span>
                    </div>
                    <div class="experience-description">
                        <?php echo nl2br(htmlspecialchars($experience['description'])); ?>
                    </div>
                </div>
            <?php 
                endforeach;
            endif;
            ?>
        <?php else: ?>
            <p class="text-muted">Keine Berufserfahrung angegeben</p>
        <?php endif; ?>
    </div>
</div>

        <!-- Skills Section -->
        <div class="profile-card">
    <div class="card-header d-flex justify-content-between align-items-center" 
         data-bs-toggle="collapse" 
         data-bs-target="#skillsContent" 
         aria-expanded="false" 
         aria-controls="skillsContent">
        <h2><i class="fas fa-lightbulb"></i> Kenntnisse & Fähigkeiten</h2>
        <i class="fas fa-chevron-up collapse-icon collapsed"></i>
    </div>
    <div class="collapse" id="skillsContent">
        <div class="card-body">
                    <?php 
                    if (!empty($profile['superior_review_skills'])) {
                        $skills = is_string($profile['superior_review_skills']) ? 
                                 explode(',', $profile['superior_review_skills']) : 
                                 $profile['superior_review_skills'];
                        
                        foreach ($skills as $skill) {
                            if (is_array($skill)) {
                                $skillName = $skill['name'];
                                $endorsements = isset($skill['endorsements']) ? $skill['endorsements'] : 0;
                                echo '<div class="skill-badge-container">';
                                echo '<span class="skill-badge">' . htmlspecialchars(trim($skillName)) . '</span>';
                                if ($endorsements > 0) {
                                    echo '<span class="endorsements-count">' . $endorsements . ' Bestätigungen</span>';
                                }
                                echo '</div>';
                            } else {
                                echo '<span class="skill-badge">' . htmlspecialchars(trim($skill)) . '</span>';
                            }
                        }
                    } else {
                        echo '<p class="text-muted">Keine Kenntnisse angegeben</p>';
                    }
                    ?>
                </div>
            </div>
        </div>

<!-- Bewertungen Section -->
<div class="profile-card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h2><i class="fas fa-star text-warning"></i> Bewertungen</h2>
    </div>
    
    <div class="card-body">
        <?php
        $reviews_query = "SELECT sr.*, 
                        DATE_FORMAT(sr.superior_review_timestamp, '%d.%m.%Y') as formatted_date,
                        (SELECT AVG(superior_review_stars) 
                         FROM superior_review_star 
                         WHERE superior_review_id = sr.superior_review_id) as avg_rating
                        FROM superior_review sr
                        WHERE sr.superior_review_id = ? 
                        AND sr.review_published = 1
                        ORDER BY sr.superior_review_timestamp DESC";
        
        $stmt = mysqli_prepare($con, $reviews_query);
        mysqli_stmt_bind_param($stmt, "i", $executive_id);
        mysqli_stmt_execute($stmt);
        $reviews_result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($reviews_result) > 0):
            while ($review = mysqli_fetch_assoc($reviews_result)):
        ?>
            <div class="review-item mb-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <strong class="text-primary">Bewertung vom <?php echo $review['formatted_date']; ?></strong>
                        <div class="rating-stars">
                            <?php 
                            $avg_rating = number_format($review['avg_rating'], 1);
                            echo "<span class='rating-value'>$avg_rating</span>";
                            for ($i = 1; $i <= 5; $i++): 
                            ?>
                                <i class="fa<?php echo $i <= $avg_rating ? 's' : 'r'; ?> fa-star text-warning"></i>
                            <?php endfor; ?>
                        </div>
                    </div>
                    <button class="btn btn-link show-more-btn" type="button" 
                            data-bs-toggle="collapse" 
                            data-bs-target="#review-<?php echo $review['superior_review_id']; ?>">
                        Details anzeigen <i class="fas fa-chevron-down ms-1"></i>
                    </button>
                </div>

                <div class="collapse" id="review-<?php echo $review['superior_review_id']; ?>">
                    <?php if (!empty($review['superior_review_free_text'])): ?>
                        <div class="review-text mb-4">
                            <?php echo nl2br(htmlspecialchars($review['superior_review_free_text'])); ?>
                        </div>
                    <?php endif; ?>

                    <div class="row">
                        <?php
                        $star_query = "SELECT srs.*, src.superior_review_subcategory_name
                                     FROM superior_review_star srs
                                     JOIN superior_review_subcategory src 
                                     ON srs.superior_review_subcategory_id = src.superior_review_subcategory_id
                                     WHERE srs.superior_review_id = ?";
                        $stmt_stars = mysqli_prepare($con, $star_query);
                        mysqli_stmt_bind_param($stmt_stars, "i", $review['superior_review_id']);
                        mysqli_stmt_execute($stmt_stars);
                        $stars_result = mysqli_stmt_get_result($stmt_stars);

                        while ($star = mysqli_fetch_assoc($stars_result)):
                        ?>
                            <div class="col-md-6 mb-3">
                                <div class="review-category-box">
                                    <div class="category-name">
                                        <?php echo htmlspecialchars($star['superior_review_subcategory_name']); ?>
                                    </div>
                                    <div class="rating-stars">
                                        <?php for ($i = 1; $i <= 5; $i++): ?>
                                            <i class="fa<?php echo $i <= $star['superior_review_stars'] ? 's' : 'r'; ?> fa-star text-warning"></i>
                                        <?php endfor; ?>
                                    </div>
                                    <?php if (!empty($star['superior_review_text'])): ?>
                                        <div class="category-comment">
                                            <?php echo nl2br(htmlspecialchars($star['superior_review_text'])); ?>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        <?php endwhile; ?>
                    </div>
                </div>
            </div>
        <?php 
            endwhile;
        else:
        ?>
            <div class="text-center py-3">
                <p class="text-muted">Keine Bewertungen vorhanden</p>
            </div>
        <?php endif; ?>
    </div>
</div>
<!-- Personality Section -->
<div class="profile-card">
    <div class="card-header d-flex justify-content-between align-items-center" 
         data-bs-toggle="collapse" 
         data-bs-target="#personalityContent" 
         aria-expanded="false" 
         aria-controls="personalityContent">
        <h2><i class="fas fa-brain"></i> Persönlichkeitsprofil</h2>
        <i class="fas fa-chevron-up collapse-icon collapsed"></i>
    </div>
    <div class="collapse" id="personalityContent">
        <div class="card-body">
            <?php
            // Interpretations-Array
            $interpretations = [
                1 => [ // Offenheit
                    'high' => 'Stark in Innovation und Change Management',
                    'low' => 'Fokus auf Stabilität und bewährte Methoden',
                    'skills' => ['Innovationsmanagement', 'Strategische Vision', 'Adaptionsfähigkeit']
                ],
                2 => [ // Gewissenhaftigkeit
                    'high' => 'Exzellent in Projektmanagement und Qualitätssicherung',
                    'low' => 'Flexibler Führungsstil mit Fokus auf Agilität',
                    'skills' => ['Projektmanagement', 'Qualitätskontrolle', 'Strategische Planung']
                ],
                3 => [ // Extraversion
                    'high' => 'Stark in Networking und Team-Motivation',
                    'low' => 'Fokussiert auf individuelle Betreuung und Analyse',
                    'skills' => ['Teamführung', 'Kommunikation', 'Networking']
                ],
                4 => [ // Verträglichkeit
                    'high' => 'Exzellent in Teambuilding und Konfliktlösung',
                    'low' => 'Fokus auf Ergebnisorientierung und Durchsetzungsstärke',
                    'skills' => ['Konfliktmanagement', 'Teambuilding', 'Mitarbeiterentwicklung']
                ],
                5 => [ // Neurotizismus
                    'high' => 'Sensibel für Risiken und Stressfaktoren',
                    'low' => 'Stark in Krisenmanagement und unter Druck',
                    'skills' => ['Stressmanagement', 'Resilienz', 'Entscheidungsfähigkeit']
                ]
            ];

            // Persönlichkeitsprofil abrufen
            $personality_query = "SELECT pd.dimension_id, pd.dimension_name, pd.dimension_description, pr.score,
                                (SELECT AVG(score) FROM personality_results WHERE dimension_id = pd.dimension_id) as avg_score
                                FROM personality_results pr
                                JOIN personality_dimensions pd ON pr.dimension_id = pd.dimension_id
                                WHERE pr.superior_review_id = ?
                                ORDER BY pd.dimension_id ASC";
            $stmt = mysqli_prepare($con, $personality_query);
            mysqli_stmt_bind_param($stmt, "i", $executive_id);
            mysqli_stmt_execute($stmt);
            $personality_results = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($personality_results) > 0): ?>
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i> 
                    Diese Auswertung basiert auf dem Big Five Persönlichkeitsmodell, angepasst für Führungskräfte.
                </div>

                <?php while ($dimension = mysqli_fetch_assoc($personality_results)):
                    $score_percentage = ($dimension['score'] * 20);
                    $avg_percentage = ($dimension['avg_score'] * 20);
                    $interpretation = $dimension['score'] > 3 ? 
                                    $interpretations[$dimension['dimension_id']]['high'] : 
                                    $interpretations[$dimension['dimension_id']]['low'];
                ?>
                    <div class="personality-dimension">
                        <h6 class="d-flex justify-content-between align-items-center mb-3">
                            <strong><?php echo $dimension['dimension_name']; ?></strong>
                            <span><?php echo number_format($dimension['score'], 1); ?>/5</span>
                        </h6>
                        
                        <div class="progress-container mb-3">
                            <div class="progress" style="height: 10px; position: relative;">
                                <div class="progress-bar" 
                                     role="progressbar" 
                                     style="width: <?php echo $score_percentage; ?>%; 
                                            background: linear-gradient(45deg, #124f8f, #1a62ab);"
                                     aria-valuenow="<?php echo $score_percentage; ?>" 
                                     aria-valuemin="0" 
                                     aria-valuemax="100">
                                </div>
                                <div class="average-marker" 
                                     style="position: absolute; 
                                            left: <?php echo $avg_percentage; ?>%; 
                                            top: -3px; 
                                            height: 16px; 
                                            width: 3px; 
                                            background-color: #ff4444;">
                                </div>
                            </div>
                            <small class="text-muted d-block mt-1">
                                Durchschnitt aller Führungskräfte: <?php echo number_format($dimension['avg_score'], 1); ?>
                            </small>
                        </div>

                        <p class="mb-3"><?php echo $dimension['dimension_description']; ?></p>
                        <p class="mb-3"><strong>Interpretation:</strong> <?php echo $interpretation; ?></p>
                        
                        <div class="skills-badges mb-2">
                            <?php foreach ($interpretations[$dimension['dimension_id']]['skills'] as $skill): ?>
                                <span class="badge badge-light mr-2 mb-2"><?php echo $skill; ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <div class="text-center py-3">
                    <p class="text-muted mb-3">Noch kein Persönlichkeitsprofil vorhanden</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>
    <?php include "footer.php"; ?>

    <!-- Toast Container -->
    <div class="toast-container"></div>

    <script>
        // Review Details Toggle
       function toggleReviewDetails(reviewId) {
    const detailsElement = document.getElementById(reviewId);
    const button = event.currentTarget;
    
    if (detailsElement.style.display === 'none') {
        detailsElement.style.display = 'block';
        button.innerHTML = '<i class="fas fa-chevron-up"></i> Details ausblenden';
    } else {
        detailsElement.style.display = 'none';
        button.innerHTML = '<i class="fas fa-chevron-down"></i> Details anzeigen';
    }
}

        // Follow/Unfollow Functionality
        function followExecutive(executiveId) {
            fetch('follow_executive.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    executive_id: executiveId
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const followButton = document.getElementById('followButton');
                    const followersCount = document.querySelector('.stat-value');
                    
                    if (data.following) {
                        followButton.innerHTML = '<i class="fas fa-user-minus"></i> Entfolgen';
                        showToast('Sie folgen nun dieser Führungskraft', 'success');
                    } else {
                        followButton.innerHTML = '<i class="fas fa-user-plus"></i> Folgen';
                        showToast('Sie folgen dieser Führungskraft nicht mehr', 'info');
                    }
                    
                    followersCount.textContent = data.followers;
                } else {
                    if (data.redirect) {
                        window.location.href = data.redirect;
                    } else {
                        showToast(data.message, 'error');
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showToast('Ein Fehler ist aufgetreten', 'error');
            });
        }

        // Message Function
        function sendMessage(executiveId) {
            window.location.href = `conversation.php?recipient=${executiveId}`;
        }

        // Toast Notification
        function showToast(message, type = 'success') {
            const toast = document.createElement('div');
            toast.className = `toast ${type} animate__animated animate__fadeInRight`;
            toast.innerHTML = `
                <i class="fas fa-${type === 'success' ? 'check-circle' : 
                                  type === 'error' ? 'exclamation-circle' : 
                                  'info-circle'}"></i>
                <span>${message}</span>
            `;
            
            document.querySelector('.toast-container').appendChild(toast);
            
            setTimeout(() => {
                toast.classList.remove('animate__fadeInRight');
                toast.classList.add('animate__fadeOutRight');
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }

        // Initialize animations on scroll
        document.addEventListener('DOMContentLoaded', function() {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__fadeInUp');
                        observer.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.2,
                rootMargin: '0px'
            });

            document.querySelectorAll('.profile-card').forEach(card => {
                observer.observe(card);
            });
        });
// Collapse Icon Animation
    $('.card-header').on('click', function() {
        $(this).find('.collapse-icon').toggleClass('collapsed');
    });
<script>
    // Collapse Icon Animation
    document.querySelectorAll('[data-bs-toggle="collapse"]').forEach(button => {
        button.addEventListener('click', function() {
            this.querySelector('.collapse-icon').classList.toggle('collapsed');
        });
    });
</script>
</body>
</html>
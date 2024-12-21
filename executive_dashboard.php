<?php
session_start();
include "database.php";
include "functions.php";

header('Content-Type: text/html; charset=utf-8');
mb_internal_encoding('UTF-8');

// Prüfen ob eine Executive ID vorhanden ist
$executive_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if (!$executive_id) {
    header("Location: index.php");
    exit();
}

// Führungskraft-Daten abrufen
$exec_query = "SELECT sr.*, c.company_title 
              FROM superior_review sr 
              JOIN company c ON sr.company_id = c.company_id 
              WHERE sr.superior_review_id = ?";
              
$stmt = mysqli_prepare($con, $exec_query);
mysqli_stmt_bind_param($stmt, "i", $executive_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$executive = mysqli_fetch_assoc($result);

if (!$executive) {
    header("Location: index.php");
    exit();
}

// Bewertungen abrufen
$reviews_query = "SELECT COUNT(*) as total_reviews, AVG(superior_review_stars) as avg_rating 
                 FROM superior_review_star 
                 WHERE superior_review_id = ?";
$stmt = mysqli_prepare($con, $reviews_query);
mysqli_stmt_bind_param($stmt, "i", $executive_id);
mysqli_stmt_execute($stmt);
$reviews_data = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt));
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - <?php echo htmlspecialchars($executive['superior_review_firstname'] . ' ' . $executive['superior_review_lastname']); ?></title>
    
    <!-- CSS Dependencies -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style-starter.css">

    <style>
        :root {
            --primary-color: #124f8f;
            --secondary-color: #ffd700;
            --text-color: #444;
            --transition-speed: 0.3s;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--text-color);
            line-height: 1.7;
        }
* {
        text-transform: none !important;
        font-family: 'Poppins', sans-serif;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
        color: var(--text-color);
        line-height: 1.7;
    }
        .dashboard-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        }
        
        .stat-card {
            background: linear-gradient(45deg, #124f8f, #1a62ab);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .stat-card i {
            font-size: 2.5em;
            opacity: 0.5;
        }
        
        .stat-card .stat-value {
            font-size: 1.8em;
            font-weight: bold;
        }
        
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .rating-stars {
            color: #ffd700;
        }

        .btn-edit {
            background: var(--primary-color);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .btn-edit:hover {
            background: #1a62ab;
            color: white;
            transform: translateY(-2px);
        }

        .review-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }

        .review-item:last-child {
            border-bottom: none;
        }

        .formatted-text {
            white-space: pre-wrap;
            word-wrap: break-word;
        }
        
        .formatted-text p {
            margin-bottom: 1rem;
        }
        
        .formatted-text strong, 
        .formatted-text b {
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .profile-image {
                width: 120px;
                height: 120px;
            }
.card-header {
        background-color: #f8f9fa;
        border-bottom: none;
        cursor: pointer;
    }
    
    .card-header:hover {
        background-color: #e9ecef;
    }
    
    .collapse-icon {
        transition: transform 0.3s ease;
    }
    
    .collapsed .collapse-icon {
        transform: rotate(-180deg);
    }
.formatted-text p {
    margin-bottom: 1rem;
}
.formatted-text br {
    display: block;
    margin: 1rem 0;
    content: "";
}
.formatted-text .section-title {
    margin-top: 1.5rem;
    margin-bottom: 0.5rem;
    color: var(--primary-color);
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

.card-header {
    background-color: #f8f9fa;
    border-bottom: none;
    cursor: pointer;
}

.card-header:hover {
    background-color: #e9ecef;
}

.collapse-icon {
    transition: transform 0.3s ease;
}

.collapsed .collapse-icon {
    transform: rotate(-180deg);
}

.skills-badges .badge {
    display: inline-block;
    margin-right: 8px;
    margin-bottom: 8px;
    padding: 8px 12px;
    background-color: #e9ecef;
    color: #495057;
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
    <?php include "navbar.php"; ?>
    
    <div class="container" style="margin-top: 120px;">
        <div class="row">
            <!-- Linke Spalte - Profilinfo -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <div class="card-body text-center">
                        <img src="<?php echo $executive['profile_image_url'] ?? 'assets/images/default-profile.jpg'; ?>" 
                             class="profile-image mb-3" 
                             alt="Profilbild">
                        <h4><?php echo htmlspecialchars($executive['superior_review_firstname'] . ' ' . $executive['superior_review_lastname']); ?></h4>
                        <p class="text-muted"><?php echo htmlspecialchars($executive['company_title']); ?></p>
                        <p class="text-muted">
                            <i class="fas fa-map-marker-alt"></i> 
                            <?php echo htmlspecialchars($executive['superior_review_location'] ?? 'Keine Angabe'); ?>
                        </p>
                        <button class="btn btn-edit" data-toggle="modal" data-target="#editProfileModal">
                            <i class="fas fa-edit"></i> Profil bearbeiten
                        </button>
                    </div>
                </div>

                <!-- Statistiken -->
                <div class="stat-card">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <i class="fas fa-eye"></i>
                        </div>
                        <div class="col-9">
                            <div class="stat-value"><?php echo number_format($executive['profile_views']); ?></div>
                            <div>Profilaufrufe</div>
                        </div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="col-9">
                            <div class="stat-value">
                                <?php echo number_format($reviews_data['avg_rating'] ?? 0, 1); ?>
                            </div>
                            <div>Durchschnittliche Bewertung</div>
                        </div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <i class="fas fa-comments"></i>
                        </div>
                        <div class="col-9">
                            <div class="stat-value"><?php echo $reviews_data['total_reviews'] ?? 0; ?></div>
                            <div>Bewertungen</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Rechte Spalte - Hauptinhalt -->
            <div class="col-md-8">
<!-- Status-Einstellungen -->
    <div class="dashboard-card">
        <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#statusContent">
            <h5 class="card-title mb-0">Status-Einstellungen</h5>
            <i class="fas fa-chevron-up collapse-icon"></i>
        </div>
        <div id="statusContent" class="collapse show">
            <div class="card-body">
                <form action="update_status.php" method="POST" id="statusForm">
                    <input type="hidden" name="executive_id" value="<?php echo $executive_id; ?>">
                    
                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="openToOffers" 
                               name="open_to_offers" value="1" 
                               <?php echo $executive['open_to_offers'] ? 'checked' : ''; ?>>
                        <label class="form-check-label" for="openToOffers">
                            <i class="fas fa-briefcase"></i> 
                            Offen f&uuml;r neue berufliche M&ouml;glichkeiten
                        </label>
                    </div>
                    
                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="isHiring" 
                               name="is_hiring" value="1" 
                               <?php echo $executive['is_hiring'] ? 'checked' : ''; ?>>
                        <label class="form-check-label" for="isHiring">
                            <i class="fas fa-user-plus"></i> 
                            Aktuell auf der Suche nach neuen Mitarbeitern
                        </label>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Status aktualisieren
                    </button>
                </form>
            </div>
        </div>
    </div>
                <!-- &Uuml;ber mich -->
    <div class="dashboard-card">
        <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#aboutMeContent">
            <h5 class="card-title mb-0">&Uuml;ber mich</h5>
            <i class="fas fa-chevron-up collapse-icon"></i>
        </div>
        <div id="aboutMeContent" class="collapse">
            <div class="card-body">
                <div class="formatted-text">
                  <?php 
            if (!empty($executive['superior_review_experience'])) {
                $text = $executive['superior_review_experience'];
                
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

                <!-- Skills -->
               <div class="dashboard-card">
        <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#skillsContent">
            <h5 class="card-title mb-0">F&auml;higkeiten</h5>
            <i class="fas fa-chevron-up collapse-icon"></i>
        </div>
        <div id="skillsContent" class="collapse">
            <div class="card-body">
                <?php
                $skills = explode(',', $executive['superior_review_skills'] ?? '');
                if (!empty($skills[0])) {
                    foreach ($skills as $skill) {
                        echo '<span class="badge badge-primary mr-2 mb-2">' . htmlspecialchars(trim($skill)) . '</span>';
                    }
                } else {
                    echo '<p class="text-muted">Keine F&auml;higkeiten angegeben</p>';
                }
                ?>
            </div>
        </div>
    </div>

                <!-- Letzte Bewertungen -->
               <div class="dashboard-card">
        <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#reviewsContent">
            <h5 class="card-title mb-0">Letzte Bewertungen</h5>
            <i class="fas fa-chevron-up collapse-icon"></i>
        </div>
        <div id="reviewsContent" class="collapse">
            <div class="card-body">
                        <h5 class="card-title">Letzte Bewertungen</h5>
                        <?php
                        $recent_reviews_query = "SELECT srs.superior_review_stars, srs.superior_review_text, 
                                                      src.superior_review_category_name
                                               FROM superior_review_star srs
                                               JOIN superior_review_category src 
                                                   ON srs.superior_review_category_id = src.superior_review_category_id
                                               WHERE srs.superior_review_id = ?
                                               ORDER BY srs.superior_review_star_id DESC 
                                               LIMIT 5";
                        $stmt = mysqli_prepare($con, $recent_reviews_query);
                        mysqli_stmt_bind_param($stmt, "i", $executive_id);
                        mysqli_stmt_execute($stmt);
                        $recent_reviews = mysqli_stmt_get_result($stmt);

                        if (mysqli_num_rows($recent_reviews) > 0) {
                            while ($review = mysqli_fetch_assoc($recent_reviews)) {
                                ?>
                                <div class="review-item">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <strong><?php echo htmlspecialchars($review['superior_review_category_name']); ?></strong>
                                        <div class="rating-stars">
                                            <?php
                                            for ($i = 1; $i <= 5; $i++) {
                                                echo $i <= $review['superior_review_stars'] ? 
                                                     '<i class="fas fa-star"></i>' : 
                                                     '<i class="far fa-star"></i>';
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <?php if (!empty($review['superior_review_text'])): ?>
                                        <p class="mb-0 mt-2"><?php echo htmlspecialchars($review['superior_review_text']); ?></p>
                                    <?php endif; ?>
                                </div>
                                <?php
                            }
                        } else {
                            echo '<p class="text-muted">Noch keine Bewertungen vorhanden</p>';
                        }
                        ?>
                    </div>
                </div>
<div class="dashboard-card">
    <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#personalityContent">
        <h5 class="card-title mb-0">Pers&ouml;nlichkeitsprofil</h5>
        <i class="fas fa-chevron-up collapse-icon"></i>
    </div>
    <div id="personalityContent" class="collapse">
        <div class="card-body">
            <?php
            // Interpretations-Array VOR der Datenbankabfrage definieren
            $interpretations = [
                1 => [ // Offenheit
                    'high' => 'Stark in Innovation und Change Management',
                    'low' => 'Fokus auf Stabilit&auml;t und bew&auml;hrte Methoden',
                    'skills' => ['Innovationsmanagement', 'Strategische Vision', 'Adaptionsf&auml;higkeit']
                ],
                2 => [ // Gewissenhaftigkeit
                    'high' => 'Exzellent in Projektmanagement und Qualit&auml;tssicherung',
                    'low' => 'Flexibler Fü&uuml;hrungsstil mit Fokus auf Agilit&auml;t',
                    'skills' => ['Projektmanagement', 'Qualit&auml;tskontrolle', 'Strategische Planung']
                ],
                3 => [ // Extraversion
                    'high' => 'Stark in Networking und Team-Motivation',
                    'low' => 'Fokussiert auf individuelle Betreuung und Analyse',
                    'skills' => ['Teamf&uuml;hrung', 'Kommunikation', 'Networking']
                ],
                4 => [ // Verträglichkeit
                    'high' => 'Exzellent in Teambuilding und Konfliktl&ouml;sung',
                    'low' => 'Fokus auf Ergebnisorientierung und Durchsetzungsst&auml;rke',
                    'skills' => ['Konfliktmanagement', 'Teambuilding', 'Mitarbeiterentwicklung']
                ],
                5 => [ // Neurotizismus
                    'high' => 'Sensibel für Risiken und Stressfaktoren',
                    'low' => 'Stark in Krisenmanagement und unter Druck',
                    'skills' => ['Stressmanagement', 'Resilienz', 'Entscheidungsf&auml;higkeit']
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

            if (mysqli_num_rows($personality_results) > 0) {
                ?>
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> 
                            Diese Auswertung basiert auf dem Big Five Pers&ouml;nlichkeitsmodell, angepasst f&uuml;r F&uuml;hrungskr&auml;fte.
                        </div>
                    </div>
                </div>

                <?php
                while ($dimension = mysqli_fetch_assoc($personality_results)) {
                    $score_percentage = ($dimension['score'] * 20);
                    $avg_percentage = ($dimension['avg_score'] * 20);
                    
                    $interpretation = $dimension['score'] > 3 ? 
                                    $interpretations[$dimension['dimension_id']]['high'] : 
                                    $interpretations[$dimension['dimension_id']]['low'];
                    ?>
                    
                    <div class="personality-dimension">
                        <h6 class="d-flex justify-content-between align-items-center mb-3">
                            <strong><?php echo htmlspecialchars($dimension['dimension_name']); ?></strong>
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
                                            background-color: #ff4444;
                                            box-shadow: 0 0 2px rgba(0,0,0,0.2);">
                                </div>
                            </div>
                            <small class="text-muted d-block mt-1">Durchschnitt aller F&uuml;hrungskr&auml;fte: <?php echo number_format($dimension['avg_score'], 1); ?></small>
                        </div>

                        <p class="mb-3"><?php echo htmlspecialchars($dimension['dimension_description']); ?></p>
                        <p class="mb-3"><strong>Interpretation:</strong> <?php echo $interpretation; ?></p>
                        
                        <div class="skills-badges mb-2">
                            <?php foreach ($interpretations[$dimension['dimension_id']]['skills'] as $skill) { ?>
                                <span class="badge badge-light mr-2 mb-2"><?php echo $skill; ?></span>
                            <?php } ?>
                        </div>
                    </div>
                    <?php
                }
                ?>
                
                <div class="text-center mt-4">
                    <a href="personality_test.php?id=<?php echo $executive_id; ?>" class="btn btn-primary">
                        Test wiederholen
                    </a>
                </div>
                
            <?php } else { ?>
                <div class="text-center py-3">
                    <p class="text-muted mb-3">Noch kein Pers&ouml;nlichkeitsprofil vorhanden</p>
                    <a href="personality_test.php?id=<?php echo $executive_id; ?>" class="btn btn-primary">
                        Test jetzt durchf&uuml;hren
                    </a>
                </div>
            <?php } ?>
        </div>
    </div>
</div>

            </div>
        </div>
    </div>
<!-- Passende Unternehmen Section -->
<div class="dashboard-card">
                <div class="card-header d-flex justify-content-between align-items-center" data-toggle="collapse" data-target="#matchingCompaniesContent">
                    <h5 class="card-title mb-0">Passende Unternehmen</h5>
                    <i class="fas fa-chevron-up collapse-icon"></i>
                </div>
                <div id="matchingCompaniesContent" class="collapse show">
                    <div class="card-body">
                        <?php
                        $skills = !empty($executive['superior_review_skills']) ? 
                                 explode(',', $executive['superior_review_skills']) : [];
                        $location = $executive['superior_review_location'] ?? '';
                        
                        $matching_query = "SELECT DISTINCT j.job_id, j.job_title, j.job_link, 
                                         c.company_id, c.company_title, c.company_location
                                         FROM job j
                                         INNER JOIN company c ON j.company_id = c.company_id
                                         WHERE c.company_location LIKE ?";
                        
                        $params = ["%$location%"];
                        $types = "s";
                        
                        if (!empty($skills)) {
                            $matching_query .= " AND (";
                            $skill_conditions = [];
                            
                            foreach ($skills as $skill) {
                                if (!empty($skill)) {
                                    $skill_conditions[] = "j.job_title LIKE ? OR j.job_description LIKE ?";
                                    $params[] = "%$skill%";
                                    $params[] = "%$skill%";
                                    $types .= "ss";
                                }
                            }
                            
                            if (!empty($skill_conditions)) {
                                $matching_query .= implode(" OR ", $skill_conditions) . ")";
                            }
                        }
                        
                        $matching_query .= " LIMIT 5";
                        
                        $stmt = mysqli_prepare($con, $matching_query);
                        if ($stmt && !empty($params)) {
                            mysqli_stmt_bind_param($stmt, $types, ...$params);
                            mysqli_stmt_execute($stmt);
                            $matching_results = mysqli_stmt_get_result($stmt);
                            
                            if (mysqli_num_rows($matching_results) > 0) {
                                while ($job = mysqli_fetch_assoc($matching_results)) {
                                    ?>
                                    <div class="matching-job mb-3">
                                        <div class="company-name">
                                            <a href="company.php?id=<?php echo $job['company_id']; ?>" 
                                               class="text-primary">
                                                <?php echo htmlspecialchars($job['company_title']); ?>
                                            </a>
                                        </div>
                                        <div class="job-title small">
                                            <a href="<?php echo $job['job_link']; ?>" 
                                               target="_blank" 
                                               class="text-dark">
                                                <?php echo htmlspecialchars($job['job_title']); ?>
                                            </a>
                                        </div>
                                        <div class="location small text-muted">
                                            <i class="fas fa-map-marker-alt"></i> 
                                            <?php echo htmlspecialchars($job['company_location']); ?>
                                        </div>
                                    </div>
                                    <?php
                                }
                            } else {
                                ?>
                                <div class="text-center py-3">
                                    <div class="text-muted">
                                        <i class="fas fa-info-circle me-2"></i>
                                        Aktuell keine passenden Unternehmen in Ihrer Region gefunden.
                                    </div>
                                </div>
                                <?php
                            }
                            mysqli_stmt_close($stmt);
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Profil bearbeiten Modal -->
    <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Profil bearbeiten</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="update_profile.php" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" name="executive_id" value="<?php echo $executive_id; ?>">
                        
                        <div class="form-group">
                            <label>Profilbild</label>
                            <input type="file" class="form-control-file" name="profile_image">
                        </div>
                        
                        <div class="form-group">
                            <label>Standort</label>
                            <input type="text" class="form-control" name="location" 
                                   value="<?php echo htmlspecialchars($executive['superior_review_location'] ?? ''); ?>">
                        </div>
                        
                        <div class="form-group">
    <label>&Uuml;ber mich</label>
    <textarea class="form-control" name="experience" rows="15" style="white-space: pre-wrap;"><?php 
        if (!empty($executive['superior_review_experience'])) {
            $text = $executive['superior_review_experience'];
            // Konvertiere Escape-Sequenzen zu echten Zeilenumbrüchen
            $text = str_replace(['\\r\\n', '\\n', '\\r'], "\n", $text);
            echo htmlspecialchars($text);
        }
    ?></textarea>
</div>
                        
                        <div class="form-group">
                            <label>F&auml;higkeiten (mit Komma getrennt)</label>
                            <input type="text" class="form-control" name="skills" 
                                   value="<?php echo htmlspecialchars($executive['superior_review_skills'] ?? ''); ?>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Abbrechen</button>
                        <button type="submit" class="btn btn-primary">Speichern</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript Dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    $('.card-header').click(function() {
        $(this).find('.collapse-icon').toggleClass('collapsed');
    });
});
</script>
</body>
</html>
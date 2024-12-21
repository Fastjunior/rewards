<?php
session_start();
include "database.php";
include "functions.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $executive_id = isset($_POST['executive_id']) ? intval($_POST['executive_id']) : 0;
    
    if (!$executive_id) {
        $_SESSION['error_message'] = "Ungültige Anfrage.";
        header("Location: executive_dashboard.php");
        exit();
    }

    // Daten aus dem Formular sammeln
    $location = mysqli_real_escape_string($con, $_POST['location']);
    $experience = mysqli_real_escape_string($con, $_POST['experience']);
    $skills = mysqli_real_escape_string($con, $_POST['skills']);

    // Profilbild-Upload
$profile_image_url = null;
if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] === 0) {
    $allowed = ['jpg', 'jpeg', 'png', 'gif'];
    $filename = $_FILES['profile_image']['name'];
    $file_ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

    if (in_array($file_ext, $allowed)) {
        // Absoluten Pfad definieren
        $upload_path = $_SERVER['DOCUMENT_ROOT'] . '/uploads/profile_images/';
        
        // Erstelle Upload-Verzeichnis falls es nicht existiert
        if (!file_exists($upload_path)) {
            mkdir($upload_path, 0777, true);
        }

        // Generiere eindeutigen Dateinamen
        $new_filename = uniqid('profile_') . '.' . $file_ext;
        $upload_file = $upload_path . $new_filename;
        
        // URL-Pfad für die Datenbank
        $profile_image_url = '/uploads/profile_images/' . $new_filename;

        if (move_uploaded_file($_FILES['profile_image']['tmp_name'], $upload_file)) {
            // Alte Bilddatei löschen wenn vorhanden
            $query = "SELECT profile_image_url FROM superior_review WHERE superior_review_id = ?";
            $stmt = mysqli_prepare($con, $query);
            mysqli_stmt_bind_param($stmt, "i", $executive_id);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            $old_image = mysqli_fetch_assoc($result);
            
            if ($old_image && $old_image['profile_image_url']) {
                $old_file = $_SERVER['DOCUMENT_ROOT'] . $old_image['profile_image_url'];
                if (file_exists($old_file)) {
                    unlink($old_file);
                }
            }
        }
    }
}

    // Update Query mit korrekten Spaltennamen
    $update_query = "UPDATE superior_review SET 
                    superior_review_location = ?,
                    superior_review_experience = ?,
                    superior_review_skills = ?";
    
    $params = array($location, $experience, $skills);
    $types = "sss";
    
    if ($profile_image_url) {
        $update_query .= ", profile_image_url = ?";
        $params[] = $profile_image_url;
        $types .= "s";
    }
    
    $update_query .= " WHERE superior_review_id = ?";
    $params[] = $executive_id;
    $types .= "i";
    
    // Update durchführen
    $stmt = mysqli_prepare($con, $update_query);
    
    if ($stmt) {
        mysqli_stmt_bind_param($stmt, $types, ...$params);
        
        if (mysqli_stmt_execute($stmt)) {
            $_SESSION['success_message'] = "Profil wurde erfolgreich aktualisiert.";
            
            // Erhöhe den Profile-Views-Counter
            $view_query = "UPDATE superior_review SET profile_views = profile_views + 1 WHERE superior_review_id = ?";
            $view_stmt = mysqli_prepare($con, $view_query);
            mysqli_stmt_bind_param($view_stmt, "i", $executive_id);
            mysqli_stmt_execute($view_stmt);
            
        } else {
            error_log("MySQL Error: " . mysqli_error($con));
            $_SESSION['error_message'] = "Fehler beim Aktualisieren des Profils.";
        }
    } else {
        error_log("MySQL Prepare Error: " . mysqli_error($con));
        $_SESSION['error_message'] = "Datenbankfehler beim Vorbereiten der Anfrage.";
    }

    // Zurück zum Dashboard
    header("Location: executive_dashboard.php?id=" . $executive_id);
    exit();
} else {
    // Wenn keine POST-Anfrage, zurück zur Hauptseite
    header("Location: index.php");
    exit();
}
?>
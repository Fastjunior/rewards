<?php
session_start();
include "database.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $executive_id = intval($_POST['executive_id']);
    $open_to_offers = isset($_POST['open_to_offers']) ? 1 : 0;
    $is_hiring = isset($_POST['is_hiring']) ? 1 : 0;
    
    $update_query = "UPDATE superior_review 
                    SET open_to_offers = ?, 
                        is_hiring = ?,
                        last_status_update = CURRENT_TIMESTAMP 
                    WHERE superior_review_id = ?";
    
    $stmt = mysqli_prepare($con, $update_query);
    mysqli_stmt_bind_param($stmt, "iii", $open_to_offers, $is_hiring, $executive_id);
    
    if (mysqli_stmt_execute($stmt)) {
        $_SESSION['success_message'] = "Status erfolgreich aktualisiert";
    } else {
        $_SESSION['error_message'] = "Fehler beim Aktualisieren des Status";
    }
    
    header("Location: executive_dashboard.php?id=" . $executive_id);
    exit();
}
<?php
function get_youtube_id_from_url($url)
{
	
    if (stristr($url,'youtu.be/'))
        {preg_match('/(https:|http:|)(\/\/www\.|\/\/|)(.*?)\/(.{11})/i', $url, $final_ID); return $final_ID[4]; }
    else 
        {@preg_match('/(https:|http:|):(\/\/www\.|\/\/|)(.*?)\/(embed\/|watch.*?v=|)([a-z_A-Z0-9\-]{11})/i', $url, $IDD); return $IDD[5]; }
}
?>
<?php
	function upload_file($filearr, $key, $path) {
		$dirs = explode('/', $path);
		$dir_path = '';
		for ($i=0;$i<sizeof($dirs);$i++) {
			$dir_path .= $dirs[$i].'/';
			if (!is_dir($dir_path)) {
				mkdir($dir_path);
			}
		}
		
		$date_path = date('Y');
		$dir_path .= date('Y');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$date_path .= '/'.date('m');
		$dir_path .= '/'.date('m');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$date_path .= '/'.date('d');
		$dir_path .= '/'.date('d');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$ext_arr = explode('.',$filearr[$key]['name']);
		$extension = '';
		if (sizeof($ext_arr)>1) {
			$extension = $ext_arr[sizeof($ext_arr)-1];
		}
		
		$filename = time().'_'.rand(1111,9999).'.'.$extension;
		
		$target = $dir_path.'/'.$filename;
		$full_filename =  $date_path.'/'.$filename;;
		
		if (move_uploaded_file($filearr[$key]['tmp_name'], $target)) {
			return $full_filename;
		} else {
			return false;
		}
	}
	
	function upload_multiple_files($filearr, $key, $path) {
		$dirs = explode('/', $path);
		$dir_path = '';
		for ($i=0;$i<sizeof($dirs);$i++) {
			$dir_path .= $dirs[$i].'/';
			if (!is_dir($dir_path)) {
				mkdir($dir_path);
			}
		}
		
		$date_path = date('Y');
		$dir_path .= date('Y');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$date_path .= '/'.date('m');
		$dir_path .= '/'.date('m');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$date_path .= '/'.date('d');
		$dir_path .= '/'.date('d');
		if (!is_dir($dir_path)) {
			mkdir($dir_path);
		}
		
		$full_filename = array();
		for ($i=0;$i<sizeof($filearr[$key]['name']);$i++) {
			$ext_arr = explode('.',$filearr[$key]['name'][$i]);
			$extension = '';
			if (sizeof($ext_arr)>1) {
				$extension = $ext_arr[sizeof($ext_arr)-1];
			}
			
			$filename = time().'_'.rand(1111,9999).'.'.$extension;
			
			$target = $dir_path.'/'.$filename;
			
			if (move_uploaded_file($filearr[$key]['tmp_name'][$i], $target)) {
				array_push($full_filename, $date_path.'/'.$filename);
			}
		}
		
		return $full_filename;
	}
	
	function copy_paste_post($post) {
		foreach ($post as $key => $value) {
			echo '$'.$key.' = mysqli_real_escape_string($con, $_POST["'.$key.'"]);<br>';
		}
		echo "<br>";
		foreach ($post as $key => $value) {
			echo $key." = '$$key',<br>";
		}
		echo "<br>";
		foreach ($post as $key => $value) {
			echo "$".$key.', ';
		}
		echo "<br>";
		foreach ($post as $key => $value) {
			?>
				$<?php echo $key ?> = isset($_POST["<?php echo $key ?>"]) ? mysqli_real_escape_string($con, $_POST["<?php echo $key ?>"]) : "";
				<br>
			<?php
		}
	}
	
?>
<?php
	function show_stars($stars_value) {
		$float_val = abs(floor($stars_value) - $stars_value);
		$stars = floor($stars_value);
		$color = "green";
		if (ceil($stars)==1||ceil($stars)==2) {
			$color = "red";
		} else if (floatval($stars_value)>3.5) {
			$color = "green";
		} else if (ceil($stars)==3) {
			$color = "orange";
		} else if (ceil($stars)==0) {
			$color = "grey";
		}
		for ($i=1;$i<=$stars;$i++) {
			echo "<i class='fa fa-star' style='color:$color'></i>";
		}
		$next_start = $stars+1;
		if ($float_val>=0.3&&$float_val<=0.7) {
			echo "<i class='fa fa-star-half-o' style='color:$color'></i>";
			$next_start = $stars+2;
		}
		for ($i=$next_start;$i<=5;$i++) {
			echo "<i class='fa fa-star-o' style='color:$color'></i>";
		}
	}
?>
<?php function show_company_grid($con, $company_row) { ?>
<?php
	$company_id = $company_row["company_id"];
	$company_link = "company.php?id=".$company_row["company_id"];
?>
<div class="blog-grid" id="zoomIn">
	<a href="<?php echo $company_link ?>">
		<figure>
			<div style="position:relative;">
				<img src="company/images/1000x400.png" style="width:100%">
				<div class="img-absolute center-bg-image" style="background-image:url('company/images/<?php echo $company_row["company_cover"] ?>'), url('company/images/company_cover.jpg')">
				</div>
			</div>
		</figure>
	</a>
	<div class="blog-info">
		<h3 class="one-line-text"><a href="<?php echo $company_link ?>" style="border-bottom:none;padding-bottom:0px"><?php echo $company_row["company_title"] ?></a></h3>
		<div class="row m-0">
			<div class="col-3 p-3">
				<div style="position:relative;">
					<img src="company/images/100x100.png" style="width:100%">
					<div class="img-absolute center-bg-image" style="background-image:url('company/images/<?php echo $company_row["company_logo"] ?>'), url('company/images/company_cover.jpg')">
					</div>
				</div>
			</div>
			<?php
				$cnav_avg_num = get_company_average($company_id);
			?>
			
			
			<div class="col-9 pt-3 pb-3 pl-0 pr-3">
				<?php show_stars(floatval($cnav_avg_num)) ?>
				<?php echo number_format(floatval($cnav_avg_num), 1, ",", "") ?>
				<br>
				<?php
					$cnav_num = get_company_total_reviews($company_id)
				?>
				<?php echo $cnav_num; ?> Bewertungen
			</div>
		</div>
		
	</div>
</div>
<br>
<?php } ?>
<?php function show_news_grid($con, $news_row) { ?>
<?php
	$news_id = $news_row["news_id"];
	$news_link = "news.php?id=".$news_row["news_id"];
?>
<div class="blog-grid" id="zoomIn">
	<a href="<?php echo $news_link ?>">
		<figure>
			<div style="position:relative;">
				<img src="company/images/1200x800.png" style="width:100%">
				<div class="img-absolute center-bg-image" style="background-image:url('company/images/<?php echo $news_row["news_image"] ?>')">
				</div>
			</div>
		</figure>
	</a>
	<div class="blog-info">
		<h3 class="one-line-text"><a href="<?php echo $news_link ?>" style="border-bottom:none;padding-bottom:0px"><?php echo $news_row["news_title"] ?></a></h3>
		<!--<p class="px-4 one-line-text text-secondary"><small><?php // echo $news_row["company_title"] ?></small></p>-->
		<div class="row m-0">
			<div class="col-md-12">
				<p class="two-line-text"><?php echo $news_row["news_description"] ?></p>
				<p><small><a href="<?php echo $news_link ?>">Weiterlesen</a> | <?php echo date("d.m.Y", $news_row["news_timestamp"]) ?></small></p>
			</div>
		</div>
		
	</div>
</div>
<br>
<?php } ?>
<?php
	function german_date($date_str) {
		$timest = strtotime($date_str);
		$day = date("j", $timest);
		$month = date("m", $timest);
		$month_name = get_german_month($month);
		$year = date("Y", $timest);
		return $day.' '.$month_name.' '.$year;
	}
	
	function get_german_month($m) {
		$months = array("Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember");
		return $months[intval($m)-1];
	}
?>
<?php function show_message($message_row) { ?> 
	<!--<div class="">
		<hr>
		<p class="text-primary"><b><i class="fa fa-user"></i> <?php if ($message_row["by_user"]==1) echo $message_row["user_name"]; else echo "Admin" ?></b></p>
		<p class="mb-0 pb-0">
			<?php echo nl2br(htmlspecialchars($message_row["message_text"])) ?>
			<br>
			<small><?php echo date("d.m.Y", $message_row["message_timestamp"]) ?></small>
		</p>
	</div>-->
	
	<div class="row">
		<?php 
			$col_class = "col-10 offset-2";
			$bg = "bg-primary";
			$float = "right";
			$heading_text = "text-light";
			$color = "text-light";
			if ($message_row["by_admin"]==1) {
				$col_class = "col-10";
				$bg = "bg-light";
				$float = "left";
				$heading_text = "text-primary";
				$color = "text-dark";
			}
		?>
		<div class="<?php echo $col_class ?> mb-2 mt-2">
			<div class="p-3 <?php echo $bg ?> d-inline-block" style="border-radius:12px;float:<?php echo $float ?>;">
				<p class="<?php echo $heading_text ?>"><b><i class="fa fa-user"></i> <?php if ($message_row["by_user"]==1) echo $message_row["user_name"]; else echo "Admin" ?></b></p>
				<p class="mb-0 pb-0 <?php echo $color; ?>">
					<?php echo nl2br(htmlspecialchars($message_row["message_text"])) ?>
					<br>
					<small><?php echo date("d.m.Y", $message_row["message_timestamp"]) ?></small>
				</p>
			</div>
		</div>
		
	</div>
<?php } ?>
<?php 
	function get_company_average($company_id) {
		global $con;
		$cnav_avg_res1 = mysqli_query($con, "SELECT AVG(employee_review_stars) as total_1 FROM employee_review_star INNER JOIN employee_review ON employee_review_star.employee_review_id=employee_review.employee_review_id WHERE employee_review_star.company_id = $company_id AND review_published = 1");
		$cnav_avg_num1 = mysqli_fetch_array($cnav_avg_res1)["total_1"];
		$cnav_avg_res2 = mysqli_query($con, "SELECT AVG(applicant_review_stars) as total_2 FROM applicant_review_star INNER JOIN applicant_review ON applicant_review_star.applicant_review_id=applicant_review.applicant_review_id WHERE applicant_review_star.company_id = $company_id AND review_published = 1");
		$cnav_avg_num2 = mysqli_fetch_array($cnav_avg_res2)["total_2"];
		$cnav_avg_res3 = mysqli_query($con, "SELECT AVG(superior_review_stars) as total_3 FROM superior_review_star INNER JOIN superior_review ON superior_review_star.superior_review_id=superior_review.superior_review_id WHERE superior_review_star.company_id = $company_id AND review_published = 1");
		$cnav_avg_num3 = mysqli_fetch_array($cnav_avg_res3)["total_3"];
		$cnav_avg_res4 = mysqli_query($con, "SELECT AVG(supplier_review_stars) as total_4 FROM supplier_review_star INNER JOIN supplier_review ON supplier_review_star.supplier_review_id=supplier_review.supplier_review_id WHERE supplier_review_star.company_id = $company_id AND review_published = 1");
		$cnav_avg_num4 = mysqli_fetch_array($cnav_avg_res4)["total_4"];
		$cnav_avg_res5 = mysqli_query($con, "SELECT AVG(prevention_review_stars) as total_5 FROM prevention_review_star INNER JOIN prevention_review ON prevention_review_star.prevention_review_id=prevention_review.prevention_review_id WHERE prevention_review_star.company_id = $company_id AND review_published = 1");
		$cnav_avg_num5 = mysqli_fetch_array($cnav_avg_res5)["total_5"];
		$cnav_avg_num = 0;
		$avg_arr = array();
		if (floatval($cnav_avg_num1)>floatval(0)) {
			$avg_arr[] = floatval($cnav_avg_num1);
		}
		if (floatval($cnav_avg_num2)>floatval(0)) {
			$avg_arr[] = floatval($cnav_avg_num2);
		}
		if (floatval($cnav_avg_num3)>floatval(0)) {
			$avg_arr[] = floatval($cnav_avg_num3);
		}
		if (floatval($cnav_avg_num4)>floatval(0)) {
			$avg_arr[] = floatval($cnav_avg_num4);
		}
		if (floatval($cnav_avg_num5)>floatval(0)) {
			$avg_arr[] = floatval($cnav_avg_num5);
		}
		if (count($avg_arr)==0) {
			return floatval(0);
		} else {
			return array_sum($avg_arr)/count($avg_arr);
		}
	}
	
	function get_company_total_reviews($company_id) {
		global $con;
		$cnav_num1 = get_employee_total_reviews($company_id);
		$cnav_num2 = get_applicant_total_reviews($company_id);
		$cnav_num3 = get_superior_total_reviews($company_id);
		$cnav_num4 = get_supplier_total_reviews($company_id);
		$cnav_num5 = get_prevention_total_reviews($company_id);
	
		$cnav_num = intval($cnav_num1) + intval($cnav_num2) + intval($cnav_num3) + intval($cnav_num4) + intval($cnav_num5);
		return $cnav_num;
	}
	
	function get_employee_total_reviews($company_id) {
		global $con;
		$cnav_res1 = mysqli_query($con, "SELECT COUNT(employee_review_id) as total_1 FROM employee_review WHERE company_id = $company_id AND review_published = 1");
		$cnav_num1 = mysqli_fetch_array($cnav_res1)["total_1"];
		return $cnav_num1;
	}
	
	function get_applicant_total_reviews($company_id) {
		global $con;
		$cnav_res2 = mysqli_query($con, "SELECT COUNT(applicant_review_id) as total_2 FROM applicant_review WHERE company_id = $company_id AND review_published = 1");
		$cnav_num2 = mysqli_fetch_array($cnav_res2)["total_2"];
		return $cnav_num2;
	}
	
	function get_superior_total_reviews($company_id) {
		global $con;
		$cnav_res3 = mysqli_query($con, "SELECT COUNT(superior_review_id) as total_3 FROM superior_review WHERE company_id = $company_id AND review_published = 1");
		$cnav_num3 = mysqli_fetch_array($cnav_res3)["total_3"];
		return $cnav_num3;
	}
	
	function get_supplier_total_reviews($company_id) {
		global $con;
		$cnav_res4 = mysqli_query($con, "SELECT COUNT(supplier_review_id) as total_4 FROM supplier_review WHERE company_id = $company_id AND review_published = 1");
		$cnav_num4 = mysqli_fetch_array($cnav_res4)["total_4"];
		return $cnav_num4;
	}
	
	function get_prevention_total_reviews($company_id) {
		global $con;
		$cnav_res5 = mysqli_query($con, "SELECT COUNT(prevention_review_id) as total_5 FROM prevention_review WHERE company_id = $company_id AND review_published = 1");
		$cnav_num5 = mysqli_fetch_array($cnav_res5)["total_5"];
		return $cnav_num5;
	}
	
	function set_company_average($company_id) {
		global $con;
		$company_score = get_company_average($company_id);
		$company_score = number_format(floatval($company_score), 2, ".", "");
		mysqli_query($con, "UPDATE company SET company_score='$company_score' WHERE company_id=$company_id");
	}
?>
<?php
function randomPassword() {
    $alphabet = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

function custom_number_format($n, $precision = 1) {
    if ($n < 1000) {
        // Anything less than a million
        $n_format = number_format($n);
    } else if ($n < 1000000) {
        // Anything less than a billion
        $n_format = number_format($n / 1000, $precision) . 'K';
    } else if ($n < 1000000000) {
        // Anything less than a billion
        $n_format = number_format($n / 1000000, $precision) . 'M';
    } else {
        // At least a billion
        $n_format = number_format($n / 1000000000, $precision) . 'B';
    }

    return $n_format;
}
?>
<?php function show_news_likes($news_id, $font="1.5em") { ?>
	<?php
		global $con;
	?>
	<p style="font-size:<?php echo $font; ?>">
		<?php
			$user_id = 0;
			if (isset($_SESSION["user_id"])) {
				$user_id = $_SESSION["user_id"];
			}
			
			$like_color = "";
			$chk_res = mysqli_query($con, "SELECT * FROM news_like WHERE news_id=$news_id AND user_id=$user_id AND is_liked=1");
			if (mysqli_num_rows($chk_res)>0) { // Already liked
				$like_color = "text-primary";
			}
			$like_res = mysqli_query($con, "SELECT COUNT(news_id) AS like_count FROM news_like WHERE news_id=$news_id AND is_liked=1");
			$like_count = intval(mysqli_fetch_array($like_res)["like_count"]);
		?>
		<i class="fa fa-thumbs-up <?php echo $like_color ?>" style="cursor:pointer;" onclick="like_news(<?php echo $news_id ?>)"></i>
		<?php echo custom_number_format($like_count) ?>
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		
		<?php
			$dislike_color = "";
			$chk_res = mysqli_query($con, "SELECT * FROM news_like WHERE news_id=$news_id AND user_id=$user_id AND is_disliked=1");
			if (mysqli_num_rows($chk_res)>0) { // Already disliked
				$dislike_color = "text-primary";
			}
			$dislike_res = mysqli_query($con, "SELECT COUNT(news_id) AS dislike_count FROM news_like WHERE news_id=$news_id AND is_disliked=1");
			$dislike_count = intval(mysqli_fetch_array($dislike_res)["dislike_count"]);
		?>
		<i class="fa fa-thumbs-down <?php echo $dislike_color ?>" style="cursor:pointer;" onclick="dislike_news(<?php echo $news_id ?>)"></i>
		<?php echo custom_number_format($dislike_count) ?>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<?php
			$comment_res = mysqli_query($con, "SELECT COUNT(news_id) AS comment_count FROM news_comment WHERE news_id=$news_id");
			$comment_count = intval(mysqli_fetch_array($comment_res)["comment_count"]);
		?>
		<a href="news.php?id=<?php echo $news_id ?>#comments" style="color:inherit;"><i class="fa fa-comment" style="cursor:pointer;"></i></a>
		<?php echo custom_number_format($comment_count) ?>
	</p>
<?php } ?>
<?php
	function show_company_follow_btn($company_id) {
		global $con;
		$btn_class = "btn btn-danger btn-sm";
		$btn_text = "Folgen";
		$btn_opacity = 1;
		$user_id = 0;
		if (isset($_SESSION["user_id"])) {
			$user_id = $_SESSION["user_id"];
		}
		$follow_res = mysqli_query($con, "SELECT * FROM company_follower WHERE company_id=$company_id AND user_id=$user_id") or die(mysqli_error($con));
		if (mysqli_num_rows($follow_res)>0) { // Already follwed
			$btn_text = "Folgenden";
			$btn_opacity = 0.5;
		}
		
		$follow_count = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(company_follower_id) AS follower_count FROM company_follower WHERE company_id=$company_id"))["follower_count"];
		?>
			<button onclick="follow_company(<?php echo $company_id; ?>)" class="<?php echo $btn_class ?>" style="opacity:<?php echo $btn_opacity ?>">
				<?php echo $btn_text ?>
				<span style="opacity:0.4">|</span>
				<?php echo custom_number_format($follow_count) ?>
			</button>
		<?php
	}
	
	function show_fake_button($review_type, $review_id) {
		global $con;
		$total_upvotes = intval(mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) AS total_upvotes FROM review_upvote WHERE review_id=$review_id AND review_type='$review_type'"))["total_upvotes"]);
		$fake_button_link = "login.php";
		if (isset($_SESSION["user_id"])) {
			$voted = 0;
			$fake_button_link = "operations.php?add_fake_comment_vote=$review_id&type=$review_type&backto=".$_SERVER["REQUEST_URI"];
			$upvote_res = mysqli_query($con, "SELECT * FROM review_upvote WHERE user_id = {$_SESSION["user_id"]} AND review_id=$review_id AND review_type='$review_type'");
			if (mysqli_num_rows($upvote_res)>0) {
				$voted = 1;
				$fake_button_link = "operations.php?delete_fake_comment_vote=$review_id&type=$review_type&backto=".$_SERVER["REQUEST_URI"];
			}
		}
		?>
			<div class="my-2">
				<a href="<?php echo $fake_button_link; ?>" style="text-decoration:none;"><button class="btn btn-link btn-sm <?php if ($voted==1) echo "bg-primary text-light" ?>" style="text-decoration:none;"><i class="fa fa-arrow-circle-o-up"></i> Fake-Kommentar <small>(<?php echo $total_upvotes ?>)</small></button></a>
			</div>
		<?php
	}
// Neue Funktionen für Superior Profile Views
function log_superior_view($superior_review_id, $company_id, $superior_name) {
    global $con;
    
    $timestamp = time();
    $ip = $_SERVER['REMOTE_ADDR'];
    
    // Prüfe ob der gleiche Besucher die Führungskraft in den letzten 24h bereits angesehen hat
    $check_query = "SELECT view_id FROM superior_profile_views 
                   WHERE superior_review_id = ? 
                   AND ip_address = ? 
                   AND view_timestamp > ?";
                   
    $stmt = mysqli_prepare($con, $check_query);
    $yesterday = time() - (24 * 60 * 60);
    mysqli_stmt_bind_param($stmt, "isi", $superior_review_id, $ip, $yesterday);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    
    // Nur zählen wenn kein Aufruf in den letzten 24h
    if (mysqli_num_rows($result) == 0) {
        $insert_query = "INSERT INTO superior_profile_views 
                        (superior_review_id, company_id, superior_name, view_timestamp, ip_address) 
                        VALUES (?, ?, ?, ?, ?)";
                        
        $stmt = mysqli_prepare($con, $insert_query);
        mysqli_stmt_bind_param($stmt, "iisis", $superior_review_id, $company_id, $superior_name, $timestamp, $ip);
        mysqli_stmt_execute($stmt);
    }
}

function get_superior_views($superior_review_id, $company_id) {
    global $con;
    
    $views_query = "SELECT COUNT(DISTINCT ip_address) as view_count 
                   FROM superior_profile_views 
                   WHERE superior_review_id = ? 
                   AND company_id = ?";
    
    $stmt = mysqli_prepare($con, $views_query);
    mysqli_stmt_bind_param($stmt, "ii", $superior_review_id, $company_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    return mysqli_fetch_assoc($result)['view_count'];
}
// ... existing code ...

function generateVerificationCode() {
    // Generiert einen sicheren 32-Zeichen langen Code
    return bin2hex(random_bytes(16));
}

function sendVerificationEmail($to_email, $verification_code, $executive) {
    global $email_host, $email_username, $email_password, $email_smtp_secure, 
           $email_port, $email_from, $email_from_name, $email_reply, $email_reply_name;
    
    require_once __DIR__ . '/PHPMailer/src/Exception.php';
    require_once __DIR__ . '/PHPMailer/src/PHPMailer.php';
    require_once __DIR__ . '/PHPMailer/src/SMTP.php';

    try {    
        $mail = new PHPMailer\PHPMailer\PHPMailer(true);
        
        // Server settings
        $mail->isSMTP();
        $mail->Host       = strval($email_host ?? 'smtp.strato.de');
        $mail->SMTPAuth   = true;
        $mail->Username   = strval($email_username ?? 'info@execurater.de');
        $mail->Password   = strval($email_password);
        $mail->SMTPSecure = strval($email_smtp_secure ?? 'tls');
        $mail->Port       = intval($email_port ?? 587);
        $mail->CharSet    = 'UTF-8';

        // Absender - Stelle sicher, dass keine null-Werte übergeben werden
        $mail->setFrom(
            strval($email_from ?? 'info@execurater.de'), 
            strval($email_from_name ?? 'Execurater')
        );
        
        // Reply-To
        $mail->addReplyTo(
            strval($email_reply ?? 'info@execurater.de'), 
            strval($email_reply_name ?? 'Execurater')
        );
        
        // Empfänger
        $mail->addAddress(strval($to_email));

        // Inhalt
        $mail->isHTML(true);
        $mail->Subject = 'Verifizieren Sie Ihr Execurater Führungskraft-Profil';

        // Sicherstellen, dass die Namen nicht null sind
        $firstname = strval($executive['superior_review_firstname'] ?? '');
        $lastname = strval($executive['superior_review_lastname'] ?? '');
        $verification_code = strval($verification_code);

        $mail->Body = "
            <h2>Willkommen bei Execurater!</h2>
            <p>Sehr geehrte/r " . htmlspecialchars($firstname) . " " . htmlspecialchars($lastname) . ",</p>
            <p>Bitte bestätigen Sie Ihre E-Mail-Adresse, um Ihr Führungskraft-Profil zu verifizieren.</p>
            <p>Ihr Verifizierungscode lautet: <strong>{$verification_code}</strong></p>
            <p>Oder klicken Sie direkt auf diesen Link:</p>
            <p><a href='https://execurater.de/verify_claim.php?code={$verification_code}'>Profil verifizieren</a></p>
            <p>Der Code ist 24 Stunden gültig.</p>
            <br>
            <p>Mit freundlichen Grüßen</p>
            <p>Ihr Execurater Team</p>
        ";

        // Plaintext Alternative
        $mail->AltBody = "Willkommen bei Execurater!\n\n" .
            "Sehr geehrte/r $firstname $lastname,\n\n" .
            "Bitte bestätigen Sie Ihre E-Mail-Adresse, um Ihr Führungskraft-Profil zu verifizieren.\n" .
            "Ihr Verifizierungscode lautet: $verification_code\n\n" .
            "Oder besuchen Sie diesen Link:\n" .
            "https://execurater.de/verify_claim.php?code=$verification_code\n\n" .
            "Der Code ist 24 Stunden gültig.\n\n" .
            "Mit freundlichen Grüßen\n" .
            "Ihr Execurater Team";

        $mail->send();
        return true;
    } catch (\PHPMailer\PHPMailer\Exception $e) {
        error_log("Mailer Error: " . $mail->ErrorInfo);
        return false;
    }
}
?>
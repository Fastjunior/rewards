-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: database-5013036621.webspace-host.com
-- Generation Time: Mar 11, 2024 at 01:01 PM
-- Server version: 5.7.41-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs10946312`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_us_id` int(255) NOT NULL,
  `about_us_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_us_id`, `about_us_text`) VALUES
(1, 'Execurater ist eine Plattform, die die Stimmen der Arbeitnehmer erhöht und eine ehrliche, ungeschminkte Darstellung der Arbeitswelt bietet. Unser Fokus liegt darauf, die Wahrheit ans Licht zu bringen und diejenigen zu unterstützen, die sich oft nicht trauen, ihre Gedanken und Erfahrungen zu teilen.\r\n\r\nWir glauben an die Macht der kollektiven Stimme und daran, dass jede einzelne Erfahrung zählt. Bei Execurater geht es darum, eine Community aufzubauen, die die Arbeitswelt nachhaltig verändert, indem sie ehrliche Bewertungen und Einblicke in Unternehmen und Vorgesetzte ermöglicht.\r\n\r\nUnsere Plattform fördert Offenheit, Fairness und Zusammenarbeit. Wir ermutigen dazu, das Miteinander zu stärken und eine Umgebung zu schaffen, in der Arbeitnehmer sich sicher fühlen, ihre Ansichten zu teilen, und gleichzeitig dazu beitragen, positive Veränderungen in Unternehmen herbeizuführen.\r\n\r\nUnser Ziel ist es, eine transparente Arbeitswelt zu schaffen, in der jede Stimme gehört wird und in der die Wahrheit über Arbeitsbedingungen, Unternehmenskultur und Führungsstile ans Licht kommt. Wir sind davon überzeugt, dass dies dazu beiträgt, nicht nur die Arbeitswelt selbst, sondern auch das Leben der Menschen, die in ihr tätig sind, nachhaltig zu verbessern.');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_review`
--

CREATE TABLE `applicant_review` (
  `applicant_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `applicant_review_timestamp` int(255) NOT NULL,
  `applicant_advertised_as` varchar(255) NOT NULL,
  `applicant_advertised_year` int(10) NOT NULL,
  `applicant_result_of_application` varchar(255) NOT NULL,
  `applicant_review_title` varchar(255) NOT NULL,
  `suggestion_improvement` text NOT NULL,
  `applicant_total_interviews` int(255) NOT NULL,
  `applicant_total_interlocutors` int(255) NOT NULL,
  `applicant_psycho_test` varchar(255) NOT NULL,
  `applicant_assessment_center` varchar(255) NOT NULL,
  `applicant_recruiting_events` varchar(255) NOT NULL,
  `applicant_recruiting_employer` varchar(255) NOT NULL,
  `question_to_person` text NOT NULL,
  `question_to_career` text NOT NULL,
  `other_questions` text NOT NULL,
  `applicant_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_review_category`
--

CREATE TABLE `applicant_review_category` (
  `applicant_review_category_id` int(255) NOT NULL,
  `applicant_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `applicant_review_category`
--

INSERT INTO `applicant_review_category` (`applicant_review_category_id`, `applicant_review_category_name`) VALUES
(1, 'Vor dem Bewerbungsgespräch'),
(2, 'Während des Bewerbungsgesprächs'),
(3, 'Nach dem Bewerbungsgespräch');

-- --------------------------------------------------------

--
-- Table structure for table `applicant_review_other_star`
--

CREATE TABLE `applicant_review_other_star` (
  `applicant_review_other_star_id` int(255) NOT NULL,
  `applicant_review_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `applicant_review_question_name` varchar(255) NOT NULL,
  `applicant_review_other_stars` int(10) NOT NULL,
  `applicant_review_other_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_review_star`
--

CREATE TABLE `applicant_review_star` (
  `applicant_review_star_id` int(255) NOT NULL,
  `applicant_review_id` int(255) NOT NULL,
  `applicant_review_category_id` int(255) NOT NULL,
  `applicant_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `applicant_review_stars` int(10) NOT NULL,
  `applicant_review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_review_subcategory`
--

CREATE TABLE `applicant_review_subcategory` (
  `applicant_review_subcategory_id` int(255) NOT NULL,
  `applicant_review_category_id` int(255) NOT NULL,
  `applicant_review_subcategory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `applicant_review_subcategory`
--

INSERT INTO `applicant_review_subcategory` (`applicant_review_subcategory_id`, `applicant_review_category_id`, `applicant_review_subcategory_name`) VALUES
(1, 1, 'Zufriedenstellende Reaktion'),
(2, 1, 'Schnelle Antwort'),
(3, 1, 'Erwartbarkeit des Prozesses'),
(4, 2, 'Professionalität des Gesprächs'),
(5, 2, 'Vollständigkeit der Infos'),
(6, 2, 'Angenehme Atmosphäre'),
(7, 2, 'Wertschätzende Behandlung'),
(8, 2, 'Zufriedenstellende Antworten'),
(9, 2, 'Erklärung der weiteren Schritte'),
(10, 3, 'Zeitgerechte Zu- oder Absage');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(255) NOT NULL,
  `company_score` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_title` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `company_cover` varchar(255) NOT NULL,
  `company_desc` text NOT NULL,
  `company_location` varchar(255) NOT NULL,
  `company_location_lat` varchar(255) NOT NULL,
  `company_location_lng` varchar(255) NOT NULL,
  `company_timestamp` int(255) NOT NULL,
  `company_branch` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_score`, `user_id`, `company_title`, `company_logo`, `company_cover`, `company_desc`, `company_location`, `company_location_lat`, `company_location_lng`, `company_timestamp`, `company_branch`) VALUES
(2, '3.54', 1, 'ADS Allgemeine Deutsche Steuerberatungsgesellschaft  mbH', '2021/04/27/1619526755_8020.jpg', '2021/04/27/1619527071_8193.jpg', 'Die ADS Allgemeine Deutsche Steuerberatungsgesellschaft mbH ist eine deutschlandweit tätige Beratungsgesellschaft für Steuern, Finanzen und Betriebswirtschaft und gehört zum EDEKA-Verband. Mit 26 Zweigniederlassungen, 6 Kompetenz- und ServiceCentern, einer Zentrale in Hamburg und mehr als 800 Mitarbeiter/innen verfügen wir über ein kompetentes Netzwerk an Spezialisten.\r\n\r\nNeben der klassischen Steuerberatung verfolgen wir einen ganzheitlichen Beratungsansatz mit Leistungen u.a. in den Bereichen betriebswirtschaftliche Beratung, Privatberatung und Nachlassverwaltung.\r\n\r\nIhre Karriere bei uns\r\n\r\nOb Berufseinsteiger oder Berufserfahrener: Wir bieten Ihnen ein Arbeitsfeld, in dem Sie sich wohlfühlen und entwickeln können. Dazu gehören vielfältige und verantwortungsvolle Tätigkeiten mit Perspektive und ein umfangreiches Aus-und Fortbildungsprogramm.', 'Dera Adda, Multan, Pakistan', '30.1887271', '71.4510633', 1614870766, ''),
(4, '', 0, 'My Company 123', '', '', 'great', 'Lalak Jaan Park, Multan, Pakistan', '30.1900123', '71.4359661', 1617189233, ''),
(5, '', 0, 'My Company 456', '', '', 'wow', 'Dera Adda, Multan, Pakistan', '30.1887271', '71.4510633', 1617189385, ''),
(12, '4.38', 7, 'Khan Cons', '2021/04/29/1619731545_4925.jpg', '2021/04/29/1619733362_7960.jpg', '', 'München', '48.1351253', '11.5819805', 1617524931, ''),
(13, '', 0, 'Yasir Companies', '', '', 'Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description ', 'Lahore, Pakistan', '31.5203696', '74.3587473', 1619715772, ''),
(14, '', 0, 'Ahmed Industries', '', '', 'Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description Here is the description ', 'Okara, North', '30.8138017', '73.4533779', 1619715774, ''),
(17, '4.46', 0, 'ManagersBook', '', '', 'Lets Change the World of WORK!', 'München', '48.1351253', '11.5819805', 1619729875, ''),
(18, '', 0, 'BVT', '', '', 'MUC', 'München', '48.1351253', '11.5819806', 1701786036, ''),
(19, '3.15', 0, 'BVT', '', '', 'Fonds', 'München', '48.1351253', '11.5819806', 1701789799, ''),
(20, '', 0, 'BVT Holding GmbH & Co. KG', '', '', 'blabla', 'Rosenheimer Str. 141h, München', '48.1234889', '11.6032219', 1701806828, ''),
(21, '3.47', 0, 'CCC', '', '', 'M.K CEO', 'Starnberg', '47.9999615', '11.3390089', 1701930577, ''),
(22, '', 32, 'Sauer BAU und Projektentwicklung GmbH', '2023/12/12/1702410643_5232.png', '', 'Sauer BAU und Projektentwicklung GmbH\r\nist ein modernes, kompetentes Full-Service-Unternehmen in den Bereichen Abbruch, Sanierung von Schadstoffen (insbes. auch von Asbest), Entsorgung, Recycling, Erdarbeiten und Nutzbarmachung von Grundstücken für Neubauten und Projektentwicklung.\r\nWir begleiten Investoren bei Erwerb und Revitalisierung von Bestandsgebäuden und Liegenschaften mit Altlastenproblematiken, mit kostensicheren Einschätzungen und innovativen Lösungsansätzen.', 'München Unterhaching', '48.0689177', '11.6212533', 1702410643, '');

-- --------------------------------------------------------

--
-- Table structure for table `company_access`
--

CREATE TABLE `company_access` (
  `company_access_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_access`
--

INSERT INTO `company_access` (`company_access_id`, `company_id`, `user_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 22, 32);

-- --------------------------------------------------------

--
-- Table structure for table `company_access_request`
--

CREATE TABLE `company_access_request` (
  `company_access_request_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_follower`
--

CREATE TABLE `company_follower` (
  `company_follower_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_follower`
--

INSERT INTO `company_follower` (`company_follower_id`, `user_id`, `company_id`) VALUES
(9, 1, 2),
(14, 7, 2),
(10, 1, 11),
(13, 7, 12),
(12, 7, 17);

-- --------------------------------------------------------

--
-- Table structure for table `company_for_applicants`
--

CREATE TABLE `company_for_applicants` (
  `company_for_applicants_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `for_applicants_id` int(255) NOT NULL,
  `company_for_applicants_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company_for_applicants`
--

INSERT INTO `company_for_applicants` (`company_for_applicants_id`, `company_id`, `for_applicants_id`, `company_for_applicants_text`) VALUES
(21, 2, 1, 'Ansprechpartnerin für Direkteinstieg:\r\nChristine Schulz\r\nTelefon 040 63305-5039\r\n\r\nAnsprechpartner für Ausbildung, Studium und Praktikum:\r\nMilena Bock\r\nTelefon 040 63305-5044'),
(22, 2, 2, 'Wir möchten Sie gerne kennernlernen - teilen Sie uns daher im Anschreiben mit, was Sie an der ausgeschriebenen Position reizt und welche Erwartungen Sie an die neue Stelle haben. Informieren Sie sich vorab auf unserer Website über unser Unternehmen und unsere Leistungen/Produkte. Bleiben Sie während des Bewerbungsprozesses authentisch und überzeugen Sie uns von Ihrem Interesse an einer Tätigkeit bei der ADS!'),
(23, 2, 3, 'Für ein erstes Kennenlernen findet i.d.R. ein Telefoninterview statt und im nächsten Schritt folgt ein persönliches Vorstellungsgespräch.'),
(24, 2, 4, 'Bitte laden Sie Ihre Bewerbungsunterlagen (Anschreiben, Lebenslauf und Zeugnisse) über unser Online-Portal hoch: https://www.ads-steuer.de/karriere/stellenboerse\r\n\r\nDadurch sind Ihre Unterlagen für den zuständigen Ansprechpartner direkt verfügbar.'),
(25, 2, 5, 'Wenn Sie sich für eine Position mit Leitungsfunktion bewerben, nehmen Sie zusätzlich an einem Assessment-Center teil.\r\n\r\nFür die Auswahl unserer Azubis und Dualstudenten organisieren wir unseren sogenannten Bewerbertag. '),
(26, 12, 1, 'S.K'),
(27, 12, 2, 'Offenheit'),
(28, 12, 3, 'Anschreiben+Lebenslauf+Zeugnisse '),
(29, 12, 4, 'per Mail'),
(30, 12, 5, 'kurze Kommunikationswege und schnelle Entscheidungen');

-- --------------------------------------------------------

--
-- Table structure for table `company_photo`
--

CREATE TABLE `company_photo` (
  `company_photo_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `company_photo_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company_photo`
--

INSERT INTO `company_photo` (`company_photo_id`, `company_id`, `company_photo_name`) VALUES
(1, 2, '2021/03/05/1614958117_1491.jpg'),
(2, 2, '2021/03/05/1614966763_4123.jpg'),
(3, 2, '2021/03/05/1614966773_8340.jpg'),
(4, 2, '2021/03/05/1614966781_8585.jpg'),
(5, 2, '2021/04/27/1619527981_2589.jpg'),
(6, 12, '2021/04/29/1619731417_3322.jpg'),
(7, 12, '2021/04/29/1619731451_1554.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `company_supervisor`
--

CREATE TABLE `company_supervisor` (
  `company_supervisor_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_supervisor_name` varchar(255) NOT NULL,
  `company_supervisor_position` varchar(255) NOT NULL,
  `company_supervisor_image` varchar(255) NOT NULL,
  `company_supervisor_from` varchar(255) NOT NULL,
  `company_supervisor_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company_supervisor`
--

INSERT INTO `company_supervisor` (`company_supervisor_id`, `company_id`, `user_id`, `company_supervisor_name`, `company_supervisor_position`, `company_supervisor_image`, `company_supervisor_from`, `company_supervisor_to`) VALUES
(7, 2, 21, 'Arkent', 'Web Developer / Manager', '', '2021', 'Present'),
(8, 2, 22, 'Sabir', 'Manager', '', '2021', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `company_video`
--

CREATE TABLE `company_video` (
  `company_video_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `company_video_yt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company_video`
--

INSERT INTO `company_video` (`company_video_id`, `company_id`, `company_video_yt`) VALUES
(1, 2, '01Q6hB2gUSg'),
(2, 2, 'HGkGyDv-0OM'),
(3, 2, 'svEG3kwmuRg');

-- --------------------------------------------------------

--
-- Table structure for table `company_what_we_offer`
--

CREATE TABLE `company_what_we_offer` (
  `company_wwo_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `what_we_offer_id` int(255) NOT NULL,
  `company_wwo_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `company_what_we_offer`
--

INSERT INTO `company_what_we_offer` (`company_wwo_id`, `company_id`, `what_we_offer_id`, `company_wwo_text`) VALUES
(9, 2, 1, '* flexible Arbeitszeiten und Teilzeitmodelle\r\n* fachliche und persönliche Weiterbildung\r\n* betriebliche Altersvorsorge und Gruppenunfallversicherung\r\n* Zuschüsse für Sport- und Gesundheitsmaßnahmen\r\n* Unterstützung bei der Vereinbarkeit von Familie und Beruf\r\n* Heiligabend und Silvester erhalten Sie zusätzlich frei\r\n* an Ihrem Geburtstag schenken wir Ihnen einen halben Urlaubstag\r\n* Mitarbeiterevents (Betriebsausflug, Weihnachtsfeier, Jubiläumsveranstaltung)'),
(10, 2, 2, 'Die ADS gehört zum EDEKA-Verbund und weist jahrzehntelange Erfahrung insbesondere im Einzelhandel auf. Das heißt wir verfügen über umfangreiche Branchenkenntnisse.\r\n\r\nMittlerweile vertrauen über 8.000 Mandanten – darunter mehr als 2.000 EDEKA-Kaufleute – auf unser Spezialisten-Wissen. Die Kombination aus örtlicher Nähe und überregionalen Netzwerk macht die ADS zu dem, was sie heute ist: ein großes modernes Dienstleistungsunternehmen. \r\n\r\nBei uns haben Sie die Chance, sich einzubringen und etwas zu bewegen.');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `conversation_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `conversation_update` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`conversation_id`, `user_id`, `conversation_update`) VALUES
(1, 1, 1617471986),
(6, 4, 1617468215),
(14, 2, 1617704895),
(15, 8, 1617898029),
(16, 7, 1619726260),
(17, 9, 1617902242),
(18, 13, 1617995976),
(19, 16, 1617996654),
(20, 17, 1619361482),
(21, 18, 1619363444),
(24, 19, 1619767660),
(56, 20, 1619808707),
(57, 29, 1701713395),
(61, 39, 1703013958);

-- --------------------------------------------------------

--
-- Table structure for table `corporate_division`
--

CREATE TABLE `corporate_division` (
  `corporate_division_id` int(255) NOT NULL,
  `corporate_division_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `corporate_division`
--

INSERT INTO `corporate_division` (`corporate_division_id`, `corporate_division_name`) VALUES
(1, 'Administration / administration'),
(2, 'Procurement / purchasing'),
(3, 'Design / creation'),
(4, 'Finance / Controlling'),
(5, 'Research & Development'),
(6, 'Managing directors'),
(7, 'IT'),
(8, 'Logistics / materials management'),
(9, 'Marketing / product management'),
(10, 'PR / communication'),
(11, 'Personnel / training and further education'),
(12, 'production'),
(13, 'Law & Taxation'),
(14, 'Sales sale'),
(15, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email_id` int(255) NOT NULL,
  `email_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email_id`, `email_name`) VALUES
(4, 'hassan@gmail.com'),
(1, 'yasir72.multan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee_nomination`
--

CREATE TABLE `employee_nomination` (
  `employee_nomination_id` int(255) NOT NULL,
  `en_gender` varchar(255) NOT NULL,
  `en_fname` varchar(255) NOT NULL,
  `en_lname` varchar(255) NOT NULL,
  `en_email` varchar(255) NOT NULL,
  `en_telephone` varchar(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `en_reason` text NOT NULL,
  `en_contact_person` text NOT NULL,
  `en_point_1` text NOT NULL,
  `en_point_2` text NOT NULL,
  `en_point_3` text NOT NULL,
  `en_point_4` text NOT NULL,
  `en_point_5` text NOT NULL,
  `en_timestamp` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_nomination`
--

INSERT INTO `employee_nomination` (`employee_nomination_id`, `en_gender`, `en_fname`, `en_lname`, `en_email`, `en_telephone`, `company_id`, `en_reason`, `en_contact_person`, `en_point_1`, `en_point_2`, `en_point_3`, `en_point_4`, `en_point_5`, `en_timestamp`) VALUES
(3, 'Herr', 'Yasir', 'Mushtaq', 'yasir@gmail.com', '123-456-789', 2, 'here is the reason', 'here is the details', 'yes great', 'nice', 'wow', 'super', 'amazing', 1623416390);

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `employee_position_id` int(255) NOT NULL,
  `employee_position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee_position`
--

INSERT INTO `employee_position` (`employee_position_id`, `employee_position_name`) VALUES
(1, 'Angestellte/r oder Arbeiter/in'),
(2, 'Führungskraft / Management'),
(3, 'Zeitarbeiter/in'),
(4, 'Freelancer'),
(5, 'Werkstudent/in'),
(6, 'Praktikant/in'),
(7, 'Auszubildende/r');

-- --------------------------------------------------------

--
-- Table structure for table `employee_review`
--

CREATE TABLE `employee_review` (
  `employee_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `employee_review_timestamp` int(255) NOT NULL,
  `employee_review_current_job` int(10) NOT NULL,
  `employee_position_id` int(255) NOT NULL,
  `employee_review_title` varchar(255) NOT NULL,
  `improvement_suggestions` text NOT NULL,
  `what_is_good` text NOT NULL,
  `what_is_bad` text NOT NULL,
  `recommend_to_friend` int(10) NOT NULL DEFAULT '1',
  `employee_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee_review`
--

INSERT INTO `employee_review` (`employee_review_id`, `review_published`, `user_id`, `company_id`, `employee_review_timestamp`, `employee_review_current_job`, `employee_position_id`, `employee_review_title`, `improvement_suggestions`, `what_is_good`, `what_is_bad`, `recommend_to_friend`, `employee_review_email`, `company_reply`) VALUES
(15, 1, 0, 21, 1702372496, 0, 2, 'Tolle Idee schlechtes Führungspersonal', 'Es sollte professioneller gestaltet werden. Es gibt zu viele persönliche Befindlichkeiten auch Schimpfwörter fallen wenn die entsprechenden Kollegen nicht anwesend sind. ', 'Dynamisch', 'Überstunden und sehr viel Arbeit die nicht mit dieser Teamstärke aufgefangen werden kann', 0, 'suleiman.khan@gmx.de', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_review_category`
--

CREATE TABLE `employee_review_category` (
  `employee_review_category_id` int(255) NOT NULL,
  `employee_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee_review_category`
--

INSERT INTO `employee_review_category` (`employee_review_category_id`, `employee_review_category_name`) VALUES
(1, 'Karriere & Gehalt'),
(2, 'Unternehmenskultur'),
(3, 'Arbeitsumgebung'),
(4, 'Vielfalt');

-- --------------------------------------------------------

--
-- Table structure for table `employee_review_other_star`
--

CREATE TABLE `employee_review_other_star` (
  `employee_review_other_star_id` int(255) NOT NULL,
  `employee_review_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `employee_review_question_name` varchar(255) NOT NULL,
  `employee_review_other_stars` int(10) NOT NULL,
  `employee_review_other_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `employee_review_star`
--

CREATE TABLE `employee_review_star` (
  `employee_review_star_id` int(255) NOT NULL,
  `employee_review_id` int(255) NOT NULL,
  `employee_review_category_id` int(255) NOT NULL,
  `employee_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `employee_review_stars` int(10) NOT NULL,
  `employee_review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee_review_star`
--

INSERT INTO `employee_review_star` (`employee_review_star_id`, `employee_review_id`, `employee_review_category_id`, `employee_review_subcategory_id`, `user_id`, `company_id`, `employee_review_stars`, `employee_review_text`) VALUES
(248, 15, 1, 1, 0, 21, 4, ''),
(249, 15, 1, 2, 0, 21, 5, ''),
(250, 15, 1, 3, 0, 21, 3, ''),
(251, 15, 2, 4, 0, 21, 3, 'Sehr dunkle Räume und die GF hat stets die Türen zu. '),
(252, 15, 2, 5, 0, 21, 2, 'Leider nur dann wenn GF mal am Plaudern ist. Sonst keine Infos an Kollegen'),
(253, 15, 2, 6, 0, 21, 4, 'Untereinander starker Zusammenhalt. Einer für alle alle für einen.'),
(254, 15, 2, 7, 0, 21, 4, 'HO möglich und auch mal Zeit für die Familie nehmen. Jedoch bleibt die Arbeit nicht stehen und muss entsprechend dann später abgearbeitet werden. '),
(255, 15, 2, 8, 0, 21, 3, 'Wenn man im inneren Kreis ist super und freundschaftlich. Solange einem die Nase eben passt. '),
(256, 15, 2, 9, 0, 21, 5, 'Das aufjedenfall aufgrund Start up. '),
(257, 15, 3, 10, 0, 21, 5, ''),
(258, 15, 3, 11, 0, 21, 1, 'GF hat eine 700PS Maschine.. ESG gleich 0'),
(259, 15, 4, 12, 0, 21, 3, ''),
(260, 15, 4, 13, 0, 21, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_review_subcategory`
--

CREATE TABLE `employee_review_subcategory` (
  `employee_review_subcategory_id` int(255) NOT NULL,
  `employee_review_category_id` int(255) NOT NULL,
  `employee_review_subcategory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee_review_subcategory`
--

INSERT INTO `employee_review_subcategory` (`employee_review_subcategory_id`, `employee_review_category_id`, `employee_review_subcategory_name`) VALUES
(1, 1, 'Gehalt/Sozialleistungen'),
(2, 1, 'Image'),
(3, 1, 'Karriere/Weiterbildung'),
(4, 2, 'Arbeitsatmosphäre'),
(5, 2, 'Kommunikation'),
(6, 2, 'Kollegenzusammenhalt'),
(7, 2, 'Work-Life-Balance'),
(8, 2, 'Vorgesetztenverhalten'),
(9, 2, 'Interessante Aufgaben'),
(10, 3, 'Arbeitsbedingungen'),
(11, 3, 'Umwelt-/Sozialbewusstsein'),
(12, 4, 'Gleichberechtigung'),
(13, 4, 'Umgang mit älteren Kollegen');

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `employee_salary_id` int(255) NOT NULL,
  `company_id` int(255) DEFAULT NULL,
  `employement` varchar(255) DEFAULT NULL,
  `part_time_weekly_hours` varchar(255) DEFAULT NULL,
  `hours_per_week` varchar(255) DEFAULT NULL,
  `salary_frequency` varchar(255) DEFAULT NULL,
  `num_of_monthly_salaries` varchar(255) DEFAULT NULL,
  `gross_salary` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `job_type` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `personnel_responsibility` varchar(255) DEFAULT NULL,
  `career` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `year_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_salary`
--

INSERT INTO `employee_salary` (`employee_salary_id`, `company_id`, `employement`, `part_time_weekly_hours`, `hours_per_week`, `salary_frequency`, `num_of_monthly_salaries`, `gross_salary`, `job_title`, `job_type`, `experience`, `personnel_responsibility`, `career`, `gender`, `year_of_birth`, `email`, `submitted`) VALUES
(1, 18, 'Vollzeit', '', '', 'Jährlich', '12x', '120000', 'Leiter Controlling', 'Aktueller Job', '6-10 Jahre', 'Ja', 'Teamlead (Manager)', 'Männlich', '1989', 'suleiman.khan@gmx.de', '2023-12-05 15:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `footer_link`
--

CREATE TABLE `footer_link` (
  `footer_link_id` int(255) NOT NULL,
  `footer_link_facebook` text NOT NULL,
  `footer_link_twitter` text NOT NULL,
  `footer_link_linkedin` text NOT NULL,
  `footer_link_xing` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `footer_link`
--

INSERT INTO `footer_link` (`footer_link_id`, `footer_link_facebook`, `footer_link_twitter`, `footer_link_linkedin`, `footer_link_xing`) VALUES
(1, 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.xing.com');

-- --------------------------------------------------------

--
-- Table structure for table `for_applicants`
--

CREATE TABLE `for_applicants` (
  `for_applicants_id` int(255) NOT NULL,
  `for_applicants_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `for_applicants`
--

INSERT INTO `for_applicants` (`for_applicants_id`, `for_applicants_name`) VALUES
(1, 'Ansprechpartner'),
(2, 'Erwartungen an Bewerber'),
(3, 'Bewerbungstipps'),
(4, 'Bevorzugte Bewerbungsform'),
(5, 'Auswahlverfahren');

-- --------------------------------------------------------

--
-- Table structure for table `impressum`
--

CREATE TABLE `impressum` (
  `impressum_id` int(255) NOT NULL,
  `impressum_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `impressum`
--

INSERT INTO `impressum` (`impressum_id`, `impressum_text`) VALUES
(1, 'Impressum\r\nAngaben gemäß § 5 TMG\r\n \r\n\r\nSK\'s New Work Rethink \r\nLeopoldstraße  XXX\r\n80809 München\r\n\r\n\r\nHaftungsausschluss\r\nDer Betreiber von Execurater nimmt für seine angebotenen Inhalte und Dienste das grundgesetzlich garantierte Recht auf Meinungs- und Pressefreiheit in Anspruch. Alle Inhalte werden von dem Execurater-Team sorgfältig nach bestem Wissen auf rechtliche Unbedenklichkeit und Tauglichkeit geprüft. Dabei wird kein Anspruch auf Vollständigkeit, Aktualität, Qualität und Richtigkeit erhoben. Für Schäden, die durch das Vertrauen auf die Inhalte dieser Webseite oder deren Gebrauch entstehen, kann keine Verantwortung übernommen werden. Darüber hinaus erklärt der Betreiber, dass zum Zeitpunkt der Link-Setzung die entsprechend verlinkten Internetseiten frei von bedenklichen Inhalten waren. Auf die aktuelle und zukünftige Gestaltung und auf die Inhalte der gelinkten Seiten hat der Betreiber keinen Einfluss. Deshalb distanziert sich der Betreiber ausdrücklich von allen Inhalten sämtlicher verlinkten Seiten, die nach Aufnahme auf dieser Webseite verändert wurden. Für illegale, fehlerhafte oder unvollständige Inhalte und insbesondere für Schäden, die aus der Nutzung oder Nichtnutzung der dargebotenen Informationen entstehen, kann ausschließlich der jeweilige Anbieter der Seite, auf die verwiesen wurde, verantwortlich gemacht werden, nicht aber derjenige, der auf diese verweist.\r\nUrheberrecht\r\nAlle Informationen, Inhalte, Bilder und Grafiken dieser Webseite unterliegen dem Urheberrecht und dürfen von Dritten nur nach Genehmigung veröffentlicht oder weiterverarbeitet werden.\r\n\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_description` text NOT NULL,
  `job_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `company_id`, `user_id`, `job_title`, `job_description`, `job_link`) VALUES
(3, 2, 1, 'Account Managers Jobs', 'Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. Here is the description. ', 'https://yari.pk/today/job/accounts-manager-jobs-in-food-processing-company-2021-yari-pk/?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic'),
(4, 2, 1, 'Website Development', 'here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description ', 'https://yari.pk/today/job/accounts-manager-jobs-in-food-processing-company-2021-yari-pk/?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic'),
(5, 2, 1, 'Website Development', 'here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description here is description ', 'https://yari.pk/today/job/accounts-manager-jobs-in-food-processing-company-2021-yari-pk/?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic'),
(6, 22, 32, 'Teamassistenz/ Empfang  (m/w/d)', 'Wir suchen ab sofort eine Teamassistenz/ Empfang (m/w/d) in Vollzeit:\r\n\r\n \r\n\r\nIhre Aufgaben:\r\n\r\nTelefonzentrale und Empfang Besuchen\r\nE-Mail-Bearbeitung und allgemeine Korrespondenz\r\nAllgemeine Büroorganisation unter anderem Bestellung von Büromaterial und Betriebsbedarf\r\nErstprüfung der Eingangsrechnungen sowie Dokumenten Management in DMS/DATEV\r\nDatenerfassung\r\nUnterstützung und Assistenz Bauleitung\r\nPflege der Social-Media-Kanäle\r\n \r\n\r\nIhr Profil:\r\n\r\nAbgeschlossene kaufmännische Ausbildung\r\nSehr gute MS Office-Kenntnisse\r\nErfahrung mit DATEV DMS (von Vorteil)\r\nErfahrung mit ZEDAL elektronisches Nachweisverfahren (von Vorteil)\r\nStrukturierte sowie ziel- und ergebnisorientierte Arbeitsweise\r\nHohe Belastbarkeit und Einsatzbereitschaft\r\nFließende Kenntnisse in Deutsch\r\n \r\n\r\nWir bieten Ihnen:\r\n\r\nÜberdurchschnittliche Vergütung\r\nWeihnachts- und Urlaubsgeld\r\nVWL\r\nFortbildung\r\n30 Tage Urlaub\r\nMVV-Ticket/Fahrkostenzuschuss\r\nGetränke, Kaffee, Tee und Sweets\r\nWork-Life-Balance \r\nEine abwechslungsreiche Position in einem sehr erfolgreichen, mittelständischen Unternehmen mit flachen Hierarchien und kurzen Entscheidungswegen. Wir sprechen (m/w/d) Bewerber gleichermaßen an.\r\n\r\n \r\n\r\nSie fühlen sich angesprochen und wir haben Ihr Interesse geweckt?\r\n\r\n \r\n\r\n \r\n\r\nDann freuen wir uns auf Ihre vollständigen Bewerbungsunterlagen unter Angabe des nächstmöglichen Einstellungstermins sowie Ihrer Gehaltsvorstellungen an sb@sauerbau.bayern.', 'https://www.sauerbau.bayern/');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `by_user` int(10) NOT NULL,
  `by_admin` int(10) NOT NULL,
  `message_seen` int(10) NOT NULL,
  `message_text` text NOT NULL,
  `message_timestamp` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `user_id`, `by_user`, `by_admin`, `message_seen`, `message_text`, `message_timestamp`) VALUES
(1, 1, 1, 0, 1, 'wow', 1617462297),
(2, 1, 1, 0, 1, 'great', 1617462575),
(3, 1, 1, 0, 1, 'great', 1617462593),
(4, 1, 1, 0, 1, 'oh wow', 1617462700),
(5, 1, 1, 0, 1, 'wow', 1617462732),
(6, 1, 1, 0, 1, 'wow', 1617462760),
(7, 1, 1, 0, 1, 'wow sir great!', 1617462989),
(8, 1, 1, 0, 1, 'thank you!', 1617463023),
(9, 1, 0, 1, 1, 'your welcome dear', 1617463023),
(10, 1, 1, 0, 1, 'thanks :)', 1617463642),
(11, 1, 1, 0, 1, 'ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ad asdba dedb d ', 1617464257),
(12, 1, 1, 0, 1, 'great', 1617464958),
(13, 1, 1, 0, 1, 'wow', 1617464966),
(14, 1, 1, 0, 1, 'wow', 1617465068),
(15, 1, 1, 0, 1, 'hmmm...', 1617465084),
(16, 1, 1, 0, 1, 'great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! great man! ', 1617465223),
(17, 1, 0, 1, 1, 'wow good', 1617465223),
(18, 4, 1, 0, 1, 'Hello Sir!', 1617466073),
(19, 1, 0, 1, 1, 'good', 1617467913),
(20, 1, 0, 1, 1, 'great!', 1617467918),
(21, 1, 0, 1, 1, 'good', 1617468008),
(22, 1, 1, 0, 1, 'thank you sir :)', 1617468014),
(23, 1, 0, 1, 1, 'your welcome', 1617468026),
(24, 1, 1, 0, 1, 'hmmm....', 1617468048),
(25, 4, 0, 1, 1, 'Hi Asif!', 1617468215),
(26, 1, 1, 0, 1, 'Great!!!', 1617471986),
(27, 2, 1, 0, 1, 'Aoa', 1617704224),
(28, 2, 1, 0, 1, 'Hello melisa', 1617704262),
(29, 2, 0, 1, 1, 'Hi', 1617704513),
(30, 2, 0, 1, 1, 'Hello', 1617704516),
(31, 2, 1, 0, 1, 'G jnb', 1617704531),
(32, 2, 1, 0, 1, 'Shin sion ', 1617704538),
(33, 2, 0, 1, 1, 'Kese ho', 1617704547),
(34, 2, 1, 0, 1, 'Great work', 1617704549),
(35, 2, 0, 1, 1, 'Thanks', 1617704555),
(36, 2, 1, 0, 1, 'Fatt', 1617704557),
(37, 2, 1, 0, 1, 'Ap bht acha ho', 1617704567),
(38, 2, 0, 1, 1, 'Ye admin-user wali chat ha. Not user-user', 1617704571),
(39, 2, 1, 0, 1, 'Good', 1617704582),
(40, 2, 0, 1, 1, 'User to user zyada achi hoti ha', 1617704599),
(41, 2, 0, 1, 1, 'Laikin wo social platform pr use hoti hai', 1617704613),
(42, 2, 0, 1, 1, '?????????????', 1617704640),
(43, 2, 0, 1, 1, 'Emoji support nahi krta', 1617704648),
(44, 2, 1, 0, 1, 'Acha kam kia hai or mobile responsive hai he pannel', 1617704664),
(45, 2, 1, 0, 1, 'Lakin mera nai chalta', 1617704672),
(46, 2, 1, 0, 1, '????????????????????????', 1617704680),
(47, 2, 1, 0, 1, 'G nai krta emojo', 1617704689),
(48, 2, 0, 1, 1, 'Emoji ki library lagti ha', 1617704739),
(49, 2, 0, 1, 1, 'Twitter emoji name ha library ka', 1617704749),
(50, 2, 1, 0, 1, 'Sahi or', 1617704762),
(51, 2, 0, 1, 1, 'Yahan har 5 second baad ajax call hoti hai jo new messages ko show krti ha', 1617704821),
(52, 2, 1, 0, 1, 'Late hai real time ho', 1617704860),
(53, 2, 0, 1, 1, 'Yar wo phir epizy itna support ni krta traffic ko', 1617704878),
(54, 2, 0, 1, 1, 'Is liye 5 sec rakha ha', 1617704884),
(55, 2, 0, 1, 1, 'Us ke server pr dalun ga to 1 sec kr du ga', 1617704895),
(56, 8, 1, 0, 1, 'hi', 1617898029),
(57, 7, 1, 0, 1, 'hi\n', 1617902227),
(58, 9, 1, 0, 1, 'hi\n', 1617902242),
(59, 13, 1, 0, 1, 'hallo\n', 1617994493),
(60, 13, 0, 1, 1, 'Hallo, wie kann ich Ihnen helfen?\n', 1617994513),
(61, 13, 1, 0, 1, 'ich wollte nur schauen ob mir jemand antwortet\n', 1617994544),
(62, 13, 0, 1, 1, 'ja du spasst\n', 1617994580),
(63, 13, 1, 0, 1, 'Hallo', 1617995976),
(64, 16, 1, 0, 1, 'Hi', 1617996654),
(65, 17, 1, 0, 1, 'hi', 1619361482),
(66, 18, 1, 0, 1, 'Hi', 1619363115),
(67, 18, 1, 0, 1, 'great', 1619363273),
(68, 18, 1, 0, 1, 'great one cool', 1619363307),
(69, 18, 1, 0, 1, 'wow thank you', 1619363334),
(70, 18, 1, 0, 1, 'absjd asdjbasjd asdnasl aslnxaksxnalskxnsksksks xsanxa xasnxas', 1619363343),
(71, 18, 1, 0, 1, 'wow good', 1619363375),
(72, 18, 1, 0, 1, 'm\n', 1619363430),
(73, 18, 1, 0, 1, 'nice one', 1619363440),
(74, 18, 1, 0, 1, 'cool good', 1619363444),
(75, 7, 1, 0, 1, 'TEST', 1619726239),
(76, 7, 0, 1, 1, 'Hallo, Wie kann ich Ihnen helfen? \n', 1619726260),
(77, 19, 1, 0, 1, 'Hallooo', 1619767147),
(78, 19, 1, 0, 1, 'Ist jemand da ?', 1619767166),
(79, 19, 0, 1, 1, 'Guten Tag Miguelitoooooooo :D', 1619767189),
(80, 19, 1, 0, 1, 'Hahaha geil', 1619767234),
(81, 19, 0, 1, 1, 'ge :D ', 1619767244),
(82, 19, 1, 0, 1, 'Ja schönes Ding ', 1619767245),
(83, 19, 1, 0, 1, 'Gefällt mir ', 1619767256),
(84, 19, 1, 0, 1, 'Ich habe das Gefühl das könnte etwas großes werden ', 1619767276),
(85, 19, 1, 0, 1, 'Du auch ?', 1619767280),
(86, 19, 0, 1, 1, 'Danke ist noch echt viel Arbeit.. Es kommen sehr viele Funktionen noch bis 15 Mai hinzu. Aber vom Design ist das doch gut und mordern oder?', 1619767281),
(87, 19, 1, 0, 1, 'Sehe ich auch so...da ist wirklich viel Arbeit noch ', 1619767315),
(88, 19, 0, 1, 1, 'Miguelito glaube mir.. ich auch... es fügt sich alles wie ein Puzzle.. ich hoffe so sehr das es einfach nur mein Gehalt zahlen kann dann bin ich schon der glücklischte Mensch der Welt', 1619767322),
(89, 19, 1, 0, 1, 'Aber das wird schon und ja das Design finde ich gut ', 1619767333),
(90, 19, 1, 0, 1, 'Das ist ja erstmal Inhalt was du brauchst ', 1619767365),
(91, 19, 0, 1, 1, 'Super, genau das mein ich.. Ich brauche jmd der wirklich von außen einen blick wirft und sehr kritisch alles hinterfragt. das kann ich nicht weil ich vom Fach bin', 1619767379),
(92, 19, 1, 0, 1, 'Später kannst ja Feinschliff verpassen das es noch schöner und intuitiv wird ', 1619767400),
(93, 19, 0, 1, 1, 'ja absolut! ', 1619767438),
(94, 19, 0, 1, 1, 'Ich wünsche uns beiden das wir mit unseren eigenen Sachen erfolgreich sind! ', 1619767466),
(95, 19, 1, 0, 1, 'Da helfe ich dir gerne und hinterfrage diee Sachen kritisch ', 1619767472),
(96, 19, 0, 1, 1, 'das weiß ich dass du da immer ehrlich und offen bist und das ist sehr wichtig', 1619767492),
(97, 19, 1, 0, 1, 'Mir fallen schon paar Sachen auf aber macht erstmal das fertig dann kann ich gern helfen ', 1619767502),
(98, 19, 1, 0, 1, 'Jaaaaa auf jefen Fall broooo', 1619767516),
(99, 19, 1, 0, 1, 'Oh man bin echt Grad so stolz bro', 1619767535),
(100, 19, 0, 1, 1, 'ok super.. Dann suchen wir einfach mal einen Tag aus.. Schau dir mal das office an alter :D ', 1619767538),
(101, 19, 0, 1, 1, 'https://www.immobilienscout24.de/expose/116804052?referrer=com_otp_search&searchGeoPath=%2Fde%2Fbayern%2Fmuenchen&searchPriceRangeType=TOTAL&searchPriceTo=350#/', 1619767540),
(102, 19, 1, 0, 1, 'Wir schreiben hier auf deine Website in Chat....stell dir Mal vor in 1-2 Jahren Millionen Einträge und Unternehmen mit 20 Mio Umsatz', 1619767602),
(103, 19, 0, 1, 1, 'und wenn wir da gemeinsam wären wie geil alter hahahah', 1619767607),
(104, 19, 1, 0, 1, ':)', 1619767615),
(105, 19, 0, 1, 1, 'puhh.. ich werd mir einen abhobeln hhahaha', 1619767622),
(106, 19, 1, 0, 1, 'Ich schaue gleich nach bro habe jetzt einen Fall aber melde mich später ', 1619767635),
(107, 19, 1, 0, 1, 'Bin alleine hier ', 1619767645),
(108, 19, 0, 1, 1, 'ok alter viel spaß und bis später! ich mach auch weiter', 1619767660),
(109, 20, 1, 0, 1, 'Hallo', 1619806874),
(110, 20, 0, 1, 1, 'Guten Abend', 1619806881),
(111, 20, 1, 0, 1, 'ja es klaüüt', 1619806893),
(112, 20, 0, 1, 1, 'Wie kann ich Ihnen helfen?', 1619806898),
(113, 20, 1, 0, 1, 'ich habe gar nis gemacht', 1619806925),
(114, 20, 1, 0, 1, 'https://www.steuerklassen.com/jobs/arbeitgeber-bewertung/bizzwatch/', 1619808707),
(115, 29, 1, 0, 1, 'Hi bro', 1701713395),
(116, 29, 1, 0, 1, 'Ich hätte gerne einen job', 1701713408),
(117, 29, 1, 0, 1, 'Shamone!', 1701713426),
(118, 29, 1, 0, 1, 'badaba! ', 1703013761),
(119, 39, 1, 0, 1, 'shamone', 1703013958);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `news_timestamp` int(255) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_description` text NOT NULL,
  `news_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `company_id`, `user_id`, `news_timestamp`, `news_title`, `news_description`, `news_image`) VALUES
(1, 2, 1, 1615374591, 'Great Place To Work', 'auxmoney wurde von seinen Mitarbeitern als einer der besten Arbeitgeber Deutschlands ausgezeichnet. 83% der Mitarbeiter finden: \"Alles in allem kann ich sagen, dies hier ist ein sehr guter Arbeitsplatz“. In unserer Größenklasse haben wir es sogar in die Top 20 geschafft und uns gegen mehr als 800 andere Unternehmen durchgesetzt.\r\n\r\nauxmoney wurde von seinen Mitarbeitern als einer der besten Arbeitgeber Deutschlands ausgezeichnet. 83% der Mitarbeiter finden: \"Alles in allem kann ich sagen, dies hier ist ein sehr guter Arbeitsplatz“. In unserer Größenklasse haben wir es sogar in die Top 20 geschafft und uns gegen mehr als 800 andere Unternehmen durchgesetzt.', '2021/03/10/1615374591_9751.jpg'),
(4, 0, 0, 1619727818, 'Gallup-Studie: Vorgesetzte schädigen die Firma, wenn Sie das Thema Führung nicht beherrschen', 'Autor: Claudia Tödtmann\r\nProduktivität\r\n\r\nHätten sie gute Führungskräfte, würden deutsche Unternehmen 105 Milliarden mehr Umsatz im Jahr machen, rechnet die neue Gallup-Studie vor. Stattdessen leisten sie sich mit 70 Prozent eine große Mehrheit von Mitarbeitern, die schweigen, statt Einsatzfreude an den Tag zu legen.  \r\n\r\n\r\n \r\n\r\nDie meisten Mitarbeiter sind an ihr Unternehmen emotional kaum gebunden und machen nur Dienst nach Vorschrift. Der Graben zwischen den Mitarbeitern und den Unternehmen wird immer größer, belegt die aktuelle Untersuchung des Marktforschungsunternehmens Gallup: In seinem Engagement Index 2016 veröffentlicht es alljährlich, wie es um die Mitarbeiterbindung, die Motivation der Angestellten und um deren Verhältnis zu Chefs und Unternehmen steht. Befragt wurden für die Untersuchung 1413 Arbeitnehmer über 18 Jahren in zwei Erhebungswellen, im Februar/März und Oktober/Dezember 2016.\r\n\r\n \r\n\r\nSchlechte Führungskräfte senken die Wettbewerbsfähigkeit\r\n\r\nDas Fazit der diesjährigen Untersuchung: Schlechte Vorgesetzte sind die Stellschraube, die dringend bewegt werden müsste. Sie kosten die deutsche Wirtschaft bis zu 105 Milliarden Euro im Jahr. So hoch sind die Verluste durch innere Kündigungen der Mitarbeiter. Die Mehrheit der Mitarbeiter ist emotional an ihr Unternehmen kaum gebunden. Die Folge: Das alles beeinträchtigt wichtige Wettbewerbsfaktoren. Die Fehlzeiten steigen, Produktivität, Rentabilität, Qualität und Kundenbindung sinken dagegen.\r\n\r\n \r\n\r\nPannen sehen – und lieber schweigen. Eigeninitiative? Lieber nicht.\r\n\r\nMarco Nink, Studienverantwortlicher bei Gallup sagt: „Arbeitnehmer, die sich emotional nicht an ihren Arbeitgeber gebunden fühlen, zeigen weniger Eigeninitiative, Leistungsbereitschaft und Verantwortungsbewusstsein – und sie schweigen zudem häufiger zu Fehlentwicklungen.“ Das bedeutet im Klartext: Läuft im Unternehmen etwas schief, schweigt die Mehrheit der Angestellten – aus Resignation -, statt darauf aufmerksam zu machen und um die Behebung von Missständen sowie Fehlentwicklungen zu kämpfen.\r\n\r\n\r\nMarco Nink vom Marktforscher Gallup\r\n\r\n \r\n\r\nAuch schwere Bedenken bleiben unausgesprochen\r\n\r\nSehr bedenklich sind die Folgen dieser Nicht-Widerspruchs- und Schweigekultur für die Unternehmen selbst. Der aktuelle Engagement Index zeigt: jeder dritte Mitarbeiter hat in den vergangenen zwölf Monaten gegenüber seinem Vorgesetzten mindestens einmal sogar schwere Bedenken nicht geäußert. Von den Mitarbeitern ohne emotionale Bindung schwieg sogar fast jeder Zweite (45 Prozent).\r\n\r\n \r\n\r\nDer Traumarbeitnehmer ist eine Rarität\r\n\r\nSo, wie sich Unternehmen den optimalen Mitarbeiter wünschen, sind laut Gallup-Studie nur 15 Prozent der Leute – die sind nämlich mit Hand, Herz und Verstand bei der Arbeit. Das Gros der Mitarbeiter will in erster Linie unauffällig sein: 70 Prozent der Beschäftigten sind emotional gering gebunden und machen lediglich Dienst nach Vorschrift, so Gallup.\r\n\r\n \r\n\r\nMan liebt die Arbeit, aber nicht Vorgesetzte und Arbeitgeber\r\n\r\nDabei scheint das alles unnötig zu sein. Denn die Arbeitseinstellung ist durchaus sehr positiv. Auf die Gretchenfrage, ob man denn weiter arbeiten würde, wenn man nicht auf das Gehalt für den Lebensunterhalt angewiesen wäre, gaben 77 Prozent der Befragten die Antwort: Doch, sie würden durchaus weiter arbeiten wollen, das waren vor sechs Jahren noch weniger (2010: 70 Prozent).\r\n\r\nWas den Mitarbeitern wichtig wäre? Nink sagt: „Faktoren wie Arbeitsplatzsicherheit, Entlohnung, Sozialleistungen, flexible Arbeitszeit oder die Zahl der Urlaubstage sind für Mitarbeiter zwar durchaus wichtig, sie haben aber auf deren emotionale Bindung kaum Einfluss.“\r\n\r\n \r\n\r\nFührungsqualität wird Wettbewerbsvorteil dank einsatzfreudiger Mitarbeiter\r\n\r\nFünfmal wichtiger als das Gehalt ist es dagegen, wenn man „die Möglichkeit hat, das zu tun, was man richtig gut kann“. Entscheidend sind laut Nink außerdem die „Führungsqualität, eine herausfordernde, abwechslungsreiche und als sinnvoll empfundene Tätigkeit und die Kollegen. Emotionale Bindung wird im direkten Arbeitsumfeld erzeugt und der direkte Vorgesetzte ist dabei das A und O.“\r\n\r\n \r\n\r\nWarum die Innerlich-Gekündigten immer mehr werden\r\n\r\nDie Gallup-Untersuchung zeigt den Zusammenhang zwischen Führung und Ergebnissen. „Wie lange Mitarbeiter ihrem Unternehmen treu bleiben und wie einsatzfreudig und produktiv sie in der Zeit sind, hängt in erster Linie vom Führungsverhalten des direkten Vorgesetzten ab“, so Nink. „Doch in punkto Führungsqualität klaffen die Wünsche der Mitarbeiter und die Wirklichkeit in den Unternehmen weit auseinander.“\r\n\r\nDas hat Folgen für die Betriebstreue – und zwar negative. Waren manche Unternehmen jahrelang froh über Mitarbeiter, die von selbst ihren Hut nahmen. So scheint sich das langsam zu drehen. Den Unternehmen, die inzwischen viel Geld investieren in ihren guten Ruf als Arbeitgebermarke, kann dieses Ergebnis der Gallup-Umfrage nicht gefallen: Die Zahl der Mitarbeiter mit hoher Bindung an die Firma, 15 Prozent, geht keinen Deut nach oben. Ebenso hoch bleibt auch die Zahl der Resignierten, die innerlich gekündigt haben. Dabei seien diese Frustrierten keineswegs Versager, auch sie waren ursprünglich mal als motivierte, gute Leute angetreten – und könnten das auch wieder werden, betont Nink.\r\n\r\n \r\n\r\n„Ich will weg hier“\r\n\r\nQualifizierte Führungskräfte könnten helfen. Doch die Führungsqualität liegt hierzulande im Argen: Die Wünsche der Mitarbeiter und die Wirklichkeit in den Unternehmen klaffen besonders weit auseinander. Nur jeder fünfte Arbeitnehmer (21 Prozent) sagt: „die Führung, die ich bei der Arbeit erlebe, motiviert mich, hervorragende Arbeit zu leisten“.  Selbst in der Gruppe der hoch gebundenen Angestellten sagen das nur 66 Prozent. Und bei den Arbeitnehmern mit geringer oder ganz ohne Bindung nur 15 beziehungsweise nur drei Prozent.\r\n\r\nKein Wunder, dass ein Fluchtreflex einsetzt. Fast jeder Fünfte (18 Prozent) dachte in den vergangenen zwölf Monaten daran zu kündigen – und zwar wegen seines direkten Vorgesetzten.\r\n\r\n \r\n\r\nIch bin ein Super-Chef – Sie sind ein schlechter Chef\r\n\r\nInteressant ist das Auseinanderfallen von Fremd- und Eigenwahrnehmung: 69 Prozent der Arbeitnehmer hatten mindestens einmal einen schlechten Vorgesetzten laut Gallup. „Doch die Chefs selbst sind sich ihrer Defizite nicht bewusst – 97 Prozent halten sich selbst für eine gute Führungskraft“, so Nink.\r\n\r\nMerkwürdigerweise haben laut Gallup-Umfrage 2016 immerhin 40 Prozent der Führungskräfte eine Weiterbildung besucht haben, um den Umgang mit ihren Mitarbeitern zu verbessern. Das aber wohl ohne Erfolg.\r\n\r\n \r\n\r\nDialog mit Mitarbeitern? Totalausfall\r\n\r\nDer wichtigste Hebel, um einsatzfreudige Mitarbeiter mit emotionaler Bindung an die Firma zu bekommen ist ein kontinuierlicher Dialog mit den Führungskräften. Das kann nicht funktionieren, wenn nur 56 Prozent der Mitarbeiter mit ihren Chefs und dann nur einmal im Jahr über ihre Arbeit und die Leistung sprechen. Nur 14 Prozent der Mitarbeiter berichten bei der Untersuchung über kontinuierlichen Austausch mit dem Vorgesetzten und das über das Jahr hinweg.\r\n\r\n \r\n\r\nMitarbeitergespräche ohne Ergebnis für die Firma\r\n\r\nVor allem die gefürchteten Mitarbeitergespräche – einmal im Jahr auf Drängen der Personalabteilung – verfehlen oft ihr Ziel, nämlich die Arbeitsleistung nachhaltig zu verbessern. Nur 38 Prozent der Mitarbeiter sagen, dass diese Mitarbeitergespräche helfen, ihre Arbeit besser zu machen. Ein schlechtes Zeugnis für Führungskräfte, urteilt Nink. „Wo es doch die Aufgabe einer Führungskraft ist, die individuellen Leistungspotenziale der Mitarbeiter freizusetzen und zur Entwicklung des Einzelnen beizutragen.“ Chefs müssten herausfinden, was ein Mitarbeiter gut kann und mag und wie er dementsprechend eingesetzt werden kann – und das gehe am besten im Gespräch.\r\n\r\nWas bedeutet, dass Vorgesetzte sich die Zeit zum Zuhören nehmen und für ihre Mitarbeiter echt interessieren müssen.\r\n\r\n \r\n\r\n \r\n\r\nWas Arbeitnehmer von Unternehmen erwarten: Jobsicherheit, Vereinbarkeit und die richtige Arbeit stehen ganz oben\r\n\r\nGefragt hat Gallup nach der Bewertung von 19 Aspekten auf einer Skala von 1 „überhaupt nicht wichtig“ bis 5 „äußerst wichtig“\r\n\r\n———————————————————————————————\r\n\r\nAngebote zur Kinderbetreuung  3.05\r\n\r\nMöglichkeit, Führungsverantwortung zu übernehmen 3.68\r\n\r\nAngebote zur Gesundheitsförderung 3.69\r\n\r\nAufstiegschancen und Entwicklungsmöglichkeiten 3.79\r\n\r\nInnovationen 3.85\r\n\r\nUnternehmensziele und Unternehmensphilosophie 3.92\r\n\r\nSozialleistungen, Zuschüsse und Annehmlichkeiten 3.96\r\n\r\nRuf/Renommee des Unternehmens + seines Führungspersonals 4\r\n\r\nUnternehmenskultur 4.02\r\n\r\nBezahlung oder Verdienstmöglichkeiten 4.12\r\n\r\nFreiheiten und Gestaltungsspielraum  4.13\r\n\r\nFlexibilität bei der Arbeitszeit  4.15\r\n\r\nHerausfordernde und abwechslungsreiche Tätigkeit 4.31\r\n\r\nZahl der Urlaubstage 4.33\r\n\r\nHervorragende Führungskraft 4.35\r\n\r\nTolle Kollegen und Kolleginnen 4.44\r\n\r\nMöglichkeit, das tun zu können, was sie richtig gut können 4.45\r\n\r\nVereinbarkeit von Arbeit + Privatleben + persönl. Wohlbefinden 4.52\r\n\r\nSicherheit des Arbeitsplatzes 4.52\r\n\r\n', '2021/04/29/1619727818_6953.jpg'),
(5, 0, 0, 1619733656, 'Diversifikation? Frauenquote ? ', 'Der übliche Anteil an Männern in Meetings in heutigen Führungsetagen ist eher im hohen bis vollständigen Anteil anzusehen. Jedoch nicht nur dort. Für Unternehmen muss es lohnenswert sein, sich mit Themen wie Diversifikation auseinanderzusetzen. Mit Managers Book entwickeln wir eine Funktion, die es erlaubt, sich online dazu zu äußern. Nehmen Sie Ihre Bewertungen vor. Helfen Sie mit, dass zur Arbeit gehen wieder Freude macht. Treiben wir die Frauenquote nach oben und sorgen für eine ausgeglichene Verteilung von Posten. Nicht nur in den Vorständen. Auch den Migrationsanteil in Unternehmen wollen wir so ins Gespräch bringen. Tragen Sie mit Ihrer Bewertung dazu bei, dass sich eine offene Kultur darum entwickeln kann. ', '2021/04/30/1619733656_3311.jpg'),
(6, 2, 1, 1623325780, 'Germany ranks third globally for number of ultra-rich', 'A new report has revealed a surge in private wealth for a small number of individuals during the coronavirus pandemic. The German super-rich have benefited particularly well.\r\n\r\nThe number of individuals with a financial wealth of over $100 million (€82.25 million) grew by 6,000 during the coronavirus pandemic according to a new report by the consultancy firm Boston Consulting Group published on Thursday.\r\n\r\nThe club of the ultra-rich reached a record of 60,000 members in 2020. Germany came third on global rankings with around 2,900 \"ultra-high net worth individuals,\" following only the US and China.\r\n\r\nThe German ultra-rich controlled around $1.4 trillion of global investable wealth in 2020, representing an almost 6% growth on the previous year, the \"Global Wealth 2021\" report said.', '2021/06/10/1623325780_9165.jpg'),
(7, 0, 0, 1701787687, 'Mein Boss, der Psycho', 'Miese Vorgesetzte, schlechte Stimmung, toxisches Betriebsklima: Zu viele Unternehmen machen ihre Angestellten systematisch unglücklich. Der wirtschaftliche Schaden ist riesig, der menschliche noch weitaus größer. Lässt sich der Büroalltag entgiften?', '2023/12/05/1701787687_1983.webp'),
(8, 0, 0, 1701787794, 'Keine Seltenheit: 90 Prozent der Mitarbeiter rächen sich offenbar am Arbeitgeber', 'Haben Sie auch schon mal mit dem Gedanken gespielt, es dem Arbeitgeber auf die ein oder andere Weise heimzuzahlen? Damit stehen Sie wohl nicht alleine da.\r\n\r\nZu spät zur Arbeit erscheinen, Aufgaben langsam erledigen, Informationen unterschlagen – wenn Mitarbeiter mutwillig den Erfolg des Unternehmens torpedieren, kann das für den Arbeitgeber einen Schaden in Milliardenhöhe bedeuten, wie eine Studie offenbart, die 2021 im „Journal of Applied Psychology“ erschien. Ganze 90 Prozent der Arbeitnehmer in den USA geben demnach zu, von Zeit zu Zeit Rache an ihrem Arbeitgeber nehmen. Das Forscherteam geht davon aus, dass sich die Zahlen auch auf den europäischen und deutschsprachigen Raum übertragen lassen.\r\n\r\nWarum wollen sich Mitarbeiter an ihrem Arbeitgeber rächen?\r\nDie Auslöser für Rachegelüste bei den Mitarbeitern können vielfältig sein, doch im Grunde sind sie auf einen Vertrauensbruch zurückzuführen, wie die Forscher erklären. Das ist zum Beispiel der Fall, wenn ein Arbeitgeber seinen Angestellten gute Entwicklungsmöglichkeiten im Unternehmen in Aussicht stellt, aber dann nicht einlöst. Oder wenn flexible Arbeitsregelungen wie Gleitzeit oder Homeoffice versprochen werden, nur um doch nichts zu ändern. Auch ein versprochenes höheres Gehalt, das dann plötzlich unter den Tisch fällt, bringt Mitarbeiter in Rage. Da sie aber am kürzeren Hebel sitzen, können Angestellte an dem unmittelbaren Ärgernis nicht immer etwas ändern. Daher überlegen sie sich subtile Möglichkeiten, um sich zu revanchieren. Sie zeigen weniger Engagement, beeilen sich bei wichtigen Projekten nicht mehr oder ignorieren die Anweisungen der Chefs.\r\n\r\nForscher empfehlen Achtsamkeitstraining\r\nLaut den Studienautoren können Unternehmen der Rache ihrer Mitarbeiter vorbeugen, indem sie ein Achtsamkeitstraining anbieten. In den USA ist das bereits bei 22 Prozent der Arbeitgeber der Fall. Die Trainings hätten bewirkt, dass sich das feindselige Verhalten nach einem Vertrauensbruch reduzierte. Der Sinn eines Achtsamkeitstrainings ist, sich den eigenen Gedanken und Gefühlen bewusst zu werden, ohne diese zu bewerten. Es hilft den Teilnehmern dabei, Erfahrungen von der eigenen Person abzukoppeln und somit nicht mehr persönlich zu nehmen. Das verhindert eine zu impulsive und emotionale Reaktion auf Ungerechtigkeiten. In der Folge betrachten Betroffene die Situation aus unterschiedlichen Blickwinkeln und sind bereit, mildernde Faktoren gelten zu lassen oder alternative Lösungen zu akzeptieren.', '2023/12/05/1701787794_3160.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `news_comment`
--

CREATE TABLE `news_comment` (
  `news_comment_id` int(255) NOT NULL,
  `news_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `news_comment_timestamp` int(255) NOT NULL,
  `news_comment_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `news_comment`
--

INSERT INTO `news_comment` (`news_comment_id`, `news_id`, `user_id`, `news_comment_timestamp`, `news_comment_text`) VALUES
(1, 1, 1, 1617195294, 'Wow great news!'),
(2, 1, 1, 1617195570, 'That\'s great.'),
(3, 2, 1, 1617196188, 'that\'s so strange.');

-- --------------------------------------------------------

--
-- Table structure for table `news_like`
--

CREATE TABLE `news_like` (
  `news_like_id` int(255) NOT NULL,
  `news_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `is_liked` int(255) NOT NULL,
  `is_disliked` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news_like`
--

INSERT INTO `news_like` (`news_like_id`, `news_id`, `user_id`, `is_liked`, `is_disliked`) VALUES
(18, 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `prevention_review`
--

CREATE TABLE `prevention_review` (
  `prevention_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `prevention_review_timestamp` int(255) NOT NULL,
  `prevention_review_title` varchar(255) NOT NULL,
  `prevention_review_free_text` text NOT NULL,
  `prevention_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `prevention_review_category`
--

CREATE TABLE `prevention_review_category` (
  `prevention_review_category_id` int(255) NOT NULL,
  `prevention_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prevention_review_category`
--

INSERT INTO `prevention_review_category` (`prevention_review_category_id`, `prevention_review_category_name`) VALUES
(4, 'Präventionsabteilung bewerten');

-- --------------------------------------------------------

--
-- Table structure for table `prevention_review_other_star`
--

CREATE TABLE `prevention_review_other_star` (
  `prevention_review_other_star_id` int(255) NOT NULL,
  `prevention_review_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `prevention_review_question_name` varchar(255) NOT NULL,
  `prevention_review_other_stars` int(10) NOT NULL,
  `prevention_review_other_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `prevention_review_star`
--

CREATE TABLE `prevention_review_star` (
  `prevention_review_star_id` int(255) NOT NULL,
  `prevention_review_id` int(255) NOT NULL,
  `prevention_review_category_id` int(255) NOT NULL,
  `prevention_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `prevention_review_stars` int(10) NOT NULL,
  `prevention_review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `prevention_review_subcategory`
--

CREATE TABLE `prevention_review_subcategory` (
  `prevention_review_subcategory_id` int(255) NOT NULL,
  `prevention_review_category_id` int(255) NOT NULL,
  `prevention_review_subcategory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `prevention_review_subcategory`
--

INSERT INTO `prevention_review_subcategory` (`prevention_review_subcategory_id`, `prevention_review_category_id`, `prevention_review_subcategory_name`) VALUES
(11, 4, 'Mobbing in der Arbeit'),
(12, 4, 'Unterschreitung von Mindestlohn'),
(13, 4, 'Diskriminierung'),
(14, 4, 'Geldwäsche'),
(15, 4, 'Urkundenfälschung'),
(16, 4, 'Schwarzarbeit'),
(17, 4, 'Coronahilfen Missbrauch'),
(18, 4, 'Öffentliche Fördergelder missbrauch'),
(19, 4, 'Überstunden'),
(20, 4, 'Sexuelle Belästigung');

-- --------------------------------------------------------

--
-- Table structure for table `salary_review`
--

CREATE TABLE `salary_review` (
  `salary_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL DEFAULT '1',
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `salary_review_timestamp` int(255) NOT NULL,
  `annual_salary` varchar(255) NOT NULL,
  `salary_frequency` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `job_type` varchar(255) NOT NULL,
  `personal_res` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birth_year` int(255) NOT NULL,
  `salary_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `salary_review`
--

INSERT INTO `salary_review` (`salary_review_id`, `review_published`, `user_id`, `company_id`, `salary_review_timestamp`, `annual_salary`, `salary_frequency`, `job_title`, `job_type`, `personal_res`, `gender`, `birth_year`, `salary_review_email`, `company_reply`) VALUES
(24, 1, 0, 2, 1620842697, 'Yasir', 'Jährlich', 'Website Development', 'Aktueller job', 'Ja', 'Weiblich', 2019, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `salary_review_category`
--

CREATE TABLE `salary_review_category` (
  `salary_review_category_id` int(255) NOT NULL,
  `salary_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `salary_review_category`
--

INSERT INTO `salary_review_category` (`salary_review_category_id`, `salary_review_category_name`) VALUES
(4, 'Gehen Sie zum Gehaltsvergleich');

-- --------------------------------------------------------

--
-- Table structure for table `salary_review_star`
--

CREATE TABLE `salary_review_star` (
  `salary_review_star_id` int(255) NOT NULL,
  `salary_review_id` int(255) NOT NULL,
  `salary_review_category_id` int(255) NOT NULL,
  `salary_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `salary_review_stars` int(10) NOT NULL,
  `salary_review_text` text NOT NULL,
  `salary_review_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `salary_review_star`
--

INSERT INTO `salary_review_star` (`salary_review_star_id`, `salary_review_id`, `salary_review_category_id`, `salary_review_subcategory_id`, `user_id`, `company_id`, `salary_review_stars`, `salary_review_text`, `salary_review_photo`) VALUES
(146, 24, 4, 11, 0, 2, 4, 'Great one', '2021/05/12/1620842697_5972.jpg'),
(147, 24, 4, 12, 0, 2, 5, 'wow', '');

-- --------------------------------------------------------

--
-- Table structure for table `salary_review_subcategory`
--

CREATE TABLE `salary_review_subcategory` (
  `salary_review_subcategory_id` int(255) NOT NULL,
  `salary_review_category_id` int(255) NOT NULL,
  `salary_review_subcategory_name` varchar(255) NOT NULL,
  `attach_photo` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `salary_review_subcategory`
--

INSERT INTO `salary_review_subcategory` (`salary_review_subcategory_id`, `salary_review_category_id`, `salary_review_subcategory_name`, `attach_photo`) VALUES
(11, 4, 'Arbeitsatmosphäre', 1),
(12, 4, 'Wurde Ihr Gehalt bisher pünktlich gezahlt?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `superior_review`
--

CREATE TABLE `superior_review` (
  `superior_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `superior_review_timestamp` int(255) NOT NULL,
  `superior_review_title` varchar(255) NOT NULL,
  `superior_review_free_text` text NOT NULL,
  `superior_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `superior_review`
--

INSERT INTO `superior_review` (`superior_review_id`, `review_published`, `user_id`, `company_id`, `superior_review_timestamp`, `superior_review_title`, `superior_review_free_text`, `superior_review_email`, `company_reply`) VALUES
(11, 1, 0, 21, 1701930772, 'Toller Gedanke falsche Führungskräfte', '', 'suleiman.khan@gmx.de', '');

-- --------------------------------------------------------

--
-- Table structure for table `superior_review_category`
--

CREATE TABLE `superior_review_category` (
  `superior_review_category_id` int(255) NOT NULL,
  `superior_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `superior_review_category`
--

INSERT INTO `superior_review_category` (`superior_review_category_id`, `superior_review_category_name`) VALUES
(4, 'Vorgesetzen bewerten');

-- --------------------------------------------------------

--
-- Table structure for table `superior_review_other_star`
--

CREATE TABLE `superior_review_other_star` (
  `superior_review_other_star_id` int(255) NOT NULL,
  `superior_review_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `superior_review_question_name` varchar(255) NOT NULL,
  `superior_review_other_stars` int(10) NOT NULL,
  `superior_review_other_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `superior_review_star`
--

CREATE TABLE `superior_review_star` (
  `superior_review_star_id` int(255) NOT NULL,
  `superior_review_id` int(255) NOT NULL,
  `superior_review_category_id` int(255) NOT NULL,
  `superior_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `superior_review_stars` int(10) NOT NULL,
  `superior_review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `superior_review_star`
--

INSERT INTO `superior_review_star` (`superior_review_star_id`, `superior_review_id`, `superior_review_category_id`, `superior_review_subcategory_id`, `user_id`, `company_id`, `superior_review_stars`, `superior_review_text`) VALUES
(187, 11, 4, 11, 0, 21, 3, 'Teilweise etwas zu offen. Man erfährt Sachen die viel zu persönlich sind.'),
(188, 11, 4, 12, 0, 21, 5, ''),
(189, 11, 4, 13, 0, 21, 5, ''),
(190, 11, 4, 14, 0, 21, 5, ''),
(191, 11, 4, 15, 0, 21, 3, 'Gibt leider kein Team. Ellbogenmentalität'),
(192, 11, 4, 16, 0, 21, 2, 'Kaum Kritikfähig. Wenn man seine Meinung sagt ist gleich raus aus dem Kreis des Vetrauens'),
(193, 11, 4, 17, 0, 21, 2, 'Selbes'),
(194, 11, 4, 18, 0, 21, 4, ''),
(195, 11, 4, 19, 0, 21, 5, 'Unglaubliche Fachkompetenz. '),
(196, 11, 4, 20, 0, 21, 2, 'Ohne die zauberhafte Sekretärin würde nichts organisatisches gehen'),
(197, 11, 4, 21, 0, 21, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `superior_review_subcategory`
--

CREATE TABLE `superior_review_subcategory` (
  `superior_review_subcategory_id` int(255) NOT NULL,
  `superior_review_category_id` int(255) NOT NULL,
  `superior_review_subcategory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `superior_review_subcategory`
--

INSERT INTO `superior_review_subcategory` (`superior_review_subcategory_id`, `superior_review_category_id`, `superior_review_subcategory_name`) VALUES
(11, 4, 'Offenheit + Wertschätzung'),
(12, 4, 'Gerechtigkeit'),
(13, 4, 'Verlässlichkeit'),
(14, 4, 'Motivationsfähigkeit'),
(15, 4, 'Teamfähigkeit'),
(16, 4, 'Kritikfähigkeit'),
(17, 4, 'Konfliktfähigkeit'),
(18, 4, 'Entscheidungsfähigkeit'),
(19, 4, 'Fachkompetenz'),
(20, 4, 'Organisationsgeschick'),
(21, 4, 'Informationsverhalten');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_review`
--

CREATE TABLE `supplier_review` (
  `supplier_review_id` int(255) NOT NULL,
  `review_published` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `supplier_review_timestamp` int(255) NOT NULL,
  `supplier_review_title` varchar(255) NOT NULL,
  `supplier_would_recommed` varchar(255) NOT NULL,
  `supplier_review_free_text` text NOT NULL,
  `supplier_review_email` varchar(255) NOT NULL,
  `company_reply` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `supplier_review`
--

INSERT INTO `supplier_review` (`supplier_review_id`, `review_published`, `user_id`, `company_id`, `supplier_review_timestamp`, `supplier_review_title`, `supplier_would_recommed`, `supplier_review_free_text`, `supplier_review_email`, `company_reply`) VALUES
(11, 0, 0, 18, 1701786522, 'NIcht so toll', '0', 'Anonymous', 'suleiman.khan@gmx.de', ''),
(12, 0, 0, 20, 1701806894, 'test', '1', 'Anonymous', 'dennis.morasch1990@googlemail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_review_category`
--

CREATE TABLE `supplier_review_category` (
  `supplier_review_category_id` int(255) NOT NULL,
  `supplier_review_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `supplier_review_category`
--

INSERT INTO `supplier_review_category` (`supplier_review_category_id`, `supplier_review_category_name`) VALUES
(4, 'Lieferanten Bewerten');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_review_other_star`
--

CREATE TABLE `supplier_review_other_star` (
  `supplier_review_other_star_id` int(255) NOT NULL,
  `supplier_review_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `supplier_review_question_name` varchar(255) NOT NULL,
  `supplier_review_other_stars` int(10) NOT NULL,
  `supplier_review_other_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_review_star`
--

CREATE TABLE `supplier_review_star` (
  `supplier_review_star_id` int(255) NOT NULL,
  `supplier_review_id` int(255) NOT NULL,
  `supplier_review_category_id` int(255) NOT NULL,
  `supplier_review_subcategory_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `company_id` int(255) NOT NULL,
  `supplier_review_stars` int(10) NOT NULL,
  `supplier_review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `supplier_review_star`
--

INSERT INTO `supplier_review_star` (`supplier_review_star_id`, `supplier_review_id`, `supplier_review_category_id`, `supplier_review_subcategory_id`, `user_id`, `company_id`, `supplier_review_stars`, `supplier_review_text`) VALUES
(121, 11, 4, 11, 0, 18, 3, ''),
(122, 11, 4, 12, 0, 18, 4, ''),
(123, 11, 4, 13, 0, 18, 2, ''),
(124, 11, 4, 14, 0, 18, 5, ''),
(125, 11, 4, 15, 0, 18, 3, ''),
(126, 12, 4, 11, 0, 20, 3, ''),
(127, 12, 4, 12, 0, 20, 4, ''),
(128, 12, 4, 13, 0, 20, 2, ''),
(129, 12, 4, 14, 0, 20, 3, ''),
(130, 12, 4, 15, 0, 20, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_review_subcategory`
--

CREATE TABLE `supplier_review_subcategory` (
  `supplier_review_subcategory_id` int(255) NOT NULL,
  `supplier_review_category_id` int(255) NOT NULL,
  `supplier_review_subcategory_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `supplier_review_subcategory`
--

INSERT INTO `supplier_review_subcategory` (`supplier_review_subcategory_id`, `supplier_review_category_id`, `supplier_review_subcategory_name`) VALUES
(11, 4, 'Hohe Produkt- bzw. Dienstleistungsqualität?'),
(12, 4, 'Hoher Servicestandard? '),
(13, 4, 'Werden Ihre Rechnungen pünktlich gezahlt?'),
(14, 4, 'Wie ist die Zusammenarbeit mit Ihrem Lieferanten?'),
(15, 4, 'Verbesserungsvorschläge? ');

-- --------------------------------------------------------

--
-- Table structure for table `t_conversation`
--

CREATE TABLE `t_conversation` (
  `t_conversation_id` int(255) NOT NULL,
  `sender_id` int(255) NOT NULL,
  `receiver_id` int(255) NOT NULL,
  `t_conversation_update` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_conversation`
--

INSERT INTO `t_conversation` (`t_conversation_id`, `sender_id`, `receiver_id`, `t_conversation_update`) VALUES
(1, 1, 22, 1623683884),
(2, 22, 1, 1623683884),
(207, 5, 1, 1623683902),
(208, 1, 5, 1623683902),
(219, 23, 22, 1623681788),
(220, 22, 23, 1623681788),
(231, 4, 22, 1623685490),
(232, 22, 4, 1623685490);

-- --------------------------------------------------------

--
-- Table structure for table `t_message`
--

CREATE TABLE `t_message` (
  `t_message_id` int(255) NOT NULL,
  `sender_id` int(255) NOT NULL,
  `receiver_id` int(255) NOT NULL,
  `t_message_text` text NOT NULL,
  `t_message_seen` int(10) NOT NULL DEFAULT '0',
  `t_message_timestamp` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_message`
--

INSERT INTO `t_message` (`t_message_id`, `sender_id`, `receiver_id`, `t_message_text`, `t_message_seen`, `t_message_timestamp`) VALUES
(74, 1, 22, 'cool', 1, 1623678055),
(75, 1, 22, 'cool', 1, 1623678055),
(76, 1, 22, 'cool', 1, 1623678056),
(77, 1, 22, 'cool', 1, 1623678057),
(78, 1, 22, 'cool', 1, 1623678057),
(79, 1, 22, 'cool', 1, 1623678058),
(80, 1, 22, 'cool', 1, 1623678059),
(81, 1, 22, 'cool', 1, 1623678060),
(82, 1, 22, 'cool', 1, 1623678062),
(83, 1, 22, 'cool', 1, 1623678063),
(84, 1, 22, 'cool', 1, 1623678063),
(85, 1, 22, 'cool', 1, 1623678064),
(86, 1, 22, 'cool', 1, 1623678065),
(87, 1, 22, 'cool', 1, 1623678065),
(88, 1, 22, 'nice', 1, 1623678107),
(89, 1, 22, 'nice', 1, 1623678109),
(90, 1, 22, 'nice', 1, 1623678110),
(91, 1, 22, 'nice', 1, 1623678130),
(92, 1, 22, 'nice', 1, 1623678131),
(93, 1, 22, 'nice', 1, 1623678133),
(94, 1, 22, 'nice', 1, 1623678134),
(95, 1, 22, 'good one', 1, 1623678141),
(96, 22, 1, 'hello\n', 1, 1623678225),
(97, 22, 1, ' asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx  asdvjas asvdjas ajsx ', 1, 1623678249),
(98, 22, 1, 'hello', 1, 1623680465),
(99, 22, 1, 'hello cool', 1, 1623680525),
(100, 22, 1, 'hello cool whats up', 1, 1623680532),
(101, 22, 1, 'yep', 1, 1623680600),
(102, 1, 22, 'oh wow nice', 1, 1623680633),
(103, 1, 22, 'wow', 1, 1623680707),
(104, 22, 1, 'yeah', 1, 1623680720),
(105, 5, 1, 'hello sir', 1, 1623680772),
(106, 5, 1, 'hello sir', 1, 1623680848),
(107, 1, 5, 'nice one', 1, 1623680890),
(108, 1, 5, 'oh', 1, 1623680951),
(109, 1, 5, 'nice one cool', 1, 1623680959),
(110, 5, 1, 'hello sir thank you', 1, 1623680969),
(111, 23, 22, 'hi', 1, 1623681788),
(112, 1, 22, 'hi', 1, 1623682528),
(113, 5, 1, 'good', 1, 1623683598),
(114, 22, 1, 'Oh okay', 1, 1623683751),
(115, 1, 22, 'wow cool', 1, 1623683884),
(116, 1, 5, 'okay', 0, 1623683902),
(117, 4, 22, 'hello', 0, 1623685145),
(118, 4, 22, 'cool', 0, 1623685490),
(119, 4, 22, 'Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool \r\n\r\nYeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool ', 0, 1623687227),
(120, 4, 22, 'Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool \r\n\r\nYeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool ', 0, 1623687315),
(121, 4, 22, 'Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool \r\n\r\nYeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool ', 0, 1623687396),
(122, 4, 22, 'Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool \r\n\r\nYeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool ', 0, 1623687406),
(123, 4, 22, 'Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool \r\n\r\nYeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool Yeah thats cool ', 0, 1623687472);

-- --------------------------------------------------------

--
-- Table structure for table `t_message_attachment`
--

CREATE TABLE `t_message_attachment` (
  `t_message_attachment_id` int(255) NOT NULL,
  `t_message_attachment_name` varchar(255) NOT NULL,
  `t_message_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_message_attachment`
--

INSERT INTO `t_message_attachment` (`t_message_attachment_id`, `t_message_attachment_name`, `t_message_id`) VALUES
(5, '2021/06/14/1623687406_3048.png', 122),
(6, '2021/06/14/1623687406_3691.jpg', 122),
(7, '2021/06/14/1623687406_8043.png', 122),
(8, '2021/06/14/1623687406_6214.sql', 122),
(9, '2021/06/14/1623687472_8420.png', 123),
(10, '2021/06/14/1623687472_1143.jpg', 123),
(11, '2021/06/14/1623687472_5676.png', 123),
(12, '2021/06/14/1623687472_2369.sql', 123);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_open_for_jobs` int(10) NOT NULL DEFAULT '0',
  `user_role` varchar(255) NOT NULL DEFAULT 'company',
  `user_image` varchar(255) NOT NULL,
  `forgot_pass_hash` varchar(255) NOT NULL,
  `user_position` varchar(255) NOT NULL,
  `user_employee_type` varchar(255) NOT NULL,
  `user_last_employeer` varchar(255) NOT NULL,
  `user_branch` varchar(255) NOT NULL,
  `user_last_seen` int(255) NOT NULL,
  `user_salary` varchar(255) NOT NULL DEFAULT '0',
  `user_salary_interval` varchar(255) NOT NULL DEFAULT 'month',
  `user_salary_position` varchar(255) DEFAULT NULL,
  `user_age` int(255) DEFAULT NULL,
  `user_num_of_women` int(255) NOT NULL DEFAULT '0',
  `user_num_of_foreign` int(255) NOT NULL DEFAULT '0',
  `login_by` varchar(30) NOT NULL DEFAULT 'Form' COMMENT 'google , linkedin , xing, Form',
  `user_last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_open_for_jobs`, `user_role`, `user_image`, `forgot_pass_hash`, `user_position`, `user_employee_type`, `user_last_employeer`, `user_branch`, `user_last_seen`, `user_salary`, `user_salary_interval`, `user_salary_position`, `user_age`, `user_num_of_women`, `user_num_of_foreign`, `login_by`, `user_last_login`) VALUES
(1, 'Yasir Mushtaq', 'yasir72.multan@gmail.com', 'yasir', 0, 'company', '2021/02/21/1613921967_9478.PNG', 'f5c346ee93470b65d846341e025f519ab9f4fa1a', 'We Development', 'Web Programming and Design', 'Manager', 'Multan', 1704104380, '0', 'month', NULL, NULL, 7, 20, 'Form', '2024-01-01 10:22:48'),
(2, 'Talib Rasheed', 'talib@gmail.com', 'talib123', 0, 'company', '', '', '', '', '', '', 1623681178, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(4, 'Asif', 'asif@gmail.com', 'asif123', 0, 'company', '', '', '', '', '', '', 1623688306, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(5, 'Amir', 'amir@gmail.com', 'amir123', 0, 'company', '2021/02/27/1614427833_5143.jpg', '', '', '', '', '', 1623683612, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(6, 'Talha Ansari', 'talha@gmail.com', 'talha123', 0, 'company', '', '', '', '', '', '', 1623681178, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(18, 'Ahmed', 'ahmed@gmial.com', 'pf7f0O7q', 0, 'company', '', '', '', '', '', '', 1623681178, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(21, 'Arkent', 'arkent@gmail.com', 'yasir', 0, 'company', '', '', '', '', '', '', 1623681178, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(22, 'Sabir', 'sabir@gmail.com', 'sabir', 0, 'company', '2021/06/14/1623670216_4873.png', '', '', '', '', '', 1623684118, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(24, 'Shahid', 'shahid@gmail.com', 'shahid', 0, 'company', '', '', '', '', '', '', 1687557541, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(25, 'Sumi', 'sumi@gmail.com', 'sumi', 0, 'company', '', '', '', '', '', '', 1687557580, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(29, 'DMorasch', 'dennis.morasch1990@googlemail.com', '12345', 0, 'employee', '', '', '', '', '', '', 1703013901, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(30, 'Suleiman', 'suleiman.khan@gmx.de', '123456', 1, 'employee', '', '', '', '', '', '', 1701790984, '10000', 'month', 'Leiter Controlling', 33, 0, 0, 'Form', '2024-01-01 10:22:48'),
(31, 'Sule', 'suleiman.khan@derigo.de', '123456789', 0, 'company', '', '', '', '', '', '', 1701930858, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-01 10:22:48'),
(32, 'Suleiman', 'fastjunior89@gmail.com', '123456789', 0, 'company', '', '', '', '', '', '', 1703197225, '0', 'month', NULL, NULL, 11, 90, 'Form', '2024-01-01 10:22:48'),
(33, 'Radhika', 't2pdemo@gmail.com', 't2pdemo@', 1, 'company', '', '', '', '', '', '', 1704181271, '0', 'month', NULL, NULL, 0, 0, 'Form', '2024-01-02 07:36:28'),
(34, 'Sunny tester', 'tech2peak.tester@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1702904710, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(35, 'Sunny bherwani', 'sunny@hucoco.eu', '123456', 1, 'company', '', '', '', '', '', '', 1702905019, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(36, 'Pooja soni', 'pooja8282s@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1702965883, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(37, 'pooja maheshwari', 'pooja9243mah@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1702967439, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(38, 'S. L.', 'lazarstefanie@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1703011663, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(39, 'Dennis Morasch', 'dennis-morasch@mail.de', '123456', 1, 'company', '', '', '', '', '', '', 1703014508, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(40, 'sunny bherwani', 'bherwani.sunny123@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1703846944, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48'),
(41, 'sunny bherwani', 'bherwani.sunny@gmail.com', '123456', 1, 'company', '', '', '', '', '', '', 1703847508, '0', 'month', NULL, NULL, 0, 0, 'Google', '2024-01-01 10:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_skill`
--

CREATE TABLE `user_skill` (
  `user_id` int(255) NOT NULL,
  `user_skill_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `what_we_offer`
--

CREATE TABLE `what_we_offer` (
  `what_we_offer_id` int(255) NOT NULL,
  `what_we_offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `what_we_offer`
--

INSERT INTO `what_we_offer` (`what_we_offer_id`, `what_we_offer_name`) VALUES
(1, 'Was sagen wir über Leistungen?'),
(2, 'Was ist das Besondere an unserer Arbeit?');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_us_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `applicant_review`
--
ALTER TABLE `applicant_review`
  ADD PRIMARY KEY (`applicant_review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `applicant_review_category`
--
ALTER TABLE `applicant_review_category`
  ADD PRIMARY KEY (`applicant_review_category_id`);

--
-- Indexes for table `applicant_review_other_star`
--
ALTER TABLE `applicant_review_other_star`
  ADD PRIMARY KEY (`applicant_review_other_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_id` (`applicant_review_id`),
  ADD KEY `employee_review_subcategory_id` (`company_id`) USING BTREE;

--
-- Indexes for table `applicant_review_star`
--
ALTER TABLE `applicant_review_star`
  ADD PRIMARY KEY (`applicant_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_subcategory_id` (`applicant_review_subcategory_id`),
  ADD KEY `employee_review_category_id` (`applicant_review_category_id`),
  ADD KEY `employee_review_id` (`applicant_review_id`);

--
-- Indexes for table `applicant_review_subcategory`
--
ALTER TABLE `applicant_review_subcategory`
  ADD PRIMARY KEY (`applicant_review_subcategory_id`),
  ADD KEY `applicant_review_category_id` (`applicant_review_category_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `company_access`
--
ALTER TABLE `company_access`
  ADD PRIMARY KEY (`company_access_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`company_id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`user_id`) USING BTREE;

--
-- Indexes for table `company_access_request`
--
ALTER TABLE `company_access_request`
  ADD PRIMARY KEY (`company_access_request_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`company_id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`user_id`) USING BTREE;

--
-- Indexes for table `company_follower`
--
ALTER TABLE `company_follower`
  ADD PRIMARY KEY (`company_follower_id`),
  ADD UNIQUE KEY `company_id` (`company_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `company_for_applicants`
--
ALTER TABLE `company_for_applicants`
  ADD PRIMARY KEY (`company_for_applicants_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `for_applicants_id` (`for_applicants_id`);

--
-- Indexes for table `company_photo`
--
ALTER TABLE `company_photo`
  ADD PRIMARY KEY (`company_photo_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company_supervisor`
--
ALTER TABLE `company_supervisor`
  ADD PRIMARY KEY (`company_supervisor_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `company_video`
--
ALTER TABLE `company_video`
  ADD PRIMARY KEY (`company_video_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company_what_we_offer`
--
ALTER TABLE `company_what_we_offer`
  ADD PRIMARY KEY (`company_wwo_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `what_we_offer` (`what_we_offer_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conversation_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `corporate_division`
--
ALTER TABLE `corporate_division`
  ADD PRIMARY KEY (`corporate_division_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_name` (`email_name`);

--
-- Indexes for table `employee_nomination`
--
ALTER TABLE `employee_nomination`
  ADD PRIMARY KEY (`employee_nomination_id`);

--
-- Indexes for table `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`employee_position_id`);

--
-- Indexes for table `employee_review`
--
ALTER TABLE `employee_review`
  ADD PRIMARY KEY (`employee_review_id`),
  ADD KEY `user_id` (`user_id`,`employee_review_timestamp`) USING BTREE,
  ADD KEY `company_id` (`company_id`,`employee_review_timestamp`) USING BTREE,
  ADD KEY `employee_review_timestamp` (`employee_review_timestamp`),
  ADD KEY `employee_review_timestamp_2` (`employee_review_timestamp`),
  ADD KEY `review_published` (`review_published`);

--
-- Indexes for table `employee_review_category`
--
ALTER TABLE `employee_review_category`
  ADD PRIMARY KEY (`employee_review_category_id`);

--
-- Indexes for table `employee_review_other_star`
--
ALTER TABLE `employee_review_other_star`
  ADD PRIMARY KEY (`employee_review_other_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_id` (`employee_review_id`),
  ADD KEY `employee_review_subcategory_id` (`company_id`) USING BTREE;

--
-- Indexes for table `employee_review_star`
--
ALTER TABLE `employee_review_star`
  ADD PRIMARY KEY (`employee_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_category_id` (`employee_review_category_id`),
  ADD KEY `employee_review_id` (`employee_review_id`),
  ADD KEY `employee_review_subcategory_id` (`employee_review_subcategory_id`,`company_id`) USING BTREE;

--
-- Indexes for table `employee_review_subcategory`
--
ALTER TABLE `employee_review_subcategory`
  ADD PRIMARY KEY (`employee_review_subcategory_id`),
  ADD KEY `employee_review_category_id` (`employee_review_category_id`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`employee_salary_id`),
  ADD KEY `submitted` (`submitted`);

--
-- Indexes for table `footer_link`
--
ALTER TABLE `footer_link`
  ADD PRIMARY KEY (`footer_link_id`);

--
-- Indexes for table `for_applicants`
--
ALTER TABLE `for_applicants`
  ADD PRIMARY KEY (`for_applicants_id`);

--
-- Indexes for table `impressum`
--
ALTER TABLE `impressum`
  ADD PRIMARY KEY (`impressum_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `user_id` (`user_id`,`news_timestamp`),
  ADD KEY `company_id` (`company_id`,`news_timestamp`) USING BTREE;

--
-- Indexes for table `news_comment`
--
ALTER TABLE `news_comment`
  ADD PRIMARY KEY (`news_comment_id`),
  ADD KEY `news_id` (`news_id`,`news_comment_timestamp`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `news_like`
--
ALTER TABLE `news_like`
  ADD PRIMARY KEY (`news_like_id`),
  ADD UNIQUE KEY `news_id` (`news_id`,`user_id`),
  ADD KEY `news_id_2` (`news_id`,`is_liked`),
  ADD KEY `news_id_3` (`news_id`,`is_disliked`);

--
-- Indexes for table `prevention_review`
--
ALTER TABLE `prevention_review`
  ADD PRIMARY KEY (`prevention_review_id`),
  ADD KEY `user_id` (`user_id`,`prevention_review_timestamp`) USING BTREE,
  ADD KEY `company_id` (`company_id`,`prevention_review_timestamp`) USING BTREE,
  ADD KEY `superior_review_timestamp` (`prevention_review_timestamp`);

--
-- Indexes for table `prevention_review_category`
--
ALTER TABLE `prevention_review_category`
  ADD PRIMARY KEY (`prevention_review_category_id`);

--
-- Indexes for table `prevention_review_other_star`
--
ALTER TABLE `prevention_review_other_star`
  ADD PRIMARY KEY (`prevention_review_other_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_id` (`prevention_review_id`),
  ADD KEY `employee_review_subcategory_id` (`company_id`) USING BTREE;

--
-- Indexes for table `prevention_review_star`
--
ALTER TABLE `prevention_review_star`
  ADD PRIMARY KEY (`prevention_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_category_id` (`prevention_review_category_id`),
  ADD KEY `employee_review_id` (`prevention_review_id`),
  ADD KEY `employee_review_subcategory_id` (`prevention_review_subcategory_id`,`company_id`) USING BTREE;

--
-- Indexes for table `prevention_review_subcategory`
--
ALTER TABLE `prevention_review_subcategory`
  ADD PRIMARY KEY (`prevention_review_subcategory_id`),
  ADD KEY `applicant_review_category_id` (`prevention_review_category_id`);

--
-- Indexes for table `salary_review`
--
ALTER TABLE `salary_review`
  ADD PRIMARY KEY (`salary_review_id`),
  ADD KEY `user_id` (`user_id`,`salary_review_timestamp`) USING BTREE,
  ADD KEY `company_id` (`company_id`,`salary_review_timestamp`) USING BTREE,
  ADD KEY `employee_review_timestamp` (`salary_review_timestamp`),
  ADD KEY `employee_review_timestamp_2` (`salary_review_timestamp`),
  ADD KEY `review_published` (`review_published`);

--
-- Indexes for table `salary_review_category`
--
ALTER TABLE `salary_review_category`
  ADD PRIMARY KEY (`salary_review_category_id`);

--
-- Indexes for table `salary_review_star`
--
ALTER TABLE `salary_review_star`
  ADD PRIMARY KEY (`salary_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_category_id` (`salary_review_category_id`),
  ADD KEY `employee_review_id` (`salary_review_id`),
  ADD KEY `employee_review_subcategory_id` (`salary_review_subcategory_id`,`company_id`) USING BTREE;

--
-- Indexes for table `salary_review_subcategory`
--
ALTER TABLE `salary_review_subcategory`
  ADD PRIMARY KEY (`salary_review_subcategory_id`),
  ADD KEY `applicant_review_category_id` (`salary_review_category_id`);

--
-- Indexes for table `superior_review`
--
ALTER TABLE `superior_review`
  ADD PRIMARY KEY (`superior_review_id`),
  ADD KEY `user_id` (`user_id`,`superior_review_timestamp`) USING BTREE,
  ADD KEY `company_id` (`company_id`,`superior_review_timestamp`) USING BTREE,
  ADD KEY `superior_review_timestamp` (`superior_review_timestamp`);

--
-- Indexes for table `superior_review_category`
--
ALTER TABLE `superior_review_category`
  ADD PRIMARY KEY (`superior_review_category_id`);

--
-- Indexes for table `superior_review_other_star`
--
ALTER TABLE `superior_review_other_star`
  ADD PRIMARY KEY (`superior_review_other_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_id` (`superior_review_id`),
  ADD KEY `employee_review_subcategory_id` (`company_id`) USING BTREE;

--
-- Indexes for table `superior_review_star`
--
ALTER TABLE `superior_review_star`
  ADD PRIMARY KEY (`superior_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_category_id` (`superior_review_category_id`),
  ADD KEY `employee_review_id` (`superior_review_id`),
  ADD KEY `employee_review_subcategory_id` (`superior_review_subcategory_id`,`company_id`) USING BTREE;

--
-- Indexes for table `superior_review_subcategory`
--
ALTER TABLE `superior_review_subcategory`
  ADD PRIMARY KEY (`superior_review_subcategory_id`),
  ADD KEY `applicant_review_category_id` (`superior_review_category_id`);

--
-- Indexes for table `supplier_review`
--
ALTER TABLE `supplier_review`
  ADD PRIMARY KEY (`supplier_review_id`),
  ADD KEY `user_id` (`user_id`,`supplier_review_timestamp`) USING BTREE,
  ADD KEY `company_id` (`company_id`,`supplier_review_timestamp`) USING BTREE,
  ADD KEY `superior_review_timestamp` (`supplier_review_timestamp`);

--
-- Indexes for table `supplier_review_category`
--
ALTER TABLE `supplier_review_category`
  ADD PRIMARY KEY (`supplier_review_category_id`);

--
-- Indexes for table `supplier_review_other_star`
--
ALTER TABLE `supplier_review_other_star`
  ADD PRIMARY KEY (`supplier_review_other_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_id` (`supplier_review_id`),
  ADD KEY `employee_review_subcategory_id` (`company_id`) USING BTREE;

--
-- Indexes for table `supplier_review_star`
--
ALTER TABLE `supplier_review_star`
  ADD PRIMARY KEY (`supplier_review_star_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `employee_review_category_id` (`supplier_review_category_id`),
  ADD KEY `employee_review_id` (`supplier_review_id`),
  ADD KEY `employee_review_subcategory_id` (`supplier_review_subcategory_id`,`company_id`) USING BTREE;

--
-- Indexes for table `supplier_review_subcategory`
--
ALTER TABLE `supplier_review_subcategory`
  ADD PRIMARY KEY (`supplier_review_subcategory_id`),
  ADD KEY `applicant_review_category_id` (`supplier_review_category_id`);

--
-- Indexes for table `t_conversation`
--
ALTER TABLE `t_conversation`
  ADD PRIMARY KEY (`t_conversation_id`),
  ADD UNIQUE KEY `convo` (`sender_id`,`receiver_id`) USING BTREE,
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `sender_id` (`sender_id`,`t_conversation_update`) USING BTREE;

--
-- Indexes for table `t_message`
--
ALTER TABLE `t_message`
  ADD PRIMARY KEY (`t_message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`,`t_message_seen`) USING BTREE,
  ADD KEY `sender_id_2` (`sender_id`,`receiver_id`,`t_message_timestamp`),
  ADD KEY `receiver_id_2` (`receiver_id`,`sender_id`,`t_message_timestamp`),
  ADD KEY `sender_id_3` (`sender_id`,`receiver_id`,`t_message_seen`);

--
-- Indexes for table `t_message_attachment`
--
ALTER TABLE `t_message_attachment`
  ADD PRIMARY KEY (`t_message_attachment_id`),
  ADD KEY `t_message_id` (`t_message_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_skill`
--
ALTER TABLE `user_skill`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `what_we_offer`
--
ALTER TABLE `what_we_offer`
  ADD PRIMARY KEY (`what_we_offer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_us_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applicant_review`
--
ALTER TABLE `applicant_review`
  MODIFY `applicant_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `applicant_review_category`
--
ALTER TABLE `applicant_review_category`
  MODIFY `applicant_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `applicant_review_other_star`
--
ALTER TABLE `applicant_review_other_star`
  MODIFY `applicant_review_other_star_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_review_star`
--
ALTER TABLE `applicant_review_star`
  MODIFY `applicant_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `applicant_review_subcategory`
--
ALTER TABLE `applicant_review_subcategory`
  MODIFY `applicant_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `company_access`
--
ALTER TABLE `company_access`
  MODIFY `company_access_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_access_request`
--
ALTER TABLE `company_access_request`
  MODIFY `company_access_request_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_follower`
--
ALTER TABLE `company_follower`
  MODIFY `company_follower_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `company_for_applicants`
--
ALTER TABLE `company_for_applicants`
  MODIFY `company_for_applicants_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `company_photo`
--
ALTER TABLE `company_photo`
  MODIFY `company_photo_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_supervisor`
--
ALTER TABLE `company_supervisor`
  MODIFY `company_supervisor_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_video`
--
ALTER TABLE `company_video`
  MODIFY `company_video_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_what_we_offer`
--
ALTER TABLE `company_what_we_offer`
  MODIFY `company_wwo_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `conversation_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `corporate_division`
--
ALTER TABLE `corporate_division`
  MODIFY `corporate_division_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `email_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_nomination`
--
ALTER TABLE `employee_nomination`
  MODIFY `employee_nomination_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `employee_position_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_review`
--
ALTER TABLE `employee_review`
  MODIFY `employee_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employee_review_category`
--
ALTER TABLE `employee_review_category`
  MODIFY `employee_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_review_other_star`
--
ALTER TABLE `employee_review_other_star`
  MODIFY `employee_review_other_star_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_review_star`
--
ALTER TABLE `employee_review_star`
  MODIFY `employee_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `employee_review_subcategory`
--
ALTER TABLE `employee_review_subcategory`
  MODIFY `employee_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `employee_salary_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54246;

--
-- AUTO_INCREMENT for table `footer_link`
--
ALTER TABLE `footer_link`
  MODIFY `footer_link_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `for_applicants`
--
ALTER TABLE `for_applicants`
  MODIFY `for_applicants_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `impressum`
--
ALTER TABLE `impressum`
  MODIFY `impressum_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news_comment`
--
ALTER TABLE `news_comment`
  MODIFY `news_comment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_like`
--
ALTER TABLE `news_like`
  MODIFY `news_like_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `prevention_review`
--
ALTER TABLE `prevention_review`
  MODIFY `prevention_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `prevention_review_category`
--
ALTER TABLE `prevention_review_category`
  MODIFY `prevention_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prevention_review_other_star`
--
ALTER TABLE `prevention_review_other_star`
  MODIFY `prevention_review_other_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `prevention_review_star`
--
ALTER TABLE `prevention_review_star`
  MODIFY `prevention_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `prevention_review_subcategory`
--
ALTER TABLE `prevention_review_subcategory`
  MODIFY `prevention_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `salary_review`
--
ALTER TABLE `salary_review`
  MODIFY `salary_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `salary_review_category`
--
ALTER TABLE `salary_review_category`
  MODIFY `salary_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_review_star`
--
ALTER TABLE `salary_review_star`
  MODIFY `salary_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `salary_review_subcategory`
--
ALTER TABLE `salary_review_subcategory`
  MODIFY `salary_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `superior_review`
--
ALTER TABLE `superior_review`
  MODIFY `superior_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `superior_review_category`
--
ALTER TABLE `superior_review_category`
  MODIFY `superior_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `superior_review_other_star`
--
ALTER TABLE `superior_review_other_star`
  MODIFY `superior_review_other_star_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superior_review_star`
--
ALTER TABLE `superior_review_star`
  MODIFY `superior_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `superior_review_subcategory`
--
ALTER TABLE `superior_review_subcategory`
  MODIFY `superior_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `supplier_review`
--
ALTER TABLE `supplier_review`
  MODIFY `supplier_review_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `supplier_review_category`
--
ALTER TABLE `supplier_review_category`
  MODIFY `supplier_review_category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier_review_other_star`
--
ALTER TABLE `supplier_review_other_star`
  MODIFY `supplier_review_other_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `supplier_review_star`
--
ALTER TABLE `supplier_review_star`
  MODIFY `supplier_review_star_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `supplier_review_subcategory`
--
ALTER TABLE `supplier_review_subcategory`
  MODIFY `supplier_review_subcategory_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_conversation`
--
ALTER TABLE `t_conversation`
  MODIFY `t_conversation_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `t_message`
--
ALTER TABLE `t_message`
  MODIFY `t_message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `t_message_attachment`
--
ALTER TABLE `t_message_attachment`
  MODIFY `t_message_attachment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `what_we_offer`
--
ALTER TABLE `what_we_offer`
  MODIFY `what_we_offer_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicant_review_other_star`
--
ALTER TABLE `applicant_review_other_star`
  ADD CONSTRAINT `applicant_review_other_star_ibfk_1` FOREIGN KEY (`applicant_review_id`) REFERENCES `applicant_review` (`applicant_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applicant_review_star`
--
ALTER TABLE `applicant_review_star`
  ADD CONSTRAINT `applicant_review_star_ibfk_1` FOREIGN KEY (`applicant_review_id`) REFERENCES `applicant_review` (`applicant_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_review_other_star`
--
ALTER TABLE `employee_review_other_star`
  ADD CONSTRAINT `employee_review_other_star_ibfk_1` FOREIGN KEY (`employee_review_id`) REFERENCES `employee_review` (`employee_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_review_star`
--
ALTER TABLE `employee_review_star`
  ADD CONSTRAINT `employee_review_star_ibfk_1` FOREIGN KEY (`employee_review_id`) REFERENCES `employee_review` (`employee_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prevention_review_other_star`
--
ALTER TABLE `prevention_review_other_star`
  ADD CONSTRAINT `prevention_review_other_star_ibfk_1` FOREIGN KEY (`prevention_review_id`) REFERENCES `prevention_review` (`prevention_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prevention_review_star`
--
ALTER TABLE `prevention_review_star`
  ADD CONSTRAINT `prevention_review_star_ibfk_1` FOREIGN KEY (`prevention_review_id`) REFERENCES `prevention_review` (`prevention_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary_review_star`
--
ALTER TABLE `salary_review_star`
  ADD CONSTRAINT `salary_review_star_ibfk_1` FOREIGN KEY (`salary_review_id`) REFERENCES `salary_review` (`salary_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `superior_review_other_star`
--
ALTER TABLE `superior_review_other_star`
  ADD CONSTRAINT `superior_review_other_star_ibfk_1` FOREIGN KEY (`superior_review_id`) REFERENCES `superior_review` (`superior_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `superior_review_star`
--
ALTER TABLE `superior_review_star`
  ADD CONSTRAINT `superior_review_star_ibfk_1` FOREIGN KEY (`superior_review_id`) REFERENCES `superior_review` (`superior_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_review_other_star`
--
ALTER TABLE `supplier_review_other_star`
  ADD CONSTRAINT `supplier_review_other_star_ibfk_1` FOREIGN KEY (`supplier_review_id`) REFERENCES `supplier_review` (`supplier_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_review_star`
--
ALTER TABLE `supplier_review_star`
  ADD CONSTRAINT `supplier_review_star_ibfk_1` FOREIGN KEY (`supplier_review_id`) REFERENCES `supplier_review` (`supplier_review_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

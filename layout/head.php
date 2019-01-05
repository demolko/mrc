<?php 
include_once __DIR__ . '/../config/session.php';

if(!isset($_SESSION['username'])): ?>
 <script type="text/javascript">
   window.location.href = 'not_authorized.php';
</script>
<?php endif ?>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="./css/view_layout.css" />
	<link rel="stylesheet" type="text/css" href="./css/buttons.css" />
	<link rel="stylesheet" type="text/css" href="./css/custom_page_layout.css" />
	<link rel="stylesheet" type="text/css" href="./css/forms.css" />
	<link rel="stylesheet" type="text/css" href="./css/modals.css" />
	<script src="./lib/jquery/jquery-3.3.1.min.js"></script>
	<script src="./js/main.js"></script>
</head>
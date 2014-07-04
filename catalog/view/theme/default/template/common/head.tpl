<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
<meta charset="UTF-8" />
<meta name="author" content="Ion LogicDev opencart-lite.com">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
    <!-- start: MAIN CSS -->
    <link href="catalog/view/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="catalog/view/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="catalog/view/fonts/style.css">
    <link rel="stylesheet" href="catalog/view/plugins/animate.css/animate.min.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/main.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/main-responsive.css">
    <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/theme_blue.css" type="text/css" id="skin_color">
    <!-- end: MAIN CSS -->
    <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
    <link rel="stylesheet" href="catalog/view/plugins/colorbox/example2/colorbox.css">
    <link rel="stylesheet" href="catalog/view/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
    <link rel="stylesheet" href="catalog/view/plugins/iCheck/skins/all.css">
    <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
<!--<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />-->
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
    <!--[if lt IE 9]>
    <script src="catalog/view/plugins/html5shiv.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="catalog/view/plugins/respond.min.js"></script>
    <script src="catalog/view/plugins/excanvas.min.js"></script>
    <script src="catalog/view/plugins/html5shiv.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <!--<![endif]-->
    <script src="catalog/view/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="catalog/view/plugins/jquery.transit/jquery.transit.js"></script>
    <script src="catalog/view/plugins/hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"></script>
    <script src="catalog/view/plugins/jquery.appear/jquery.appear.js"></script>
    <script src="catalog/view/plugins/blockUI/jquery.blockUI.js"></script>
    <script src="catalog/view/plugins/jquery-cookie/jquery.cookie.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="catalog/view/plugins/stellar.js/jquery.stellar.min.js"></script>
    <script src="catalog/view/plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="catalog/view/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js"></script>
    <script src="catalog/view/plugins/iCheck/jquery.icheck.min.js"></script>
    <script src="catalog/view/javascript/index.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="login example2">
<div id="container">

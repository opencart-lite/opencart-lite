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
    <script src="catalog/view/plugins/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <script src="catalog/view/javascript/index.js"></script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php //echo $body; ?>">
<div id="container">
<!-- start: HEADER -->
<header class="colored-top-bar">
<!-- start: SLIDING BAR (SB) -->
<div id="slidingbar-area">
    <div id="slidingbar">
        <!-- start: SLIDING BAR FIRST COLUMN -->
        <div class="col-md-4 col-sm-4">
            <h2>About <?php echo $store_name; ?></h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
                Nulla consequat massa quis enim.
                Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.
                In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.
            </p>
        </div>
        <!-- end: SLIDING BAR FIRST COLUMN -->
        <!-- start: SLIDING BAR THIRD COLUMN -->
        <div class="col-md-4 col-sm-4">
            <h2>Contact Us</h2>
            <address class="margin-bottom-40">
                Clip-One
                <br>
                12345 Street Name, City Name, United States
                <br>
                P: (641)-734-4763
                <br>
                Email:
                <a href="#">
                    info@example.com
                </a>
            </address>
        </div>
        <!-- end: SLIDING BAR THIRD COLUMN -->
    </div>
    <!-- start: SLIDING BAR TOGGLE BUTTON -->
    <a href="#" class="sb_toggle">
    </a>
    <!-- end: SLIDING BAR TOGGLE BUTTON -->
</div>
<!-- end: SLIDING BAR -->
<!-- start: TOP BAR -->
<div class="clearfix " id="topbar">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <!-- start: TOP BAR CALL US -->
                <div class="callus">
                    <?php if (!$logged) { ?>
                    <?php echo $text_welcome; ?>
                    <?php } else { ?>
                    <?php echo $text_logged; ?>
                    <?php } ?>
                </div>
                <!-- end: TOP BAR CALL US -->
            </div>
            <div class="col-sm-6">
                <!-- start: TOP BAR SOCIAL ICONS -->
                <div class="social-icons">
                    <ul>
                        <li class="social-twitter tooltips" data-original-title="Twitter" data-placement="bottom">
                            <a target="_blank" href="http://www.twitter.com">
                                Twitter
                            </a>
                        </li>
                        <li class="social-dribbble tooltips" data-original-title="Dribbble" data-placement="bottom">
                            <a target="_blank" href="http://dribbble.com">
                                Dribbble
                            </a>
                        </li>
                        <li class="social-facebook tooltips" data-original-title="Facebook" data-placement="bottom">
                            <a target="_blank" href="http://facebook.com">
                                Facebook
                            </a>
                        </li>
                        <li class="social-google tooltips" data-original-title="Google" data-placement="bottom">
                            <a target="_blank" href="http://google.com">
                                Google+
                            </a>
                        </li>
                        <li class="social-linkedin tooltips" data-original-title="LinkedIn" data-placement="bottom">
                            <a target="_blank" href="http://linkedin.com">
                                LinkedIn
                            </a>
                        </li>
                        <li class="social-youtube tooltips" data-original-title="YouTube" data-placement="bottom">
                            <a target="_blank" href="http://youtube.com/">
                                YouTube
                            </a>
                        </li>
                        <li class="social-rss tooltips" data-original-title="RSS" data-placement="bottom">
                            <a target="_blank" href="#" >
                                RSS
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- end: TOP BAR SOCIAL ICONS -->





                <div class="navbar-tools">
                <!-- start: TOP NAVIGATION MENU -->
                <ul class="nav navbar-right">
                    <li class="dropdown">
                        <?php //echo $language; ?>
                    </li>
                    <li class="dropdown">
                        <?php //echo $currency; ?>
                    </li>

                    <?php echo $cart; ?>


                <!-- start: USER DROPDOWN -->
                <li class="dropdown current-user">
                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true" href="#">
                        <img src="assets/images/avatar-1-small.jpg" class="circle-img" alt="">
                        <span class="username">Peter Clark</span>
                        <i class="clip-chevron-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="pages_user_profile.html">
                                <i class="clip-user-2"></i>
                                &nbsp;My Profile
                            </a>
                        </li>
                        <li>
                            <a href="pages_calendar.html">
                                <i class="clip-calendar"></i>
                                &nbsp;My Calendar
                            </a>
                        </li><li>
                            <a href="pages_messages.html">
                                <i class="clip-bubble-4"></i>
                                &nbsp;My Messages (3)
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="utility_lock_screen.html"><i class="clip-locked"></i>
                                &nbsp;Lock Screen </a>
                        </li>
                        <li>
                            <a href="login_example1.html">
                                <i class="clip-exit"></i>
                                &nbsp;Log Out
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- end: USER DROPDOWN -->
                </ul>
                <!-- end: TOP NAVIGATION MENU -->
                </div>
            </div>
        </div>
    </div>
</div>




<!-- end: TOP BAR -->
<div role="navigation" class="navbar navbar-default navbar-fixed-top space-top">
<!-- start: TOP NAVIGATION CONTAINER -->
<div class="container">
<div class="navbar-header">
    <!-- start: RESPONSIVE MENU TOGGLER -->
    <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <!-- end: RESPONSIVE MENU TOGGLER -->
    <!-- start: LOGO -->
    <a class="navbar-brand" href="#">
        <?php if ($logo) { ?>
        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
        <?php } else { ?>
        <i class="clip-cart"></i> <?php echo $store_name; ?>
        <?php } ?>
    </a>
    <!-- end: LOGO -->
</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav navbar-right">
<li class="<?php //echo $home['active']; ?>">
    <a href="<?php //echo $home['href']; ?>">
        <?php //echo $text_home; ?>
    </a>
</li>
<?php if ($categories) { ?>
        <?php foreach ($categories as $category) { ?>
        <li class="dropdown <?= /*($category['active']) ? 'active'  : ''*/'' ?>">
            <a class="dropdown-toggle" href="<?php echo $category['href']; ?>" data-toggle="dropdown" data-hover="dropdown">
                <?php echo $category['name']; ?> <b class="caret"></b>
            </a>
            <?php if ($category['children']) { ?>
                <ul class="dropdown-menu">
                    <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
                    <?php if (isset($category['children'][$i])) { ?>
                    <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
            <?php } ?>
        </li>
        <?php } ?>
<?php } ?>
<li class="menu-search">
    <!-- start: SEARCH BUTTON -->
    <a href="#" data-placement="bottom" data-toggle="popover">
        <i class="clip-search-3"></i>
    </a>
    <!-- end: SEARCH BUTTON -->
    <!-- start: SEARCH POPOVER -->
    <div class="popover bottom search-box">
        <div class="arrow"></div>
        <div class="popover-content">

            <!-- start: SEARCH FORM -->
                <div class="input-group">
                    <?php if ($filter_name) { ?>
                    <input type="text" name="filter_name" class="form-control" placeholder="<?php echo $filter_name; ?>">
                    <?php } else { ?>
                    <input type="text" name="filter_name" class="form-control" placeholder="<?php echo $text_search; ?>">
                    <?php } ?>
                    <span class="input-group-btn">
                        <button class="btn btn-main-color btn-squared" type="submit">
                            <i class="clip-search-3"></i>
                        </button>
                    </span>
                </div>
            <!-- end: SEARCH FORM -->
        </div>
    </div>
    <!-- end: SEARCH POPOVER -->
</li>
</ul>
</div>
</div>
<!-- end: TOP NAVIGATION CONTAINER -->
</div>
</header>
<!-- end: HEADER -->

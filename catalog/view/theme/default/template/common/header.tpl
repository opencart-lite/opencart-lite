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
            <h2><?php echo $text_about; ?><?php echo $store_name; ?></h2>
            <p>
                <?php echo $store_about; ?>
            </p>
        </div>
        <!-- end: SLIDING BAR FIRST COLUMN -->
        <!-- start: SLIDING BAR THIRD COLUMN -->
        <div class="col-md-4 col-sm-4">
            <h2><?php echo $text_contact; ?></h2>
            <address class="margin-bottom-40">
                <?php echo $store_owner; ?>
                <br>
                <?php echo $store_address; ?>
                <br>
                <?php echo $store_telephone; ?>
                <br>
                <?php echo $text_email; ?>
                <a href="mailto:<?php echo $store_email; ?>">
                    <?php echo $store_email; ?>
                </a>
            </address>
        </div>
        <!-- end: SLIDING BAR THIRD COLUMN -->
    </div>
    <!-- start: SLIDING BAR TOGGLE BUTTON -->
    <a href="javascript:void(0)" class="sb_toggle">
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


                    <li class="links tooltips dropdown" data-original-title="<?php echo $text_account; ?>" data-placement="bottom">
                        <a class="dropdown-toggle" href="<?php echo $account; ?>">
                            <i class="clip-user-3"></i>
                        </a>
                    </li>
                    <li class="links tooltips dropdown" data-original-title="<?php echo $text_wishlist; ?>" data-placement="bottom">
                        <a class="dropdown-toggle" href="<?php echo $wishlist; ?>">
                            <i class="fa fa-heart"></i>
                            <?php if ($wishlist_count) { ?>
                            <span class="badge"> <?php echo $wishlist_count; ?></span>
                            <?php } ?>
                        </a>
                    </li>
                    <li class="links tooltips dropdown" data-original-title="<?php echo $text_checkout; ?>" data-placement="bottom">
                        <a class="dropdown-toggle" href="<?php echo $checkout; ?>">
                            <i class="fa fa-check"></i>
                        </a>
                    </li>

                <!-- start: USER DROPDOWN -->
                <!--<li class="dropdown current-user">
                    <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true" href="#">
                        <i class="clip-user-3"></i>
                        <span class="username"><?php echo $login_name; ?></span>
                        <i class="clip-chevron-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<?php echo $account; ?>">
                                <i class="fa fa-gear"></i>
                                &nbsp;<?php echo $text_account; ?>
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo $wishlist; ?>">
                                <i class="fa fa-heart"></i>
                                &nbsp;<?php echo $text_wishlist; ?>
                            </a>
                        </li><li>
                            <a href="<?php echo $shopping_cart; ?>">
                                <i class="fa fa-shopping-cart"></i>
                                &nbsp;<?php echo $text_shopping_cart; ?>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<?php echo $checkout; ?>">
                                <i class="fa fa-file-text"></i>
                                &nbsp;<?php echo $text_checkout; ?>
                            </a>
                        </li>
                        <li>
                            <?php if (!$logged) { ?>
                            <a href="<?php echo $login ?>">
                                <i class="fa fa-sign-in"></i>
                                &nbsp;<?php echo $text_login ?>
                            </a>
                            <?php } else { ?>
                            <a href="<?php echo $logout ?>">
                                <i class="fa fa-power-off"></i>
                                &nbsp;<?php echo $text_logout ?>
                            </a>
                            <?php } ?>

                        </li>
                    </ul>
                </li>-->
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
    <a href="<?php echo $home; ?>">
        <?php echo $text_home; ?>
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

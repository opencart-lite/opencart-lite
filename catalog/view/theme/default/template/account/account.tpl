<?php echo $header; ?>
<!-- start: MAIN CONTAINER -->
<div class="main-container">
    <section class="page-top">
        <div class="container">
            <div class="col-md-4 col-sm-4">
                <h1><?php echo $heading_title; ?></h1>
            </div>
            <div class="col-md-8 col-sm-8">
                <!-- BREADCRUMBS -->
                <ul class="pull-right breadcrumb">
                    <?php $i=0; ?>
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php if(isset($breadcrumb['href']) && $breadcrumb['href']) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    </li>
                    <?php } else { ?>
                    <li class="active"><?php echo $breadcrumb['text']; ?></li>
                    <?php } ?>
                    <?php } ?>
                </ul>
                <!-- /BREADCRUMBS -->
            </div>
            <?php if ($success) { ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
            <?php } ?>
        </div>
    </section>
    <section id="notification"></section>
    <section class="wrapper">
        <div class="container">
            <?php echo $content_top; ?>
            <div class="row">
                <?php echo $column_left; ?>
                <div class="col-md-9">
                    <div class="row">

                        <h2><?php echo $text_my_account; ?></h2>
                        <div class="content">
                            <ul>
                                <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                                <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                                <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                            </ul>
                        </div>
                        <h2><?php echo $text_my_orders; ?></h2>
                        <div class="content">
                            <ul>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                <?php if ($reward) { ?>
                                <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
                                <?php } ?>
                                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                            </ul>
                        </div>
                        <h2><?php echo $text_my_newsletter; ?></h2>
                        <div class="content">
                            <ul>
                                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                            </ul>
                        </div>


                    </div>
                </div>
            <?php echo $column_right; ?>
        </div>
        <?php echo $content_bottom; ?>
</div>
</section>
</div>
<!-- end: MAIN CONTAINER -->
<?php echo $footer; ?>
<script>
    jQuery(document).ready(function() {
        Main.init();
    });
</script>
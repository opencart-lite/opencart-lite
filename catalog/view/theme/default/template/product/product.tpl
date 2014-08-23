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
        </div>
    </section>
    <section id="notification"></section>
    <section class="wrapper product">
        <div class="container">
            <?php echo $content_top; ?>
            <div class="row">
                <?php echo $column_left; ?>
                <div class="col-md-9">


                            <div class="row product-info">
                                <?php if ($images) { ?>
                                <div class="col-sm-5">
                                    <div class="flexslider" data-plugin-options='{"controlNav":false,"sync": "#carousel"}'>
                                        <ul class="slides">
                                            <?php foreach ($images as $image) { ?>
                                            <li>
                                                <a class="group1" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
                                                    <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                                    <span class="image-overlay"> <i class="clip-expand circle-icon circle-main-color"></i> </span>
                                                </a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                    <div id="carousel" class="flexslider animate-group" data-plugin-options='{"itemWidth": 120, "itemMargin": 5}'>
                                        <ul class="slides">
                                            <?php foreach ($images as $image) { ?>
                                            <li>
                                                <img src="<?php echo $image['mini_thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="animate" data-animation-options='{"animation":"fadeIn", "duration":"600"}'/>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="col-sm-6">
                                    <div class="section-content">
                                        <h2><?php if ($manufacturer) { ?>
                                            <div class="manufacturer"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div>
                                            <?php } ?>
                                            <?php echo $heading_title; ?>
                                            <sub class="model"><i>[<?php echo $model; ?>]</i></sub>
                                        </h2>
                                        <hr class="fade-right">


                                        <?php if ($price) { ?>
                                        <?php if ($special) { ?>
                                        <span class="badge price-old"> <?php echo $price; ?></span>
                                        <?php } ?>
                                        <div class="price">
                                            <?php if (!$special) { ?>
                                            <span class="price-clear"><?php echo $price; ?></span>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $special; ?></span>
                                            <?php } ?>
                                            <?php if ($minimum > 1) { ?>
                                            <?php $text_qty = $text_minimum; ?>
                                            <?php } ?>
                                            <div class="col-sm-3 qty">
                                                <input type="text" class="form-control tooltips" name="quantity" size="2" value="<?php echo $minimum; ?>" tooltips" data-original-title="<?php echo $text_qty; ?>" /></div>

                                            <span class="badge tooltips" data-original-title="<?php echo $text_points; ?>"> <?php echo $points; ?></span>
                                        </div>

                                        <div class="description">
                                        <div class="points">
                                            <div class="col-sm-6">
                                            <?php if ($points) { ?>
                                            <!--<span class="reward"><small><i><?php echo $text_points; ?> <?php echo $points; ?></i></small></span><br />-->
                                            <?php } ?>
                                                <?php if ($reward) { ?>
                                                <span class="badge tooltips" data-original-title="<?php echo $text_reward; ?>"> +<?php echo $reward; ?></span>
                                                <?php } ?>
                                            </div>
                                            <div class="col-sm-6">
                                                <span class="badge tooltips" data-original-title="<?php echo $text_stock; ?>"> <?php echo $stock; ?></span>
                                            </div>
                                        </div>

                                        <?php if ($review_status) { ?>
                                        <div class="review">
                                            <div ><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;
                                                <a class="reviews tooltips" data-original-title="<?php echo $text_review; ?>" onclick="$('a[href=\'#tab-review\']').trigger('click');"><span class="badge"><?php echo $reviews; ?></span></a>
                                                <a class="write tooltips" data-original-title="<?php echo $text_write; ?>" onclick="$('a[href=\'#tab-review\']').trigger('click');"> <i class="fa fa-pencil"></i></a></div>
                                        </div>
                                        <?php } ?>


                                        </div>
                                        <?php if ($discounts) { ?>
                                        <div class="discount">
                                            <?php foreach ($discounts as $discount) { ?>
                                            <div><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></div>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <?php } ?>
                                        <?php if ($options) { ?>
                                        <div class="options">
                                            <h2><?php echo $text_option; ?></h2>
                                            <br />
                                            <?php foreach ($options as $option) { ?>
                                            <?php if ($option['type'] == 'select') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <select class="form-control" name="option[<?php echo $option['product_option_id']; ?>]">
                                                    <option value=""><?php echo $text_select; ?></option>
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'radio') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <div>
                                                <input class="form-control" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                                </div>

                                                <?php } ?>
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'checkbox') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <input class="form-control" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                                <br />
                                                <?php } ?>
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'image') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <table class="option-image">
                                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                                    <tr>
                                                        <td style="width: 1px;"><input class="form-control" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                                                        <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                                                        <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </label></td>
                                                    </tr>
                                                    <?php } ?>
                                                </table>
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'text') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'textarea') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <textarea class="form-control" name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'file') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <input class="form-control" type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'date') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'datetime') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php if ($option['type'] == 'time') { ?>
                                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                                <?php if ($option['required']) { ?>
                                                <span class="required">*</span>
                                                <?php } ?>
                                                <b><?php echo $option['name']; ?>:</b><br />
                                                <input class="form-control" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time"  />
                                            </div>
                                            <br />
                                            <?php } ?>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <hr class="fade-right">
                                        <div class="cart">

                                                <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                                                &nbsp;
                                                <button id="button-cart" class="btn btn-main-color btn-squared">
                                                    <i class="clip-cart"></i>
                                                    <?php echo $button_cart; ?>
                                                </button>
                                            <!---<div><span>&nbsp;&nbsp;&nbsp;<?php echo $text_or; ?>&nbsp;&nbsp;&nbsp;</span></div>-->
                                            <div class="wishlist"><a onclick="addToWishList('<?php echo $product_id; ?>');"><i class="icon fa fa-heart fa-large tooltips" data-original-title="<?php echo $button_wishlist; ?>"></i></a></div>
                                            <div class="compare"><a onclick="addToCompare('<?php echo $product_id; ?>');"><i class="icon fa fa-bar-chart-o fa-large tooltips" data-original-title="<?php echo $button_compare; ?>"></i></a></div>

                                        </div>
                                        <?php if ($review_status) { ?>
                                        <div class="review">
                                            <div class="share"><!-- AddThis Button BEGIN -->
                                                <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
                                                <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>
                                                <!-- AddThis Button END -->
                                            </div>
                                        </div>
                                        <?php } ?>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="tabbable">
                                        <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
                                            <li class="active">
                                                <a data-toggle="tab" href="#tab-description">
                                                    <?php echo $tab_description; ?>
                                                </a>
                                            </li>
                                            <?php if ($attribute_groups) { ?>
                                            <li>
                                                <a data-toggle="tab" href="#tab-attribute">
                                                    <?php echo $tab_attribute; ?>
                                                </a>
                                            </li>
                                            <?php } ?>
                                            <?php if ($review_status) { ?>
                                            <li>
                                                <a data-toggle="tab" href="#tab-review">
                                                    <?php echo $tab_review; ?>
                                                </a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                    <div class="tab-content">
                                    <div id="tab-description" class="tab-pane in active">
                                        <div><?php echo $description; ?></div>
                                    </div>
                                        <?php if ($attribute_groups) { ?>
                                    <div id="tab-attribute" class="tab-pane">
                                        <div>
                                            <table class="attribute">
                                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                                <thead>
                                                <tr>
                                                    <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                <tr>
                                                    <td><?php echo $attribute['name']; ?></td>
                                                    <td><?php echo $attribute['text']; ?></td>
                                                </tr>
                                                <?php } ?>
                                                </tbody>
                                                <?php } ?>
                                            </table>
                                        </div>
                                    </div>
                                        <?php } ?>
                                        <?php if ($review_status) { ?>
                                    <div id="tab-review" class="tab-pane">
                                        <div>
                                            <div id="review"></div>
                                            <h2 id="review-title"><?php echo $text_write; ?></h2>
                                            <b><?php echo $entry_name; ?></b><br />
                                            <input type="text" name="name" value="" />
                                            <br />
                                            <br />
                                            <b><?php echo $entry_review; ?></b>
                                            <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
                                            <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                                            <br />
                                            <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
                                            <input type="radio" name="rating" value="1" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="4" />
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" />
                                            &nbsp;<span><?php echo $entry_good; ?></span><br />
                                            <br />
                                            <b><?php echo $entry_captcha; ?></b><br />
                                            <input type="text" name="captcha" value="" />
                                            <br />
                                            <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
                                            <br />
                                            <div class="buttons">
                                                <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                                            </div>
                                        </div>
                                    </div>
                                        <?php } ?>

                                    </div>

                                    <?php if ($products) { ?>
                                    <div class="row related">
                                        <div class="col-md-12">
                                            <h2 class="center"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</h2>
                                            <div id="carousel" class="flexslider animate-group" data-plugin-options='{"itemWidth": 220, "itemMargin": 5}'>
                                                <ul class="slides">

                                                        <?php foreach ($products as $product) { ?>
                                                    <li>

                                                            <div class="grid-item animate">
                                                                <a href="<?php echo $product['href']; ?>">
                                                                    <?php if ($product['thumb']) { ?>
                                                                    <div class="grid-image">
                                                                        <img src="<?php echo $product['thumb']; ?>" class="img-responsive"/>
                                                                        <span class="image-overlay"> <i class="fa fa-mail-forward circle-icon circle-main-color"></i> </span>
                                                                    </div>
                                                                    <?php } ?>
                                                                    <div class="grid-content">
                                                                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                                                        <?php if ($product['price']) { ?>
                                                                        <div class="price">
                                                                            <?php if (!$product['special']) { ?>
                                                                            <?php echo $product['price']; ?>
                                                                            <?php } else { ?>
                                                                            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                                                                            <?php } ?>
                                                                        </div>
                                                                        <?php } ?>
                                                                        <?php if ($product['rating']) { ?>
                                                                        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                                                                        <?php } ?>
                                                                        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                                                                    </div>
                                                                </a>

                                                        </div>
                                                        </li>
                                                        <?php } ?>





                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>

                                    <?php if ($tags) { ?>
                                    <div class="tags"><b><?php echo $text_tags; ?></b>
                                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                        <?php if ($i < (count($tags) - 1)) { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                                        <?php } else { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
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
<script type="text/javascript">
    /*$('.colorbox').colorbox({
        overlayClose: true,
        opacity: 0.5
    });*/
    </script>
<script type="text/javascript">
    $('#button-cart').bind('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
            dataType: 'json',
            success: function(json) {
                $('.success, .warning, .attention, .information, .error').remove();

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                        }
                    }
                }

                if (json['success']) {
                    $('#notification').html('<div class="alert alert-success" style="display: none;">' + json['success'] + '<button data-dismiss="alert" class="close">×</button></div>');

                    $('.success').fadeIn('slow');

                    $('#cart-total').html(json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            }
        });
    });
    </script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript">
    new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
        action: 'index.php?route=product/product/upload',
        name: 'file',
        autoSubmit: true,
        responseType: 'json',
        onSubmit: function(file, extension) {
            $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
        },
        onComplete: function(file, json) {
            $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);

            $('.error').remove();

            if (json['success']) {
                alert(json['success']);

                $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
            }

            if (json['error']) {
                $('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
            }

            $('.loading').remove();
        }
    });
    </script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript">
    /*$('#review .pagination a').live('click', function() {
        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');

        return false;
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').bind('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
                $('.success, .warning').remove();
                $('#button-review').attr('disabled', true);
                $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
            },
            complete: function() {
                $('#button-review').attr('disabled', false);
                $('.attention').remove();
            },
            success: function(data) {
                if (data['error']) {
                    $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                }

                if (data['success']) {
                    $('#review-title').after('<div class="alert alert-success">' + data['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').attr('checked', '');
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });*/
    </script>
<script type="text/javascript">
    //$('#tabs a').tabs();
    </script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
    /*if ($.browser.msie && $.browser.version == 6) {
        $('.date, .datetime, .time').bgIframe();
    }

    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
    });
    $('.time').timepicker({timeFormat: 'h:m'});*/
    </script>
<?php echo $footer; ?>
<script>
    jQuery(document).ready(function() {
        Main.init();
        Index.init();
        $.stellar();
    });
</script>
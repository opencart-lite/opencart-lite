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
    <section class="wrapper">
        <div class="container">
            <?php echo $content_top; ?>
            <div class="row">
                <?php echo $column_left; ?>
                <div class="col-md-9">
                    <div class="blog-posts">
                        <div class="row">
                            <?php if ($thumb || $description) { ?>
                            <div class="category-info">
                                <?php if ($thumb) { ?>
                                <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
                                <?php } ?>
                                <?php if ($description) { ?>
                                <?php echo $description; ?>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php if ($categories) { ?>
                            <h2 class="col-md-9"><?php echo $text_refine; ?></h2>
                            <div class="category-list col-md-9">
                                <?php if (count($categories) <= 5) { ?>
                                <ul>
                                    <?php foreach ($categories as $category) { ?>
                                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                                    <?php } ?>
                                </ul>
                                <?php } else { ?>
                                <?php for ($i = 0; $i < count($categories);) { ?>
                                <ul>
                                    <?php $j = $i + ceil(count($categories) / 4); ?>
                                    <?php for (; $i < $j; $i++) { ?>
                                    <?php if (isset($categories[$i])) { ?>
                                    <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
                                    <?php } ?>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                                <?php } ?>
                            </div>
                            <?php } ?>
                        </div>
                        <hr>
                        <?php if ($products) { ?>
                        <div class="row">

                            <div class="product-filter">

                                <div class="input-group col-md-4 display">

                                <div class="make-switch switch-large" data-label-icon="fa fa-desktop fa-large" data-on-label="<i class='fa fa-list fa-white'></i>" data-off-label="<i class='fa fa-th-large'></i>">
                                    <input onclick="display('grid');alert('click');" type="checkbox" checked>
                                </div>
                                </div>
                                <div class="input-group col-md-2 limit"><span class="input-group-addon"> <i class="fa fa-eye"></i> </span>
                                    <select class="form-control" onchange="location = this.value;">
                                        <?php foreach ($limits as $limits) { ?>
                                        <?php if ($limits['value'] == $limit) { ?>
                                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="input-group col-md-3 sort"><span class="input-group-addon"> <i class="fa fa-sort-alpha-asc"></i> </span>
                                    <select class="form-control date-range" onchange="location = this.value;">
                                        <?php foreach ($sorts as $sorts) { ?>
                                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="product-compare col-md-3"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
                            <hr>
                        </div>
                        <?php foreach ($products as $product) { ?>
                        <article>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="post-image">
                                        <div class="flexslider" data-plugin-options='{"directionNav":true}'>
                                            <ul class="slides">
                                                <?php if ($product['images']) { ?>
                                                <ul class="slides">
                                                    <?php foreach ($product['images'] as $image) { ?>
                                                    <li>
                                                        <img src="<?php echo $image['thumb']; ?>" title="" alt="" />
                                                    </li>
                                                    <?php } ?>
                                                </ul>
                                                <?php } ?>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="post-content">
                                        <h2>
                                            <a href="<?php echo $product['href']; ?>">
                                                <?php echo $product['name']; ?>
                                            </a></h2>
                                        <p>
                                            <?php echo $product['description']; ?> [...]
                                        </p>
                                        <p>
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
                                        <div class="cart">
                                            <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
                                        </div>
                                        <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
                                        <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>

                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="post-meta">
                                        <span><i class="fa fa-calendar"></i> January 11, 2014 </span>
                                        <?php if ($product['tags']) { ?>
                           <span><i class="fa fa-tag"></i>
                               <?php for ($i = 0; $i < count($product['tags']); $i++) { ?>
                               <?php if ($i < (count($product['tags']) - 1)) { ?>
                               <a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>,
                               <?php } else { ?>
                               <a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>
                               <?php } ?>
                               <?php } ?>
                            </span>
                                        <?php } ?>
												<span><i class="fa fa-comments"></i>
													<a href="#">
                                                        36 Comments
                                                    </a></span>
                                        <a class="btn btn-xs btn-main-color pull-right" href="<?php echo $product['href']; ?>">
                                            <?php echo $button_continue; ?>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <?php } ?>
                        <?php echo $pagination; ?>
                        <?php } ?>
                        <?php if (!$categories && !$products) { ?>
                        <div class="content"><?php echo $text_empty; ?></div>
                        <div class="buttons">
                            <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
                        </div>
                        <?php } ?>

                    </div>
                </div>
                <?php echo $column_right; ?>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </section>
</div>
<!-- end: MAIN CONTAINER -->
<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<script>
    jQuery(document).ready(function() {
        Main.init();
    });
</script>

<script type="text/javascript"><!--
    /*function display(view) {
        if (view == 'list') {
            $('.product-grid').attr('class', 'product-list');

            $('.product-list > div').each(function(index, element) {
                html  = '<div class="right">';
                html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
                html += '</div>';

                html += '<div class="left">';

                var image = $(element).find('.image').html();

                if (image != null) {
                    html += '<div class="image">' + image + '</div>';
                }

                var price = $(element).find('.price').html();

                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }

                html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
                html += '  <div class="description">' + $(element).find('.description').html() + '</div>';

                var rating = $(element).find('.rating').html();

                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }

                html += '</div>';


                $(element).html(html);
            });

            $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');

            $.cookie('display', 'list');
        } else {
            $('.product-list').attr('class', 'product-grid');

            $('.product-grid > div').each(function(index, element) {
                html = '';

                var image = $(element).find('.image').html();

                if (image != null) {
                    html += '<div class="image">' + image + '</div>';
                }

                html += '<div class="name">' + $(element).find('.name').html() + '</div>';
                html += '<div class="description">' + $(element).find('.description').html() + '</div>';

                var price = $(element).find('.price').html();

                if (price != null) {
                    html += '<div class="price">' + price  + '</div>';
                }

                var rating = $(element).find('.rating').html();

                if (rating != null) {
                    html += '<div class="rating">' + rating + '</div>';
                }

                html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
                html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
                html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

                $(element).html(html);
            });

            $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');

            $.cookie('display', 'grid');
        }
    }

    view = $.cookie('display');

    if (view) {
        display(view);
    } else {
        display('list');
    }
    */
    //--></script>
<?php echo $footer; ?>
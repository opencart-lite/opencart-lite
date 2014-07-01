<section class="wrapper wrapper-grey padding50">
    <!-- start: WORKS CONTAINER -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="center"><?php echo $heading_title; ?></h2>
                <div class="grid-container animate-group" data-animation-interval="100">
                    <?php foreach ($products as $product) { ?>
                    <div class="col-md-3 col-sm-6">
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
                    </div>
                    <?php } ?>
                </div>

            </div>
        </div>
    </div>
    <!-- end: WORKS CONTAINER -->
</section>
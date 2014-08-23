<!-- start: CART DROPDOWN -->
<li class= "links dropdown">
    <a class="dropdown-toggle" data-close-others="true" data-hover="dropdown" data-toggle="dropdown" href="#">
        <i class="clip-cart"></i>
        <?php if ($items) { ?>
        <span class="badge"> <?php echo $items; ?></span>
        <?php } ?>
    </a>
    <ul class="dropdown-menu posts">
        <li>
            <span class="dropdown-menu-title"> <?php echo $text_items; ?></span>
        </li>
        <li>
            <div class="drop-down-wrapper ps-container">
                <ul>
                    <?php foreach ($products as $product) { ?>
                    <li>
                        <a href="javascript:;">
                            <div class="clearfix">
                                <?php if ($product['thumb']) { ?>
                                <div class="thread-image">
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                </div>
                                <?php } ?>
                                <div>
                                    <?php foreach ($product['option'] as $option) { ?>
                                    - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                                    <?php } ?>
                                </div>
                                <div class="thread-content">
                                    <span class="author"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                                    <span class="preview"><?php echo $product['quantity']; ?></span>
                                    <span class="preview"><?php echo $product['total']; ?></span>
                                    <span class="time"> <img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" /></span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <?php } ?>

                    <?php foreach ($vouchers as $voucher) { ?>
                    <li>
                        <a href="javascript:;">
                            <div class="clearfix">
                                <div class="thread-image">
                                    <?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                    <?php } ?>
                                </div>
                                <div class="thread-content">
                                    <span class="author"><?php echo $voucher['description']; ?></span>
                                    <span class="preview">x&nbsp;1</span>
                                    <span class="preview"><?php echo $voucher['amount']; ?></span>
                                    <span class="time"> <img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <?php } ?>
                    <?php foreach ($totals as $total) { ?>
                    <li>
                        <a href="javascript:;">
                            <div class="clearfix">
                                <div class="thread-content">
                                    <span class="author"><b><?php echo $total['title']; ?>:</b></span>
                                    <span class="preview"><?php echo $total['text']; ?></span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
                <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 3px; width: 270px; display: none;"><div class="ps-scrollbar-x" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px; height: 250px; display: inherit;"><div class="ps-scrollbar-y" style="top: 0px; height: 0px;"></div></div></div>
        </li>
        <li class="view-all">
            <a href="pages_messages.html">
                <a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a><i class="fa fa-arrow-circle-o-right"></i>
            </a>
        </li>
    </ul>
</li>
<!-- end: CART DROPDOWN -->
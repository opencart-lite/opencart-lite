<!-- start: CART DROPDOWN -->
<li class= "links dropdown">
    <a id="cart-total" class="dropdown-toggle" data-close-others="true" data-hover="dropdown" data-toggle="dropdown" href="#">
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
            <div class="drop-down-wrapper ps-container" style="overflow-y:scroll">
                <ul>
                    <li>
                    <?php foreach ($products as $product) { ?>
                            <div class="clearfix">
                                <?php if ($product['thumb']) { ?>
                                <div class="thread-content">
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                    <a class="name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                    <div class="quantity"> x <?php echo $product['quantity']; ?></div>
                                    <div class="total"><?php echo $product['total']; ?></div>



                                    <span class="label label-danger" alt="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" ><i class="fa fa-times"></i></span>

                                    <div class="option">
                                        <?php foreach ($product['option'] as $option) { ?>
                                        - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                                        <?php } ?>
                                    </div>
                                </div>
                                <?php } ?>

                            </div>


                    <?php } ?>
                    </li>

                    <!--<?php foreach ($vouchers as $voucher) { ?>
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
                    <?php } ?>-->
                    <li id="mini-cart-total">

                        <table>
                            <tbody>
                            <?php foreach ($totals as $total) { ?>
                            <tr class="preview">
                                <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                                <td class="right"><?php echo $total['text']; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>


                        <!--<a href="javascript:;">
                            <div class="clearfix">
                                <div class="thread-content">
                                    <?php foreach ($totals as $total) { ?>
                                    <span class="author"><b><?php echo $total['title']; ?>:</b></span>
                                    <span class="preview"><?php echo $total['text']; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </a>-->


                    </li>

                </ul>

            </div>
        </li>
        <li class="view-all">

                <a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
                <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a><!--<i class="fa fa-arrow-circle-o-right"></i>-->

        </li>
    </ul>
</li>
<!-- end: CART DROPDOWN -->
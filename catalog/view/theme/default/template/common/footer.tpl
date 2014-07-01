<!-- start: FOOTER -->
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div>
                    <?php if ($informations) { ?>
                        <h4><?php echo $text_information; ?></h4>
                        <ul class="contact">
                            <?php foreach ($informations as $information) { ?>
                            <li><p><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></p></li>
                            <?php } ?>
                        </ul>
                    <?php } ?>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    <h4><?php echo $text_extra; ?></h4>
                    <ul class="contact">
                        <li><p><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li></p>
                        <li><p><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li></p>
                        <li><p><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li></p>
                        <li><p><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li></p>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <h4><?php echo $text_account; ?></h4>
                    <ul class="contact">
                        <li><p><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li></p>
                        <li><p><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li></p>
                        <li><p><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li></p>
                        <li><p><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li></p>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <h4>Follow Us</h4>
                <div class="social-icons">
                    <ul>
                        <li class="social-twitter tooltips" data-original-title="Twitter" data-placement="bottom">
                            <a target="_blank" href="http://www.twitter.com">
                                Twitter
                            </a>
                        </li>
                        <li class="social-facebook tooltips" data-original-title="Facebook" data-placement="bottom">
                            <a target="_blank" href="http://facebook.com" data-original-title="Facebook">
                                Facebook
                            </a>
                        </li>
                        <li class="social-linkedin tooltips" data-original-title="LinkedIn" data-placement="bottom">
                            <a target="_blank" href="http://linkedin.com" data-original-title="LinkedIn">
                                LinkedIn
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-1">
                    <a class="logo" href="http://opencart-lite.com">
                        opencart<i class="clip-clip"></i>Lite
                    </a>
                </div>
                <div class="col-md-7">
                    <p>
                        <?php echo $powered; ?>
                    </p>
                </div>

                <div class="col-md-4">
                    <nav id="sub-menu">
                        <ul>
                            <ul>
                                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                            </ul>
                        </ul>
                    </nav>
                </div>
            </div>


        </div>
    </div>
</footer>
<a id="scroll-top" href="#"><i class="fa fa-angle-up"></i></a>
<!-- end: FOOTER -->
<script src="catalog/view/javascript/main.js"></script>
</body>
</html>
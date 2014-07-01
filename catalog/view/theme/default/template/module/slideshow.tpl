<!-- start: REVOLUTION SLIDERS -->
<section class="fullwidthbanner-container">
    <div id="slideshow<?php echo $module; ?>" class="fullwidthabnner" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
        <ul>
            <?php foreach ($banners as $banner) { ?>
            <!-- start: FIRST SLIDE -->
            <li data-transition="fade" data-slotamount="7" data-masterspeed="1500" >
                <img src="<?php echo $banner['image']; ?>"  style="background-color:rgb(246, 246, 246)" alt="<?php echo $banner['title']; ?>"  data-bgfit="cover" data-bgposition="left bottom" data-bgrepeat="no-repeat">
                <!--<div class="caption lft slide_title slide_item_left"
                     data-x="0"
                     data-y="105"
                     data-speed="400"
                     data-start="1500"
                     data-easing="easeOutExpo">
                    <?php echo $banner['title']; ?>
                </div>-->
                <!--<div class="caption lft slide_subtitle slide_item_left"
                     data-x="0"
                     data-y="180"
                     data-speed="400"
                     data-start="2000"
                     data-easing="easeOutExpo">
                    Super Clean Admin Theme
                </div>--
                <div class="caption lft slide_desc slide_item_left"
                     data-x="0"
                     data-y="220"
                     data-speed="400"
                     data-start="2500"
                     data-easing="easeOutExpo">
                    Lorem ipsum dolor sit amet, dolore eiusmod
                    <br>
                    quis tempor incididunt. Sed unde omnis iste.
                </div>-->
                <?php if ($banner['link']) { ?>
                <a class="caption lft btn btn-green slide_btn slide_item_left" href="<?php echo $banner['link']; ?>"
                   data-x="0"
                   data-y="320"
                   data-speed="400"
                   data-start="3000"
                   data-easing="easeOutExpo">
                    <!--Read More..-->
                    <?php echo $banner['title']; ?>
                </a>
                <?php } ?>
                <!--<div class="caption sfr"
                     data-x="720"
                     data-y="55"
                     data-speed="700"
                     data-start="1000"
                     data-easing="easeOutExpo"  >
                    <img src="<?php //echo $TEMPLATE; ?>images/free-woman.png" alt="Image 1">
                </div>-->
            </li>
            <!-- end: FIRST SLIDE -->
            <?php } ?>
        </ul>
    </div>
</section>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#slideshow<?php echo $module; ?>').revolution({
            delay: 9000,
            startheight: 450,
            startwidth:1120,
            hideThumbs: 10,
            thumbWidth: 100, // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
            thumbHeight: 50,
            thumbAmount: 5,
            //videoJsPath:"assets/plugins/revolution_slider/rs-plugin/videojs",
            navigationType: "bullet", // bullet, thumb, none
            navigationArrows: "solo", // nexttobullets, solo (old name verticalcentered), none
            navigationStyle: "round", // round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom
            navigationHAlign: "center", // Vertical Align top,center,bottom
            navigationVAlign: "bottom", // Horizontal Align left,center,right
            navigationHOffset: 0,
            navigationVOffset: 20,
            soloArrowLeftHalign: "left",
            soloArrowLeftValign: "center",
            soloArrowLeftHOffset: 20,
            soloArrowLeftVOffset: 0,
            soloArrowRightHalign: "right",
            soloArrowRightValign: "center",
            soloArrowRightHOffset: 20,
            soloArrowRightVOffset: 0,
            touchenabled: "on", // Enable Swipe Function : on/off
            onHoverStop: "on", // Stop Banner Timet at Hover on Slide on/off
            stopAtSlide: -1,
            stopAfterLoops: -1,
            shadow: 0, //0 = no Shadow, 1,2,3 = 3 Different Art of Shadows  (No Shadow in Fullwidth Version !)
            fullWidth: "on", // Turns On or Off the Fullwidth Image Centering in FullWidth Modus
            forceFullWidth: "on"
        });
    });
</script>
<!-- end: REVOLUTION SLIDERS -->
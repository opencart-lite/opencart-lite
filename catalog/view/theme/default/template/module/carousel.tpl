<section class="wrapper wrapper-grey padding50">
    <!-- start: PORTFOLIO CONTAINER -->
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!--id="carousel<?php echo $module; ?>"-->
                <div id="carousel" class="flexslider animate-group" data-plugin-options='{"itemWidth": 120, "itemMargin": 5}'>
                    <ul class="slides">
                        <?php foreach ($banners as $banner) { ?>
                        <li>
                            <img src="<?php echo $banner['image']; ?>" class="animate" data-animation-options='{"animation":"fadeIn", "duration":"600"}' />
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end: PORTFOLIO CONTAINER -->
</section>
<script type="text/javascript"><!--
    /*$('#carousel<?php echo $module; ?> ul').jcarousel({
        vertical: false,
        visible: <?php echo $limit; ?>,
    scroll: <?php echo $scroll; ?>
    });*/
//--></script>
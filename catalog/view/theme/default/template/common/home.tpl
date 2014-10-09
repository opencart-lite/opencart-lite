<?php echo $header; ?>
<section id="notification"></section>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<!-- start: MAIN CONTAINER -->
<div class="main-container">
<?php echo $content_top; ?>
<section>
    <!-- start: CORE BOXES CONTAINER -->
    <div class="container">
        <div class="row">

        </div>
    </div>
    <!-- end: CORE BOXES CONTAINER -->
</section>
<?php echo $content_bottom; ?>
</div>
<!-- end: MAIN CONTAINER -->
<script type="text/javascript">
    jQuery(window).ready(function() {
        Main.init();
        Index.init();
        $.stellar();
    });
</script>
<?php echo $footer; ?>
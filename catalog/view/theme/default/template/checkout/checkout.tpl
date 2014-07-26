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
<div class="col-md-12">
<div class="row">
    <div class="col-md-12">
        <!-- start: TABLE WITH IMAGES PANEL -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-external-link-square"></i>
            </div>
            <div class="panel-body">
                    <div id="wizard" class="swMain">
                        <ul>
                            <li>
                                <a href="javascript:void(0)" class="selected" id="address">
                                    <div class="stepNumber">
                                        1
                                    </div>
                                    <span class="stepDesc"><?php echo $text_checkout_address; ?></span>
                                </a>
                            </li>
                            <?php if ($shipping_required) { ?>
                            <li>
                                <a href="javascript:void(0)" id="shipping_method">
                                    <div class="stepNumber">
                                        2
                                    </div>
                                    <span class="stepDesc"><?php echo $text_checkout_shipping_method; ?></span>
                                </a>
                            </li>
                            <?php } ?>
                            <li>
                                <a href="javascript:void(0)" id="payment_method">
                                    <div class="stepNumber">
                                        3
                                    </div>
                                    <span class="stepDesc"><?php echo $text_checkout_payment_method; ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" id="confirm">
                                    <div class="stepNumber">
                                        4
                                    </div>
                                    <span class="stepDesc"><?php echo $text_checkout_confirm; ?></span>
                                </a>
                            </li>
                        </ul>
                        <div class="progress progress-striped active progress-sm">
                            <div aria-valuemax="100" aria-valuemin="0" role="progressbar" class="progress-bar progress-bar-success step-bar">
                                <span class="sr-only"> 0% Complete (success)</span>
                            </div>
                        </div>


                        <div id="checkout-content"></div>

                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-8" id="button">
                                <button class="btn btn-blue next-step btn-block" id="button-next">
                                    Continue<?php //echo $button_continue; ?> <i class="fa fa-arrow-circle-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </div>
        <!-- end: TABLE WITH IMAGES PANEL -->
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
<script type="text/javascript"><!--

   /* $(document).keyup(function(e){
        if(e.which==39){ // Right Arrow
            $this.goForward();
        }else if(e.which==37){ // Left Arrow
            $this.goBackward();
        }
    });*/
    $('#wizard ul li a').css('cursor', 'default');

<?php if ($logged) { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/address',
        dataType: 'html',
        success: function(html) {
            animateBar();
            $('#checkout-content').html(html);
            $('#button-next').attr('step', 'address');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

<?php }  else  { ?>
    $.ajax({
        url: 'index.php?route=checkout/guest_address',
        dataType: 'html',
        success: function(html) {
            animateBar();
            $('#checkout-content').html(html);
            $('#button-next').attr('step', 'guest_address');

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
<?php } ?>

var animateBar = function (val) {
    if ((typeof val == 'undefined') || val == "") {
        val = 1;
    };
    numberOfSteps = $('.swMain > ul > li').length;
    var valueNow = Math.floor(100 / numberOfSteps * val);
    $('.step-bar').css('width', valueNow + '%');
};

var nextSteps = {
<?php if($shipping_required){ ?>
    'address' : {
         'curr' : 1,
         'id' : 2,
         'name' : 'shipping_method',
     },
<?php } else{ ?>
      'address' : {
          'curr' : 1,
          'id' : 3,
          'name' : 'payment_method',
      },
<?php } ?>
    'shipping_method' : {
         'curr' : 2,
         'id' : 3,
         'name' : 'payment_method',
     },
    'payment_method' : {
           'curr' : 3,
           'id' : 4,
           'name' : 'confirm',
    },
    'confirm' : {
        'curr' : 4,
        'id' : 4,
        'name' : 'confirm',
    },
 }

var runStep = function (step, next) {
    $.ajax({
        url: 'index.php?route=checkout/' + step + '/validate',
        type: 'post',
        data: $(
            '#checkout-content input[type=\'text\'],' +
            '#checkout-content input[type=\'hidden\'],' +
            '#checkout-content input[type=\'mail\'],' +
            '#checkout-content input[type=\'checkbox\']:checked,' +
            '#checkout-content input[type=\'radio\']:checked,' +
            '#checkout-content select,' +
            '#checkout-content textarea'
        ),
        dataType: 'json',
        success: function(json) {

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('.alert').remove();

                if (json['error']['warning']) {
                    $('#checkout-content').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/' + next,
                    dataType: 'html',
                    success: function(html) {
                        animateBar(nextSteps[step].id);
                        $('#' + step).attr('class', 'done').css('cursor', 'pointer');
                        $('#' + next).attr('class', 'selected').css('cursor', 'pointer');
                        $('#checkout-content').html(html);
                        $('#button-next').attr('step', next);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
};

    var viewStep = function (step, next) {
        $.ajax({
            url: 'index.php?route=checkout/' + step,
            dataType: 'html',
            success: function(html) {
                animateBar(nextSteps[step].curr);
                $('#' + step).attr('class', 'selected').css('cursor', 'pointer');
                $('#checkout-content').html(html);
                $('#button-next').attr('step', step);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
};

// Checkout
$('#button-next').on('click', function() {
    var step = $('#button-next').attr('step');

    runStep(step , nextSteps[step].name);

});
    $('#wizard ul li a').on('click', function() {
        var step = $(this).attr('id');
        var sClass = $(this).attr('class');
        if(sClass == 'selected' || sClass == 'done'){
            viewStep(step , nextSteps[step].name);
        }
        return false;
    });

});
//--></script>
<script>
    jQuery(document).ready(function() {
        Main.init();
    });
</script>
<?php echo $footer; ?>
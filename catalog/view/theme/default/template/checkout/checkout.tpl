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



                <form action="javascript:void(0)" role="form" class="smart-wizard form-horizontal" id="form">
                    <div id="wizard" class="swMain">
                        <ul>
                            <li>
                                <a href="#checkout">
                                    <div class="stepNumber">
                                        1
                                    </div>
                                    <span class="stepDesc"> Step 1<br /><small><?php echo $text_checkout_option; ?></small> </span>
                                </a>
                            </li>
                            <?php if ($shipping_required) { ?>
                            <li>
                                <a href="#shipping-method">
                                    <div class="stepNumber">
                                        2
                                    </div>
                                    <span class="stepDesc"> Step 2<br /><small><?php echo $text_checkout_shipping_method; ?></small> </span>
                                </a>
                            </li>
                            <?php } ?>
                            <li>
                                <a href="#payment-method">
                                    <div class="stepNumber">
                                        3
                                    </div>
                                    <span class="stepDesc"> Step 3<br /><small><?php echo $text_checkout_payment_method; ?></small> </span>
                                </a>
                            </li>
                            <li>
                                <a href="#confirm">
                                    <div class="stepNumber">
                                        4
                                    </div>
                                    <span class="stepDesc"> Step 4<br /><small><?php echo $text_checkout_confirm; ?></small> </span>
                                </a>
                            </li>
                        </ul>
                        <div class="progress progress-striped active progress-sm">
                            <div aria-valuemax="100" aria-valuemin="0" role="progressbar" class="progress-bar progress-bar-success step-bar">
                                <span class="sr-only"> 0% Complete (success)</span>
                            </div>
                        </div>


                        <div id="checkout">
                            <div class="checkout-heading StepTitle"><?php echo $text_checkout_option; ?></div>
                            <div class="checkout-content"></div>
                        </div>
                        <div id="payment-address">
                            <div class="checkout-heading StepTitle"><?php echo $text_checkout_option; ?></div>
                            <div class="checkout-content"></div>
                        </div>
                        <?php if ($shipping_required) { ?>
                        <div id="shipping-method">
                            <div class="checkout-heading"><?php echo $text_checkout_shipping_method; ?></div>
                            <div class="checkout-content"></div>
                        </div>
                        <?php } ?>
                        <div id="payment-method">
                            <div class="checkout-heading"><?php echo $text_checkout_payment_method; ?></div>
                            <div class="checkout-content"></div>
                        </div>
                        <div id="confirm">
                            <div class="checkout-heading"><?php echo $text_checkout_confirm; ?></div>
                            <div class="checkout-content"></div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-2 col-sm-offset-8">
                                <button class="btn btn-blue next-step btn-block" id="button-checkout">
                                    Continue<?php //echo $button_continue; ?> <i class="fa fa-arrow-circle-right"></i>
                                </button>
                            </div>
                        </div>

                    </div>
            </div>

            </form>



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

<?php if ($logged) { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/address',
        dataType: 'html',

        success: function(html) {
            //$('.warning, .error').remove();

            $('#checkout .checkout-content').html(html);
            $('#checkout').attr('style', 'display:block');
            $('#button-checkout').attr('step', '2');
            animateBar();
            //$('#checkout .checkout-content').slideUp('slow');

            //$('#payment-address .checkout-content').slideDown('slow');

            //$('.checkout-heading a').remove();

            //$('#checkout .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

<?php } else if ($shipping_required) { ?>
    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            alert(html);
            $('#shipping-method .checkout-content').html(html);
            $('#shipping-method').attr('style', 'display:block');

            //$('#shipping-method .checkout-content').slideDown('slow');

            //$('#shipping-method .checkout-heading a').remove();
            //$('#payment-method .checkout-heading a').remove();

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
<?php }  else  { ?>
    $.ajax({
        url: 'index.php?route=checkout/shipping_method',
        dataType: 'html',
        success: function(html) {
            $('#shipping-method .checkout-content').html(html);

            $('#shipping-method .checkout-content').slideDown('slow');

            $('#shipping-method .checkout-heading a').remove();
            $('#payment-method .checkout-heading a').remove();

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

// Checkout
$('#button-checkout').on('click', function() {
    var step =  $('#button-checkout').attr('step');
    animateBar(step);
    alert('sdfasdrf');
	/*$.ajax({
		url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').attr('value'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-account').attr('disabled', true);
			$('#button-account').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-account').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(html) {
			$('.warning, .error').remove();

			$('#payment-address .checkout-content').html(html);

			$('#checkout .checkout-content').slideUp('slow');

			$('#payment-address .checkout-content').slideDown('slow');

			$('.checkout-heading a').remove();

			$('#checkout .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});*/
});

});
/*
// Guest
$('#button-guest').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest').attr('disabled', true);
			$('#button-guest').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-guest').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<button data-dismiss="alert" class="close">×</button></div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}

				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
				}

				if (json['error']['email']) {
					$('#payment-address input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
				}	

				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\'] + br').after('<span class="error">' + json['error']['company_id'] + '</span>');
				}

				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\'] + br').after('<span class="error">' + json['error']['tax_id'] + '</span>');
				}

				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
			} else {
				<?php if ($shipping_required) { ?>	
				var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
				
				if (shipping_address) {
					$.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
							$('#shipping-method .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-method .checkout-content').slideDown('slow');
							
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();		
															
							$('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
							$('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');									
							
							$.ajax({
								url: 'index.php?route=checkout/guest_shipping',
								dataType: 'html',
								success: function(html) {
									$('#shipping-address .checkout-content').html(html);
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});					
				} else {
					$.ajax({
						url: 'index.php?route=checkout/guest_shipping',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-address .checkout-content').slideDown('slow');
							
							$('#payment-address .checkout-heading a').remove();
							$('#shipping-address .checkout-heading a').remove();
							$('#shipping-method .checkout-heading a').remove();
							$('#payment-method .checkout-heading a').remove();
							
							$('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
				<?php } else { ?>				
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#payment-address .checkout-content').slideUp('slow');
							
						$('#payment-method .checkout-content').slideDown('slow');
							
						$('#payment-address .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
														
						$('#payment-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
				<?php } ?>
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest Shipping
$('#button-guest-shipping').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest_shipping/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest-shipping').attr('disabled', true);
			$('#button-guest-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-guest-shipping').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-address .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<button data-dismiss="alert" class="close">×</button></div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').after('<span class="error">' + json['error']['lastname'] + '</span>');
				}	
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').after('<span class="error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').after('<span class="error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						
						$('#shipping-address .checkout-content').slideUp('slow');
						
						$('#shipping-method .checkout-content').slideDown('slow');
						
						$('#shipping-address .checkout-heading a').remove();
						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
							
						$('#shipping-address .checkout-heading').append('<a><?php echo $text_modify; ?></a>');
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
});

$('#button-shipping-method').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
			$('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<button data-dismiss="alert" class="close">×</button></div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');

						$('#shipping-method .checkout-heading a').remove();
						$('#payment-method .checkout-heading a').remove();
						
						$('#shipping-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	

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
});

$('#button-payment-method').live('click', function() {

	$.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {

			$('#button-payment-method').attr('disabled', true);
			$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {

			$('#button-payment-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();

			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="warning" style="display: none;">' + json['error']['warning'] + '<button data-dismiss="alert" class="close">×</button></div>');

					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {

						$('#confirm .checkout-content').html(html);
						
						$('#payment-method .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						
						$('#payment-method .checkout-heading a').remove();
						
						$('#payment-method .checkout-heading').append('<a><?php echo $text_modify; ?></a>');	
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
});
*/
//--></script>
<script>
    jQuery(document).ready(function() {
        Main.init();
        //FormWizard.init();

        /*$('#wizard').smartWizard({
            onLeaveStep:leaveAStepCallback,
            onFinish:onFinishCallback
        });

        function leaveAStepCallback(obj, context){
            alert("Leaving step " + context.fromStep + " to go to step " + context.toStep);
            return validateSteps(context.fromStep); // return false to stay on step and true to continue navigation
        }

        function onFinishCallback(objs, context){
            if(validateAllSteps()){
                $('form').submit();
            }
        }

        // Your Step validation logic
        function validateSteps(stepnumber){
            var isStepValid = true;
            // validate step 1
            if(stepnumber == 1){
                // Your step validation logic
                // set isStepValid = false if has errors
                alert('dfsdgt');
            }
            // ...
        }
        function validateAllSteps(){
            var isStepValid = true;
            // all step validation logic
            return isStepValid;
        }*/

    });
</script>
<?php echo $footer; ?>
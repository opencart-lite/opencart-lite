<script type="text/javascript"><!--
$('#button').html('<button class="btn btn-blue next-step btn-block" id="button-confirm"><?php echo $button_confirm; ?> <i class="fa fa-arrow-circle-right"></i></button>');
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/free_checkout/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script> 

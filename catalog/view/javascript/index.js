var Index = function () {

    // function to initiate Revolution Slider
   /*var runRevolution = function () {
        var api;
        api = jQuery('.fullwidthabnner').revolution({
            delay: 9000,
            startheight: 450,
           	startwidth:1120,
            hideThumbs: 10,
            thumbWidth: 100, // Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
            thumbHeight: 50,
            thumbAmount: 5,
            videoJsPath:"assets/plugins/revolution_slider/rs-plugin/videojs",
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
    };*/
    // function to initiate Full Calendar
    var runColorbox = function () {
        $(".group1").colorbox({
            rel: 'group1',
            width:"85%"
        });
    };
    return {
        init: function () {
            //runRevolution();
            runColorbox();
        }
    };
}();

$(document).ready(function() {
    /* Search */
    /*$('.button-search').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var filter_name = $('input[name=\'filter_name\']').attr('value');

        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }

        location = url;
    });

    $('#header input[name=\'filter_name\']').bind('keydown', function(e) {
        if (e.keyCode == 13) {
            url = $('base').attr('href') + 'index.php?route=product/search';

            var filter_name = $('input[name=\'filter_name\']').attr('value');

            if (filter_name) {
                url += '&filter_name=' + encodeURIComponent(filter_name);
            }

            location = url;
        }
    });
*/
    /* Ajax Cart */
    /*$('#cart > .heading a').live('click', function() {
        $('#cart').addClass('active');

        $('#cart').load('index.php?route=module/cart #cart > *');

        $('#cart').live('mouseleave', function() {
            $(this).removeClass('active');
        });
    });*/

    /* Mega Menu */
    /*$('#menu ul > li > a + div').each(function(index, element) {
        // IE6 & IE7 Fixes
        if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
            var category = $(element).find('a');
            var columns = $(element).find('ul').length;

            $(element).css('width', (columns * 143) + 'px');
            $(element).find('ul').css('float', 'left');
        }

        var menu = $('#menu').offset();
        var dropdown = $(this).parent().offset();

        i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

        if (i > 0) {
            $(this).css('margin-left', '-' + (i + 5) + 'px');
        }
    });
*/
    /*$('.success img, .warning img, .attention img, .information img').live('click', function() {
        $(this).parent().fadeOut('slow', function() {
            $(this).remove();
        });
    });*/
});

function getURLVar(urlVarName) {
    var urlHalves = String(document.location).toLowerCase().split('?');
    var urlVarValue = '';

    if (urlHalves[1]) {
        var urlVars = urlHalves[1].split('&');

        for (var i = 0; i <= (urlVars.length); i++) {
            if (urlVars[i]) {
                var urlVarPair = urlVars[i].split('=');

                if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
                    urlVarValue = urlVarPair[1];
                }
            }
        }
    }

    return urlVarValue;
}

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                $('.success').fadeIn('slow');

                $('#cart-total').html(json['total']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        }
    });
}
function addToWishList(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                $('.success').fadeIn('slow');

                $('#wishlist-total').html(json['total']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        }
    });
}

function addToCompare(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                $('.success').fadeIn('slow');

                $('#compare-total').html(json['total']);

                $('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        }
    });
}
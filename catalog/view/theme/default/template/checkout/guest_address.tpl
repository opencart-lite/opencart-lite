<fieldset id="address">
    <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="firstname" placeholder="<?php echo $entry_firstname; ?>" value="<?php echo $firstname; ?>" required />
                         <i class="fa fa-user"></i> </span>
    </div>
    <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="lastname" placeholder="<?php echo $entry_lastname; ?>" value="<?php echo $lastname; ?>" required />
                         <i class="fa fa-users"></i> </span>
    </div>
    <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="telephone" placeholder="<?php echo $entry_telephone; ?>" value="<?php echo $telephone; ?>" required />
                         <i class="fa fa-phone"></i> </span>
    </div>
    <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="city" placeholder="<?php echo $entry_city ?>" value="<?php echo $city; ?>" required />
                     <i class="fa fa-building-o"></i> </span>
    </div>
    <div class="form-group">
                     <span class="input-icon">
                    <input type="text" class="form-control" name="address" placeholder="<?php echo $entry_address; ?>" value="<?php echo $address; ?>" required />
                    <i class="fa fa-map-marker"></i> </span>
    </div>
    <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" required />
                        <i class="fa fa-paperclip"></i> </span>
    </div>
    <div class="form-group">
        <label for="country_id"><?php echo $entry_country; ?></label>
        <div class="input-group">
            <span class="input-group-addon"> <i class="fa  fa-flag"></i> </span>
            <select class="form-control" class="col-md-6" id="e1" name="country_id">
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="zone_id"><?php echo $entry_zone; ?></label>
        <div class="input-group">
            <span class="input-group-addon"> <i class="fa  fa-flag-checkered"></i> </span>
            <select class="form-control" id="e2" name="zone_id">
            </select>
        </div>
    </div>
    <div class="buttons">
        <div class="right">
            <input type="button" value="<?php echo $button_continue; ?>" id="button-address" class="button" />
        </div>
    </div>
</fieldset>
<br />
<br />
<script type="text/javascript"><!--
            $('#address select[name=\'country_id\']').bind('change', function() {
                $.ajax({
                    url: 'index.php?route=checkout/address/country&country_id=' + this.value,
                    dataType: 'json',
                    beforeSend: function() {
                        $('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                    },
                    complete: function() {
                        $('.wait').remove();
                    },
                    success: function(json) {
                        if (json['postcode_required'] == '1') {
                            $('#payment-postcode-required').show();
                        } else {
                            $('#payment-postcode-required').hide();
                        }

                        html = '<option value=""><?php echo $text_select; ?></option>';

                        if (json['zone'] != '') {

                            for (i = 0; i < json['zone'].length; i++) {
                                html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                                if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                                    html += ' selected="selected"';
                                }

                                html += '>' + json['zone'][i]['name'] + '</option>';
                            }
                        } else {
                            html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                        }

                        $('#address select[name=\'zone_id\']').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });

    $('#address select[name=\'country_id\']').trigger('change');
//--></script>
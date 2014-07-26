<?php echo $head; ?>
<div class="main-login col-sm-4 col-sm-offset-4">
    <div class="logo"><?php echo $heading_title; ?></div>
    <!-- start: REGISTER BOX -->
    <div class="box-register">
        <h3><?php echo $text_register; ?></h3>
        <p><?php echo $text_account_already; ?></p>
        <h4>
           <?php echo $text_your_details; ?>
        </h4>
        <form class="form-register" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <?php if ($error_warning) { ?>
            <div class="errorHandler alert alert-danger">
                <i class="fa fa-remove-sign"></i> <?php echo $error_warning; ?>
            </div>
            <?php } ?>
            <fieldset>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="firstname" placeholder="<?php echo $entry_firstname; ?>" value="<?php echo $firstname; ?>" required />
                         <i class="fa fa-user"></i> </span>
                    <?php if ($error_firstname) { ?>
                    <span class="error"><?php echo $error_firstname; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="lastname" placeholder="<?php echo $entry_lastname; ?>" value="<?php echo $lastname; ?>" required />
                         <i class="fa fa-users"></i> </span>
                    <?php if ($error_lastname) { ?>
                    <span class="error"><?php echo $error_lastname; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="telephone" placeholder="<?php echo $entry_telephone; ?>" value="<?php echo $telephone; ?>" required />
                         <i class="fa fa-phone"></i> </span>

                    <?php if ($error_telephone) { ?>
                    <span class="error"><?php echo $error_telephone; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="fax" placeholder="<?php echo $entry_fax; ?>" value="<?php echo $fax; ?>" />
                         <i class="fa fa-print"></i> </span>
                </div>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="city" placeholder="<?php echo $entry_city ?>" value="<?php echo $city; ?>" required />
                     <i class="fa fa-building-o"></i> </span>

                    <?php if ($error_city) { ?>
                    <span class="error"><?php echo $error_city; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
                     <span class="input-icon">
                    <input type="text" class="form-control" name="address" placeholder="<?php echo $entry_address; ?>" value="<?php echo $address; ?>" required />
                    <i class="fa fa-map-marker"></i> </span>

                    <?php if ($error_address) { ?>
                    <span class="error"><?php echo $error_address; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="text" class="form-control" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" required />
                        <i class="fa fa-paperclip"></i> </span>
                    <?php if ($error_postcode) { ?>
                    <span class="error"><?php echo $error_postcode; ?></span>
                    <?php } ?>
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
                <div class="form-group">
                    <label><?php echo $entry_newsletter; ?></label>
                    <div>
                        <?php if ($newsletter) { ?>
                        <label class="radio-inline">
                            <input type="radio" class="grey" name="newsletter" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                        </label>
                        <label class="radio-inline">
                            <input type="radio" class="grey" name="newsletter" value="0" />
                            <?php echo $text_no; ?>
                        </label>
                        <?php } else { ?>
                        <label class="radio-inline">
                            <input type="radio" class="grey" name="newsletter" value="1" />
                            <?php echo $text_yes; ?>
                        </label>
                        <label class="radio-inline">
                            <input type="radio" class="grey" name="newsletter" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                        </label>
                        <?php } ?>
                    </div>
                </div>
                <h4>
                    <?php echo $text_account_details; ?>
                </h4>
                <div class="form-group">
                    <span class="input-icon">
                    <input type="email" class="form-control" name="email" placeholder="<?php echo $entry_email; ?>" value="<?php echo $email; ?>" required />
                    <i class="fa fa-envelope"></i> </span>
                    <?php if ($error_email) { ?>
                    <span class="error"><?php echo $error_email; ?></span>
                    <?php } ?>
                </div>
                <div class="form-group">
							<span class="input-icon">
								<input type="password" class="form-control" id="password" name="password" placeholder="<?php echo $entry_password; ?>" value="<?php echo $password; ?>" required />
                                <?php if ($error_password) { ?>
                                <span class="error"><?php echo $error_password; ?></span>
                                <?php } ?></td>
                                <i class="fa fa-lock"></i> </span>
                </div>
                <div class="form-group">
							<span class="input-icon">
								<input type="password" class="form-control" name="confirm" placeholder="<?php echo $entry_confirm; ?>" value="<?php echo $confirm; ?>" required />
                                <?php if ($error_confirm) { ?>
                                <span class="error"><?php echo $error_confirm; ?></span>
                                <?php } ?></td>
                                <i class="fa fa-lock"></i> </span>
                </div>
                <?php if ($text_agree) { ?>
                <div class="form-group">
                    <div>
                        <label class="checkbox-inline">
                            <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" class="grey agree" id="agree" value="1" checked="checked" required />
                            <?php } else { ?>
                            <input type="checkbox" name="agree" class="grey agree" id="agree" value="1" required />
                            <?php } ?>
                        </label>
                        <span><?php echo $text_agree; ?></span>
                    </div>
                </div>
                <?php } ?>
                <div class="form-actions">
                    <button type="submit" class="btn btn-bricky pull-right">
                        <?php echo $button_continue; ?> <i class="fa fa-arrow-circle-right"></i>
                    </button>
                </div>
            </fieldset>
        </form>
    </div>
    <!-- end: REGISTER BOX -->
<script type="text/javascript"><!--
        $('select[name=\'country_id\']').bind('change', function() {
            $.ajax({
                url: 'index.php?route=account/register/country&country_id=' + this.value,
                dataType: 'json',
                beforeSend: function() {
                    $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                },
                complete: function() {
                    $('.wait').remove();
                },
                success: function(json) {
                    if (json['postcode_required'] == '1') {
                        $('#postcode-required').show();
                    } else {
                        $('#postcode-required').hide();
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

                    $('select[name=\'zone_id\']').html(html);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $('select[name=\'country_id\']').trigger('change');
//--></script>
<script type="text/javascript">
    jQuery(window).ready(function() {
        Index.init();
    });
</script>
<?php echo $foot; ?>
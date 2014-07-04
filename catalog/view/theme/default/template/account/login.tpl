<?php echo $head; ?>
<div class="main-login col-sm-4 col-sm-offset-4">
    <div class="logo"><?php echo $heading_title; ?>
    </div>
    <!-- start: LOGIN BOX -->
    <div class="box-login">
        <h3><?php echo $text_returning_customer; ?></h3>
        <p>
            <?php echo $text_i_am_returning_customer; ?>
        </p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <?php if ($error_warning) { ?>
            <div class="errorHandler alert alert-danger"><i class="fa fa-remove-sign"></i> <?php echo $error_warning; ?></div>
            <?php } ?>
            <fieldset>
                <div class="form-group">
							<span class="input-icon">
								<input type="email" class="form-control" name="email" placeholder="<?php echo $entry_email; ?>" required>
								<i class="fa fa-envelope"></i> </span>
                </div>
                <div class="form-group form-actions">
							<span class="input-icon">
								<input type="password" class="form-control password" name="password" placeholder="<?php echo $entry_password; ?>" required>
								<i class="fa fa-lock"></i>
								<a class="forgot" href="<?php echo $forgotten; ?>">
                                    <?php echo $text_forgotten; ?>
                                </a> </span>
                </div>
                <div class="form-actions">
                    <button id="login" type="submit" class="btn btn-bricky pull-right">
                        <?php echo $button_login; ?> <i class="fa fa-arrow-circle-right"></i>
                    </button>
                    <?php if ($redirect) { ?>
                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                </div>
                <div class="new-account">
                        <?php echo $text_register_account; ?>
                        <a href="<?php echo $register; ?>" class="register">
                        <?php echo $text_register; ?>
                    </a>
                </div>
            </fieldset>
        </form>
    </div>
    <!-- end: LOGIN BOX -->
<?php echo $foot; ?>
<?php echo $head; ?>
<div class="main-login col-sm-4 col-sm-offset-4">
    <div class="logo"><?php echo $heading_title; ?>
    </div>
    <!-- start: FORGOT BOX -->
    <div class="box-forgot">
        <h3><?php echo $text_forgotten; ?></h3>
        <p>
            <?php echo $text_email; ?>
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
                <div class="form-actions">
                    <a class="btn btn-light-grey go-back" href="<?php echo $back; ?>">
                        <i class="fa fa-circle-arrow-left"></i> <?php echo $button_back; ?>
                    </a>
                    <button type="submit" class="btn btn-bricky pull-right">
                        <?php echo $button_continue; ?> <i class="fa fa-arrow-circle-right"></i>
                    </button>
                </div>
            </fieldset>
        </form>
    </div>
    <!-- end: FORGOT BOX -->
    <?php echo $foot; ?>
<div class="center">
<table class="table table-condensed">
    <tr>
        <td class="right"><h3><?php echo $firstname; ?> <?php echo $lastname; ?></h3></td>
    </tr>

    <tr>
        <td class="right"><h3><?php echo $telephone; ?></h3></td>
    </tr>
    <tr>
        <td class="right">
            <h3><?php echo $address['country'] ?></h3> <h3><?php echo $address['zone'] ?></h3> <h3><?php echo $address['city'] ?></h3><br>
            <h3><?php echo $address['address']; ?></h3>
        </td>
    </tr>
    <tr>
        <td class="right"><h3><?php echo $address['postcode']; ?></h3></td>
    </tr>
    <div class="buttons">
        <div class="right">
            <input type="button" value="<?php echo $button_continue; ?>" id="button-address" class="button" />
        </div>
    </div>
</table>
</div>

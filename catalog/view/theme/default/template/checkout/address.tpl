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
            <input type="hidden" name="address_id" value="<?php echo $address_id; ?>">
        </td>
    </tr>
    <tr>
        <td class="right"><h3><?php echo $address['postcode']; ?></h3></td>
    </tr>
</table>
</div>

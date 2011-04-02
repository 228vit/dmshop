<?php use_helper('Date') ?>
<h3>Thanks for order!</h3>
<h4>Order details</h4>
<table class="coloredTable" border="1">
  <tr>
    <th>Order #</th>
    <td><?php echo $order->id ?></td>
  </tr>
  <tr>
    <th>Customer</th>
    <td><?php echo $order->company ?></td>
  </tr>
  <tr>
    <th>C.persone</th>
    <td><?php echo $order->contact ?></td>
  </tr>
  <tr>
    <th>Email</th>
    <td><?php echo $order->email ?></td>
  </tr>
  <tr>
    <th>Phone</th>
    <td><?php echo $order->phone ?></td>
  </tr>
  <tr>
    <th>Ship address</th>
    <td><?php echo $order->ship_address ?></td>
  </tr>
  <tr>
    <th>Ship date</th>
    <td><?php echo format_datetime($order->ship_date, 'f') ?></td>
  </tr>
  <tr>
    <th>Ship time</th>
    <td><?php echo $order->ship_time ?></td>
  </tr>
  <tr>
    <th>Note</th>
    <td><?php echo $order->note ?></td>
  </tr>
</table>
<h4>Products</h4>
<table class="coloredTable" border="1">
  <tr>
    <th>#</th>
    <th>Name</th>
    <th>Q-ty</th>
    <th>Price</th>
    <th>Subtotal</th>
  </tr>
  <?php $total = 0 ?>
  <?php foreach ($order->getOrderDetail() as $i => $od): ?>
  <tr>
    <th><?php echo $i+1 ?></th>
    <td><?php echo $od->getProduct()->name ?></td>
    <td align="center"><?php echo $od->quantity ?></td>
    <td><?php echo round($od->price, 2) ?></td>
    <td><?php echo $od->quantity * $od->price ?></td>
    <?php $total += (float)($od->quantity * $od->price) ?>
  </tr>
  <?php endforeach; ?>
  <tr>
    <td colspan="5" align="right">
      Total: <?php echo $total ?>
    </td>
  </tr>
</table>
  
<p><?php echo _link('@homepage')->text('&laquo; back to main page'); ?></p>

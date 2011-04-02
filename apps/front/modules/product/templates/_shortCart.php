<?php if ($shopping_cart->isEmpty()): ?>

  Your cart is empty

<?php else: ?>
  <?php echo _link('main/showCart')->text('In your cart ')->currentSpan(false) ?> <br>
  items: <?php echo $shopping_cart->getNbItems() ?> <br>
  total: <?php echo _tag('span', $shopping_cart->getTotal())  ?> 

<?php endif; ?>
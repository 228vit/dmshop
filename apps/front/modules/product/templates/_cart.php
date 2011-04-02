<?php if ($shopping_cart->isEmpty()): ?>

  <h3>Your cart is empty.</h3>

<?php else: ?>
<form action="<?php echo _link('+/product/recalc_cart')->getHref() ?>" method="post">
<table>
  <tr>
    <th>Name</th>
    <th>Price</th>
    <th>Q-ty</th>
    <th>Subtotal</th>
  </tr>
  <?php foreach ($items as $i => $item): ?>
  <tr>
    <td><?php echo $item->getName() ?></td>
    <td><?php echo $item->getPrice() ?></td>
    <td>
      <input type="text" size="4" name="quantity_<?php echo $item->getId() ?>" value="<?php echo $item->getQuantity() ?>" />
    </td>
    <td>
        <?php echo round($item->getPrice()*$item->getQuantity(), 2). ' руб.' ?>
        <?php if ($item->getDiscount()): ?>
          (- <?php echo $item->getDiscount() ?> %)
        <?php endif; ?>
    </td>
    <td>
      <?php echo _link('+/product/delete_from_cart?id='.$item->getId())->text('delete') ?>
    </td>
  </tr>
  <?php endforeach; ?>
  <tr>
  <div class="itogo"><div class="itogo2">Итого: <?php echo $shopping_cart->getTotal(). 'руб.'  ?></div></div><br />
  <div class="itogo" style="text-align: right;">
      <input type="submit" name="recalc" value="recalculate" />
      <input type="submit" name="order" value="process to order" />
  </div>
</tr>
</table><!-- cart -->
</form>
<?php endif; ?>

<script>
(function($)
{
    $('.clear_cart, .delete_from_cart').click(function (){
      if (confirm('are you sure?'))
      {
        document.location.href($(this).attr('href'));
      } else {
        return false;
      }
    })

})(jQuery);
</script>
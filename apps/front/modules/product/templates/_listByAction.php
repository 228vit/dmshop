<div class="catalog">
<?php if (count($productPager) != 0): ?>
  <?php  foreach ($productPager as $product): ?>
    <div class="product">
      <?php
        echo _tag('div.title', _link($product));
        echo _tag('div.picture',_link($product)->text(_media($product->Photo)->size(80, 80)));
        echo _tag('div.description', $product->description);
        echo _tag('div.price', 'old price: '._tag('strike', round($product->price)));
        echo _tag('div.price', 'new price: '._tag('span.new_price', round($product->price_action)));
        echo _link('+/product/add_to_cart?id='.$product->id)->text('add to cart') ;
      ?>
    </div>

  <?php endforeach; ?>

  <?php
  $productPager
    ->setOption('first', false)  //__('First page') use a translated text for first button
    ->setOption('prev', '← previous') // use an image for prev button
    ->setOption('next', 'next →')     // use HTML for next button
    ->setOption('last', false);             // disable last button

  echo $productPager->renderNavigationBottom(array());
  ?>
<?php else : // if pager ?>

  <?php echo _tag('h2', 'No action products right now') ?>

<?php endif; ?>
</div>
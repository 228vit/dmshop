<?php // Vars: $product

echo _open('div.one_good');

    echo _link(_media($product->Photo)->getSrc())
            ->set('.og_photo.zoomPic')
            ->text(
              _media($product->Photo)->size('220') .
              _media('/i/lupe.png')->alt('увеличить')->set('.lupe')
            );
    echo _open('div.og_text');
      echo _tag('h3', $product->name);
      echo _tag('p', $product->body);
      echo _open('div.price');
        if ($product->hide_price)
        {
        } else {
          echo _link('+/product/add_to_cart?id='.$product->id)
                    ->set('.add_to_cart')->text('Добавить в корзину') .
                round($product->price).' руб.' ;
        }
      echo _close('div');
      /*echo _tag('div.price',
                  _link('+/product/add_to_cart?id='.$product->id)
                  ->set('.add_to_cart')->text('Добавить в корзину') .
                ($product->hide_price ? 'цена договорная' : round($product->price).' руб.') );
                */
    echo _close('div'); // og_text

echo _close('div'); // one_good

?>
<script>
$(document).ready(function() {

	/* This is basic - uses default settings */

	$("a.zoomPic").fancybox();
})
</script>
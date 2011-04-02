<?php // Vars: $productPager

echo $productPager->renderNavigationTop();

echo _open('div.catalog');

foreach ($productPager as $product)
{
  if ($product->is_in_action)
  {
    echo _open('div.product');
  
        echo _tag('div.title', _link($product));
        echo _tag('div.picture',_link($product)->text(_media($product->Photo)->size(80, 80)));
        echo _tag('div.description', $product->description);
        echo _tag('div.price', 'old price: '._tag('strike', round($product->price)));
        echo _tag('div.price', 'new price: '._tag('span.new_price', round($product->price_action)));
        echo _link('+/product/add_to_cart?id='.$product->id)->text('add to cart') ;
    
  } 
  else
  {
    echo _open('div.product');
  
        echo _tag('div.title', _link($product));
        echo _tag('div.picture',_link($product)->text(_media($product->Photo)->size(80, 80)));
        echo _tag('div.description', $product->description);
        echo _tag('div.price', 'price: '._tag('span.new_price', round($product->price_action)));
        echo _link('+/product/add_to_cart?id='.$product->id)->text('add to cart') ;

  }

  echo _close('div'); // cat_good
}

echo _close('div'); // catalog

echo $productPager->renderNavigationBottom();
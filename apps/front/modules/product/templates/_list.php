<?php // Vars: $productPager

//echo $productPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($productPager as $product)
{
  echo _open('li.element');

    echo _link($product);

  echo _close('li');
}

echo _close('ul');

$productPager
  ->setOption('first', false)  //__('First page') use a translated text for first button
  ->setOption('prev', '← предыдущая') // use an image for prev button
  ->setOption('next', 'следующая →')     // use HTML for next button
  ->setOption('last', false);             // disable last button

echo $productPager->renderNavigationBottom(array());
?>
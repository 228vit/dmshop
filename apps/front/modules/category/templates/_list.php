<?php // Vars: $categoryPager

echo $categoryPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($categoryPager as $category)
{
  echo _open('li.element');

    echo _link($category);

  echo _close('li');
}

echo _close('ul');

echo $categoryPager->renderNavigationBottom();
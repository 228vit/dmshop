<?php // Vars: $order
if (!$order)
{
  echo _tag('p', 'Неверный параметр');
  echo _tag('p', _link('@homepage')->text('&laquo; вернуться на главную'));
}
else
{
  echo _table();
  echo _open('ul');
  echo _close('ul');
}

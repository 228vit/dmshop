<h3>Apply an order</h3>
<?php
// Vars: $form
echo $form->open('.order_form');

echo _tag('ul.order_form',


  _tag('li.clearfix', $form['company']->label()->field()->error()).

  _tag('li.clearfix', $form['contact']->label()->field()->error()) .

  _tag('li.clearfix', $form['phone']->label()->field()->error()) .

  _tag('li.clearfix', $form['email']->label()->field()->error()) .

  _tag('li.clearfix', $form['ship_address']->label()->field()->error()) .
          
  _tag('li.clearfix', $form['ship_date']->label()->field()->error()) .

  _tag('li.clearfix', $form['ship_time']->label()->field()->error()) .

  _tag('li.clearfix', $form['note']->label()->field()->error()) //.

  //_tag('li', $form['']->label()->field()->error())

);

echo $form->renderHiddenFields();

echo $form->submit('process');

echo $form->close();
//echo $form;
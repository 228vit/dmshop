<h4>Вас приветствует <?php echo $companyName ?>!</h4>


<h5>Детали заказа</h5>

<table>
  <tr>
    <th>№ заказа</th>
    <td><?php echo $order->id ?></td>
  </tr>
  <tr>
    <th>Компания</th>
    <td><?php echo $order->company ?></td>
  </tr>
  <tr>
    <th>Конт.лицо</th>
    <td><?php echo $order->contact ?></td>
  </tr>
  <tr>
    <th>Email</th>
    <td><?php echo $order->email ?></td>
  </tr>
  <tr>
    <th>Телефон</th>
    <td><?php echo $order->phone ?></td>
  </tr>
  <tr>
    <th>Адрес доставки</th>
    <td><?php echo $order->ship_address ?></td>
  </tr>
  <tr>
    <th>Время доставки</th>
    <td><?php echo $order->ship_time ?></td>
  </tr>
  <tr>
    <th>Примечание</th>
    <td><?php echo $order->note ?></td>
  </tr>
</table>

<style>
  th, td { border: 1px ridge gray; }
</style>

<h4>Товары</h4>
<table style="border: 1px ridge gray;">
  <tr>
    <th>№</th>
    <th>Название</th>
    <th>Кол-во</th>
    <th>Цена</th>
    <th>Итого</th>
  </tr>
  <?php $total = 0 ?>
  <?php foreach ($order->getOrderDetail() as $i => $od): ?>
  <tr>
    <th><?php echo $i+1 ?></th>
    <td><?php echo $od->getProduct()->name ?></td>
    <td align="center"><?php echo $od->quantity ?></td>
    <td><?php echo $od->price ?></td>
    <td><?php echo $od->quantity * $od->price ?></td>
    <?php $total += (float)($od->quantity * $od->price) ?>
  </tr>
  <?php endforeach; ?>
  <tr>
    <td colspan="5" align="right">
      всего к оплате: <?php echo $total ?>
    </td>
  </tr>
</table>

<?php //echo $siteUrl.'/show_cart/ordershow?uid='.$order->uid ?>

---

<p>С наилучшими пожеланиями, <b><?php echo $companyName ?></b>
<br />
<?php echo $siteUrl ?>
<br />
<?php echo $companyPhone ?>
</p>


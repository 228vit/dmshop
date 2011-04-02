<?php
/**
 * Order actions
 */
class orderActions extends myFrontModuleActions
{

  public function executeFormWidget(dmWebRequest $request)
  {
    $form = new OrderForm();
        
    if ($request->hasParameter($form->getName()) && $form->bindAndValid($request))
    {
      $order = $form->save();
      $order->setUid(md5(rand(1111,9999).time()));
      $order->save();
      // link order details
      $this->shopping_cart = $shopping_cart = $this->getUser()->getShoppingCart();
      $this->items = $shopping_cart->getItems();
      foreach ($shopping_cart->getItems() as $i => $item)
      {
        $od = new OrderDetail();
        $od->fromArray(array(
          'product_id'  => $item->getId(),
          'order_id'    => $order->id,
          'quantity'    => $item->getQuantity(),
          'price'       => $item->getPrice(),
        ));
        $od->save();
      }

      if (sfConfig::get('app_send_order', false))
      {
        dm::enableMailer();

        //send mail
        $message = $this->getMailer()->compose(
          $_from  = dmConfig::get('orderEmail'),
          $_to    = array($order->email, dmConfig::get('orderEmail')),
          $_subj  = '['.dmConfig::get('siteName').'] thanks for order'
        );

        $message->setBody($this->getPartial('order/mailOrder', array(
          'order'           => $order,
          'companyName'     => dmConfig::get('companyName'),
          'companyPhone'    => dmConfig::get('companyPhone'),
          'siteUrl'         => dmConfig::get('siteUrl'),
          'siteName'        => dmConfig::get('siteName'),
        )));
        $message->setContentType('text/html');

        $this->getMailer()->send($message);
      } // if send order
      
      // clear cart now
      $shopping_cart->clear();
      
      //redirect to order info
      $this->redirect($this->getHelper()->link('main/ordershow?uid='.$order->uid)->getHref());

      //$this->redirectBack();
    }
    
    $this->forms['Order'] = $form;
  }


}

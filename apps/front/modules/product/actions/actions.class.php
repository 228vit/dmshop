<?php
/**
 * Product actions
 */
class productActions extends myFrontModuleActions
{
  public function executeAdd_to_cart(dmWebRequest $request)
  {
    $this->forward404Unless(
      $product = dmDb::table('Product')->findOneById($request->getParameter('id'))
    );

    $item = new sfShoppingCartItem('Product', $this->getRequestParameter('id'));
    $item->setQuantity(1);
    $item->setPrice($product->getIsInAction() ? $product->getPriceAction() : $product->getPrice());
    $item->setName($product->getName());
    
    $shopping_cart = $this->getUser()->getShoppingCart();
    $shopping_cart->addItem($item);

    $this->redirectBack();

  }

  public function executeDelete_from_cart(dmWebRequest $request)
  {
    if ($this->hasRequestParameter('id'))
    {
      $shopping_cart = $this->getUser()->getShoppingCart();
      $shopping_cart->deleteItem('Product', $request->getParameter('id'));
    }

    $this->redirectBack();
  }

  public function executeRecalc_cart(dmWebRequest $request)
  {
    $shopping_cart = $this->getUser()->getShoppingCart();
    foreach ($shopping_cart->getItems() as $item)
    {
      if ($this->hasRequestParameter('quantity_'.$item->getId()))
      {
        $item->setQuantity($this->getRequestParameter('quantity_'.$item->getId()));
      }
    }
    if ($request->hasParameter('order'))
    {
      $this->redirect($this->getHelper()->link('main/order')->getHref());
    }
    $this->redirectBack();
  }

  public function executeClear_cart(dmWebRequest $request)
  {
    $shopping_cart = $this->getUser()->getShoppingCart();
    $shopping_cart->clear();

    $this->redirectBack();
  }

}

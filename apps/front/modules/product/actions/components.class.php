<?php
/**
 * Product components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 * 
 * 
 * 
 * 
 */
class productComponents extends myFrontModuleComponents
{

  public function executeList()
  {
    $query = $this->getListQuery();
    
    $this->productPager = $this->getPager($query);
  }

  public function executeShow()
  {
    $query = $this->getShowQuery();
    
    $this->product = $this->getRecord($query);
  }

  public function executeListByCategory()
  {
    $query = $this->getListQuery();
    $this->productPager = $this->getPager($query);
  }

  public function executeCart()
  {
    $this->shopping_cart = $shopping_cart = $this->getUser()->getShoppingCart();
    $this->items = $shopping_cart->getItems();
  }

  public function executeShortCart()
  {
    $this->shopping_cart = $shopping_cart = $this->getUser()->getShoppingCart();
  }

  public function executeViewCart()
  {
    $this->shopping_cart = $shopping_cart = $this->getUser()->getShoppingCart();
  }

  public function executeListByAction()
  {
    $query = $this->getListQuery('product')
            ->addWhere('product.is_in_action = ?', true);
    
    $this->productPager = $this->getPager($query);
  }


}

<?php
/**
 * Category components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class categoryComponents extends myFrontModuleComponents
{

  public function executeListOnMainPage(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->categoryPager = $this->getPager($query);
  }

  public function executeListOnSidebar(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->categoryPager = $this->getPager($query);
  }

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->categoryPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->category = $this->getRecord($query);
  }


}

<?php
/**
 * Order components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 * 
 */
class orderComponents extends myFrontModuleComponents
{

  public function executeForm()
  {
    $this->form = $this->forms['Order'];
  }

  public function executeShow(dmWebRequest $request)
  {
  }

  public function executeView(dmWebRequest $request)
  {
    // Your code here
    $query = $this->getShowQuery('Order o')
            ->addWhere('o.uid = ?', $request->getParameter('uid'));

    $this->order = $this->getRecord($query);
  }


}

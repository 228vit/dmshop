<?php

/**
 * DmMailTemplateTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class DmMailTemplateTable extends PluginDmMailTemplateTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object DmMailTemplateTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DmMailTemplate');
    }
}
<?php

/**
 * DmMediaTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class DmMediaTable extends PluginDmMediaTable
{
    /**
     * Returns an instance of this class.
     *
     * @return object DmMediaTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('DmMedia');
    }
}
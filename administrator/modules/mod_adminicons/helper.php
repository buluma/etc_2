<?php
/**
 * Helper class for Hello World! module
 * 
 * @package    Joomla.Tutorials
 * @subpackage Modules
 * @link http://docs.joomla.org/J3.x:Creating_a_simple_module/Developing_a_Basic_Module
 * @license        GNU/GPL, see LICENSE.php
 * mod_helloworld is free software. This version may have been modified pursuant
 * to the GNU General Public License, and as distributed it includes or
 * is derivative of works licensed under the GNU General Public License or
 * other free or open source software licenses.
 */
class ModAdminIconsHelper
{
    /**
     * Retrieves the hello message
     *
     * @param   array  $params An object containing the module parameters
     *
     * @access public
     */    
    public static function getHello($params)
    {
        return 'Most Recent visits!';
    }

    public static function getList()
    {
        // JPluginHelper::importPlugin('sampledata');
        // $dispatcher = JEventDispatcher::getInstance();
        // $data = $dispatcher->trigger('onSampledataGetOverview', array('test', 'foo'));

        // return $data;

        // var_dump($data);

        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('COUNT(*)');
        $query->from($db->quoteName('#__locations'));
        // $query->where($db->quoteName('name')." = ".$db->quote($value));

        // Reset the query using our newly populated query object.
        $db->setQuery($query);
        $count = $db->loadResult();

        return $count;

        // var_dump($count);
    }

    public static function getImages()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('COUNT(*)');
        $query->from($db->quoteName('#__photos'));
        // $query->where($db->quoteName('name')." = ".$db->quote($value));

        // Reset the query using our newly populated query object.
        $db->setQuery($query);
        $count = $db->loadResult();

        return $count;
    }

    public static function getIssues()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('COUNT(*)');
        $query->from($db->quoteName('#__quality_issues'));
        // $query->where($db->quoteName('name')." = ".$db->quote($value));

        // Reset the query using our newly populated query object.
        $db->setQuery($query);
        $count = $db->loadResult();

        return $count;
    }

    public static function getOutlets()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('COUNT(*)');
        $query->from($db->quoteName('#__outlets'));
        // $query->where($db->quoteName('name')." = ".$db->quote($value));

        // Reset the query using our newly populated query object.
        $db->setQuery($query);
        $count = $db->loadResult();

        return $count;
    }

    public static function getTasks()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('COUNT(*)');
        $query->from($db->quoteName('#__tasks'));
        // $query->where($db->quoteName('name')." = ".$db->quote($value));

        // Reset the query using our newly populated query object.
        $db->setQuery($query);
        $count = $db->loadResult();

        return $count;
    }
}
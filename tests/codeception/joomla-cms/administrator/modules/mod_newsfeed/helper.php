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
class ModNewsFeedHelper
{
    /**
     * Retrieves the hello message
     *
     * @param   array  $params An object containing the module parameters
     *
     * @access public
     */    

    public static function getImages()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('id, imagepath, submitter');
        $query->from($db->quoteName('#__photos'));
        // $query->where($db->quoteName('id')." = ".$db->quote($some_value));

        $db->setQuery($query);
        $result = $db->loadObjectList();

        // echo '<pre>';
        // var_dump($result);
        // print_r($result);
        // echo '<pre/>';

        return $result;
    }

    public static function getVisits()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('*');
        $query->from($db->quoteName('#__locations'));
        // $query->where($db->quoteName('id')." = ".$db->quote($some_value));
        $query->setLimit('4');

        // Join over the user field 'user_id'
        $query->select('`user_id`.name AS `user_id`');
        $query->join('LEFT', '#__users AS `user_id` ON `user_id`.id = `user_id`');

        // Join over the outlet field 'user_id'
        $query->select('`outlets`.shop_name AS `storename`');
        $query->join('LEFT', '#__outlets AS `outlets` ON `outlets`.id = `store_id`');

        $db->setQuery($query);
        $result = $db->loadObjectList();

        // echo '<pre>';
        // var_dump($result);
        // print_r($result);
        // echo '<pre/>';

        return $result;
    }

    //format time
    function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
    }
}
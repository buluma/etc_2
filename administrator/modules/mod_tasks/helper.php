<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  mod_logged
 *
 * @copyright   Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Helper for mod_logged
 *
 * @since  1.5
 */
abstract class ModTasksHelper
{
    /**
     * Get a list of logged users.
     *
     * @param   \Joomla\Registry\Registry  &$params  The module parameters.
     *
     * @return  mixed  An array of users, or false on error.
     *
     * @throws  RuntimeException
     */
    public static function getList(&$params)
    {
        $db    = JFactory::getDbo();
        $user  = JFactory::getUser();
        // $query = $db->getQuery(true)
        //     ->select('s.time, s.client_id, u.id, u.name, u.username')
        //     ->from('#__session AS s')
        //     ->join('LEFT', '#__users AS u ON s.userid = u.id')
        //     ->where('s.guest = 0');

        $query = $db->getQuery(true)
            ->select('s.id as taskid, s.task, s.created, s.deadline, s.priority, s.user, s.status, u.id, u.name, u.username')
            ->from('#__tasks AS s')
            ->join('LEFT', '#__users AS u ON s.user = u.id');
            // ->where('s.guest = 0');
            // var_dump($query);

        $db->setQuery($query, 0, $params->get('count', 5));

        try
        {
            $results = $db->loadObjectList();
            // echo '<pre>';
            // var_dump($results);
            // echo '<pre/>';
        }
        catch (RuntimeException $e)
        {
            throw $e;
        }

        foreach ($results as $k => $result)
        {
            $results[$k]->logoutLink = '';

            if ($user->authorise('core.manage', 'com_tasks'))
            {
                $results[$k]->editLink   = JRoute::_('index.php?option=com_tasks&view=task&layout=edit&id=' . $result->taskid);
            }

            if ($params->get('name', 1) == 0)
            {
                $results[$k]->name = $results[$k]->username;
            }
        }

        return $results;
    }

    /**
     * Get the alternate title for the module
     *
     * @param   \Joomla\Registry\Registry  $params  The module parameters.
     *
     * @return  string    The alternate title for the module.
     */
    public static function getTitle($params)
    {
        return JText::plural('MOD_LOGGED_TITLE', $params->get('count'));
    }
}

<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  mod_logged
 *
 * @copyright   Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependencies.
JLoader::register('ModTasksHelper', __DIR__ . '/helper.php');

// $users = ModTasksHelper::getList($params);
$tasks = ModTasksHelper::getList($params);

if ($params->get('automatic_title', 0))
{
	$module->title = ModTasksHelper::getTitle($params);
}

require JModuleHelper::getLayoutPath('mod_tasks', $params->get('layout', 'default'));

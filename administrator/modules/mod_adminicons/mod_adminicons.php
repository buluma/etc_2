<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  mod_sampledata
 *
 * @copyright   Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependencies.
JLoader::register('ModAdminIconsHelper', __DIR__ . '/helper.php');

$document = JFactory::getDocument();
$csspath = JURI::base().'modules/'.$module->module;
// var_dump($csspath);
$document->addStyleSheet($csspath. '/assets/css/font-awesome.min.css');

$visits = ModAdminIconsHelper::getList();
$photos = ModAdminIconsHelper::getImages();
$issues = ModAdminIconsHelper::getIssues();
$outlets = ModAdminIconsHelper::getOutlets();
$tasks = ModAdminIconsHelper::getTasks();
// var_dump($photos);
require JModuleHelper::getLayoutPath('mod_adminicons', $params->get('layout', 'default'));
?>

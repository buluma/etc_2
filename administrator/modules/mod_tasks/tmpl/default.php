<?php
/**
 * @package     Joomla.Administrator
 * @subpackage  mod_logged
 *
 * @copyright   Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('bootstrap.tooltip');
?>
<div class="row-striped">
  <div class="row-fluid">
      <div class="span6">
        <strong>Task</strong>
      </div>
      <div class="span3">
        <strong>Deadline</strong>
      </div>
      <div class="span3">
        <strong>Priority</strong>
      </div>
    </div>
  <?php
  // var_dump($tasks);
   foreach ($tasks as $user) : ?>
    <div class="row-fluid">
      <div class="span6">
        <span class="row-title">
          <?php if (isset($user->editLink)) : ?>
            <a href="<?php echo $user->editLink; ?>" class="hasTooltip" title="<?php echo JHtml::_('tooltipText', 'JGRID_HEADING_ID'); ?> : <?php echo $user->taskid; ?>">
              <?php echo $user->task; ?></a>
          <?php else : ?>
            <?php echo $user->task; ?>
          <?php endif; ?>
        </span>

        <small class="small hasTooltip" title="<?php echo JHtml::_('tooltipText', 'User'); ?>">
          <?php if ($user->name === null) : ?>
            <?php // Don't display a client ?>
          <?php elseif ($user->name) : ?>
            <?php echo $user->name ;//JText::_('JADMINISTRATION'); ?>
          <?php else : ?>
            <?php echo JText::_('JSITE'); ?>
          <?php endif; ?>
        </small>
      </div>

      <div class="span3">
        <div class="small pull-left hasTooltip" title="<?php echo JHtml::_('tooltipText', 'Created on'); ?>">
          <span class="icon-calendar" aria-hidden="true"></span> <?php echo JHtml::_('date', $user->created, JText::_('DATE_FORMAT_LC5')); ?>
        </div>
      </div>
      <div class="span3">
        <div class="small pull-left hasTooltip" title="<?php echo JHtml::_('tooltipText', 'MOD_LOGGED_LAST_ACTIVITY'); ?>">
          <span class="icon-calendar" aria-hidden="true"></span> 
          <?php 

            if ($user->priority == 1) {
              echo 'Low';
            } elseif ($user->priority == 2) {
              echo 'Medium';
            } elseif ($user->priority == 3) {
              echo 'High';
            }
            
          //echo JHtml::_('date', $user->deadline, JText::_('DATE_FORMAT_LC5')); ?>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>

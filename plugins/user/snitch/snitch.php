<?php 
defined('_JEXEC') or die( 'Restricted access' );
jimport('joomla.plugin.plugin');
class plgUserSnitch extends JPlugin{
	function plgUserSnitch( &$subject, $config ){
		parent::__construct( $subject, $config );
	}

   function onLoginUser($user, $options)
   {
	$mailer =& JFactory::getMailer();
	$config =& JFactory::getConfig();
	$sender = array( 
	   	$config->getValue( 'config.mailfrom' ),
   		$config->getValue( 'config.fromname' ) );
	$mailer->setSender( $sender );
	$user =& JFactory::getUser();
	$recipient = $user->email;
//	$sendto = array( 'mail@domain.com', 'other@mail.net' );
	$sendto = $this->params->get('sendto','');
	if(!$sendto) $sendto = $config->getValue( 'config.mailfrom' );
	$mailer->addRecipient($sendto);
	$date = getdate();
	$date = $date['weekday'] . " " . $date['mday'] . "/". $date['year'] . " at " . $date['hours'] .":". $date['minutes'] .":". $date['seconds'];
	$body   = "Login Details: (username) " . $user->username . " / (name) ". $user->name . " / (user email) " . $user->email ." on: " . $date;
	$mailer->setSubject('Joomla! Logged In Users Report');
	$mailer->setBody($body);
	$send =& $mailer->Send();
//	if ( $send !== true ) {	} else { }
	return true;
   }
}
?>
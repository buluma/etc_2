<?php
	public function extrahello()
	{

		// Get the input
		$input = JFactory::getApplication()->input;
		$pks = $input->post->get('cid', array(), 'array');

		// Sanitize the input
		JArrayHelper::toInteger($pks);

		// Get the model
		$model = $this->getModel();

		$return = $model->extrahello($pks);

		// Redirect to the list screen.
		$this->setRedirect(JRoute::_('index.php?option=com_location_visits&view=maps', false));

	}
?>
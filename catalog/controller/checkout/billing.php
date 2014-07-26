<?php  namespace Controller\Checkout;

use Engine\Controller;
use Engine\iController;

class Billing implements iController {
    use Controller;

	public function index() {

        $this->load->model('account/address');

        $this->data['address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
        $this->data['firstname'] = $this->customer->getFirstName();
        $this->data['lastname'] = $this->customer->getLastName();
        $this->data['telephone'] = $this->customer->getTelephone();

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        $this->data['button_continue'] = $this->language->get('button_continue');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/address.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/address.tpl';
		} else {
			$this->template = 'default/template/checkout/address.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
				
		$this->response->setOutput($this->render());
  	}
	
	public function country() {
		$json = array();
		
		$this->load->model('localisation/country');

    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>
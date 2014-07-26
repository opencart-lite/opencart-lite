<?php  namespace Controller\Checkout;

use Engine\Controller;
use Engine\iController;

class Guest_address implements iController {
    use Controller;

	public function index() {

        $this->language->load('checkout/checkout');

        $this->data['text_select'] = $this->language->get('text_select');
        $this->data['text_none'] = $this->language->get('text_none');

        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_address'] = $this->language->get('entry_address');
        $this->data['entry_postcode'] = $this->language->get('entry_postcode');
        $this->data['entry_city'] = $this->language->get('entry_city');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_zone'] = $this->language->get('entry_zone');

        if (isset($this->session->data['firstname'])) {
            $this->data['firstname'] = $this->session->data['firstname'];
        } else {
            $this->data['firstname'] = '';
        }

        if (isset($this->session->data['lastname'])) {
            $this->data['lastname'] = $this->session->data['lastname'];
        } else {
            $this->data['lastname'] = '';
        }

        if (isset($this->session->data['address'])) {
            $this->data['address'] = $this->session->data['address'];
        } else {
            $this->data['address'] = '';
        }

        if (isset($this->session->data['city'])) {
            $this->data['city'] = $this->session->data['city'];
        } else {
            $this->data['city'] = '';
        }

        if (isset($this->session->data['telephone'])) {
            $this->data['telephone'] = $this->session->data['telephone'];
        } else {
            $this->data['telephone'] = '';
        }

        if (isset($this->session->data['postcode'])) {
            $this->data['telephone'] = $this->session->data['postcode'];
        } else {
            $this->data['postcode'] = '';
        }

        if (isset($this->session->data['shipping_country_id'])) {
            $this->data['country_id'] = $this->session->data['shipping_country_id'];
        } else {
            $this->data['country_id'] = $this->config->get('config_country_id');
        }

        if (isset($this->session->data['shipping_zone_id'])) {
            $this->data['zone_id'] = $this->session->data['shipping_zone_id'];
        } else {
            $this->data['zone_id'] = '';
        }

        $this->load->model('localisation/country');

        $this->data['countries'] = $this->model_localisation_country->getCountries();

        $this->data['button_continue'] = $this->language->get('button_continue');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/guest_address.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/guest_address.tpl';
		} else {
			$this->template = 'default/template/checkout/guest_address.tpl';
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
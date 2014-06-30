<?php namespace Model\Sale;

use Engine\Model;

class Order {
    use Model;

	public function addOrder($data) {

		$store_name = $this->config->get('config_name');
		$store_url = HTTP_CATALOG;

		
		$this->load->model('setting/setting');
		
		$setting_info = $this->model_setting_setting->getSetting('setting');
			
		if (isset($setting_info['invoice_prefix'])) {
			$invoice_prefix = $setting_info['invoice_prefix'];
		} else {
			$invoice_prefix = $this->config->get('config_invoice_prefix');
		}
		
		$this->load->model('localisation/country');
		
		$this->load->model('localisation/zone');
		
		$country_info = $this->model_localisation_country->getCountry($data['country_id']);
		

		if ($country_info) {
			$country = $country_info['name'];
			$address_format = $country_info['address_format'];
		} else {
			$country = '';
			$address_format = '{company}' . "\n" . '{address}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
		}
	
		$zone_info = $this->model_localisation_zone->getZone($data['zone_id']);
		
		if ($zone_info) {
			$zone = $zone_info['name'];
		} else {
			$zone = '';
		}	

		$this->load->model('localisation/currency');

		$currency_info = $this->model_localisation_currency->getCurrencyByCode($this->config->get('config_currency'));
		
		if ($currency_info) {
			$currency_id = $currency_info['currency_id'];
			$currency_code = $currency_info['code'];
			$currency_value = $currency_info['value'];
		} else {
			$currency_id = 0;
			$currency_code = $this->config->get('config_currency');
			$currency_value = 1.00000;			
		}
      	
      	$this->db->query("INSERT INTO `" . DB_PREFIX . "order` SET invoice_prefix = " . $this->db->quote($invoice_prefix) . ", store_name = " . $this->db->quote($store_name) . ",store_url = " . $this->db->quote($store_url) . ", customer_id = '" . (int)$data['customer_id'] . "', customer_group_id = '" . (int)$data['customer_group_id'] . "', firstname = " . $this->db->quote($data['firstname']) . ", lastname = " . $this->db->quote($data['lastname']) . ", email = " . $this->db->quote($data['email']) . ", telephone = " . $this->db->quote($data['telephone']) . ", fax = " . $this->db->quote($data['fax']) . ", company = " . $this->db->quote($data['company']) . ", address = " . $this->db->quote($data['address']) . ", address_id = " . $this->db->quote($data['address_id']) . ", city = " . $this->db->quote($data['city']) . ", postcode = " . $this->db->quote($data['postcode']) . ", country = " . $this->db->quote($country) . ", country_id = '" . (int)$data['country_id'] . "', zone = " . $this->db->quote($zone) . ", zone_id = '" . (int)$data['zone_id'] . "', address_format = " . $this->db->quote($address_format) . ", payment_method = " . $this->db->quote($data['payment_method']) . ", payment_code = " . $this->db->quote($data['payment_code']) . ", shipping_method = " . $this->db->quote($data['shipping_method']) . ", shipping_code = " . $this->db->quote($data['shipping_code']) . ", comment = " . $this->db->quote($data['comment']) . ", order_status_id = '" . (int)$data['order_status_id'] . "', affiliate_id  = '" . (int)$data['affiliate_id'] . "', language_id = '" . (int)$this->config->get('config_language_id') . "', currency_id = '" . (int)$currency_id . "', currency_code = " . $this->db->quote($currency_code) . ", currency_value = '" . (float)$currency_value . "', date_added = NOW(), date_modified = NOW()");
      	
      	$order_id = $this->db->getLastId();
		
      	if (isset($data['order_product'])) {		
      		foreach ($data['order_product'] as $order_product) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$order_id . "', product_id = '" . (int)$order_product['product_id'] . "', name = " . $this->db->quote($order_product['name']) . ", model = " . $this->db->quote($order_product['model']) . ", quantity = '" . (int)$order_product['quantity'] . "', price = '" . (float)$order_product['price'] . "', total = '" . (float)$order_product['total'] . "', tax = '" . (float)$order_product['tax'] . "', reward = '" . (int)$order_product['reward'] . "'");
			
				$order_product_id = $this->db->getLastId();
	
				if (isset($order_product['order_option'])) {
					foreach ($order_product['order_option'] as $order_option) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$order_option['product_option_id'] . "', product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "', name = " . $this->db->quote($order_option['name']) . ", `value` = " . $this->db->quote($order_option['value']) . ", `type` = " . $this->db->quote($order_option['type']));
					}
				}
				
				if (isset($order_product['order_download'])) {
					foreach ($order_product['order_download'] as $order_download) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_download SET order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', name = " . $this->db->quote($order_download['name']) . ", filename = " . $this->db->quote($order_download['filename']) . ", mask = " . $this->db->quote($order_download['mask']) . ", remaining = '" . (int)$order_download['remaining'] . "'");
					}
				}
			}
		}
		
		if (isset($data['order_voucher'])) {	
			foreach ($data['order_voucher'] as $order_voucher) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_voucher SET order_id = '" . (int)$order_id . "', voucher_id = '" . (int)$order_voucher['voucher_id'] . "', description = " . $this->db->quote($order_voucher['description']) . ", code = " . $this->db->quote($order_voucher['code']) . ", from_name = " . $this->db->quote($order_voucher['from_name']) . ", from_email = " . $this->db->quote($order_voucher['from_email']) . ", to_name = " . $this->db->quote($order_voucher['to_name']) . ", to_email = " . $this->db->quote($order_voucher['to_email']) . ", voucher_theme_id = '" . (int)$order_voucher['voucher_theme_id'] . "', message = " . $this->db->quote($order_voucher['message']) . ", amount = '" . (float)$order_voucher['amount'] . "'");
			
      			$this->db->query("UPDATE " . DB_PREFIX . "voucher SET order_id = '" . (int)$order_id . "' WHERE voucher_id = '" . (int)$order_voucher['voucher_id'] . "'");
			}
		}

		// Get the total
		$total = 0;
		
		if (isset($data['order_total'])) {		
      		foreach ($data['order_total'] as $order_total) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = " . $this->db->quote($order_total['code']) . ", title = " . $this->db->quote($order_total['title']) . ", text = " . $this->db->quote($order_total['text']) . ", `value` = '" . (float)$order_total['value'] . "', sort_order = '" . (int)$order_total['sort_order'] . "'");
			}
			
			$total += $order_total['value'];
		}

		// Affiliate
		$affiliate_id = 0;
		$commission = 0;
		
		if (!empty($this->request->post['affiliate_id'])) {
			$this->load->model('sale/affiliate');
			
			$affiliate_info = $this->model_sale_affiliate->getAffiliate($this->request->post['affiliate_id']);
			
			if ($affiliate_info) {
				$affiliate_id = $affiliate_info['affiliate_id']; 
				$commission = ($total / 100) * $affiliate_info['commission']; 
			}
		}
		
		// Update order total			 
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET total = '" . (float)$total . "', affiliate_id = '" . (int)$affiliate_id . "', commission = '" . (float)$commission . "' WHERE order_id = '" . (int)$order_id . "'"); 	
	}
	
	public function editOrder($order_id, $data) {
		$this->load->model('localisation/country');
		
		$this->load->model('localisation/zone');
		
		$country_info = $this->model_localisation_country->getCountry($data['country_id']);
		
		if ($country_info) {
			$country = $country_info['name'];
			$address_format = $country_info['address_format'];
		} else {
			$country = '';
			$address_format = '{company}' . "\n" . '{address}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
		}	
		
		$zone_info = $this->model_localisation_zone->getZone($data['zone_id']);
		
		if ($zone_info) {
			$zone = $zone_info['name'];
		} else {
			$zone = '';
		}	

      	$this->db->query("UPDATE `" . DB_PREFIX . "order` SET firstname = " . $this->db->quote($data['firstname']) . ", lastname = " . $this->db->quote($data['lastname']) . ", email = " . $this->db->quote($data['email']) . ", telephone = " . $this->db->quote($data['telephone']) . ", fax = " . $this->db->quote($data['fax']) . ", company = " . $this->db->quote($data['company']) . ", address = " . $this->db->quote($data['address']) . ", address_id = '" . (int)$data['address_id'] . "', city = " . $this->db->quote($data['city']) . ", postcode = " . $this->db->quote($data['postcode']) . ", country = " . $this->db->quote($country) . ", country_id = '" . (int)$data['country_id'] . "', zone = " . $this->db->quote($zone) . ", zone_id = '" . (int)$data['zone_id'] . "', address_format = " . $this->db->quote($address_format) . ", payment_method = " . $this->db->quote($data['payment_method']) . ", payment_code = " . $this->db->quote($data['payment_code']) . ", shipping_method = " . $this->db->quote($data['shipping_method']) . ", shipping_code = " . $this->db->quote($data['shipping_code']) . ", comment = " . $this->db->quote($data['comment']) . ", order_status_id = '" . (int)$data['order_status_id'] . "', affiliate_id  = '" . (int)$data['affiliate_id'] . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'"); 
       	$this->db->query("DELETE FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "'");
		
      	if (isset($data['order_product'])) {		
      		foreach ($data['order_product'] as $order_product) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_product SET order_product_id = '" . (int)$order_product['order_product_id'] . "', order_id = '" . (int)$order_id . "', product_id = '" . (int)$order_product['product_id'] . "', name = " . $this->db->quote($order_product['name']) . ", model = " . $this->db->quote($order_product['model']) . ", quantity = '" . (int)$order_product['quantity'] . "', price = '" . (float)$order_product['price'] . "', total = '" . (float)$order_product['total'] . "', reward = '" . (int)$order_product['reward'] . "'");
			
				$order_product_id = $this->db->getLastId();
	
				if (isset($order_product['order_option'])) {
					foreach ($order_product['order_option'] as $order_option) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_option SET order_option_id = '" . (int)$order_option['order_option_id'] . "', order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', product_option_id = '" . (int)$order_option['product_option_id'] . "', product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "', name = " . $this->db->quote($order_option['name']) . ", `value` = " . $this->db->quote($order_option['value']) . ", `type` = " . $this->db->quote($order_option['type']));
					}
				}
				
				if (isset($order_product['order_download'])) {
					foreach ($order_product['order_download'] as $order_download) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_download SET order_download_id = '" . (int)$order_download['order_download_id'] . "', order_id = '" . (int)$order_id . "', order_product_id = '" . (int)$order_product_id . "', name = " . $this->db->quote($order_download['name']) . ", filename = " . $this->db->quote($order_download['filename']) . ", mask = " . $this->db->quote($order_download['mask']) . ", remaining = '" . (int)$order_download['remaining'] . "'");
					}
				}
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'"); 
		
		if (isset($data['order_voucher'])) {	
			foreach ($data['order_voucher'] as $order_voucher) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_voucher SET order_voucher_id = '" . (int)$order_voucher['order_voucher_id'] . "', order_id = '" . (int)$order_id . "', voucher_id = '" . (int)$order_voucher['voucher_id'] . "', description = " . $this->db->quote($order_voucher['description']) . ", code = " . $this->db->quote($order_voucher['code']) . ", from_name = " . $this->db->quote($order_voucher['from_name']) . ", from_email = " . $this->db->quote($order_voucher['from_email']) . ", to_name = " . $this->db->quote($order_voucher['to_name']) . ", to_email = " . $this->db->quote($order_voucher['to_email']) . ", voucher_theme_id = '" . (int)$order_voucher['voucher_theme_id'] . "', message = " . $this->db->quote($order_voucher['message']) . ", amount = '" . (float)$order_voucher['amount'] . "'");
			
				$this->db->query("UPDATE " . DB_PREFIX . "voucher SET order_id = '" . (int)$order_id . "' WHERE voucher_id = '" . (int)$order_voucher['voucher_id'] . "'");
			}
		}
		
		// Get the total
		$total = 0;
				
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "'");
		
		if (isset($data['order_total'])) {		
      		foreach ($data['order_total'] as $order_total) {	
      			$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_total_id = '" . (int)$order_total['order_total_id'] . "', order_id = '" . (int)$order_id . "', code = " . $this->db->quote($order_total['code']) . ", title = " . $this->db->quote($order_total['title']) . ", text = " . $this->db->quote($order_total['text']) . ", `value` = '" . (float)$order_total['value'] . "', sort_order = '" . (int)$order_total['sort_order'] . "'");
			}
			
			$total += $order_total['value'];
		}
		
		// Affiliate
		$affiliate_id = 0;
		$commission = 0;
		
		if (!empty($this->request->post['affiliate_id'])) {
			$this->load->model('sale/affiliate');
			
			$affiliate_info = $this->model_sale_affiliate->getAffiliate($this->request->post['affiliate_id']);
			
			if ($affiliate_info) {
				$affiliate_id = $affiliate_info['affiliate_id']; 
				$commission = ($total / 100) * $affiliate_info['commission']; 
			}
		}
				 
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET total = '" . (float)$total . "', affiliate_id = '" . (int)$affiliate_id . "', commission = '" . (float)$commission . "' WHERE order_id = '" . (int)$order_id . "'"); 
	}
	
	public function deleteOrder($order_id) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_status_id > '0' AND order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

			foreach($product_query->rows as $product) {
				$this->db->query("UPDATE `" . DB_PREFIX . "product` SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_id = '" . (int)$product['product_id'] . "' AND subtract = '1'");

				$option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$product['order_product_id'] . "'");

				foreach ($option_query->rows as $option) {
					$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity + " . (int)$product['quantity'] . ") WHERE product_option_value_id = '" . (int)$option['product_option_value_id'] . "' AND subtract = '1'");
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
      	$this->db->query("DELETE FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
      	$this->db->query("DELETE FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "order_fraud WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_transaction WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_reward WHERE order_id = '" . (int)$order_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$reward = 0;
			
			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}			
			
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['country_id'] . "'");

			if ($country_query->num_rows) {
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$iso_code_2 = '';
				$iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['zone_id'] . "'");

			if ($zone_query->num_rows) {
				$zone_code = $zone_query->row['code'];
			} else {
				$zone_code = '';
			}
			

			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}				
				
			$this->load->model('sale/affiliate');
				
			$affiliate_info = $this->model_sale_affiliate->getAffiliate($affiliate_id);
				
			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';				
			}

			$this->load->model('localisation/language');
			
			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);
			
			if ($language_info) {
				$language_code = $language_info['code'];
				$language_filename = $language_info['filename'];
				$language_directory = $language_info['directory'];
			} else {
				$language_code = '';
				$language_filename = '';
				$language_directory = '';
			}
			
			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
				'company'         => $order_query->row['company'],
				'address'       => $order_query->row['address'],
				'address_id'       => $order_query->row['address_id'],
				'postcode'        => $order_query->row['postcode'],
				'city'            => $order_query->row['city'],
				'zone_id'         => $order_query->row['zone_id'],
				'zone'            => $order_query->row['zone'],
				'zone_code'       => $zone_code,
				'country_id'      => $order_query->row['country_id'],
				'country'         => $order_query->row['country'],
				'iso_code_2'      => $iso_code_2,
				'iso_code_3'      => $iso_code_3,
				'address_format'  => $order_query->row['address_format'],
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'language_filename'       => $language_filename,
				'language_directory'      => $language_directory,				
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'], 
				'user_agent'              => $order_query->row['user_agent'],	
				'accept_language'         => $order_query->row['accept_language'],					
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified']
			);
		} else {
			return false;
		}
	}
	
	public function getOrders($data = array()) {
		$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status_id']) && !is_null($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND LCASE(CONCAT(o.firstname, ' ', o.lastname)) LIKE " . $this->db->quote("%" . utf8_strtolower($data['filter_customer']) . "%");
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE(" . $this->db->quote($data['filter_date_added']) . ")";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		$sort_data = array(
			'o.order_id',
			'customer',
			'status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->rows;
	}
	
	public function getOrderOption($order_id, $order_option_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_option_id = '" . (int)$order_option_id . "'");

		return $query->row;
	}
	
	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderDownloads($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_download WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}
	
	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
		
		return $query->rows;
	}
	
	public function getOrderVoucherByVoucherId($voucher_id) {
      	$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}
				
	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getTotalOrders($data = array()) {
      	$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (isset($data['filter_order_status_id']) && !is_null($data['filter_order_status_id'])) {
			$sql .= " WHERE order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE " . $this->db->quote("%" . $data['filter_customer'] . "%");
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE(" . $this->db->quote($data['filter_date_added']) . ")";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalOrdersByOrderStatusId($order_status_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '" . (int)$order_status_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByLanguageId($language_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE language_id = '" . (int)$language_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByCurrencyId($currency_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE currency_id = '" . (int)$currency_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}
	
	public function getTotalSales() {
      	$query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalSalesByYear($year) {
      	$query = $this->db->query("SELECT SUM(total) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id > '0' AND YEAR(date_added) = '" . (int)$year . "'");

		return $query->row['total'];
	}

	public function createInvoiceNo($order_id) {
		$order_info = $this->getOrder($this->request->get['order_id']);
			
		if ($order_info && !$order_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "order` WHERE invoice_prefix = " . $this->db->quote($order_info['invoice_prefix']));
	
			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}
		
			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = " . $this->db->quote($order_info['invoice_prefix']) . " WHERE order_id = '" . (int)$order_id . "'");
			
			return $order_info['invoice_prefix'] . $invoice_no;
		}
	}
	
	public function addOrderHistory($order_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$data['order_status_id'] . "', date_modified = NOW() WHERE order_id = '" . (int)$order_id . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '" . (int)$data['order_status_id'] . "', notify = '" . (isset($data['notify']) ? (int)$data['notify'] : 0) . "', comment = " . $this->db->quote(strip_tags($data['comment'])) . ", date_added = NOW()");

		$order_info = $this->getOrder($order_id);

		// Send out any gift voucher mails
		if ($this->config->get('config_complete_status_id') == $data['order_status_id']) {
			$this->load->model('sale/voucher');

			$results = $this->getOrderVouchers($order_id);
			
			foreach ($results as $result) {
				$this->model_sale_voucher->sendVoucher($result['voucher_id']);
			}
		}

      	if ($data['notify']) {
			$language = new Language($order_info['language_directory']);
			$language->load($order_info['language_filename']);
			$language->load('mail/order');

			$subject = sprintf($language->get('text_subject'), $order_info['store_name']);

			$message  = $language->get('text_order') . ' ' . $order_id . "\n";
			$message .= $language->get('text_date_added') . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n\n";
			
			$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$data['order_status_id'] . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
				
			if ($order_status_query->num_rows) {
				$message .= $language->get('text_order_status') . "\n";
				$message .= $order_status_query->row['name'] . "\n\n";
			}
			
			if ($order_info['customer_id']) {
				$message .= $language->get('text_link') . "\n";
				$message .= html_entity_decode($order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id, ENT_QUOTES, 'UTF-8') . "\n\n";
			}
			
			if ($data['comment']) {
				$message .= $language->get('text_comment') . "\n\n";
				$message .= strip_tags(html_entity_decode($data['comment'], ENT_QUOTES, 'UTF-8')) . "\n\n";
			}

			$message .= $language->get('text_footer');

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($order_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($order_info['store_name']);
			$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			$mail->send();
		}
	}
		
	public function getOrderHistories($order_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}
		
		if ($limit < 1) {
			$limit = 10;
		}	
				
		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getTotalOrderHistories($order_id) {
	  	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}	
		
	public function getTotalOrderHistoriesByOrderStatusId($order_status_id) {
	  	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_status_id = '" . (int)$order_status_id . "'");

		return $query->row['total'];
	}	
	
	public function getEmailsByProductsOrdered($products, $start, $end) {
		$implode = array();
		
		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . $product_id . "'";
		}
		
		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");
	
		return $query->rows;
	}
	
	public function getTotalEmailsByProductsOrdered($products) {
		$implode = array();
		
		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . $product_id . "'";
		}
				
		$query = $this->db->query("SELECT COUNT(DISTINCT email) AS total FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");
	
		return $query->row['total'];
	}	
}
?>
<?php  namespace Model\Affiliate;

use Engine\Model;

class Affiliate {
    use Model;
	public function addAffiliate($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate SET firstname = " . $this->db->quote($data['firstname']) . ", lastname = " . $this->db->quote($data['lastname']) . ", email = " . $this->db->quote($data['email']) . ", telephone = " . $this->db->quote($data['telephone']) . ", fax = " . $this->db->quote($data['fax']) . ", salt = " . $this->db->quote($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . ", password = " . $this->db->quote(sha1($salt . sha1($salt . sha1($data['password'])))) . ", company = " . $this->db->quote($data['company']) . ", address_1 = " . $this->db->quote($data['address_1']) . ", address_2 = " . $this->db->quote($data['address_2']) . ", city = " . $this->db->quote($data['city']) . ", postcode = " . $this->db->quote($data['postcode']) . ", country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', code = " . $this->db->quote(uniqid()) . ", commission = '" . (float)$this->config->get('config_commission') . "', tax = " . $this->db->quote($data['tax']) . ", payment = " . $this->db->quote($data['payment']) . ", cheque = " . $this->db->quote($data['cheque']) . ", paypal = " . $this->db->quote($data['paypal']) . ", bank_name = " . $this->db->quote($data['bank_name']) . ", bank_branch_number = " . $this->db->quote($data['bank_branch_number']) . ", bank_swift_code = " . $this->db->quote($data['bank_swift_code']) . ", bank_account_name = " . $this->db->quote($data['bank_account_name']) . ", bank_account_number = " . $this->db->quote($data['bank_account_number']) . ", status = '1', date_added = NOW()");
	
		$this->language->load('mail/affiliate');
		
		$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));
		
		$message  = sprintf($this->language->get('text_welcome'), $this->config->get('config_name')) . "\n\n";
		$message .= $this->language->get('text_approval') . "\n";
		$message .= $this->url->link('affiliate/login', '', 'SSL') . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= $this->config->get('config_name');
		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');				
		$mail->setTo($this->request->post['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
		$mail->send();
	}
	
	public function editAffiliate($data) {
		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET firstname = " . $this->db->quote($data['firstname']) . ", lastname = " . $this->db->quote($data['lastname']) . ", email = " . $this->db->quote($data['email']) . ", telephone = " . $this->db->quote($data['telephone']) . ", fax = " . $this->db->quote($data['fax']) . ", company = " . $this->db->quote($data['company']) . ", address_1 = " . $this->db->quote($data['address_1']) . ", address_2 = " . $this->db->quote($data['address_2']) . ", city = " . $this->db->quote($data['city']) . ", postcode = " . $this->db->quote($data['postcode']) . ", country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "' WHERE affiliate_id = '" . (int)$this->affiliate->getId() . "'");
	}

	public function editPayment($data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET tax = " . $this->db->quote($data['tax']) . ", payment = " . $this->db->quote($data['payment']) . ", cheque = " . $this->db->quote($data['cheque']) . ", paypal = " . $this->db->quote($data['paypal']) . ", bank_name = " . $this->db->quote($data['bank_name']) . ", bank_branch_number = " . $this->db->quote($data['bank_branch_number']) . ", bank_swift_code = " . $this->db->quote($data['bank_swift_code']) . ", bank_account_name = " . $this->db->quote($data['bank_account_name']) . ", bank_account_number = " . $this->db->quote($data['bank_account_number']) . " WHERE affiliate_id = '" . (int)$this->affiliate->getId() . "'");
	}
	
	public function editPassword($email, $password) {
      	$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET salt = " . $this->db->quote($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . ", password = " . $this->db->quote(sha1($salt . sha1($salt . sha1($password)))) . " WHERE email = " . $this->db->quote($email));
	}
				
	public function getAffiliate($affiliate_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		
		return $query->row;
	}
	
	public function getAffiliateByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE email = '" . (int)$email . "'");
		
		return $query->row;
	}
		
	public function getAffiliateByCode($code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE code = " . $this->db->quote($code));
		
		return $query->row;
	}
			
	public function getTotalAffiliatesByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate WHERE LOWER(email) = " . $this->db->quote(strtolower($email)));
		
		return $query->row['total'];
	}
}
?>
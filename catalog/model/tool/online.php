<?php  namespace Model\Tool;

use Engine\Model;

class Online {
    use Model;
	public function whosonline($ip, $customer_id, $url, $referer) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_online` WHERE (UNIX_TIMESTAMP(`date_added`) + 3600) < UNIX_TIMESTAMP(NOW())");
		 
		$this->db->query("REPLACE INTO `" . DB_PREFIX . "customer_online` SET `ip` = " . $this->db->quote($ip) . ", `customer_id` = '" . (int)$customer_id . "', `url` = " . $this->db->quote($url) . ", `referer` = " . $this->db->quote($referer) . ", `date_added` = NOW()");
	}
}
?>
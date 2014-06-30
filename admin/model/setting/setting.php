<?php namespace Model\Setting;

use Engine\Model;

class Setting {
    use Model;

	public function getSetting($group) {
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `group` = " . $this->db->quote($group));
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
	
	public function editSetting($group, $data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `group` = " . $this->db->quote($group));

		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `group` = " . $this->db->quote($group) . ", `key` = " . $this->db->quote($key) . ", `value` = " . $this->db->quote($value));
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `group` = " . $this->db->quote($group) . ", `key` = " . $this->db->quote($key) . ", `value` = " . $this->db->quote(serialize($value)) . ", serialized = '1'");
			}
		}
	}
	
	public function deleteSetting($group) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `group` = " . $this->db->quote($group));
	}
}
?>
<?php  namespace Model\Setting;

use System\Engine\Model;

class Extension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = " . $this->db->quote($type));

		return $query->rows;
	}
}
?>
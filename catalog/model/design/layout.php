<?php  namespace Model\Design;

use Engine\Model;

class Layout {
    use Model;

	public function getLayout($route) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE " . $this->db->quote($route) . " LIKE CONCAT(route, '%') ORDER BY route ASC LIMIT 1");
		
		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;	
		}
	}
}
?>
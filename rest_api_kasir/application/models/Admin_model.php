<?php

class Admin_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }
    
    
    function sql_result($sql) {        
        $hasil = $this->db->query($sql)->result();
        return $hasil;
    }
    
    function sql_row($sql) {        
        $hasil = $this->db->query($sql)->row();
        return $hasil;
    }
    
    

}

?>
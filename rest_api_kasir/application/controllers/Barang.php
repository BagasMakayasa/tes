<?php

require APPPATH . '/libraries/REST_Controller.php';

class barang extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->model('Admin_model');
    }

    // show data barang
    function index_get() {
        $header = $this->input->get_request_header('Authorization');
        if ($header) {
            $token = Authorization::validateToken($header);
            if ($token) {
                $id_barang = $this->get('id_barang');
                if ($id_barang == '') {
                    $respone = $this->db->get('barang')->result();
                } else {
                    $this->db->where('id_barang', $id_barang);
                    $respone = $this->db->get('barang')->result();
                }
                $this->response($respone, 200);
            }
        }
        $response = [
            'status' => REST_Controller::HTTP_FORBIDDEN,
            'message' => 'Forbidden',
        ];
        $this->set_response($response, REST_Controller::HTTP_FORBIDDEN);
    }

    function get_barang() {
        $get_data = $this->db->get('barang')->result();
        return $get_data;
    }

    // insert new data to barang
    function index_post() {
        $data = array(
            'nama_barang' => $this->post('nama_barang'),
            'tanggal_insert' => date('Y-m-d H:i:s'),
            'id_user' => $this->post('id_user'),
        );
        $insert = $this->db->insert('barang', $data);
        if ($insert) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

    // update data barang
    function index_put() {
        $header = $this->input->get_request_header('Authorization');
        if ($header) {
            $token = Authorization::validateToken($header);
            if ($token) {
                $id_barang = $this->put('id_barang');
                $data = array(
                    'nama_barang' => $this->put('nama_barang')
                );
                $this->db->where('id_barang', $id_barang);
                $update = $this->db->update('barang', $data);
                if ($update) {
                    $this->response($data, 200);
                } else {
                    $this->response(array('status' => 'fail', 502));
                }
            }
        }
    }

    // delete barang
    function index_delete() {
        $id_barang = $this->delete('id_barang');
        $this->db->where('id_barang', $id_barang);
        $delete = $this->db->delete('barang');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}

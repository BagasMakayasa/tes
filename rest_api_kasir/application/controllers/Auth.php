<?php

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/jwt/JWT.php';
require APPPATH . '/libraries/jwt/BeforeValidException.php';
require APPPATH . '/libraries/jwt/ExpiredException.php';
require APPPATH . '/libraries/jwt/SignatureInvalidException.php';

use \Firebase\JWT\JWT;

class Auth extends REST_Controller {

    private $secretkey = 'sagabboy_yogyakartaMaret2018_restapi';

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->model('Admin_model');
    }

    // show data barang
    function index_get() {
        $date = new DateTime();
        $sql_transaksi = "select * from user where email='sagab'";
        $cek_login = $this->Admin_model->sql_row($sql_transaksi);
        if ($cek_login) {
            $payload['id'] = $cek_login->id_user;
            $payload['email'] = $cek_login->email;
            $payload['superman_access'] = 'sagab'.date('Y-m-d H:i:s');
            $payload['log'] = $date->getTimestamp(); //waktu awal log
            $payload['expired'] = $date->getTimestamp() + 3600; //waktu expired 1 jam

            $output['id_token'] = JWT::encode($payload, $this->secretkey);
            $this->response([
                'status' => 'Sukses',
                'pesan' => 'Token akan expired dalam 1 jam',
                'token' => $output]
                    , REST_Controller::HTTP_OK
            );                
        } else {
            $this->response([
                'status' => 'Gagal',
                'pesan' => 'Kombinasi password dan username salah',
                'token' => 'error']
                    , REST_Controller::HTTP_BAD_REQUEST
            );
        }        
       
    }

    //method untuk mengecek token setiap melakukan post, put, etc
    public function cektoken() {        
//        $jwt = $this->input->get_request_header('Authorization');
        $jwt = $this->input->request_headers();     
        print_r($jwt);
        try {
            $decode = JWT::decode($jwt, $this->secretkey, array('HS256'));
            //melakukan pengecekan database, jika username tersedia di database maka return true
            if ($this->Login_model->is_valid_num($decode->username) > 0) {
                return true;
            }
        } catch (Exception $e) {
            exit('Token expired');
        }
    }

}

?>
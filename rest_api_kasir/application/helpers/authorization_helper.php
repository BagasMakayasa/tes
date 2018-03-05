<?php

require_once APPPATH . 'libraries/jwt/JWT.php';

use \Firebase\JWT\JWT;

class Authorization {        
    
    public static function validateToken($token) {
        $error = json_encode(array(
            'status' => 'Token expired'
        ));
        try {
            $get_token = JWT::decode($token, 'sagabboy_yogyakartaMaret2018_restapi', array('HS256'));
            if (isset($get_token->superman_access)) {
                return $get_token;
            } 
        } catch (Exception $e) {            
            exit($error);
        }
    }

    public static function generateToken($data) {
        $CI = & get_instance();
        $key = $CI->config->item('jwt_key');
        $algorithm = $CI->config->item('jwt_algorithm');
        return JWT::encode($data, $key);
    }

    public static function tokenIsExist($headers) {
        return (array_key_exists('Authorization', $headers) && !empty($headers['Authorization']));
    }

}

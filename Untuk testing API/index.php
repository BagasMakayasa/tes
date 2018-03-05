
<?php
$url = "http://localhost:8080/rest_api_kasir/index.php/Barang";
//$url = "http://localhost:8080/rest_api_kasir/index.php/Barang?id_barang=1"; //format get row
$dataku = json_encode(array(
    "nama_barang" => "Ikan",
    "tanggal_insert"=>'2018-03-05 09:00:00',
    "id_barang" => '4',    
        ));
$ch = curl_init();
$option = array(    
    CURLOPT_CUSTOMREQUEST => 'DELETE', //POST : Simpan, PUT : update
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => array(
        'Content-type: application/json',
        'Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJlbWFpbCI6InNhZ2FiIiwic3VwZXJtYW5fYWNjZXNzIjoic2FnYWIyMDE4LTAzLTA0IDEwOjQ2OjUxIiwibG9nIjoxNTIwMTM1MjExLCJleHBpcmVkIjoxNTIwMTM4ODExfQ.bLBegGO9LchG5EBSOtVuuERN9ieeloEHDwBPqqup7Hc',        
    ),
    CURLOPT_POSTFIELDS => "id_barang=4",//format delete
//    CURLOPT_POSTFIELDS => $dataku //format put,post
);
curl_setopt_array($ch, $option);
echo $result = curl_exec($ch);

curl_close($ch);
?>

<?php
$txt = $_GET["text"];
echo $txt;
$post = [
    'text' => 'This is a sample line of text'
];

$ch = curl_init('http://www.readthewords.com/api/get/sandn7c969e0707/Lauren/0.aspx');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

$response = curl_exec($ch);
curl_close($ch);

var_dump($response);

echo $response;
header('Status: 301 Moved Permanently', false, 301);
header('Location:'.$response);    

 ?>

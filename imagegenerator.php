<?php 
//Generar Imagen
header("Content-type: image/png");

$esc = $_GET["esc"];

$im = imagecreatefrompng("match.png");
$url = $esc;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.1 Safari/537.11');
$res = curl_exec($ch);
$rescode = curl_getinfo($ch, CURLINFO_HTTP_CODE); 
curl_close($ch) ;
//echo $res;

$escudo = imagecreatefromstring($res);

$new_width = 280;
$new_height = 280;

// Resize Escudo
list($width_orig, $height_orig) = getimagesizefromstring($res);

$new_img = imagecreatetruecolor($new_width, $new_height);
$color = imagecolorallocatealpha($new_img, 255, 255, 255, 1);
imagecolortransparent($new_img, $color);
imagefill($new_img, 0, 0, $color);
imagecopyresampled($new_img, $escudo, 0, 0, 0, 0, $new_width, $new_height, $width_orig, $height_orig);



// Encimar Imagenes
imagecopy($im, $new_img, 185, 20, 0, 0, $new_width, $new_height);



//Create Image
imagepng($im);
imagedestroy($im);
// End Generar Imagen
?>
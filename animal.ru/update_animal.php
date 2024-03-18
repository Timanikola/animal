<?php
session_start();
$id_animal=$_POST["id_animal"];
$name_animal=$_POST["name_animal"];
$lenth=$_POST["lenth"];
$height=$_POST["height"];

$latitude=$_POST["latitude"];
$longitude=$_POST["longitude"];


require_once ("config.php");
 $connect = mysqli_connect($host, $user, $password, $db);
 if(!$connect) {
 die();
 }

mysqli_query($connect,"UPDATE `animals` SET `lenth` = '$lenth', `height` = '$height',  `name_animal` = '$name_animal' WHERE `animals`.`id_animal` = '$id_animal';");

mysqli_query($connect,"UPDATE `location_animal` SET `latitude` = '$latitude', `longitude` = '$longitude' WHERE `location_animal`.`id_animal` = '$id_animal';");


header("Location: my_animal.php"); 



// UPDATE `animals` SET `lenth` = '20', `height` = '200', `type_animal` = '5', `name_animal` = 'антон' WHERE `animals`.`id_animal` = 55;





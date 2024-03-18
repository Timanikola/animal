<?php
session_start();
$id=$_SESSION["id"];
$typeName=$_POST["typeName"];

// $realTime=date('Y-m-d H:i:s', time()+ 60 *60 *3);
// echo $realTime;
require_once ("config.php");
 $connect = mysqli_connect($host, $user, $password, $db);
 if(!$connect) {
 die();
 }

//проверка на авторизацию, мало ли как неавторизированный пользователь попадет на страницу добавления животного, ну и у чипера должен быть айди 
if (empty($_SESSION["id"])) {
    echo "вы не авторизированны"; 
}
else{
    if (($_FILES['file']['name'] !=='')) {
        $file = $_FILES['file'];
        $name = $file['name'];
        $pathFile = __DIR__.'/img/'.$name;

        if (!move_uploaded_file($file['tmp_name'], $pathFile)) {
            echo 'файл не смог загрузиться';
        }
        mysqli_query($connect,"INSERT INTO `types_animal` (`typeId`, `path`, `typeName`) VALUES (NULL, '$name', '$typeName');"); 
    }
    header("Location: add_type.php");
}




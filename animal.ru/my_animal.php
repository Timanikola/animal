<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>мои животные</title>
    <link rel="stylesheet" href="css/style_my_animal.css">
</head>
<body>
    <main>
        <div class="buttonBack">
        <button class="custom-btn btn-14" onclick="document.location='check_auth.php'">Назад</button>
        </div>
        
        
        <div class="myAnimal">
            
            <?php
            session_start();

            // echo "привет";
            // echo $_SESSION["id"];
            require_once ("config.php");
             $connect = mysqli_connect($host, $user, $password, $db);
             if(!$connect) {
             die();
             }
                $id=$_SESSION["id"];
                $queryResult= mysqli_query($connect,"SELECT * FROM `animals` WHERE `chipperId`= '$id';");
                // $queryResultToArray= mysqli_fetch_all($queryResult,MYSQLI_ASSOC);
                // print_r($queryResultToArray[0]["name_animal"]);
                // echo $queryResultToArray[0]['name_animal'];
                
                
                //будет работать, пока не обработает всех животных
                while( $queryResultToArray= mysqli_fetch_array($queryResult,MYSQLI_ASSOC)){
                    //каждый раз отслыет запрос в базу, чтобы заменить цифру айди животного на нормальное название
                $queryResultAnimalType= mysqli_query($connect,"SELECT * FROM `types_animal` WHERE `typeId` ='$queryResultToArray[type_animal]';");
                $queryResultAnimalTypeToArray= mysqli_fetch_array($queryResultAnimalType,MYSQLI_ASSOC);
                    
                    // $_SESSION["id_animal"]=$queryResultToArray["id_animal"];
                    
                    // echo($queryResultToArray["id_animal"]);    
                    
                    $id_animal=$queryResultToArray["id_animal"];
                    
                    $queryLocationAnimal= mysqli_query($connect,"SELECT `latitude`, `longitude` FROM `location_animal` WHERE `id_animal`='$id_animal';");
                    $queryLocationAnimalToArray= mysqli_fetch_array($queryLocationAnimal,MYSQLI_ASSOC);




                    $queryPhotoAnimal= mysqli_query($connect,"SELECT `path` FROM `photos` WHERE `id_animal`='$id_animal';");
                    $queryPhotoAnimalToArray= mysqli_fetch_array($queryPhotoAnimal,MYSQLI_ASSOC);
                    $photoAnimal=$queryPhotoAnimalToArray["path"];


                    if ($queryResultToArray['gender']==0) {
                        $gender="женский";
                    }
                    else {
                        $gender="мужской";
                    }

                      
                    // $_SESSION["id_animal"]=$id_animal;
                    echo "<div class='post'>
                          <form class='forms' action='update_animal.php' method='post'>
                          <input type='hidden' name='id_animal' value='$id_animal'>
                          

                          <input type='text' class='discriptionCard' name='name_animal' value='$queryResultToArray[name_animal]'>

                          

                          <label><p class='discription'>длинна:</p></label>
                          <input type='text' class='discriptionCard' name='lenth' value='$queryResultToArray[lenth]'>

                          <label><p class='discription'>высота:</p></label>
                          <input type='text' class='discriptionCard' name='height' value='$queryResultToArray[height]'>

                          <label><p class='discription'>пол: $gender</p></label>
                          <label><p class='discription'>дата и время чипирования: $queryResultToArray[chippingDateTime]</p></label>
                          <label><p class='discription'>тип животного: $queryResultAnimalTypeToArray[typeName]</p></label>
                          <label><p class='discription'>id животного:$id_animal</p></label>


                          <label><p class='discription'>широта:</p></label>
                          <input type='text' class='discriptionCard' name='latitude' value='$queryLocationAnimalToArray[latitude]'>

                          <label><p class='discription'>долгота:</p></label>
                          <input type='text' class='discriptionCard' name='longitude' value='$queryLocationAnimalToArray[longitude]'><br>

                          
                          
                          <label class='photo'><img src='img/$photoAnimal' alt='' width='200px' height='200px'> </label>

                          <div class='buttonCards'>
                            <input class='custom-btn btn-14' type='submit' value='обновить'>                          
                          </div>
                          </form>

                          

                          <form class='' action='remove_animal.php' method='post'>
                            <input type='hidden' name='id_animal' value='$id_animal'>
                          <div class='buttonCards'>
                            <input class='custom-btn btn-14' type='submit' value='удалить'>
                          </div>                          
                          </form>
                          </div>";
                    }           
            ?>
                 
        </div>
       
    </main>
</body>
</html>
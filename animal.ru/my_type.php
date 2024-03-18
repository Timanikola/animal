<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>мои типы</title>
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


            require_once ("config.php");
             $connect = mysqli_connect($host, $user, $password, $db);
             if(!$connect) {
             die();
             }
                $id=$_SESSION["id"];


                $queryResult= mysqli_query($connect,"SELECT * FROM `types_animal`;");

                


                //будет работать, пока не обработает всех животных
                while( $queryResultToArray= mysqli_fetch_array($queryResult,MYSQLI_ASSOC)){

                    $typeName=$queryResultToArray["typeName"];

                    $queryPhotoAnimal= mysqli_query($connect,"SELECT `path` FROM `types_animal` WHERE `typeName`='$typeName';");
                    $queryPhotoAnimalToArray= mysqli_fetch_array($queryPhotoAnimal,MYSQLI_ASSOC);

                    $photoAnimal=$queryPhotoAnimalToArray["path"];

                    echo "<form class='post' action='remove_animal.php' method='post'>
                          <label><p class='discription'>название типа: $typeName </p></label><br>
                          
                          <label class='photo'><img src='img/$photoAnimal' alt='' width='200px' height='200px'> </label>

                          <div class='buttonCards'>
                          <input class='custom-btn btn-14' type='submit' value='удалить'>                          
                          </div>
                          </form>";
                           
                   
                    }    
                    
                    
            ?>
                 
        </div>
       
    </main>
</body>
</html>
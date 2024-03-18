
<?php  

            //    $id_animal=$_SESSION["id_animal"];
            // $id_animal=$_POST["id_animal"];
            // header("Location: map.php");
            
            require_once ("config.php");
             $connect = mysqli_connect($host, $user, $password, $db);
             if(!$connect) {
             die();
             } 
            
            //  $queryLocationAnimal= mysqli_query($connect,"SELECT * FROM `location_animal` WHERE `id_animal`='$id_animal';");
             $queryLocationAnimal= mysqli_query($connect,"SELECT * FROM `location_animal`;");
             $queryLocationAnimalToArray= mysqli_fetch_all($queryLocationAnimal,MYSQLI_ASSOC);

          
            for ($i=0; $i < count($queryLocationAnimalToArray) ; $i++) { 
                $latitude[$i]=$queryLocationAnimalToArray[$i]["latitude"];               
            }
            for ($t=0; $t < count($queryLocationAnimalToArray) ; $t++) { 
                $longitude[$t]=$queryLocationAnimalToArray[$t]["longitude"];
            }

            $queryAnimal= mysqli_query($connect,"SELECT `name_animal`,type_animal FROM `animals`;");
             $queryAnimalToArray= mysqli_fetch_all($queryAnimal,MYSQLI_ASSOC);

             for ($n=0; $n < count($queryAnimalToArray) ; $n++) { 
                $name_animal[$n]=$queryAnimalToArray[$n]["name_animal"];
            }

            for ($p=0; $p < count($queryAnimalToArray) ; $p++) { 
                $typeId=$queryAnimalToArray[$p]["type_animal"];

            $queryTypeAnimal= mysqli_query($connect,"SELECT `typeName` FROM `types_animal` WHERE `typeId`='$typeId';");
            $queryTypeAnimalToArray= mysqli_fetch_array($queryTypeAnimal,MYSQLI_ASSOC);
            $type_animal[$p]=$queryTypeAnimalToArray["typeName"];
            }
            $queryAnimalPhoto= mysqli_query($connect,"SELECT `path` FROM `photos`;");
             $queryAnimalPhotoToArray= mysqli_fetch_all($queryAnimalPhoto,MYSQLI_ASSOC);
             for ($i=0; $i < count($queryAnimalPhotoToArray) ; $i++) { 
                $photo[$i]=$queryAnimalPhotoToArray[$i]["path"];               
            }


            // $latitude=$queryLocationAnimalToArray["latitude"];
            // $longitude=$queryLocationAnimalToArray["longitude"];

            //  $latitudes_json = json_encode($latitude);
            //  $longitudes_json = json_encode($longitude);

            // header('Content-Type: application/json');
            $data = array("latitude" => $latitude, "longitude" => $longitude, "name_animal" => $name_animal, "type_animal" => $type_animal, "photo" => $photo);
            echo json_encode($data);  

        //    header("Location: map.php");
            

            // header('Content-Type: application/json');            
            // echo json_encode(array("latitude" => $latitude, "longitude" => $longitude));
            
            
            

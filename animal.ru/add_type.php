<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style_add_animal.css">
    <title>добавьте тип животного</title>
</head>
<body>
    <main>
        <h1>добавьте тип животного</h1>
        <form action="end_add_type.php" method="post" enctype="multipart/form-data">
           

        <label>название типа</label><br>
        <input type="text" name="typeName" id="">
        <br>
        <br>
        <input required type="file" name="file"><br><br>


        <input class="custom-btn btn-14" type="submit" value="добавить">
        </form>
        <br>
        <button class="custom-btn btn-14" onclick="document.location='check_auth.php'">Назад</button>
    </main>
   
</body>
</html>
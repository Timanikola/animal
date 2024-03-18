ymaps.ready(init);
function init() {
  // Создание карты.
  var myMap = new ymaps.Map("map", {
    // Координаты центра карты.
    // Порядок по умолчанию: «широта, долгота».
    // Чтобы не определять координаты центра карты вручную,
    // воспользуйтесь инструментом Определение координат.
    center: [55.19831862068815,61.32016475065578],
    // Уровень масштабирования. Допустимые значения:
    // от 0 (весь мир) до 19.
    zoom: 7
  });



  let response1 = fetch('coordinates.php')
    .then(response => response.json())
    .then(data => {
      
      let longitudeArray = data.longitude;
      let latitudeArray = data.latitude;
      let name_animal = data.name_animal;
      let type_animal = data.type_animal;
      let photo=data.photo;
      // console.log(latitudeArray);
      for (var i = 0; i < longitudeArray.length; i++) {
        var placemark = new ymaps.Placemark([latitudeArray[i], longitudeArray[i]],
          {
            balloonContentHeader: '<div class="baloon-divheader"><p class="baloon-p1">'+'Имя животного: '+name_animal[i]+'</p></div>',
            balloonContentBody: '<div class="baloon-div"><p class="baloon-p2">'+'Вид животного: '+type_animal[i]+'</p></div>'
          },
          {
            iconLayout: 'default#image',
            iconImageHref: 'img/'+photo[i],
            iconImageSize: [48, 48],
            iconImageOffset: [-3, -42],
          },
          
        );
        
        // alert(latitudeArray[i]+' '+longitudeArray[i]);
        myMap.geoObjects.add(placemark);
      }



    });

}
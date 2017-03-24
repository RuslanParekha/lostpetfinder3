ymaps.ready(init);
var myMap;

function init () {
    myMap = new ymaps.Map("map", {
        center: [50.5218, 30.5027], // Obolon
        zoom: 11
    }, {
        balloonMaxWidth: 50,
        searchControlProvider: 'yandex#search'
    });

    // Обработка события, возникающего при щелчке
    // левой кнопкой мыши в любой точке карты.
    // При возникновении такого события откроем балун.
    myMap.events.add('click', function (e) {
        if (!myMap.balloon.isOpen()) {
            var coords = e.get('coords');
            myMap.balloon.open(coords, {
                
                contentBody:                    '<p>Coordinates:</p>' + '<input type="text" name="latitude" id="latitude" value="'+ [coords[0].toPrecision(6)]+'">' +
					'<input type="text" name="longitude" id="longitude" value="'+ [coords[1].toPrecision(6)]+'">',
                contentFooter:'<sup> </sup>'
            });
        }
        else {
            myMap.balloon.close();
        }
    });

    // Обработка события, возникающего при щелчке
    // правой кнопки мыши в любой точке карты.
    // При возникновении такого события покажем всплывающую подсказку
    // в точке щелчка.
    myMap.events.add('contextmenu', function (e) {
        myMap.hint.open(e.get('coords'), 'mouse click');
    });
    
    // Скрываем хинт при открытии балуна.
    myMap.events.add('balloonopen', function (e) {
        myMap.hint.close();
    });
}

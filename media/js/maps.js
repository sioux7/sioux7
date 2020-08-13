function initialize() {
    var map;
    var styles = [
        {
            stylers: [
                { hue: "" },
                { saturation: 300}
            ]
        },{
            featureType: "all",
            stylers: [
                {saturation: -100},
                {gamma: 0.90}
            ]
        },{
            featureType: "road",
            elementType: "labels",
            stylers: [
                { visibility: "off" }
            ]
        }
    ];

    var mapContainer = $('#map-canvas');
    var lat = mapContainer.attr('data-lat');
    var long = mapContainer.attr('data-long')
    var mapTitle = mapContainer.attr('data-title');

    var pinLatLng = new google.maps.LatLng(lat,long);
    var marker = new google.maps.Marker({
        position: pinLatLng,
        title:mapTitle,
        icon: 'fileadmin/template/images/pin.png',
        clickable: true,
    });
    var styledMap = new google.maps.StyledMapType(styles,
        {name: "Styled Map"});
    var mapOptions = {
        zoom: 17,
        center: new google.maps.LatLng(lat,long),
        scrollwheel: false, // disableScrollingWithMouseWheel as default
        disableDefaultUI: false,
        scaleControl: false,  // fixed to BOTTOM_RIGHT
        panControl: true,
        zoomControl: true,
        mapTypeControl: true,
        streetViewControl: true,
        streetViewControlOptions: {
            position: google.maps.ControlPosition.LEFT_BOTTOM
        },
        overviewMapControl: true,
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');
    //styleMaker1.setMap(map);
    marker.setMap(map);
}
google.maps.event.addDomListener(window, 'load', initialize);

var kh85 = { lat: 22.611639, lng: 120.300210 };   //設定座標(22.611271, 120.300455)為高雄85大樓
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: kh85,
        zoom: 17
    });
    var input = document.getElementById('pac-input');
    var autocomplete = new google.maps.places.Autocomplete(input);

    // 將地圖的邊界（視口）屬性綁定到自動完成對象，以便自動完成請求使用請求中的bounds選項的當前地圖邊界。
    autocomplete.bindTo('bounds', map);

    //設置要在用戶選擇場所時返回的數據字段。
    autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);

    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
    var marker = new google.maps.Marker({
        map: map,
        anchorPoint: new google.maps.Point(0, -29)
    });

    autocomplete.addListener('place_changed', function () {
        infowindow.close();
        marker.setVisible(false);
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // 用戶輸入了未建議的地方名稱並按Enter鍵，或者地方詳細信息請求失敗。
            window.alert("沒有詳細信息可供輸入: '" + place.name + "'");
            return;
        }

        // 如果地點有幾何圖形，則將其顯示在地圖上。
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }

        infowindowContent.children['place-icon'].src = place.icon;
        infowindowContent.children['place-name'].textContent = place.name;
        infowindowContent.children['place-address'].textContent = address;
        infowindow.open(map, marker);
    });

    // 在單選按鈕上設置偵聽器以更改“場所自動完成”上的過濾器類型。
    function setupClickListener(id, types) {
        var radioButton = document.getElementById(id);
        radioButton.addEventListener('click', function () {
            autocomplete.setTypes(types);
        });
    }

    document.getElementById('use-strict-bounds')
        .addEventListener('click', function () {
            console.log('Checkbox clicked! New state=' + this.checked);
            autocomplete.setOptions({ strictBounds: this.checked });
        });
}
      fetch(root + "/getData?action=sido")
        .then((response) => response.json())
        .then((data) => makeOption(data));

      function makeOption(data) {
        let sel = document.getElementById("search-sido");
        sel.innerHTML = `<option value="0" selected>검색 할 지역 선택(시/도)</option>`;
        data.forEach((area) => {
          let opt = document.createElement("option");
          opt.setAttribute("value", area.sidoCode);
          opt.appendChild(document.createTextNode(area.sidoName));
          sel.appendChild(opt);
        });
      }
      
      function getGugun(){
    	  let selected = document.getElementById("search-sido");
    	  let code = selected.options[selected.selectedIndex].value;
    	  makeGugun(code);
      }
      
      async function makeGugun(code){
    	  let fetched = await fetch(root + "/getData?action=gugun&code="+code);
          let data = await fetched.json();
          let sel = document.getElementById("search-gugun");
          sel.innerHTML = `<option value="0" selected>검색 할 지역 선택(구/군)</option>`;
          data.forEach((area) => {
            let opt = document.createElement("option");
            opt.setAttribute("value", area.gugunCode);
            opt.appendChild(document.createTextNode(area.gugunName));
            sel.appendChild(opt);
          });
      }

      // 검색 버튼을 누르면..
      // 지역, 유형, 검색어 얻기.
      // 위 데이터를 가지고 공공데이터에 요청.
      // 받은 데이터를 이용하여 화면 구성.
      document.getElementById("btn-search").addEventListener("click", () => {
        let searchUrl = root + "/getData?action=map";

        let sidoCode = document.getElementById("search-sido").value;
        let gugunCode = document.getElementById("search-gugun").value;
        let contentTypeId = document.getElementById("search-content-id").value;
        let keyword = document.getElementById("search-keyword").value;

        if (parseInt(sidoCode)) searchUrl += `&sidoCode=${sidoCode}`;
        if (parseInt(sidoCode)) searchUrl += `&gugunCode=${gugunCode}`;
        if (parseInt(contentTypeId)) searchUrl += `&contentTypeId=${contentTypeId}`;
        if (!keyword) {
          alert("검색어 입력 필수!!!");
          return;
        } else searchUrl += `&keyword=${keyword}`;

        makeList(searchUrl);

      });

      var positions; // marker 배열.
      var points = [];
      var mapTypeControl = new kakao.maps.MapTypeControl();
      var tripData = [];
      var tripSource = [];
      var markers = [];
      
      async function makeList(searchUrl) {
        let fetched = await fetch(searchUrl);
        let trips = await fetched.json();
        document.querySelector("table").setAttribute("style", "display: ;");
        let tripList = ``;
        positions = [];
        tripData = [];
        tripSource = [];
        var bounds = new kakao.maps.LatLngBounds();
        var flag = true;
        trips.forEach(async (area) => {
//        	console.log("여기까지");
//        	console.log(area.overview);
        	flag = false;
          tripList += `
            <tr onclick="moveCenter(${area.latitude}, ${area.longitude});">
              <td><img src="${area.first_image}" width="200px" height="100px"></td>
              <td>${area.title}</td>
            </tr>
          `;

          tripData.push(area);

          let markerInfo = {
            title: area.title,
            latlng: new kakao.maps.LatLng(area.latitude, area.longitude),
            src: area.first_image
          };
          points.push(new kakao.maps.LatLng(area.latitude, area.longitude));
          positions.push(markerInfo);
          displayMarker(bounds);
          
          let elem = markers[markers.length-1];
          elem.info = `<h5>&nbsp;관광지 정보</h5>
                      <div style="padding:10px">
                        <h5>${area.title}</h5>
                        <img src="${area.first_image}" width="200" height="100"/><br>
                        <div>설명 : <br>
                          ${area.overview}
                        </div>
                      </div>`;
          let infowindow = new kakao.maps.InfoWindow({
            content : elem.info,
            removable : true
          })

          //마커에 클릭이벤트를 등록
          kakao.maps.event.addListener(elem, 'click', function(){
            // 마커 위에 인포윈도우를 표시
            infowindow.open(map, elem);
          })
        });
        //console.log(flag);
        if(flag){
        	alert("해당 검색에 해당하는 여행지가 존재하지 않습니다.");
        	return;
        }
        map.setBounds(bounds);
        
//        markers.forEach(async (elem)=>{
//          getSource(elem);
//        });
        document.getElementById("trip-list").innerHTML = tripList;
      }

//      async function getSource(elem){
//        let sourceUrl = `https://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=${tripKey}&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId=${contentid}&contentTypeId=${contenttypeid}&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1`;
//        let fetched = await fetch(sourceUrl);
//        let data = await fetched.json();
//        elem.info = `<h5>&nbsp;관광지 정보</h5>
//                    <div style="padding:10px">
//                      <h5>${elem.title}</h5>
//                      <img src="${elem.src}" width="200" height="100"/><br>
//                      <div>설명 : <br>
//                        ${data.response.body.items.item[0].overview}
//                      </div>
//                    </div>`;
//        let infowindow = new kakao.maps.InfoWindow({
//          content : elem.info,
//          removable : true
//        })
//
//        //마커에 클릭이벤트를 등록
//        kakao.maps.event.addListener(elem, 'click', function(){
//          // 마커 위에 인포윈도우를 표시
//          infowindow.open(map, elem);
//        })
//      }

      // 카카오지도
      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
          level: 5, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      function displayMarker(bounds) {
        //var bounds = new kakao.maps.LatLngBounds();
        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        let marker = new kakao.maps.Marker({
          map: map, // 마커를 표시할 지도
          position: positions[positions.length-1].latlng, // 마커를 표시할 위치
          image: markerImage, // 마커 이미지
          clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
        });
        marker.src = positions[positions.length-1].src;
        marker.title = positions[positions.length-1].title;
        
        markers.push(marker);
        bounds.extend(points[points.length-1]);
      }

      function moveCenter(lat, lng) {
        map.setCenter(new kakao.maps.LatLng(lat, lng));
      }
$(function() {
	  var menu = $("#menu-wrap").offset().top;
	  $(window).scroll(function() {
	    var window = $(this).scrollTop();
	    if(menu <= window) {
	      $("#menu-wrap").addClass("fixed");
	    } else {
	      $("#menu-wrap").removeClass("fixed");
	    }
	  })
	  
	  $("#move").click(function(event){         
          event.preventDefault();
          $('html,body').animate({scrollTop:$(this.hash).offset().top}, 300);
  	  });
});

window.onload = function() {
var btn = document.querySelectorAll("button.modal-custom-button");
var modals = document.querySelectorAll('.modal-custom');
var spans = document.getElementsByClassName("close-modal");

for (var i = 0; i < btn.length; i++) {
    btn[i].onclick = function (e) {
        e.preventDefault();
        modal = document.querySelector(e.target.getAttribute("href"));
        console.log(modal);
        modal.style.display = "block";
    }
    
    spans[i].onclick = function () {
        for (var index in modals) {
            if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
        }
    }
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target.classList.contains('modal-custom')) {
        for (var index in modals) {
            if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
        }
    }
}



var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 스터디룸 주소
var sradr = '서울특별시 강남구 테헤란로 14길 6';

// 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(sradr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var lat = result[0].y; // 위도
			var lng = result[0].x; // 경도
			console.log(lat);
			console.log(lng);
						
		var mapbtn = document.getElementById('map-btn');
		mapbtn.addEventListener("click", function() {
			window.location = "https://map.kakao.com/link/to/"+'스터디룸 이름'+","+lat+","+lng;
		})
						
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div class="map-text">스터디룸 이름</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        
    } 
});    


	
}

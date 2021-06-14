<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br /><br /><br /><br /><br /><br /><br /><br />
	
	<section class="page-section" id="maps">
            <div class="container" >
                <div class="text-center" >
                    <h2 class="section-heading text-uppercase">map</h2>
                    <h3 class="section-subheading text-muted"></h3>
                
                	<div class="d-flex justify-content-center">
					<div id="map" style="width:500px;height:400px;"></div>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8894398a705b31ca6ff56664ec5f5718&libraries=services"></script>
					<script>
					
					// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
					var infowindow = new kakao.maps.InfoWindow({zIndex:1});

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(37.4788642,126.877888), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					var markerPosition  = new kakao.maps.LatLng(37.4788642,126.877888); 

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					
					function validate(f){
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places(); 
					var searchword = f.park.value;
					
					
					// 키워드로 장소를 검색합니다
					ps.keywordSearch(searchword, placesSearchCB); 
 
					// 키워드 검색 완료 시 호출되는 콜백함수 입니다
					function placesSearchCB (data, status, pagination) {
					    if (status === kakao.maps.services.Status.OK) {

					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					        // LatLngBounds 객체에 좌표를 추가합니다
					        var bounds = new kakao.maps.LatLngBounds();

					        for (var i=0; i<data.length; i++) {
					            displayMarker(data[i]);    
					            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
					        }       

					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					        map.setBounds(bounds);
					    } 
					    return true;
					}

					// 지도에 마커를 표시하는 함수입니다
					function displayMarker(place) {
					    
					    // 마커를 생성하고 지도에 표시합니다
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: new kakao.maps.LatLng(place.y, place.x) 
					    		
					    
					    });
					    

					    // 마커에 클릭이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'click', function() {
					        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					       var url = "https://map.kakao.com/link/to/"+place.place_name+","+place.y+","+place.x; 
					       
					        //infowindow.setContent('<div style="padding:5px;font-size:12px;">'+url+'</div>');
					        infowindow.setContent('<a style="font-size:12px" href='+url+'>'+place.place_name+'</a>');
					       	
					        infowindow.open(map, marker);
					        
					    });
					    
							
					
					}
						
					}
					</script>
					</div>
					<br></br>
                </div>
                <div class="container" align="center">
                <form id="mapForm" data-sb-form-api-token="API_TOKEN">
                       	<p>검색어를 입력한 후 물방울 모양의 마커를 누르면 길찾기 페이지로 이동합니다.</p>
                    	<div  style="width:200px;" >
                        <input class="form-control" id="park" type="text" placeholder="공원을 검색해주세요*" data-sb-validations="required" style="text-align:center"/>
                        <div class="invalid-feedback" data-sb-feedback="park:required">A park is required.</div>
                    	<button type="button" onclick="validate(this.form);">검색버튼</button>
                           
                	</div>
				</form>
   				</div>
            </div>
        </section>
        <%@ include file="../include/bottom.jsp" %>
</body>
</html>
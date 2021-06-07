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
					        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					        infowindow.open(map, marker);
					        
					    });
					    
					}
						
					}
					</script>
					</div>
					<br></br>
                </div>
                <!-- * * * * * * * * * * * * * * *-->
                <!-- * * SB Forms map Form * *-->
                <!-- * * * * * * * * * * * * * * *-->
                <!-- This form is pre-integrated with SB Forms.-->
                <!-- To make this form functional, sign up at-->
                <!-- https://startbootstrap.com/solution/map-forms-->
                <!-- to get an API token!-->
                <form id="mapForm" data-sb-form-api-token="API_TOKEN">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- Park input-->
                                <input class="form-control" id="park" type="text" placeholder="공원을 검색해주세요*" data-sb-validations="required" value="공원"/>
                                <div class="invalid-feedback" data-sb-feedback="park:required">A park is required.</div>
                            	<button type="button" onclick="validate(this.form);">검색버튼</button>
                            </div>
                            <div class="form-group">
                                <!-- Email address input-->
                                <input class="form-control" id="email" type="email" placeholder="Your Email *" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea class="form-control" id="message" placeholder="Your Message *" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                        </div>
                    </div>
                    <!-- Submit success message-->
                    <!---->
                    <!-- This is what your users will see when the form-->
                    <!-- has successfully submitted-->
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-white mb-3">
                            <div class="fw-bolder">Form submission successful!</div>
                            To activate this form, sign up at
                            <br />
                            <a href="https://startbootstrap.com/solution/map-forms">https://startbootstrap.com/solution/map-forms</a>
                        </div>
                    </div>
                    <!-- Submit error message-->
                    <!---->
                    <!-- This is what your users will see when there is-->
                    <!-- an error submitting the form-->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    <!-- Submit Button-->
                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase disabled" id="submitButton" type="submit">Send Message</button></div>
                </form>
            </div>
        </section>
</body>
</html>
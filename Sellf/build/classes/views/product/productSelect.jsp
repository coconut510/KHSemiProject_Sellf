<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="product.model.vo.*" import="member.model.vo.*" import="java.util.*"
	%>
<% 
	Product p  = null;
	SellerRate sellerRate = null;
	if(request.getAttribute("productInfo") != null){
		p = (Product)request.getAttribute("productInfo"); 
	}
	if(request.getAttribute("sellerScore") != null){
		sellerRate = ((SellerRate)request.getAttribute("sellerScore"));
	}
	
	//ReviewPageData rpd = (ReviewPageData)request.getAttribute("reviewPageData");
	//ArrayList<UserReview> reviewList = rpd.getReviewList();
	//String pageNavi = rpd.getPageNavi();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- <script src="../../JS/externalJs/jquery-1.4.4.min.js" type="text/javascript"></script> -->
<script src="../../JS/externalJs/jquery.magnify.js" type="text/javascript"></script>
<!-- <script src="../../JS/externalJs/cloud-zoom.1.0.2.js" type="text/javascript"></script> -->
<script>
$(document).ready(function() {
	$('.magnify-image').magnify();
});
</script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 내부 링크건 CSS -->
<link rel="stylesheet"
	href="../../CSS/bootstrap/bootstrap.min.css?ver=1" />
<link rel="stylesheet" href="../../CSS/common/common.css?ver=1" />
<link rel="stylesheet" href="../../CSS/product/productSelect.css?ver=1" />
<link href="../../CSS/externalCss/star.css?ver=1" media="screen" rel="stylesheet" type="text/css">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<!-- 내부 js파일 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="../../JS/bootstrap/bootstrap.min.js?ver=1"></script>

<script src="../../JS/product/productSel.js"></script>
<script type="text/javascript" src="../../JS/externalJs/jquery.raty.js?ver=1"></script>
<script src="../../JS/externalJs/labs.js" type="text/javascript"></script>

<!-- Header 링크파일 -->

<script type="text/javascript" href="../../JS/common/header.js?ver=1"></script>

<!--<link rel="stylesheet" type="text/css" href="../../CSS/common/header.css?ver=1">-->
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<script type="text/javascript" src="../../JS/common/adv.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/header.css">
<link rel="stylesheet" type="text/css" href="../../CSS/common/adv.css">
<link rel="stylesheet" type="text/css"
	href="../../CSS/common/footer.css">
<link rel="stylesheet" type="text/css" href="../../CSS/externalCss/magnify.css">


<title>상품 선택 화면</title>
</head>
<body>
	<center>
		<!--  Wrraper    -->
		<div id="wrapper">
			<!--  Header -->
			<header id="header">
				<%@include file="../../views/common/header.jsp"%>
				<!--  <div id="headerLine">HeadLine1</div>
				<div id="navigator">Navigator</div>
				-->
			</header>
			<section id="content">
			<div id="topLeftLink">
				<a href='/views/main/productList.jsp?orderType=updateOrder&category=<%=p.getProduct_entire_category_sub_id_fk()%>'> <%= p.getProduct_entire_category_main_id_fk()%></a>
				<a href="/index.jsp">홈></a>
			</div>
			<div id="productTitle">
				<h3><%=p.getProduct_name() %></h3><!-- 제목 -->
			</div>
			<div id="productContent">
				<div id="productImage">		
				
					<img src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg" class="magnify-image" data-magnify-src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg" />						
					<!-- <div class="zoom-section">    	  
						<div class="zoom-small-image">
							<a href='../../img/테스트3.JPG' class = 'cloud-zoom' id='zoom1' rel="adjustX: 10, adjustY:-4">
							<img src="../../img/테스트3.JPG" alt='' title="상품 확대" /></a>
						</div>	
						<div class="zoom-desc">
							<a href='../../img/테스트3.JPG' class='cloud-zoom-gallery' title='Red' rel="useZoom: 'zoom1', smallImage: '../../img/테스트3.JPG' ">
								<img class="zoom-tiny-image" src="../../img/테스트3.JPG" style="width:20%;"/>
							</a>
							<a href='../../img/테스트4.JPG' class='cloud-zoom-gallery' title='Blue' rel="useZoom: 'zoom1', smallImage: '../../img/테스트4.JPG'">
								<img class="zoom-tiny-image" src="../../img/테스트4.JPG" style="width:20%;"/>
							</a>
							<a href='../../img/테스트5.JPG' class='cloud-zoom-gallery' title='Blue' rel="useZoom: 'zoom1', smallImage: '../../img/테스트5.JPG' ">
								<img class="zoom-tiny-image" src="../../img/테스트5.JPG" style="width:20%;"/>
							</a>
						</div>				
					</div> -->
					
					<!-- <img	src="../../img/10_tmp_274559c6ec69ab30e666353eabc4f2619208large.jpg" /> -->
				</div>
				<div id="productInfo">
					<div class="hl"></div>
					<div id="sellPriceInfo">
						<div class="infoTitle">
							<span>판매가</span>
						</div>
						<div class="infoContent">
							<div id="priceBox">
								<!--  <div id="beforePrice">
									<s><h4 style="display: inline;">₩78,000</h4></s>
									<div class="infoBox">할인내역</div>
								</div>-->
								<div>
									<h3><%=p.getProduct_price() %></h3>
								</div>
							</div>
							<!-- 할인율 적용됐을때만  
							<div id="discountBox">
								<div id="discountLabel">
									<font color="white" size="4">23%</font>
								</div>
							</div>
							-->

						</div>
					</div>
					<div class="hlLight"></div>
					<div id="sellerInfo">
						<div class="infoTitle">
							<span>판매자 ID</span>
						</div>
						<div class="infoContent">
							<div id="sellerId"><%=p.getProduct_entire_user_entire_id_fk() %></div>
						</div>
					</div>
					<div class="hlLight"></div>
					<div id="sellerStar">
						<div class="infoTitle">
							<span>판매자 평점</span>
						</div>
						<div class="infoContent">
							<div id="sellerStarShow">
								<ul>
									<li class="star"><%if(sellerRate.getAvr()>1){ %>★  <%}else{%>☆<%} %></li>
									<li class="star"><%if(sellerRate.getAvr()>2){ %>★  <%}else{%>☆<%} %></li>
									<li class="star"><%if(sellerRate.getAvr()>3){ %>★  <%}else{%>☆<%} %></li>
									<li class="star"><%if(sellerRate.getAvr()>4){ %>★  <%}else{%>☆<%} %></li>
									<li class="star"><%if(sellerRate.getAvr()>=5){ %>★  <%}else{%>☆<%} %></li>
									<li>(<%=sellerRate.getAvr() %>/5)</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="hlLight"></div>
					<div id="totalPrice">
						<div class="infoTitle">
							<span><strong>총 상품금액</strong></span>
						</div>
						<div class="infoContent">
							<div id="totalPriceInfo">
								<h3><%=p.getProduct_price() %></h3>
							</div>
						</div>
					</div>
					<div class="hl"></div>
					<div id="purchaseBtnGroup">
						<div class="purchaseBtn">
							<div>
								<a href="">위시리스트</a>
							</div>
						</div>
						<div class="purchaseBtn">
							<div>
								<a href="">장바구니</a>
							</div>
						</div>
						<div class="purchaseBtn">
							<div>
								<a href="">바로구매</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="productDetailExplain">
				<ul class="nav nav-tabs">
					<li id="li1" onclick="changeTab(this,tab1);" class="active"><a>상품정보</a></li>
					<li id="li2" onclick='changeTab(this,tab2,"<%=p.getProduct_entire_user_entire_id_fk()%>");'><a>상품후기</a></li>
					<li id="li3" onclick="changeTab(this,tab3);"><a>상품문의</a></li>
					<!-- <li onclick="changeTab(this,tab4);"><a>교환/반품/배송정보</a></li> -->
				</ul>

				<ul style="list-style: none;">
					<li class="tabContents" id="tab1" value="tab1">
						<h3 style="float: left; margin-left: 20px;">상품정보</h3>
						<div id="productStateIconGroup" class="productIconGroup">
							<div id="useState">
								<img class="stateIcon" src="../../img/icoUse_3x_ofrw9u.jpg" />
								<div class="productStateTitle">사용</div>
								<div id="useStateDetail">
									<div id="useStateTitle">
										<h4>상품상태</h4>
									</div>
									<div id="useStateGraph">
										<div id="useStateIcon1" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="useStateIcon2" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="useStateIcon3" class="selectDot"></div>
									</div>
									<div id="useStateText">
										<div id="useStateText1">새상품</div>
										<div id="useStateText2">미사용</div>
										<div id="useStateText3">&nbsp;&nbsp;&nbsp;사용</div>
									</div>
								</div>
							</div>
							<div id="productGradeState" class="productIconGroup">
								<img class="stateIcon"
									src="../../img/icoGradeAplus_3x_fgsqml.jpg" />
								<div class="productStateTitle">A+</div>
								<div id="productGradeDetail">
									<div id="useStateTitle">
										<h4>제품등급</h4>
									</div>
									<div id="productGradeGraph">
										<div id="productGradeIcon1" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productGradeIcon2" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productGradeIcon3" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productGradeIcon4" class="selectDot"></div>
									</div>
									<div id="useStateText">
										<div id="useStateText1">&nbsp;A+급</div>
										<div id="useStateText2">&nbsp;&nbsp;&nbsp;A급</div>
										<div id="useStateText3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B급</div>
										<div id="useStateText3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C급</div>
									</div>
								</div>
							</div>
							<div id="brokenState" class="productIconGroup">
								<img class="stateIcon"
									src="../../img/icoNoBreakage_3x_iev7l3.jpg" />
								<div class="productStateTitle">생활기스</div>
								<div id="brokenStateDetail">
									<div id="useStateTitle">
										<h4>찍힘/깨짐</h4>
									</div>
									<div id="productGradeGraph">
										<div id="productBrokenIcon1" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productBrokenIcon2" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productBrokenIcon3" class="selectDot"></div>
									</div>
									<div id="useStateText">
										<div id="useStateText1">&nbsp;&nbsp;없음</div>
										<div id="useStateText2">&nbsp;&nbsp;약간</div>
										<div id="useStateText3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;심함</div>
									</div>
								</div>
							</div>
							<div id="packageState" class="productIconGroup">
								<img class="stateIcon"
									src="../../img/icoComponentYes_3x_i2j0in.jpg" />
								<div class="productStateTitle">구성품</div>
								<div id="packageStateDetail">
									<div id="useStateTitle">
										<h4>구성품</h4>
									</div>
									<div id="productGradeGraph">
										<div id="productBrokenIcon1" class="noneSelectDot"></div>
										<div class="stateLine"></div>
										<div id="productBrokenIcon2" class="selectDot"></div>
									</div>
									<div id="useStateText">
										<div id="useStateText1">있음</div>
										<div id="useStateText2">&nbsp;&nbsp;&nbsp;&nbsp;없음</div>
									</div>
								</div>
							</div>
							<div id="returnPosibleState" class="productIconGroup">
								<img class="stateIcon" src="../../img/icoReturnC_3x_okkgam.jpg" />
								<div class="productStateTitle">환불 가능 여부</div>
								<div id="returnPosibleStateDetail">
									<div id="useStateTitle">
										<h4>환불가능</h4>
										1. 안전거래가 적용됩니다. <br>
										<br> 2. 구매자가 구매확정한 후 판매자에게 입금처리됩니다. <br>
										<br> 3. 제품 수령일로 부터 3일내 환불 신청 가능합니다. <br>
										<br> 4. 단순 변심 환불의 경우 환불 배송비는 구매자가 부담합니다.
									</div>
								</div>
							</div>
							<div id="deliveryState" class="productIconGroup">
								<img class="stateIcon" src="../../img/icoDeliver_3x_sjwqny.jpg" />
								<div class="productStateTitle">일반택배</div>
								<div id="deliveryStateDetail">
									<div id="useStateTitle">
										<h4>일반택배 배송</h4>

										1. 판매자가 제품을 발송하면 택배사, 송장번호를 안내해드립니다. <br>
										<br> 2. 결제 후 3일내 판매자가 제품을 <br> 발송하지 않으면 <br>
										거래가 자동 취소됩니다.
									</div>
								</div>
							</div>
						</div>
						<hr style="clear: both;">
						<div id="productInfoTextDetail">
							<div id="productUseStateInfoTitle1" class="productInfoTextTitle">상품상태</div>
							<div id="productUseStateInfo1" class="productInfoTextExplain"><%=p.getProduct_detail() %></div>
						</div>
					</li>
					<li class="tabContents" id="tab2" value="tab2">
						<div id="productReview">
							<h3 style="float: left; margin-left: 20px;">상품후기</h3>
							<hr style="clear: both;">
							<!-- 리뷰 통계-->
							 <div id="productReviewAvr">
								<div id="starReview">
									<div class="star">
										<h3><span id="starScore" style="font-size:20;"><%=sellerRate.getAvr() %></span></h3>										
							  				<h1 style="color:#ffd53d; display:inline-block"><%if(sellerRate.getAvr()>1){ %>★  <%}else{%>☆<%} %></h1>
							  				<h1 style="color:#ffd53d; display:inline-block"><%if(sellerRate.getAvr()>2){ %>★  <%}else{%>☆<%} %></h1>
							  				<h1 style="color:#ffd53d; display:inline-block"><%if(sellerRate.getAvr()>3){ %>★  <%}else{%>☆<%} %></h1>
							  				<h1 style="color:#ffd53d; display:inline-block"><%if(sellerRate.getAvr()>4){ %>★  <%}else{%>☆<%} %></h1>
							  				<h1 style="color:#ffd53d; display:inline-block"><%if(sellerRate.getAvr()>=5){ %>★  <%}else{%>☆<%} %></h1>
									  <!--   <span class="star-rating">
									      <img type="radio" name="rating" value="1"><i></i>
									      <input type="radio" name="rating" value="2"><i></i>
									      <input type="radio" name="rating" value="3"><i></i>
									      <input type="radio" name="rating" value="4"><i></i>
									      <input type="radio" name="rating" value="5"><i></i>
									    </span> -->
									    <br><br>
										(<span id="starScore" style="font-size:20;"><%=sellerRate.getTotalCount() %></span> 명이 리뷰함)
									</div>
									
								</div>
							</div>
							<div id="productReviewList">
							
								
								<!-- <div class="reviewerCommnet">
									<div class="imageCircle">
										<img src="../../img/거실.JPG" style="width:100%; height:100%;"/>
									</div>
									<div class="reviewerStarGroup">
										<div class="reivewerId">
											JunSeokDaHatJyo
										</div>
										<div class="reviewerStar">								
											<h3>★★★★☆</h3>
										</div>
									</div>
									<div class="reviewContent">
										<div class="reviewTitle">
										애플 아이패드 프로 10.5인치 256GB WiFi
										</div>
										<div class="reviewComment">
										만족해요.
										</div>
									</div>	
								</div> 
								
							-->	
							</div>
							
							<hr style="clear: both; display:block;">
						</div>
					</li>
					<li class="tabContents" id="tab3" value="tab3">
						<div id="qa">
							<h3 style="float: left; margin-left: 20px;">상품문의</h3>
							<div id="qaBtnBox">
								<div id="qaBtn">상품 문의하기</div>
							</div>
							<hr style="clear: both;">
							<div id="qaContentBox">
								<div id="qaContent">
									상품문의가 없습니다.
								</div>
							</div>
							<hr style="clear: both;">
						</div>
					</li>
					<li class="tabContents" id="tab4">
						<div id="productDetailTap"></div>
					</li>
				</ul>
			</div>
			</section>
			<footer id="footer">
				<!--  <div id="footerTest" style="width: 100%; height: 300px; background-color: green;"></div>-->
				<%@include file="../../views/common/footer.jsp"%> 
			</footer>
		</div>
	</center>

</body>
</html>
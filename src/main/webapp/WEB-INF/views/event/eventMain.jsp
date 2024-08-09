<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title> 이벤트</title>
    
	<!--head 임포트  -->
  	<c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/event.css' />" />
  	<script src="<c:url value='/js/event.js'/>"></script>

  </head>
  <body>
    <div class="All">
      
    <!-- top 임포트 -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />

      event page입니다.
<!-- 
<img src="https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467761_640.jpg"/>
<img src="https://cdn.pixabay.com/photo/2021/04/14/07/03/newborn-6177485_1280.jpg"/>
<img src="https://cdn.pixabay.com/photo/2019/04/10/04/43/baby-4116187_1280.jpg"/>
<img src="https://cdn.pixabay.com/photo/2017/08/06/01/04/people-2587310_1280.jpg"/>
<img src="https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467761_640.jpg"/>
<img src="https://images.unsplash.com/photo-1546074176-abecd33d2b53?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
<img src="https://plus.unsplash.com/premium_photo-1689245691396-9cf66f1594f4?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
<img src="https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467761_640.jpg/">
<img src="https://cdn.pixabay.com/photo/2021/07/15/07/50/newborn-6467761_640.jpg/">
 -->
	<!-- bottom 임포트 -->
    	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    	
    </div>
    
  </body>
</html>

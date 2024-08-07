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

	<!-- bottom 임포트 -->
    	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    	
    </div>
    
  </body>
</html>

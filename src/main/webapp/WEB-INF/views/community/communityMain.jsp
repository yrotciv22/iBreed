<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>커뮤니티</title>
    
	<!--head 임포트  -->
  	<c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/community.css' />" />

  </head>
  <body>
    <div class="All">
      
    <!-- top 임포트 -->
    <c:import url="/WEB-INF/views/layout/top.jsp" />

<div class="Wrap">
      커뮤니티 페이지입니다.테스트테스트!두번째
</div>
	<!-- bottom 임포트 -->
    	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    	
    </div>
    
  </body>
</html>

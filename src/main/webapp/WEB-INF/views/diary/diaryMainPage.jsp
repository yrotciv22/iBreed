<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>My Diary</title>
    
	<!--head 임포트  -->
  	<c:import url="/WEB-INF/views/layout/head.jsp" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/diary_home.css' />" />

  </head>
  <body>
    <div class="all">

	<!--                                                                                                                                                                                                                                                                                                           공통 layout: top.jsp -->
	<c:import url="/WEB-INF/views/layout/top.jsp" />

<div class="Wrap">
      다이어리 메인 화면 (다이어리 홈피 x)
</div>


	<!-- 공통 layout: botton.jsp -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    	
    </div>
    
  </body>
</html>

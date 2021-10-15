<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다이얼로그</title>
</head>
<body>
	<tiles:insertAttribute name="header" ignore="true"></tiles:insertAttribute>
	<div>
		<div>
			<tiles:insertAttribute name="menu" ignore="true"></tiles:insertAttribute>
		</div>
		<div style="width:100%">
			<span style="width:30%; height:1000px">
				<tiles:insertAttribute name="sideMenu" ignore="true"></tiles:insertAttribute>
			</span>
			<span style="width:70%; height:1000px;  text-align:center" >
				<tiles:insertAttribute name="body" ignore="true"></tiles:insertAttribute>
			</span>
		</div>
	</div>
	<tiles:insertAttribute name="footer" ignore="true"></tiles:insertAttribute>
</body>
</html>
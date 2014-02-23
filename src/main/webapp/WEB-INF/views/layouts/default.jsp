<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
    <title>
        <tiles:getAsString name="title"/>
    </title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header" ignore="true"/>
</div>

<div class="wrapper">
    <div class="left-nav">
        <tiles:insertAttribute name="left-nav" ignore="true"/>
    </div>
    <div class="main-content">
        <tiles:insertAttribute name="body" ignore="true"/>
    </div>
</div>
<div class="footer">
    <tiles:insertAttribute name="footer" ignore="true"/>
</div>

</body>
</html>

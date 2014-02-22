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

<tiles:insertAttribute name="header" ignore="true"/>

<tiles:insertAttribute name="body" ignore="true"/>

<tiles:insertAttribute name="footer" ignore="true"/>

</body>
</html>

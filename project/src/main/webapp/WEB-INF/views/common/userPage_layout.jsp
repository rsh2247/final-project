<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
    *{
    margin: 0;
    padding: 0;
    }
      #contain {
        width: 100%;
        text-align:center;
      }
      #header {
        border: 0px solid #bcbcbc;
      }
      #side {
        border: 0px solid #bcbcbc;
        width: 350px;
        background-color: blue;
      }
      #content {
        width: 100%;
        min-height:800px;
        margin:auto;
        float: left;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #353E5C;
        height: 200px;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="contain">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="side">
      	<tiles:insertAttribute name="side" />
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>
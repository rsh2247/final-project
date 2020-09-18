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
      #content {
        width: 100%;
        height:750px;
        margin:auto;
        float: left;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
         background-color: #ddd;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="contain">
      <div id="header">
         <tiles:insertAttribute name="header"/>
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
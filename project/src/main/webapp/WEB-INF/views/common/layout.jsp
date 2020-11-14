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
	box-sizing: border-box;
    }
    *:focus{
    	outline: none;
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
        min-height: 1000px;
        margin:auto;
        padding-bottom: 100px;
        float: left;
      }
      #contentbox{
      	width: 1100px;
      	margin: auto;
      }
      #footer {
      
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #252525;
        height: 250px;
        margin-top: 200px;
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
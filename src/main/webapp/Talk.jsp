<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WebTTS</title>
<link rel="stylesheet" type="text/css" href="css/Style.css"/>
</head>

<body>
	 <div class="box"> 
            <form id="option"  method="post" action="Talking.jsp" >
                <br />
            	<input class="password" type="text" name="TALKTEXT"  placeholder="请输入朗读内容!" />				               
                <br />
                <input class='reset' type="reset" value="重新输入" />
                <input class='submit' type="submit" value="确认朗读" />
            </form>   
    </div>
</body>
</html>

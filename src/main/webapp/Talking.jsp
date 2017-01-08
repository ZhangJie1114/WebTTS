<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.jacob.com.*" %>
<%@ page import="com.jacob.activeX.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>WebTTS</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String talkText = request.getParameter("TALKTEXT");
		talkText = talkText.trim();
		if (talkText.equals("")) {
			out.println("<script>alert('朗读内容不能为空，请重新输入！');window.history.back();</script>");
			return;
		} 
		else{
			ComThread.InitSTA();
			ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");
			Dispatch sapo = sap.getObject();	
			
 			try {
				// 音量 0-100
				sap.setProperty("Volume", new Variant(100));
				// 语音朗读速度 -10 到 +10
				sap.setProperty("Rate", new Variant(-2));
				
				Variant defalutVoice = sap.getProperty("Voice");				
				Dispatch dispdefaultVoice = defalutVoice.toDispatch();
				
				Variant allVoices = Dispatch.call(sapo, "GetVoices");
				Dispatch dispVoices = allVoices.toDispatch();
				
				Dispatch setvoice = Dispatch.call(dispVoices, "Item", new Variant(1)).toDispatch();
		        ActiveXComponent voiceActivex = new ActiveXComponent(dispdefaultVoice);
		        ActiveXComponent setvoiceActivex = new ActiveXComponent(setvoice);				
				Variant item = Dispatch.call(setvoiceActivex, "GetDescription");
				
				// 执行朗读
				Dispatch.call(sapo, "Speak", new Variant(talkText));
 		    } catch (Exception e) {
 		        e.printStackTrace();
 		    } finally {
 		        sapo.safeRelease();
 		        sap.safeRelease();
 		    }
			response.setHeader("refresh", "0,url=Talk.jsp");
		}
	%>		 
</body>
</html>

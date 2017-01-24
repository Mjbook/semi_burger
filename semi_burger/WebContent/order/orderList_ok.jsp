<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="yb.order_list.*"%>
<!DOCTYPE html>
<jsp:useBean id="odto" class="yb.order_list.Order_listDTO" scope="session"/>
<%
ArrayList<Order_listDTO> arr=odto.getOdtos();



%>
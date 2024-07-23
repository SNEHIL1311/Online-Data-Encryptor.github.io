<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="p1.*" %>
<% 
    encrypt e = new encrypt();
    String text = request.getParameter("text");
    String hash = request.getParameter("hash");
    String s = null;
    if(hash.equals("MD5")){
        s = e.mdencrypt(text);
    }
    else if(hash.equals("SHA")){
        s = e.shencrypt(text);
    }
    else if(hash.equals("PBKDF2")){
        s = e.pbencrypt(text);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Encryption Result</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Open_Sans', Open_Sans;
    }
</style>
</head>
<body class="bg-gray-900 text-gray-100">

<div class="container mx-auto mt-12 bg-gray-800 p-8 rounded-lg shadow-lg max-w-md">
    <h1 class="text-center text-gray-100 font-bold bg-gray-700 p-4 rounded-lg text-3xl mb-8">Encryption Result</h1>
    <div class="box bg-gray-700 border border-gray-600 rounded-lg p-6 mb-6">
        <h2 class="text-gray-100 font-bold mb-2">Original Text</h2>
        <p class="text-gray-100 break-all text-lg font-bold"><%=text %></p>
    </div>
    <div class="box bg-gray-700 border border-gray-600 rounded-lg p-6 mb-6">
        <h2 class="text-gray-100 font-bold mb-2">Hash Method</h2>
        <p class="text-gray-100 break-all text-lg font-bold"><%=hash %></p>
    </div>
    <div class="box bg-gray-700 border border-gray-600 rounded-lg p-6">
        <h2 class="text-gray-100 font-bold mb-2">Encoded Message</h2>
        <p class="text-gray-100 break-all text-lg font-bold"><%=s %></p>
    </div>
</div>

</body>
</html>

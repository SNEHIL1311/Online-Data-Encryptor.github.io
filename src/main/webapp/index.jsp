<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
    String[] enc = {"MD5", "SHA", "PBKDF2"};
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Encryption</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'font-serif', font-serif;
    }
  </style>
</head>
<body class="bg-gray-600 text-gray-100">

<div class="container mx-auto mt-12 bg-gray-900 p-8 rounded-lg shadow-lg max-w-md">
  <div class="header text-center mb-8">
    <img src="https://repository-images.githubusercontent.com/313085399/e03b177e-8272-409b-99e4-d822e8b5a0da" alt="Encryption" class="w-24 h-24 mx-auto mb-4 rounded-full">
    <h2 class="text-gray-100 font-bold bg-gray-700 p-4 rounded-lg text-3xl">Online Data Encryptor</h2>
  </div>
 
  <form action="generate.jsp" class="space-y-6">
    <div class="form-group">
      <label for="text" class="block text-gray-100 mb-2">Enter text:</label>
      <input type="text" class="form-control border border-gray-600 bg-gray-700 text-gray-100 rounded-lg p-3 w-full" id="text" placeholder="Enter text" name="text" required>
    </div>
    <div class="form-group">
      <label for="hash" class="block text-gray-100 mb-2">Select Encryption Type:</label>
      <select class="form-control border border-gray-600 bg-gray-700 text-gray-100 rounded-lg p-3 w-full" name="hash">
        <% for(int i=0; i<enc.length; i++){ %>
            <option value="<%=enc[i] %>"><%=enc[i] %></option>
        <% } %>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" class="btn bg-gray-700 text-gray-100 rounded-lg py-2 px-6 font-bold hover:bg-gray-600">Generate</button>
    </div>
  </form>
</div>

<footer class="text-center mt-8 text-gray-500">
  <p>&copy; 2024 Online Data Encryptor. All rights reserved.</p>
</footer>

</body>
</html>

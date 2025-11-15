<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hotel.model.Room" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Rooms</title>
</head>
<body>
<h1>Rooms</h1>

<%
    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
    if (rooms == null) {
%>
    <p>No rooms available.</p>
<%
    } else {
%>
    <table border="1" cellpadding="6">
        <tr><th>ID</th><th>Number</th><th>Type</th><th>Price</th><th>Action</th></tr>
    <%
        for (Room r : rooms) {
    %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getRoomNumber() %></td>
            <td><%= r.getType() %></td>
            <td><%= r.getPrice() %></td>
            <td>
                <form action="<%= request.getContextPath() %>/rooms/<%= r.getId() %>/delete" method="post" style="display:inline">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    <%
        }
    %>
    </table>
<%
    }
%>

<h2>Add Room</h2>
<form action="<%= request.getContextPath() %>/rooms" method="post">
    Room Number: <input type="text" name="roomNumber" required /><br>
    Type: <input type="text" name="type" required /><br>
    Price: <input type="number" step="0.01" name="price" required /><br>
    <button type="submit">Add</button>
</form>

</body>
</html>

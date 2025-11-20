<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.hotel.model.Room" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Room Dashboard</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* GENERAL */
        :root {
            --glass-bg: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.25);
            --accent: #00e5ff;
            --text: #fff;
        }

        body.light {
            --glass-bg: rgba(255, 255, 255, 0.35);
            --glass-border: rgba(0, 0, 0, 0.1);
            --accent: #007fff;
            --text: #000;
            background: linear-gradient(135deg, #ffffff, #e6e9ef);
            color: black !important;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0b0f18, #141a2b);
            color: var(--text);
            overflow-x: hidden;
        }

        /* PARTICLES */
        #particles {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        /* TOP NAV */
        .top-nav {
            width: 100%;
            padding: 18px 40px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--glass-border);
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
        }

        .title {
            font-size: 28px;
            font-weight: 600;
        }

        /* Light/Dark toggle */
        .toggle-btn {
            padding: 10px 18px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            background: var(--accent);
            color: black;
            font-weight: 600;
            transition: 0.3s;
        }

        .toggle-btn:hover {
            transform: scale(1.08);
            box-shadow: 0 0 12px var(--accent);
        }

        /* RIGHT SIDEBAR */
        .sidebar {
            position: fixed;
            top: 70px;
            right: 20px;
            width: 240px;
            background: var(--glass-bg);
            backdrop-filter: blur(18px);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.5);
            transition: transform 0.3s;
        }

        .sidebar:hover {
            transform: translateY(-6px);
        }

        .sidebar h3 {
            margin-top: 0;
            font-weight: 600;
        }

        .stats-card {
            margin: 12px 0;
            padding: 14px;
            background: var(--glass-bg);
            border-radius: 14px;
            border: 1px solid var(--glass-border);
            transition: 0.25s;
        }

        .stats-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px var(--accent);
        }

        /* MAIN CONTENT */
        .main {
            width: 75%;
            margin: auto;
            margin-top: 120px;
        }

        /* TABLE BOX */
        .table-box {
            background: var(--glass-bg);
            padding: 25px;
            border-radius: 18px;
            backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            box-shadow: 0 10px 40px rgba(0,0,0,0.4);
            margin-bottom: 40px;
            transition: 0.3s;
        }

        .table-box:hover {
            transform: translateY(-6px);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: var(--text);
        }

        th, td {
            padding: 14px;
            text-align: center;
        }

        tr {
            transition: 0.25s;
        }

        tr:hover {
            background: rgba(255,255,255,0.12);
            transform: scale(1.01);
        }

        /* BUTTONS */
        .delete-btn {
            background: #ff3d6b;
            border: none;
            padding: 8px 20px;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.25s;
        }

        .delete-btn:hover {
            background: #ff174f;
            box-shadow: 0 0 12px #ff174f;
            transform: scale(1.1);
        }

        .add-room-btn {
            background: var(--accent);
            padding: 12px 26px;
            color: black;
            border-radius: 10px;
            cursor: pointer;
            border: none;
            font-weight: 600;
            transition: 0.25s;
            margin-bottom: 20px;
        }

        .add-room-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 0 12px var(--accent);
        }

        /* POPUP MODAL */
        .modal-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(6px);
            background: rgba(0,0,0,0.5);
            display: none;
            align-items: center;
            justify-content: center;
        }

        .modal {
            width: 350px;
            background: var(--glass-bg);
            border-radius: 18px;
            padding: 25px;
            backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            box-shadow: 0 15px 40px rgba(0,0,0,0.5);
            animation: pop 0.3s ease;
        }

        @keyframes pop {
            from { transform: scale(0.7); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        input {
            width: 92%;
            padding: 12px;
            margin-bottom: 12px;
            border-radius: 10px;
            border: none;
            background: rgba(255,255,255,0.25);
            color: var(--text);
        }

        .modal-btn {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: none;
            background: var(--accent);
            font-weight: 600;
            cursor: pointer;
            color: black;
            transition: 0.3s;
        }

        .modal-btn:hover {
            transform: scale(1.05);
        }

        .close-btn {
            text-align: center;
            margin-top: 10px;
            cursor: pointer;
            color: var(--accent);
        }
    </style>
</head>

<body>

<canvas id="particles"></canvas>

<!-- TOP NAVBAR -->
<div class="top-nav">
    <div class="title">Luxury Room Dashboard</div>
    <button class="toggle-btn" onclick="toggleMode()">Light/Dark</button>
</div>

<!-- RIGHT SIDEBAR -->
<div class="sidebar tilt">
    <h3>Statistics</h3>
    <div class="stats-card">Total Rooms:
        <%
            List<Room> listRooms = (List<Room>) request.getAttribute("rooms");
            out.print(listRooms != null ? listRooms.size() : 0);
        %>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="main">

    <button class="add-room-btn" onclick="openAddRoom()">+ Add Room</button>

    <!-- TABLE -->
    <div class="table-box tilt">
        <%
            List<Room> rooms = (List<Room>) request.getAttribute("rooms");
            if (rooms == null || rooms.isEmpty()) {
        %>
            <p>No rooms available.</p>
        <%
            } else {
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Number</th>
                <th>Type</th>
                <th>Price</th>
                <th>Action</th>
            </tr>

            <%
                for (Room r : rooms) {
            %>
                <tr onclick="">
                    <td><%= r.getId() %></td>
                    <td><%= r.getRoomNumber() %></td>
                    <td><%= r.getType() %></td>
                    <td><%= r.getPrice() %></td>
                    <td>
                        <button class="delete-btn" onclick="confirmDelete(<%= r.getId() %>)">Delete</button>
                    </td>
                </tr>
            <%
                }
            %>
        </table>

        <%
            }
        %>
    </div>

</div>

<!-- ADD ROOM POPUP -->
<div class="modal-bg" id="addRoomModal">
    <div class="modal">
        <h3>Add Room</h3>
        <form action="<%= request.getContextPath() %>/rooms" method="post">
            <input type="text" name="roomNumber" placeholder="Room Number" required>
            <input type="text" name="type" placeholder="Type" required>
            <input type="number" step="0.01" name="price" placeholder="Price" required>
            <button type="submit" class="modal-btn">Add Room</button>
        </form>
        <div class="close-btn" onclick="closeAddRoom()">Cancel</div>
    </div>
</div>

<!-- DELETE CONFIRM MODAL -->
<div class="modal-bg" id="deleteModal">
    <div class="modal">
        <h3>Delete Room?</h3>
        <form id="deleteForm" method="post">
            <button class="modal-btn">Confirm Delete</button>
        </form>
        <div class="close-btn" onclick="closeDelete()">Cancel</div>
    </div>
</div>

<script>
    /* LIGHT/DARK MODE */
    function toggleMode() {
        document.body.classList.toggle("light");
    }

    /* ADD ROOM POPUP */
    function openAddRoom() {
        document.getElementById("addRoomModal").style.display = "flex";
    }
    function closeAddRoom() {
        document.getElementById("addRoomModal").style.display = "none";
    }

    /* DELETE CONFIRM */
    function confirmDelete(id) {
        const form = document.getElementById("deleteForm");
        form.action = "<%= request.getContextPath() %>/rooms/" + id + "/delete";
        document.getElementById("deleteModal").style.display = "flex";
    }
    function closeDelete() {
        document.getElementById("deleteModal").style.display = "none";
    }

    /* PARTICLES */
    const canvas = document.getElementById("particles");
    const ctx = canvas.getContext("2d");
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    let particles = [];
    for (let i = 0; i < 40; i++) {
        particles.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height,
            r: Math.random() * 3 + 1,
            dx: (Math.random() - 0.5) * 0.8,
            dy: (Math.random() - 0.5) * 0.8
        });
    }

    function animateParticles() {
        ctx.clearRect(0,0,canvas.width,canvas.height);
        particles.forEach(p => {
            ctx.beginPath();
            ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
            ctx.fillStyle = "rgba(0,229,255,0.6)";
            ctx.fill();
            p.x += p.dx;
            p.y += p.dy;
            if (p.x < 0 || p.x > canvas.width) p.dx *= -1;
            if (p.y < 0 || p.y > canvas.height) p.dy *= -1;
        });
        requestAnimationFrame(animateParticles);
    }
    animateParticles();
</script>

</body>
</html>

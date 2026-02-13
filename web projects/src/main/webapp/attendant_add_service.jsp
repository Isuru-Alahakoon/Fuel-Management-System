<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Service | Sri Drive</title>
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --warning: #f72585;
    }
    
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    }
    
    body {
        background-color: #f5f7fa;
        color: var(--dark);
    }
    
    .content {
        width: calc(100vw - 230px);
        margin-left: 230px;
        display: flex;
        height: 100vh;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    
    .main {
        width: 100%;
        max-width: 600px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 40px;
        animation: fadeIn 0.5s ease;
    }
    
    .main h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
    }
    
    .station-id {
        background-color: var(--primary);
        color: white;
        padding: 8px 15px;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 20px;
        font-size: 0.9rem;
        font-weight: 500;
    }
    
    form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    label {
        font-weight: 500;
        color: var(--dark);
        font-size: 0.95rem;
    }
    
    input[type="text"],
    input[type="number"],
    input[type="datetime-local"],
    select {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="datetime-local"]:focus,
    select:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
    }
    
    button {
        background-color: var(--primary);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 1rem;
        margin-top: 10px;
        width: 100%;
    }
    
    button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    @media (max-width: 768px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        .main {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

    <%@include file = "attendant_sidebar.jsp" %>
    
    <%String stationId = request.getParameter("station_id"); %>
    
    <div class="content">
        <div class="main">
            <h1>Add New Service</h1>
            
            <form action="attendant_add_servicePurchase" method="post">
                <input type="hidden" name="st_id" value="<%=stationId %>">
                
                <div class="form-group">
                    <label for="cus_name">Customer Name</label>
                    <input type="text" name="cus_name" id="cus_name">
                </div>
                
                <div class="form-group">
                    <label for="cus_mobile">Customer Mobile</label>
                    <input type="text" name="cus_mobile" id="cus_mobile">
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" name="description" id="description">
                </div>
                
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" name="price" id="price" step="0.01">
                </div>
                
                <div class="form-group">
                    <label for="pay_method">Payment Method</label>
                    <select name="pay_method" id="pay_method">
                        <option value="cash">Cash</option>
                        <option value="card">Card</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="status">Status</label>
                    <select name="status" id="status" required>
                        <option value="completed">Completed</option>
                        <option value="pending">Pending</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="date_time">Date Time</label>
                    <input type="datetime-local" name="date_time" id="date_time">
                </div>
                
                <button type="submit">SAVE SERVICE</button>
            </form>
        </div>
    </div>
    
    <script>
    document.querySelector("form").addEventListener("submit", function(event) {
        const name = document.getElementById("cus_name").value.trim();
        const mobile = document.getElementById("cus_mobile").value.trim();
        const description = document.getElementById("description").value.trim();
        const price = parseFloat(document.getElementById("price").value.trim());
        const dateTime = document.getElementById("date_time").value;

        // Customer Name
        if (name === "") {
            alert("Customer name is required.");
            event.preventDefault();
            return;
        }

        // Mobile Number - digits only, 10 characters (adjust as needed)
        if (mobile === "" || isNaN(mobile) || mobile.length !== 10) {
            alert("Please enter a valid 10-digit mobile number.");
            event.preventDefault();
            return;
        }

        // Description
        if (description === "") {
            alert("Please enter a description.");
            event.preventDefault();
            return;
        }

        // Price
        if (isNaN(price) || price <= 0) {
            alert("Please enter a valid, positive price.");
            event.preventDefault();
            return;
        }

        // Date-Time - must not be in the past
        const selectedDate = new Date(dateTime);
        const now = new Date();
        if (!dateTime || selectedDate < now) {
            alert("Please select a valid future date and time.");
            event.preventDefault();
            return;
        }
    });
</script>
    

</body>
</html>
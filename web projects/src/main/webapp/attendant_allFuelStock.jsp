<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fuel Stock Management | Sri Drive</title>
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
        display: flex;
        width: calc(100vw - 230px);
        margin-left: 230px;
        justify-content: center;
        padding: 30px;
        min-height: 100vh;
    }
    
    .main {
        width: 100%;
        max-width: 1200px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
    }
    
    h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #e0e0e0;
    }
    
    th {
        background-color: var(--primary);
        color: white;
        font-weight: 500;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 0.5px;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #f1f5fe;
    }
    
    button {
        background-color: var(--primary);
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 0.9rem;
    }
    
    button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
    }
    
    .status-indicator {
        display: inline-block;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        margin-right: 8px;
    }
    
    .status-available {
        background-color: #4ade80;
    }
    
    .status-low {
        background-color: #fbbf24;
    }
    
    .status-out {
        background-color: #f87171;
    }
    
    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    
    .search-box {
        padding: 10px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        width: 250px;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }
    
    .search-box:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
    }
    
    .no-results {
        text-align: center;
        padding: 20px;
        color: #666;
        font-style: italic;
        display: none;
    }
    
    @media (max-width: 768px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        table {
            display: block;
            overflow-x: auto;
        }
        
        .table-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }
        
        .search-box {
            width: 100%;
        }
    }
</style>
</head>
<body>

    <%@include file = 'attendant_sidebar.jsp' %>

    <div class="content">
        <div class="main">
            <div class="table-header">
                <h1>Fuel Stock Management</h1>
                <input type="text" class="search-box" placeholder="Search fuel type..." id="searchInput">
            </div>
            
            <table id="fuelTable">
                <thead>
                    <tr>
                        <th>Fuel Type</th>
                        <th>Amount (Liters)</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="fuelTableBody">
                    <c:forEach var="fs" items="${fs}">
                    <tr>
                        <td>${fs.fuel_type}</td>
                        <td>${fs.fuel_amount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${fs.fuel_amount > 1000}">
                                    <span class="status-indicator status-available"></span>In Stock
                                </c:when>
                                <c:when test="${fs.fuel_amount > 200 && fs.fuel_amount <= 1000}">
                                    <span class="status-indicator status-low"></span>Low Stock
                                </c:when>
                                <c:otherwise>
                                    <span class="status-indicator status-out"></span>Out of Stock
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="attendant_edit_fuelAmount.jsp?stockid=${fs.stock_id}&amount=${fs.fuel_amount}&fuelid=${fs.fuel_id}">
                                <button>Update Stock</button>
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="no-results" id="noResults">
                No matching fuel types found.
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const tableBody = document.getElementById('fuelTableBody');
            const rows = tableBody.getElementsByTagName('tr');
            const noResults = document.getElementById('noResults');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                let hasResults = false;
                
                for (let i = 0; i < rows.length; i++) {
                    const fuelTypeCell = rows[i].getElementsByTagName('td')[0];
                    const fuelType = fuelTypeCell.textContent.toLowerCase();
                    
                    if (fuelType.includes(searchTerm)) {
                        rows[i].style.display = '';
                        hasResults = true;
                    } else {
                        rows[i].style.display = 'none';
                    }
                }
                
                
                if (hasResults || searchTerm === '') {
                    noResults.style.display = 'none';
                } else {
                    noResults.style.display = 'block';
                }
            });
            
            
            searchInput.addEventListener('keyup', function() {
                const visibleRows = tableBody.querySelectorAll('tr[style=""]');
                visibleRows.forEach((row, index) => {
                    row.style.animation = `fadeIn 0.3s ease ${index * 0.1}s forwards`;
                    row.style.opacity = '0';
                });
            });
        });
    </script>

    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

</body>
</html>
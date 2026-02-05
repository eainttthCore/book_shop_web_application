<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, java.text.DecimalFormat" %>
<%@ page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // Get the ordered items from request (set by CheckoutServlet)
    @SuppressWarnings("unchecked")
    List<controller.CheckoutServlet.OrderedItem> orderedItems = 
        (List<controller.CheckoutServlet.OrderedItem>) request.getAttribute("orderedItems");
    User user = (User) request.getAttribute("user");
    
    // Check if this is a payment success scenario
    Boolean paymentSuccess = (Boolean) request.getAttribute("paymentSuccess");
    String paidOrderId = (String) request.getAttribute("orderId");
    
    if (orderedItems == null || orderedItems.isEmpty()) {
        // If no ordered items found and no payment success, redirect to cart
        if (paymentSuccess == null || !paymentSuccess) {
            response.sendRedirect("cart.jsp");
            return;
        }
    }
    
    // Business information
    String businessName = "Online Book Store";
    String address = "123 Book Street, Reading City, Myanmar";
    String telephone = "09-123-456-789";
    
    // Receipt data
    String receiptDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
    String receiptTime = new SimpleDateFormat("HH:mm").format(new Date());
    
    // Calculate totals (no tax)
    double total = 0;
    if (orderedItems != null) {
        for (controller.CheckoutServlet.OrderedItem item : orderedItems) {
            total += item.getTotal();
        }
    }
    
    DecimalFormat df = new DecimalFormat("#0.00");
    
    // Generate receipt number or order ID
    String receiptNumber = "OBS" + String.valueOf(System.currentTimeMillis()).substring(7);
    String orderId = paidOrderId != null ? paidOrderId : receiptNumber;
    
    // Check for error messages
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Receipt - Online Book Store</title>
    <style>
        body {
            font-family: 'Courier New', monospace;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .receipt-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        
        .receipt {
            background-color: white;
            width: 350px;
            padding: 25px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            position: relative;
            border-radius: 8px;
        }
        
        .receipt::before {
            content: '';
            position: absolute;
            top: -5px;
            left: 0;
            right: 0;
            height: 10px;
            background: linear-gradient(45deg, transparent 5px, white 5px, white 10px, transparent 10px),
                        linear-gradient(-45deg, transparent 5px, white 5px, white 10px, transparent 10px);
            background-size: 15px 10px;
        }
        
        .receipt::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            right: 0;
            height: 10px;
            background: linear-gradient(45deg, transparent 5px, white 5px, white 10px, transparent 10px),
                        linear-gradient(-45deg, transparent 5px, white 5px, white 10px, transparent 10px);
            background-size: 15px 10px;
        }
        
        .receipt-header {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .receipt-title {
            font-size: 28px;
            font-family: 'Georgia', serif;
            margin-bottom: 10px;
            color: #2c3e50;
            font-weight: bold;
        }
        
        .business-info {
            font-size: 12px;
            line-height: 1.5;
            color: #555;
            margin-bottom: 10px;
        }
        
        .receipt-number {
            font-size: 11px;
            color: #777;
            text-align: center;
            margin-bottom: 15px;
        }
        
        .divider {
            border-top: 1px dashed #333;
            margin: 15px 0;
        }
        
        .receipt-date {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            margin-bottom: 15px;
            color: #333;
        }
        
        .customer-info {
            font-size: 12px;
            margin-bottom: 15px;
            color: #555;
        }
        
        .customer-info strong {
            color: #333;
        }
        
        .items-section {
            margin-bottom: 15px;
        }
        
        .items-header {
            display: flex;
            justify-content: space-between;
            font-weight: bold;
            font-size: 11px;
            border-bottom: 1px solid #333;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        
        .item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 11px;
            line-height: 1.3;
        }
        
        .item-details {
            flex: 1;
            margin-right: 10px;
        }
        
        .item-name {
            font-weight: bold;
            color: #2c3e50;
        }
        
        .item-author {
            color: #666;
            font-style: italic;
            font-size: 10px;
        }
        
        .item-qty-price {
            text-align: right;
            min-width: 80px;
            color: #333;
        }
        
        .item-total {
            text-align: right;
            min-width: 60px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .totals-section {
            border-top: 1px dashed #333;
            padding-top: 10px;
        }
        
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-size: 12px;
        }
        
        .grand-total {
            font-size: 16px;
            font-weight: bold;
            border-top: 2px solid #333;
            border-bottom: 2px solid #333;
            padding: 12px 0;
            margin: 15px 0;
            color: #2c3e50;
        }
        
        .thank-you {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #666;
            line-height: 1.4;
        }
        
        .actions {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: #3498db;
            color: white;
        }
        
        .btn-primary:hover {
            background: #2980b9;
            color: white;
        }
        
        .btn-success {
            background: #27ae60;
            color: white;
        }
        
        .btn-success:hover {
            background: #219a52;
            color: white;
        }
        
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 6px;
            border: 1px solid #c3e6cb;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 15px;
            border-radius: 6px;
            border: 1px solid #f5c6cb;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .payment-form {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 20px;
            width: 350px;
        }
        
        .payment-form h3 {
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .payment-summary {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        
        .payment-summary .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        
        .payment-summary .total-row {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            font-weight: bold;
        }
        
        @media print {
            body {
                background-color: white;
                padding: 0;
            }
            .receipt {
                box-shadow: none;
                border: none;
            }
            .actions, .payment-form {
                display: none;
            }
        }
    </style>
    <script>
        function printReceipt() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="receipt-container">
        <% if (errorMessage != null) { %>
            <div class="error-message">
                <strong>⚠ Error:</strong> <%= errorMessage %>
            </div>
        <% } %>
        
        <% if (paymentSuccess != null && paymentSuccess) { %>
            <div class="success-message">
                <strong>✓ Payment Successful!</strong><br>
                Your payment has been processed and your order is confirmed.
            </div>
        <% } else if (orderedItems != null && !orderedItems.isEmpty()) { %>
            <!-- Payment Form - shown before payment is made -->
            <div class="payment-form">
                <h3>Complete Your Payment</h3>
                
                <div class="payment-summary">
                    <div class="summary-row total-row">
                        <span>Total Amount:</span>
                        <span><%= df.format(total) %> MMK</span>
                    </div>
                </div>
                
                <form action="PaymentServlet" method="post">
                    <input type="hidden" name="orderId" value="<%= orderId %>">
                    <input type="hidden" name="totalAmount" value="<%= df.format(total) %>">
                    
                    <div class="form-group">
                        <label for="paymentMethod">Select Payment Method:</label>
                        <select name="paymentMethod" id="paymentMethod" required>
                            <option value="">Choose payment method...</option>
                           <!--  <option value="credit_card">Credit Card</option>
                            <option value="debit_card">Debit Card</option>
                            <option value="mobile_banking">Mobile Banking</option> -->
                            <option value="cash_on_delivery">Cash on Delivery</option>
                            <option value="bank_transfer">Bank Transfer</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-success" style="width: 100%;">
                        Process Payment - <%= df.format(total) %> MMK
                    </button>
                </form>
            </div>
        <% } %>
        
        <% if ((paymentSuccess != null && paymentSuccess) || (orderedItems != null && !orderedItems.isEmpty())) { %>
        <div class="receipt">
            <!-- Receipt Header -->
            <div class="receipt-header">
                <div class="receipt-title">ORDER RECEIPT</div>
                <div class="business-info">
                    <%= businessName %><br>
                    <%= address %><br>
                    Tel: <%= telephone %>
                </div>
                <div class="receipt-number">Receipt #: <%= orderId %></div>
            </div>
            
            <div class="divider"></div>
            
            <!-- Date and Time -->
            <div class="receipt-date">
                <span><strong>Date:</strong> <%= receiptDate %></span>
                <span><strong>Time:</strong> <%= receiptTime %></span>
            </div>
            
            <!-- Customer Information -->
            <% if (user != null) { %>
            <div class="customer-info">
                <strong>Customer:</strong> <%= user.getUname() %><br>
                <strong>Email:</strong> <%= user.getUemail() %><br>
                <strong>Phone:</strong> <%= user.getUmobile() %><br>
                <strong>Address:</strong> <%= user.getAddress() %>
            </div>
            <% } %>
            
            <div class="divider"></div>
            
            <!-- Items Header -->
            <div class="items-header">
                <span>ITEM</span>
                <span>QTY × PRICE</span>
                <span>TOTAL</span>
            </div>
            
            <!-- Items Section -->
            <% if (orderedItems != null) { %>
            <div class="items-section">
                <% 
                int itemCount = 1;
                for (controller.CheckoutServlet.OrderedItem item : orderedItems) { 
                %>
                    <div class="item">
                        <div class="item-details">
                            <div class="item-name"><%= item.getBname() %></div>
                           <%--  <div class="item-author">by <%= item.getBauthor() != null ? item.getBauthor() : "Unknown Author" %></div>
                            <div class="item-author">Category: <%= item.getCategory() %></div> --%>
                        </div>
                        <div class="item-qty-price">
                            <%= item.getQuantity() %> × <%= df.format(item.getPrice()) %>
                        </div>
                        <div class="item-total">
                            <%= df.format(item.getTotal()) %>
                        </div>
                    </div>
                <% 
                    itemCount++;
                } 
                %>
            </div>
            <% } %>
            
            <div class="divider"></div>
            
            <!-- Grand Total -->
            <div class="grand-total">
                <div style="display: flex; justify-content: space-between;">
                    <span>TOTAL AMOUNT</span>
                    <span><%= df.format(total) %> MMK</span>
                </div>
            </div>
            
           <%--  <!-- Totals Breakdown -->
            <div class="totals-section">
                <div class="total-row">
                    <strong>
                        <span>Final Total:</span>
                        <span><%= df.format(total) %> MMK</span>
                    </strong>
                </div>
            </div> --%>
            
            <% if (paymentSuccess != null && paymentSuccess) { %>
                <div class="divider"></div>
                <div class="total-row">
                    <strong>
                        <span>Payment Status:</span>
                        <span style="color: #27ae60;">PAID</span>
                    </strong>
                </div>
                <div class="total-row">
                    <span>Payment Method:</span>
                    <span><%= request.getAttribute("paymentMethod") %></span>
                </div>
            <% } %>
            
            <div class="thank-you">
                <strong>Thank you for your order!</strong><br>
                <% if (paymentSuccess != null && paymentSuccess) { %>
                    Your books will be delivered within 3-5 business days.<br>
                <% } else { %>
                    Please complete your payment to confirm the order.<br>
                <% } %>
                For any inquiries, please contact us at <%= telephone %>
            </div>
        </div>
        <% } %>
        
        <!-- Action Buttons -->
        <% if (paymentSuccess != null && paymentSuccess) { %>
        <div class="actions">
            <button class="btn btn-primary" onclick="printReceipt()">Print Receipt</button>
            <a href="userHome.jsp" class="btn btn-success">Continue Shopping</a>
        </div>
        <% } %>
    </div>
</body>
</html>
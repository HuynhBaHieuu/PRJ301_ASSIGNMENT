<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Đặt Hàng Thành Công</title>
    <style>
        .success-container {
            max-width: 420px;
            margin: 80px auto 60px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.09);
            padding: 38px 28px 32px 28px;
            text-align: center;
        }
        .success-icon {
            font-size: 3.5rem;
            color: #009045;
            margin-bottom: 12px;
        }
        .success-title {
            color: #009045;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .success-message {
            font-size: 1.1rem;
            color: #222;
            margin-bottom: 28px;
        }
        .success-btn {
            display: inline-block;
            padding: 10px 28px;
            background: #009045;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            transition: background 0.2s;
        }
        .success-btn:hover {
            background: #007a38;
        }
    </style>
</head>
<body>

<div class="success-container">
    <div class="success-icon"><i class="fa fa-check-circle"></i></div>
    <div class="success-title">Đặt hàng thành công!</div>
    <div class="success-message">Đơn hàng của bạn đã được ghi nhận.<br>Cảm ơn bạn đã mua sắm tại Nông Sản Tương Lai.</div>
    <a href="../home" class="success-btn">Tiếp tục mua hàng</a>
</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</body>
</html>

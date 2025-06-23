<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHÍNH SÁCH VẬN CHUYỂN</title>
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" href="../css/footer.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>

        <div style="margin: 50px 0;">
            <div style="width: 1250px;margin:0 auto;">
                <p style="font-size: 25px;">CHÍNH SÁCH VẬN CHUYỂN, GIAO NHẬN</p>
                <p style="font-size: 35px;font-weight: bold;margin-top: 50px;">1. Giao Hàng Tận Nhà Tại Đà Nẵng</p>
                <p style="font-size: 17px;">Cửa hàng Nông Sản Tương Lai giao hàng tận nhà cho quý khách hàng có địa chỉ tại Đà Nẵng. Phí giao hàng được áp dụng theo biểu phí đang hiện hành của Nông Sản Tương Lai.</p>

                <table cellspacing="0" cellpadding="0" border="1" class="van-chuyen-tb" style="width: 100%;height: 600px;font-size: 20px;margin-top: 40px;">
                    <tbody>
                        <tr style="background-color: #C8C8C8;">
                            <td style="text-align:center"><strong>Giá trị đơn hàng</strong></td>
                            <td style="text-align:center"><strong>Khu vực 1</strong></td>
                            <td style="text-align:center"><strong>Khu vực 2</strong></td>
                            <td style="text-align:center"><strong>Khu vực 3</strong></td>
                        </tr>

                        <tr>
                            <td style="text-align:center">&lt; 200.000 VNĐ</td>
                            <td style="text-align:center">15.000</td>
                            <td style="text-align:center">20.000</td>
                            <td rowspan="4" colspan="1" style="text-align:center">Theo phí bưu điện, gửi chành</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">200.000 VNĐ</td>
                            <td style="text-align:center">Free</td>
                            <td style="text-align:center">15.000</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">400.000 VNĐ</td>
                            <td style="text-align:center">Free</td>
                            <td style="text-align:center">Free</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">600.000 VNĐ</td>
                            <td style="text-align:center">Free</td>
                            <td style="text-align:center">Free</td>
                        </tr>

                        <tr>
                            <td rowspan="5" colspan="1">
                                <p style="text-align: center;">Khu vực</p>
                            </td>
                            <td style="text-align:center">Cẩm Lệ</td>
                            <td rowspan="5" colspan="1" style="text-align:center">Liên Chiểu</td>
                            <td rowspan="5" colspan="1" style="text-align:center">Hòa Vang<br>Hoàng Sa<br>Tỉnh khác</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">Hải Châu</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">Thanh Khuê</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">Ngũ Hành Sơn</td>
                        </tr>

                        <tr>
                            <td style="text-align:center">Sơn Trà</td>
                        </tr>
                    </tbody>
                </table>

                <p style="font-size: 35px;font-weight: bold;margin-top: 50px;">2. Đơn Hàng Ngoại Thành TP. Đà Nẵng</p>
                <p style="text-align: justify;font-size: 20px;">+ <em>Đơn hàng nhẹ, không cồng kềnh</em>: Với các đơn hàng nhỏ gọn và nhẹ, Cửa hàng Nông Sản Tương Lai sẽ tiến hành gửi hàng qua bưu điện hoặc đơn vị giao nhận hàng (logistics). Phí giao hàng sẽ báo quý khách hàng trước khi đơn hàng được giao đi.</p>
                <p style="text-align: justify;font-size: 20px;">+ <em>Đơn hàng cồng kềnh, nặng</em>: Với các mặt hàng nặng và cồng kềnh, Cửa hàng Nông Sản Tương Lai sẽ gửi hàng qua chành xe hoặc đơn vị vận tải. Phí gửi hàng qua chành bên khách hàng tự thanh toán khi nhận hàng.</p>
            </div>
	</div>

        <%@ include file="../design/footer.jsp" %>

    </body>
</html>

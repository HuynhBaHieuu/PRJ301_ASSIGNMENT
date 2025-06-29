<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIÊN HỆ</title>
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" href="../css/footer.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <style>
            .submit{
                height: 40px;
                background-color: #FBD947;
                border: #FBD947;
                border-radius: 3px;
                font-size: 17px;
            }
            .submit:hover{
                background-color: #FFEF4E;
            }
        </style>
    </head>
    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>
        
        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><span class="current">Thông tin liên hệ</span></li>
                </ul>
            </div>
        </section>

        <style>
            .breadcrumb-section {
                padding: 12px 30px;
                font-family: Arial, sans-serif;
                border-radius: 6px;
                margin: 0 30px 20px 30px; /* thẳng hàng với header */
            }

            .breadcrumb-container {
                max-width: 1200px;
                margin-left: 2.7%;
                margin-top: 1%;
            }

            .breadcrumb {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                align-items: center;
                font-size: 16px;
                color: #333;
            }

            .breadcrumb li {
                margin-right: 8px;
                display: flex;
                align-items: center;
            }

            .breadcrumb li a {
                color: #000000;
                text-decoration: none;
            }

            .breadcrumb li a:hover {
                text-decoration: underline;
            }

            .breadcrumb .divider {
                margin: 0 6px;
                color: #888;
            }

            .breadcrumb .current {
                color: #aaa;
                font-weight: normal;
            }
        </style>            

        <div style="margin: 50px 0;">
            <div style="width: 1250px;margin:0 auto;display: flex;gap:50px;">

		<div class="left-contact" style="width: 50%;">
                    <h1 style="margin-bottom: 50px;text-align: left;">THÔNG TIN LIÊN HỆ</h1>
                    <div style="display: flex;gap:15px;">
                    <img src="https://uxwing.com/wp-content/themes/uxwing/download/location-travel-map/map-pin-icon.svg" width="25" height="25" class="mr-3 align-self-center" alt="location-icon"> 
                    <div>
                        <p style="font-size: 22px;margin-top: 0;"><strong>Địa chỉ:</strong></p>
                        <p style="font-size: 22px;">CH Quận Hải Châu: 227A Núi Thành, Phường Hòa Cường Bắc, Quận Hải Châu, Thành phố Đà Nẵng</p>
                        <strong style="font-size: 22px;">GIỜ MỞ CỬA</strong>
                        <span style="display:block;font-size: 22px;margin-top: 10px;">⏰ Thứ 2 - Chủ Nhật: 7:30 - 18:00</span>
                    </div>

                    </div>				

                <div style="display: flex;gap:15px;margin-top: 20px;">
                        <img src="https://cdn-icons-png.flaticon.com/64/597/597177.png" width="25" height="25" class="mr-3 align-self-center" alt="phone-icon"> 
                        <p style="font-size: 22px;margin-top: 0;"><strong>Số điện thoại:</strong> 0829 495 069</p>
                </div>
                <div style="display: flex;gap:15px;">
                        <img src="https://cdn-icons-png.flaticon.com/64/732/732200.png" width="25" height="25" class="mr-3 align-self-center" alt="email-icon">
                        <p style="font-size: 22px;margin-top: 0;"><strong>Email:</strong> huynhbahieu456@gmail.com</p>
                </div>

                <div class="form" style="border-top: solid 1px #ccc">
                        <h1 style="text-align: left;">Liên hệ với chúng tôi</h1>
                        <form accept-charset="UTF-8" action="/contact" class="contact-form" method="post">						

                    <div style="display: flex;flex-direction: column;gap:20px;">

                        <input placeholder="Họ tên*" type="text" class="" required="" value="" name="contact[Name]" style="height: 35px;padding-left: 15px;font-size: 17px;">


                        <input placeholder="Email*" type="email" required="" id="email1" class="" value="" name="contact[email]" style="height: 35px;padding-left: 15px;font-size: 17px;">


                        <input placeholder="Số điện thoại*" type="text" class="" required="" value="" name="contact[Phone]" style="height: 35px;padding-left: 15px;font-size: 17px;">


                        <textarea placeholder="Nhập nội dung*" name="contact[body]" id="comment" class="" required="" style="height: 120px;padding: 15px;font-size: 17px;"></textarea>


                        <button type="submit" class="submit">Gửi liên hệ của bạn</button>

                    </div>

		</div>

            </div>
                <div class="right-contact" style="width: 50%;">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.3995814204595!2d108.22142369999999!3d16.044741499999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142192eddca9879%3A0x8f84686d1bca9314!2zTsO0bmcgTmdoaeG7h3AgUGjhu5EgLSDEkMOgIE7hurVuZyB8IFBow6JuIGLDs24sIGdpw6EgdGjhu4MsIGjhuqF0IGdp4buRbmcsIMSR4bqldCBz4bqhY2g!5e0!3m2!1svi!2s!4v1750520859004!5m2!1svi!2s" style="width: 100%;height: 100%;border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
	</div>

        <%@ include file="../design/footer.jsp" %>

    </body>
</html>

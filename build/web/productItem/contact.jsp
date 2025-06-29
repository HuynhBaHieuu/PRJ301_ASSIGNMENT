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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d722.1934753640159!2d108.2598638694199!3d15.968936906868189!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1750673031663!5m2!1svi!2s" style="width: 100%;height: 100%;border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                </div>
            </div>
        </div>

        <%@ include file="../design/footer.jsp" %>

    </body>
</html>

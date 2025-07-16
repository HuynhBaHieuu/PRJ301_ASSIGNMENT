<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/image/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GÓP Ý</title>
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" href="../css/footer.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <script>
            function resetFormWithConfirmation(event) {
                event.preventDefault();
                const confirmReset = confirm("Xóa hết câu trả lời trong biểu mẫu?\n\nThao tác này sẽ xóa câu trả lời của bạn khỏi tất cả câu hỏi. Bạn sẽ không thể hủy được thao tác này sau khi thực hiện.");
                if (confirmReset) {
                    document.getElementById("surveyForm").reset();
                }
            }
        </script>
    </head>
    <body>
        <%@ include file="../design/header.jsp" %>
        <%@ include file="../design/navbar.jsp" %>

        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><span class="current">Góp ý</span></li>
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

        <div style="background-color: #F0EBF8;padding: 20px 0;">
            <h1 style="font-size: 35px;color: purple;">Nông Sản Tương Lai ghi nhận ý kiến phản hồi từ Quý khách hàng</h1>
            <div style="width: 800px;margin:0 auto;">
                <p style="font-size: 18px;color: purple;">
                    Ý kiến đóng góp của quý khách hàng là kim chỉ nam cho mọi hoạt động phát triển của Nông Sản Tương Lai.
                    Nông Sản Tương Lai mong nhận được đánh giá, phản hồi từ Anh/Chị để ngày càng hoàn thiện trên chặng đường phủ xanh thành phố khắp đất nước Việt Nam.
                    Xin cảm ơn các Nông dân phố!
                </p>

                <div style="margin-top: 50px;border: solid 1px #C8C8C8;border-radius: 5px;padding: 50px;background-color: white;">
                    <form id="surveyForm" action="submitSurvey.jsp" method="post" style="font-size: 22px;">
                        <!-- Câu 1 -->
                        <h3>1. Để đánh giá mức độ hài lòng với lần mua hàng gần nhất tại Nông Sản Tương Lai, anh/chị thấy mức độ hài lòng của anh/chị ở mức nào?</h3>
                        <input type="radio" name="satisfaction" value="Rất hài lòng" required> Rất hài lòng<br>
                        <input type="radio" name="satisfaction" value="Hài lòng"> Hài lòng<br>
                        <input type="radio" name="satisfaction" value="Bình thường"> Bình thường<br>
                        <input type="radio" name="satisfaction" value="Tệ"> Tệ<br>
                        <input type="radio" name="satisfaction" value="Rất tệ"> Rất tệ<br>

                        <!-- Câu 2 -->
                        <h3>2. Vì sao anh/chị có cảm nhận trên?</h3>
                        <textarea name="reason1" rows="4" placeholder="Câu trả lời của bạn" style="width: 680px;height: 100px;padding:10px;"></textarea>

                        <!-- Câu 3 -->
                        <h3>3. Số điện thoại liên hệ của anh/chị là?</h3>
                        <input type="text" name="phone" placeholder="Nhập số điện thoại" style="width: 680px;height: 30px;padding-left:10px;font-size: 18px;">

                        <!-- Câu 4 -->
                        <h3>4. Email anh/chị thường sử dụng là?</h3>
                        <input type="email" name="email" placeholder="Nhập địa chỉ email" style="width: 680px;height: 30px;padding-left:10px;font-size: 18px;">

                        <!-- Nút gửi -->
                        <br><br>
                        <button type="submit" class="submit" style="padding: 15px 30px;background-color: #7349BD;color: white;border-radius: 5px;border: #7349BD;">
                            Gửi
                        </button>

                        <!-- Nút xóa có xác nhận -->
                        <a href="#" onclick="resetFormWithConfirmation(event)" style="margin-left: 420px;color: #673AB7; text-decoration: none;">
                            Xóa hết câu trả lời
                        </a>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="../design/footer.jsp" %>
    </body>
</html>
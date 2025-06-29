<%-- 
    Document   : blog
    Created on : Jun 22, 2025, 10:27:03 AM
    Author     : phung
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../design/header.jsp" %>
<%@ include file="../design/navbar.jsp" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <link rel="stylesheet" href="../css/home.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/blog.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">
    </head>

    <body>
        <section class="breadcrumb-section">
            <div class="breadcrumb-container">
                <ul class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><span class="divider">/</span><span class="current">Blog</span></li>
                </ul>
            </div>
        </section>

        <section class="blog-section">
            <div class="blog-container">
                <ul class="blog">
                    <li>TIN TỨC</li>
                </ul>
            </div>
        </section> 

        <div class="row">
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/cay-chuoi-canh.jsp" title="Cây chuối cảnh: Biểu tượng xanh cho không gian hiện đại" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/cay-chuoi-canh_cee4e15b3a2b49acba831b27092402ef_large.jpg" alt="Cây chuối cảnh: Biểu tượng xanh cho không gian hiện đại">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/cay-chuoi-canh.jsp" title="Cây chuối cảnh: Biểu tượng xanh cho không gian hiện đại">Cây chuối cảnh: Biểu tượng xanh cho không gian hiện đại</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">
                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Cây chuối cảnh ngày càng xuất hiện nhiều trong các thiết kế nhà ở hiện đại nhờ vẻ đẹp xanh mát, dễ chăm và hợp với...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/cay-chuoi-canh.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/thang-7-duong-lich-trong-rau-gi.jsp" title="Tháng 7 dương lịch trồng rau gì? Bí quyết trồng rau giữa mùa nắng nóng tại nhà" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/thang-7-duong-lich-trong-rau-gi_e97a56b2ea4448a1b8e14cc10110fc24_large.png" alt="Tháng 7 dương lịch trồng rau gì? Bí quyết trồng rau giữa mùa nắng nóng tại nhà">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/thang-7-duong-lich-trong-rau-gi.jsp" title="Tháng 7 dương lịch trồng rau gì? Bí quyết trồng rau giữa mùa nắng nóng tại nhà">Tháng 7 dương lịch trồng rau gì? Bí quyết trồng rau giữa mùa nắng nóng tại nhà</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">
                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Tháng 7 với thời tiết nắng gắt khiến nhiều người ngại trồng rau tại nhà. Tuy nhiên, nếu chọn đúng loại rau chịu nhiệt và chăm...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/thang-7-duong-lich-trong-rau-gi.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/cay-lan-chi.jsp" title="Cây Lan Chi: Ý nghĩa, cách trồng và chăm sóc chuẩn kỹ thuật tại nhà" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/cay-lan-chi_801938f21a4f400e92cfd685a9cdfb6d_large.jpg" alt="Cây Lan Chi: Ý nghĩa, cách trồng và chăm sóc chuẩn kỹ thuật tại nhà">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/cay-lan-chi.jsp" title="Cây Lan Chi: Ý nghĩa, cách trồng và chăm sóc chuẩn kỹ thuật tại nhà">Cây Lan Chi: Ý nghĩa, cách trồng và chăm sóc chuẩn kỹ thuật tại nhà</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">

                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">

                                Cây Lan Chi, còn gọi là cây mẫu tử, đang dần trở thành lựa chọn hàng đầu trong xu hướng trang trí xanh hiện đại nhờ...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/cay-lan-chi.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-ot.jsp" title="Cách nhận biết và xử lý hiệu quả bọ trĩ hại ớt từ A-Z" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/bo-tri-hai-ot_4ad9bcc1c2494651aaf06be562e31ff0_large.jpg" alt="Cách nhận biết và xử lý hiệu quả bọ trĩ hại ớt từ A-Z">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-ot.jsp" title="Cách nhận biết và xử lý hiệu quả bọ trĩ hại ớt từ A-Z">Cách nhận biết và xử lý hiệu quả bọ trĩ hại ớt từ A-Z</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">

                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Bọ trĩ hại ớt thường xuất hiện âm thầm nhưng để lại hậu quả khó lường nếu không phát hiện kịp. Từ thực tế đồng ruộng...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-ot.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-sau-rieng.jsp" title="Bọ trĩ hại sầu riêng: Nguyên nhân, triệu chứng và cách trị tận gốc" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/bo-tri-hai-sau-rieng_aa16ed12505f469b819058650c044047_large.jpg" alt="Bọ trĩ hại sầu riêng: Nguyên nhân, triệu chứng và cách trị tận gốc">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-sau-rieng.jsp" title="Bọ trĩ hại sầu riêng: Nguyên nhân, triệu chứng và cách trị tận gốc">Bọ trĩ hại sầu riêng: Nguyên nhân, triệu chứng và cách trị tận gốc</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">

                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">

                                Bọ trĩ hại sầu riêng là một trong những nguyên nhân chính khiến cây suy yếu, lá xoăn, hoa rụng và năng suất giảm mạnh nếu...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/bo-tri-hai-sau-rieng.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/cay-khong-khi.jsp" title="Tìm hiểu cây không khí: Loài cây độc đáo không cần đất, dễ trồng và trang trí đẹp" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/cay-khong-khi_cf3dd9154e7749c58a5cb9e48c300f08_large.jpg" alt="Tìm hiểu cây không khí: Loài cây độc đáo không cần đất, dễ trồng và trang trí đẹp">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/cay-khong-khi.jsp" title="Tìm hiểu cây không khí: Loài cây độc đáo không cần đất, dễ trồng và trang trí đẹp">Tìm hiểu cây không khí: Loài cây độc đáo không cần đất, dễ trồng và trang trí đẹp</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">
                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Cây không khí không chỉ là lựa chọn mới mẻ trong trang trí mà còn thể hiện lối sống xanh, tối giản ngày càng được yêu...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/cay-khong-khi.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/cach-trong-gung-khong-can-dat.jsp" title="Hướng dẫn cách trồng gừng không cần đất tại nhà dễ làm, sạch sẽ, nhiều củ" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/cach-trong-gung-khong-can-dat_cefc8129c0464f1896e4a51b73b1f82f_large.jpg" alt="Hướng dẫn cách trồng gừng không cần đất tại nhà dễ làm, sạch sẽ, nhiều củ">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/cach-trong-gung-khong-can-dat.jsp" title="Hướng dẫn cách trồng gừng không cần đất tại nhà dễ làm, sạch sẽ, nhiều củ">Hướng dẫn cách trồng gừng không cần đất tại nhà dễ làm, sạch sẽ, nhiều củ</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">
                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Cách trồng gừng không cần đất là lựa chọn thông minh cho những ai yêu thích làm vườn nhưng sống ở nhà phố, chung cư. Chỉ...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/cach-trong-gung-khong-can-dat.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/mot-so-kinh-nghiem-trong-rau-trong-thung-xop-ban-nen-biet.jsp" title="Một số kinh nghiệm trồng rau thùng xốp: Bí quyết đơn giản mà hiệu quả" style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/kinh-nghiem-trong-rau-thung-xop_b8c86ed57d7948d58c2f16e32b38275e_large.jpg" alt="Một số kinh nghiệm trồng rau thùng xốp: Bí quyết đơn giản mà hiệu quả">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/mot-so-kinh-nghiem-trong-rau-trong-thung-xop-ban-nen-biet.jsp" title="Một số kinh nghiệm trồng rau thùng xốp: Bí quyết đơn giản mà hiệu quả">Một số kinh nghiệm trồng rau thùng xốp: Bí quyết đơn giản mà hiệu quả</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">

                                <div class="text-muted mt-0">
                                    Th 3 24/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                Trồng rau trong thùng xốp là giải pháp lý tưởng cho người sống ở đô thị, vừa tiết kiệm chi phí vừa chủ động nguồn rau...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/mot-so-kinh-nghiem-trong-rau-trong-thung-xop-ban-nen-biet.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>
            <div class="col-md-4 col-6">
                <div class="blogwp clearfix">
                    <a class="image-blog card-img-top text-center position-relative 
                       d-flex align-items-center justify-content-center
                       aspect-ratio
                       " href="${pageContext.request.contextPath}/blogItem/nguyen-tac-4-dung-trong-su-dung-thuoc-bao-ve-thuc-vat.jsp" title="Nguyên tắc 4 đúng trong sử dụng thuốc bảo vệ thực vật." style=" --width: 400;
                       --height: 270;">
                        <img class="img-fluid m-auto w-auto" src="//file.hstatic.net/1000269461/article/4-dung-trong-su-dung-thuoc-bao-ve-thuc-vat_116380643d5649ebb00b54c0e43feea4_large.jpg" alt="Nguyên tắc 4 đúng trong sử dụng thuốc bảo vệ thực vật.">
                    </a>
                    <div class="content_blog clearfix card-body px-0 py-2">
                        <h3>
                            <a class="link" href="${pageContext.request.contextPath}/blogItem/nguyen-tac-4-dung-trong-su-dung-thuoc-bao-ve-thuc-vat.jsp" title="Nguyên tắc 4 đúng trong sử dụng thuốc bảo vệ thực vật.">Nguyên tắc 4 đúng trong sử dụng thuốc bảo vệ thực vật.</a>
                        </h3>
                        <div class="media">
                            <div class="media-body">
                                <div class="text-muted mt-0">
                                    Th 6 20/06/2025
                                </div>  
                            </div>
                        </div>
                        <p class="justify">
                            <span class="art-summary">
                                4 đúng trong sử dụng thuốc bảo vệ thực vật không chỉ là nguyên tắc kỹ thuật, mà còn là "chìa khóa" giúp nông dân giảm...<p>
                            </span>
                            <a class="button_custome_35 link" href="${pageContext.request.contextPath}/blogItem/nguyen-tac-4-dung-trong-su-dung-thuoc-bao-ve-thuc-vat.jsp" title="Đọc tiếp">Đọc tiếp</a>
                        </p>
                    </div>
                </div>							
            </div>              

        <%@ include file="../design/footer.jsp" %>                                    
    </body> 

</html>       

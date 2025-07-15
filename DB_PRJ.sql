CREATE DATABASE PRJ_PROJECT;
GO

USE PRJ_PROJECT;
GO

-- Tạo bảng Users
CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    country NVARCHAR(120) NULL,
    role NVARCHAR(50) NOT NULL DEFAULT 'user',
    status BIT NOT NULL DEFAULT 1,
    password NVARCHAR(255) NOT NULL,
    dob DATE DEFAULT GETDATE(),
    phone CHAR(10) NOT NULL CHECK(phone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    googleId VARCHAR(100) NULL
);
GO

-- Chèn dữ liệu mẫu Users
INSERT INTO Users (username, email, country, role, status, password, dob, phone) VALUES
(N'Chi Pheo', 'chi@gmail.com', N'Viet Nam', N'user', 1, 'abc@123', '1990-01-01', '0900000001'),
(N'Tu Hai', 'hai@fpt.edu.vn', N'Canada', N'user', 1, 'abc@123', '1992-02-02', '0900000002'),
(N'John Doe', 'john.doe@example.com', N'USA', N'admin', 1, 'abc@123', '1985-03-03', '0900000003'),
(N'Jane Smith', 'jane.smith@example.com', N'UK', N'user', 1, 'abc@123', '1993-04-04', '0900000004'),
(N'Mike Brown', 'mike.brown@example.com', NULL, N'user', 0, 'abc@123', '1980-05-05', '0900000005'),
(N'Sarah Johnson', 'sarah.johnson@example.com', N'Canada', N'user', 1, 'abc@123', '1994-06-06', '0900000006'),
(N'Emily Davis', 'emily.davis@example.com', N'Australia', N'admin', 0, 'abc@123', '1991-07-07', '0900000007'),
(N'huynhbahieu', 'huynhbahieu456@gmail.com', N'VietNam', N'admin', 0, 'abc@123', '2005-01-07', '0829495069');
GO

-- Tạo bảng Categories
CREATE TABLE Categories (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);
GO

-- Chèn dữ liệu Categories
INSERT INTO Categories (name) VALUES
(N'Phân bón'),
(N'Thuốc trừ sâu'),
(N'Hạt giống'),
(N'Vật tư'),
(N'Bảo vệ thực vật'),
(N'Kích thích sinh trưởng'),
(N'Dụng cụ làm vườn'),
(N'Đất sạch & Giá thể');
GO

-- Tạo bảng Products
CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description NVARCHAR(500),
    stock INT DEFAULT 0 NOT NULL,
    import_date DATETIME DEFAULT GETDATE(),
    status BIT NOT NULL,
    category_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);
GO

-- Chèn dữ liệu Products
INSERT INTO Products (name, price, description, stock, status, category_id, image_url) VALUES
(N'Phân NPK MINROx 17-17-17', 39000, N'Phân bón giá rẻ chất lượng cao', 100, 1, 1, 'phanNpkMINRO.jpg'),
(N'Thuốc trừ sâu top1', 45000, N'Thuốc trừ sâu nhập khẩu từ pháp', 50, 1, 2, 'top1.jpg'),
(N'Hạt giống bí đột biến ', 30000, N'Hạt giống được lai tạo từ nhiều loại khác nhau cho ra sản phẩm to', 200, 0, 3, 'hatgiongdotbien.jpg'),
(N'Cuốc làm vườn đa năng', 55000, N'Dụng cụ làm vườn bằng thép không gỉ', 100, 1, 7, 'cuocdanang.jpg'),
(N'Chất kích rễ sinh học', 65000, N'Giúp cây ra rễ nhanh và khỏe mạnh', 80, 1, 6, 'kichresinhhoc.jpg'),
(N'ATONIK 1.8SL (100ml)', 89000, N'Tăng sinh trưởng, kích chồi và rễ cho cây trồng', 120, 1, 6, 'atonik.jpg'),
(N'Lưới che nắng nông nghiệp', 32000, N'Vật tư hỗ trợ che nắng cho cây trồng', 150, 1, 5, 'luoichongnong.jpg'),
(N'Đất Tribat', 150000, N'Đất sạch giàu dinh dưỡng', 100, 1, 8, 'tribat.jpg'),
(N'Phân bò ủ vi sinh Sfarm', 25000, N'Phân hữu cơ cải tạo đất, tơi đất, giàu mùn', 200, 1, 1, 'phanBoUViSinh.jpg'),
(N'Phân gà bột SFARM', 32000, N'Phân gà dạng bột, hữu cơ, tăng sức đề kháng cho cây', 50, 1, 1, 'phanHotGaSFARM.jpg'),
(N'Phân trùn quế cao cấp Sfarm đã qua xử lý', 28000, N'Chuyên bón cho rau sạch, kiểng lá và hoa hồng', 150, 1, 1, 'phanTrunQueCaoCap.jpg'),
(N'Phân bò đã qua xử lý TRIBAT (10dm3)', 29000, N'Phân hữu cơ cung cấp dinh dưỡng cho cây, cải tạo đất trồng', 100, 1, 1, 'phanBoTriBat.jpg'),
(N'Phân bón Kali bột MOP Phú Mỹ (Bao 50kg)', 790000, N'Giúp cây cứng, chịu rét, giảm lốp đổ, sâu bệnh, năng suất cao', 50, 1, 1, 'phanKaliPhuMy.jpg'),
(N'COMDA 250EC (650ml)', 49000, N'Phòng trừ sâu, rệp, bọ trĩ trên hoa và rau sạch', 50, 1, 2, 'Comda250EC.jpg'),
(N'Confidor 200SL', 29000, N'Phòng trừ rệp sáp, rầy, bọ trĩ trên cây trồng', 37, 1, 2, 'Confidor200SL.jpg'),
(N'MOVENTO 150OD (100ml)', 119000, N'Phòng chống rệp sáp, bọ trĩ, sâu hại cây trồng', 37, 1, 2, 'movento150OD.jpg'),
(N'Hạt giống Cà chua bi đỏ FVN', 19000, N'Gói 5 hạt', 200, 0, 3, 'hatGiongCaChuaBi.jpg'),
(N'Hạt giống Dưa Leo Thái FVN', 14000, N'Gói 15 hạt', 200, 0, 3, 'hatGiongDuaLeo.jpg'),
(N'Hạt giống hoa baby FVN', 24000, N'Gói 5 hạt', 200, 0, 3, 'hatGiongHoaBabyFVN.jpg'),
(N'Lưới chống côn trùng khổ 1m7', 100000, N'Lỗ lưới 1 ly. Lưới chống muỗi, lưới trồng rau, lưới nuôi cá', 20, 1, 5, 'luoiChongConTrung.jpg'),
(N'Đèn diệt côn trùng', 1700000, N'Hỗ trợ diện côn trùng, hạn chế muỗi trong nhà', 110, 1, 5, 'denDietConTrung.jpeg'),
(N'Bẫy bọ thuốc lá Tobacco Beetle Trap', 110000, N'Bẫy được mồi bằng mồi nhử pheromone cực mạnh. Cài bẫy này để cung cấp cảnh báo sớm về sự xuất hiện của bọ thuốc lá.', 45, 1, 5, 'luoiChongConTru.jpg'),
(N'ATONIK 1.8SL (10ml)', 15000, N'Kích rễ, bật mầm mạnh cho cây trồng và hoa kiểng', 300, 1, 6, 'atonik-1.webp'),
(N'Kích Rễ Seasol', 15000, N'Chế phẩm kích rễ và phục hồi rễ Seasol nhập khẩu Úc', 300, 1, 6, 'kichreSeasol.webp'),
(N'Bộ 3 dụng cụ làm vườn Inox', 49000, N'Bộ 3 làm vườn gồm 1 xẻng, 1 xúc, 1 cào, sử dụng tiện lợi, kiểu dáng đẹp, nhỏ gọn', 25, 1, 7, 'bo3lamvuon.webp'),
(N'Bình xịt (phun) chuyên dụng DUDACO (4 lít)', 199000, N'Tưới phun sương cho cây con, hoa kiểng, rau sạch', 25, 1, 7, 'binhxitDURACO4lit.webp'),
(N'Bình xịt (phun) chuyên dụng DUDACO', 49000, N'2 lít', 55, 1, 7, 'binhxitDURACO2lit.webp'),
(N'Đất trồng cây đa dụng SFARM (20dm³)', 65000, N'Đất sạch, cung cấp dinh dưỡng hữu cơ, ngừa nấm bệnh, trồng mọi loại cây', 100, 1, 8, 'datSFARM.webp'),
(N'Soil Mix (Túi 15dm3)', 149000, N'Đất trồng sen đá, xương rồng, thoát nước tốt, phòng ngừa thối rễ', 100, 1, 8, 'datTrongSenDaSoilMix.webp'),
(N'Đất sạch cao cấp TRIBAT PROMIX Premium Potting Soil', 65000, N'Bao 20dm3', 100, 1, 8, 'datTribatPromix.webp'),
(N'Móc treo chậu hoa', 2000, N'Chậu trồng lan bằng kẽm', 100, 1, 4, 'moctreochaucay.webp'),
(N'Chậu nhựa cứng trồng lan', 1000, N'Chậu nhựa trồng lan siêu bền', 100, 1, 4, 'chaunhuatronglan.webp'),
(N'Lưới bỏ phân ( 10m )', 15000, N'Lưới bỏ phân là loại được kết dạng mắt cáo, có các lỗ hình thoi', 100, 1, 4, 'luoibophan.webp'),
(N'Chậu gân sọc trồng cây kiểng HD', 65000, N'Chậu nhựa PP, bền màu, trồng hoa và cây kiểng', 100, 1, 4, 'chaugansoc.webp'),
(N'Phân hữu cơ dạng viên nở', 23000, N'Phân gà Nhật Bản AKI SFARM – Giàu hữu cơ, sạch, ít mùi, tăng sức đề kháng cây', 35, 1, 1, 'phanGaHuuCoDangVien.webp');
GO

-- Tạo bảng Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending' 
        CHECK (status IN ('pending', 'shipped', 'cancelled', 'delivered')),
    shipping_address NVARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
GO

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    subtotal AS (quantity * price),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
GO

-- Tạo bảng Payments
CREATE TABLE Payments (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    method VARCHAR(10) CHECK(method IN ('COD', 'Momo', 'Bank')) DEFAULT 'COD',
    paid BIT DEFAULT 0,
    paid_at DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);
GO

-- Tạo bảng Reviews
CREATE TABLE Reviews (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
GO

-- Chèn dữ liệu mẫu Orders
INSERT INTO Orders (user_id, total_price, status, shipping_address) VALUES
(1, 60000, 'pending', N'123 Nguyễn Trãi, Hà Nội'),
(2, 90000, 'shipped', N'456 Lê Lợi, TP.HCM');
GO

-- Chèn dữ liệu OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 15000),
(1, 3, 1, 30000),
(2, 2, 2, 45000);
GO

-- Chèn dữ liệu Payments
INSERT INTO Payments (order_id, method, paid, paid_at) VALUES
(1, 'COD', 0, NULL),
(2, 'Momo', 1, GETDATE());
GO

-- Chèn dữ liệu Reviews
INSERT INTO Reviews (user_id, product_id, rating, comment) VALUES
(1, 1, 5, N'Cà rốt rất tươi và ngọt'),
(2, 2, 4, N'Táo ngon nhưng hơi mắc'),
(1, 3, 5, N'Gạo dẻo thơm, rất thích');
GO
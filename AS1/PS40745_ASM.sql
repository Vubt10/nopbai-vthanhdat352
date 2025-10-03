CREATE DATABASE QL_NHATRO_PS40745;
GO

USE QL_NHATRO_PS40745;
GO

-- Bảng LOAINHA
CREATE TABLE LOAINHA (
    MaLoaiNha INT IDENTITY(1,1) PRIMARY KEY,
    TenLoaiNha NVARCHAR(100) NOT NULL
);

-- Bảng NGUOIDUNG
CREATE TABLE NGUOIDUNG (
    MaNguoiDung INT IDENTITY(1,1) PRIMARY KEY,
    TenNguoiDung NVARCHAR(50) NOT NULL,
    GioiTinh NVARCHAR(10) CHECK (GioiTinh IN (N'Nam', N'Nữ')) NOT NULL,
    DienThoai VARCHAR(15) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
);

-- Bảng NHATRO
CREATE TABLE NHATRO (
    MaNhaTro INT IDENTITY(1,1) PRIMARY KEY,
    MaLoaiNha INT NOT NULL,
    DienTich DECIMAL(10,2) CHECK (DienTich > 0) NOT NULL,
    GiaPhong DECIMAL(18,0) CHECK (GiaPhong > 0) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    Quan NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(500),
    NgayDangTin DATE NOT NULL,
    MaNguoiLienHe INT NOT NULL,
    FOREIGN KEY (MaLoaiNha) REFERENCES LOAINHA(MaLoaiNha),
    FOREIGN KEY (MaNguoiLienHe) REFERENCES NGUOIDUNG(MaNguoiDung)
);

-- Bảng DANHGIA
CREATE TABLE DANHGIA (
    MaDanhGia INT IDENTITY(1,1) PRIMARY KEY,
    MaNguoiDung INT NOT NULL,
    MaNhaTro INT NOT NULL,
    TrangThai NVARCHAR(10) CHECK (TrangThai IN (N'LIKE', N'DISLIKE')),
    NoiDung NVARCHAR(500),
    FOREIGN KEY (MaNguoiDung) REFERENCES NGUOIDUNG(MaNguoiDung),
    FOREIGN KEY (MaNhaTro) REFERENCES NHATRO(MaNhaTro)
);


-- Thêm dữ liệu mẫu vào LOAINHA
INSERT INTO LOAINHA (TenLoaiNha) VALUES
(N'Căn hộ chung cư'),
(N'Nhà riêng'),
(N'Phòng trọ khép kín');

-- Thêm dữ liệu mẫu vào NGUOIDUNG
INSERT INTO NGUOIDUNG (TenNguoiDung, GioiTinh, DienThoai, DiaChi, Quan, Email) VALUES
(N'Nguyễn Văn A', N'Nam', '0901234567', N'12 Trần Hưng Đạo', N'Hoàn Kiếm', 'vana@example.com'),
(N'Trần Thị B', N'Nữ', '0912345678', N'45 Lý Thường Kiệt', N'Đống Đa', 'thib@example.com'),
(N'Lê Văn C', N'Nam', '0987654321', N'23 Nguyễn Trãi', N'Thanh Xuân', 'vanc@example.com'),
(N'Phạm Thị D', N'Nữ', '0978123456', N'67 Giải Phóng', N'Hai Bà Trưng', 'thid@example.com'),
(N'Hoàng Văn E', N'Nam', '0908765432', N'89 Kim Mã', N'Ba Đình', 'vane@example.com'),
(N'Nguyễn Thị F', N'Nữ', '0934567890', N'34 Láng Hạ', N'Đống Đa', 'thif@example.com'),
(N'Đỗ Văn G', N'Nam', '0923456789', N'78 Cầu Giấy', N'Cầu Giấy', 'vang@example.com'),
(N'Phan Thị H', N'Nữ', '0911222333', N'12 Nguyễn Chí Thanh', N'Ba Đình', 'thih@example.com'),
(N'Vũ Văn I', N'Nam', '0909988776', N'56 Trần Duy Hưng', N'Cầu Giấy', 'vani@example.com'),
(N'Lý Thị K', N'Nữ', '0988111222', N'90 Tây Sơn', N'Đống Đa', 'thik@example.com');

-- Thêm dữ liệu mẫu vào NHATRO
INSERT INTO NHATRO (MaLoaiNha, DienTich, GiaPhong, DiaChi, Quan, MoTa, NgayDangTin, MaNguoiLienHe) VALUES
(1, 30.5, 1700000, N'12 Trần Hưng Đạo', N'Hoàn Kiếm', N'Phòng đẹp, thoáng mát', '2025-09-01', 1),
(2, 45.0, 2500000, N'45 Lý Thường Kiệt', N'Đống Đa', N'Nhà riêng đầy đủ nội thất', '2025-08-15', 2),
(3, 20.0, 1200000, N'23 Nguyễn Trãi', N'Thanh Xuân', N'Phòng khép kín, gần trường học', '2025-09-10', 3),
(1, 35.0, 2000000, N'67 Giải Phóng', N'Hai Bà Trưng', N'Căn hộ mini, an ninh tốt', '2025-09-20', 4),
(2, 60.0, 4000000, N'89 Kim Mã', N'Ba Đình', N'Nhà rộng rãi, tiện nghi', '2025-08-30', 5),
(3, 25.0, 1500000, N'34 Láng Hạ', N'Đống Đa', N'Phòng yên tĩnh, thoáng đãng', '2025-09-05', 6),
(1, 40.0, 3000000, N'78 Cầu Giấy', N'Cầu Giấy', N'Căn hộ mới xây', '2025-09-12', 7),
(2, 55.0, 3500000, N'12 Nguyễn Chí Thanh', N'Ba Đình', N'Nhà 2 tầng đầy đủ tiện nghi', '2025-09-18', 8),
(3, 22.0, 1400000, N'56 Trần Duy Hưng', N'Cầu Giấy', N'Phòng gần chợ, thuận tiện', '2025-09-25', 9),
(1, 32.0, 1800000, N'90 Tây Sơn', N'Đống Đa', N'Phòng đẹp, giá hợp lý', '2025-09-28', 10);

-- Thêm dữ liệu mẫu vào DANHGIA
INSERT INTO DANHGIA (MaNguoiDung, MaNhaTro, TrangThai, NoiDung) VALUES
(1, 1, N'LIKE', N'Phòng sạch sẽ, chủ nhà thân thiện'),
(2, 2, N'DISLIKE', N'Giá hơi cao so với khu vực'),
(3, 3, N'LIKE', N'Vị trí thuận lợi, gần trường'),
(4, 4, N'LIKE', N'Phòng mới, rất thoáng mát'),
(5, 5, N'DISLIKE', N'Nhà hơi cũ, cần sửa sang'),
(6, 6, N'LIKE', N'Phòng yên tĩnh, phù hợp cho sinh viên'),
(7, 7, N'LIKE', N'Căn hộ rộng rãi, đầy đủ tiện nghi'),
(8, 8, N'DISLIKE', N'Chủ nhà khó tính'),
(9, 9, N'LIKE', N'Phòng gần chợ, giá hợp lý'),
(10, 10, N'LIKE', N'Phòng đẹp, giá hợp lý');

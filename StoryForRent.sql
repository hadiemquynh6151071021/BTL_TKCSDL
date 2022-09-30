CREATE DATABASE DA
go
USE DA
go
CREATE TABLE NHANVIEN(
	MANV CHAR(7) NOT NULL,
	TEN NVARCHAR(50) NOT NULL,
	EMAIL CHAR(50) UNIQUE,
	GIOITINH NVARCHAR(50) NOT NULL,
	SDT CHAR(10) UNIQUE NOT NULL,
	NGAYSINH DATE NOT NULL,
	
	DIACHI NVARCHAR(50) NOT NULL,
	CHUCVU NVARCHAR(50) NOT NULL

)
go
CREATE TABLE TRUYEN(
	MATRUYEN CHAR(6),
	TENTRUYEN NVARCHAR(50) NOT NULL,
	SOLUONG INT NOT NULL,
	NXB NVARCHAR(50) NOT NULL
)
go
CREATE TABLE TACGIA(
	MATG CHAR(7) NOT NULL,
	TEN NVARCHAR(50) NOT NULL,
	NGAYSINH DATE NOT NULL
)
go
CREATE TABLE DOCGIA(
	MADG CHAR(7) NOT NULL,
	TEN NVARCHAR(50) NOT NULL,
	NGAYSINH DATE NOT NULL,
	
	GIOITINH NVARCHAR(3) NOT NULL,
	SDT CHAR(10) UNIQUE NOT NULL,
	EMAIL CHAR(50) UNIQUE,
	DIACHI NVARCHAR(200)

)
go
CREATE TABLE PHIEUMUON(
	MAPHIEUMUON CHAR(7) NOT NULL,
	MADG CHAR(7) NOT NULL,
	NGAYMUON DATE NOT NULL,
	NGAYTRA DATE NOT NULL,
	TONGSL INT NOT NULL
)
go
CREATE TABLE DANHSACHMUON(
	MAPHIEUMUON CHAR(7) NOT NULL,
	MATRUYEN CHAR(6) NOT NULL,
	SOLUONG INT NOT NULL
)
go

CREATE TABLE QUANLYTRUYEN(
	MANV CHAR(7) NOT NULL,
	MATRUYEN CHAR(6) NOT NULL

)
go
CREATE TABLE QUANLYPHIEUMUON(
	MANV CHAR(7) NOT NULL,
	MAPHIEUMUON CHAR(7) NOT NULL
)


--RBTV
ALTER TABLE NHANVIEN
ADD CONSTRAINT RBTV_PK_NHANVIEN PRIMARY KEY(MANV)

ALTER TABLE TRUYEN
ADD CONSTRAINT RBTV_PK_TRUYEN PRIMARY KEY(MATRUYEN)

ALTER TABLE TACGIA
ADD CONSTRAINT RBTV_PK_TACGIA PRIMARY KEY(MATG)

ALTER TABLE DOCGIA
ADD CONSTRAINT RBTV_PK_DOCGIA PRIMARY KEY(MADG)

ALTER TABLE PHIEUMUON
ADD CONSTRAINT RBTV_PK_PHIEUMUON PRIMARY KEY(MAPHIEUMUON)

ALTER TABLE PHIEUMUON
ADD CONSTRAINT RBTV_PF_PHIEUMUON FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_SOLUONG_DANHSACHMUON CHECK (SOLUONG>0)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_PF1_DANHSACHMUON FOREIGN KEY (MATRUYEN) REFERENCES TRUYEN(MATRUYEN)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_PF2_DANHSACHMUON FOREIGN KEY (MAPHIEUMUON) REFERENCES PHIEUMUON(MAPHIEUMUON)

ALTER TABLE QUANLYTRUYEN
ADD CONSTRAINT RBTV_PF1_QUANLYTRUYEN FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE QUANLYTRUYEN
ADD CONSTRAINT RBTV_PF2_QUANLYTRUYEN FOREIGN KEY (MATRUYEN) REFERENCES TRUYEN(MATRUYEN)

ALTER TABLE QUANLYPHIEUMUON
ADD CONSTRAINT RBTV_PF1_QUANLYPHIEUMUON FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE QUANLYPHIEUMUON
ADD CONSTRAINT RBTV_PF2_QUANLYPHIEUMUON FOREIGN KEY (MAPHIEUMUON) REFERENCES PHIEUMUON(MAPHIEUMUON)




go
INSERT INTO NHANVIEN VALUES
('BV001', N'Trương Hiếu Nghĩa', 'TruongHieuNghia123@gmail.com', 'Nam', '0375650483', '1978- 3 -19', N'10/19 khu phố Dĩ An, thành phố Dĩ An, tỉnh Bình Dư', N'Bảo vệ'),
('GS001', N'Trương Tấn Hoàn', 'TruongTanHoan123@gmail.com', 'Nam', '0933771132', '2001- 7- 20', N'16/12 khu phố Dĩ An, Thành phố Dĩ An, tỉnh Bình Dư', N'Nhân viên Giám sát'),
('GS002', N'Phan Hữu Tài', 'PhanHuuTai123@gmail.com', 'Nam', '0911770032', '1998- 8- 19', N'13/120 khu phố Tân Đông Hiệp, Thành phố Dĩ An, tỉn', N'Giám sát kho'),
('K001', N'Nguyễn Ngân Trúc', 'NguyenNganTruc123@gmail.com', 'Nữ', '0988030324', '2001- 8- 13', N'13/20 khu phố Đông Chiêu, Thành phố Dĩ An, tỉnh B', N'Nhân viên kho'),
('K002', N'Nguyễn Tiến Anh', 'NguyenTienAnh123@gmail.com', 'Nam', '0933990323',' 2003- 6- 16', N'03/120 khu phố Tân Đông Hiệp, Thành phố Dĩ An, tỉn', N'Nhân viên kho'),
('KP001', N'Nguyễn Phạm Thành Hưng', 'NguyenPhamThanhHung123@gmail.com', 'Nam', '0362107117',' 1999- 9- 6', N'83/120 khu phố Tân Đông Hiệp, Thành phố Dĩ An, tỉn', N'Nhân viên Kiểm phiếu'),
('NV001', N'Nguyễn Thị Vân Khánh', 'NguyenThiVanKhanh123@gmail.com', 'Nữ', '0375650666', '2002- 9- 2', N'137/10 khu phố Dĩ An, thành phố Dĩ An, tỉnh Bình D', N'Nhân viên trực quầy'),
('NV002', N'Nguyễn Thị Hoa', 'NguyenThiHoa123@gmail.com', 'Nữ', '0375650323', '12- 10- 2000', N'137/10 khu phố Đông Hòa, thành phố Dĩ An, tỉnh Bìn', N'Nhân viên trực quầy'),
('NV003', N'Hà Diễm Quỳnh', 'HaDiemQuynh123@gmail.com', 'Nữ', '0362108666', '1996- 9- 17', N'130/19 khu phố Dĩ An, thành phố Dĩ An, tỉnh Bình D', N'Nhân viên trực quầy'),
('NV004', N'Lê Thị Hà', 'LeThiHa123@gmail.com', 'Nữ', '0362108118', '8- 4- 1980', N'Đường Liên Huyện, Thành phố Dĩ An, tỉnh Bình Dương', N'Phó quản lý'),
('PT001', N'Nguyễn Đức Anh', 'NguyeDucAnh123@gmail.com', 'Nam', '0933770032', '1997- 5- 12', N'156/12 khu phố Dĩ An, Thành phố Dĩ An, tỉnh Bình D', N'Nhân viên Part time'),
('PT002', N'Nguyễn Công Anh', 'NguyeCongAnh123@gmail.com', 'Nam', '0933880778', '1992- 1- 18', N'131/12 khu phố Dĩ An, Thành phố Dĩ An, tỉnh Bình D', N'Nhân viên Part time'),
('QL001', N'Nguyễn Công Hòa', 'NguyeCongHoa123@gmail.com', 'Nam', '0933880321', '1998- 9- 8', N'131/10 khu phố Dĩ An, Thành phố Dĩ An, tỉnh Bình D', N'Quản lý');
go
INSERT INTO TRUYEN VALUES
('CC001', N'Chú Cuội', 15, N'Kim Đồng'),
('CK001', N'Cây Khế', 5, N'Kim Đồng'),
('CKLA00', N'Cây Kế Là Ai ?', 19, N'Kim Đồng'),
('CN001', N'Thám tử lừng danh Conan tập 1', 15, N'Kim Đồng'),
('CN002', N'Thám tử lừng danh Conan tập 2', 19, N'Kim Đồng'),
('CN003', N'Thám tử lừng danh Conan tập 3', 15, N'Kim Đồng'),
('CN004', N'Thám tử lừng danh Conan tập 4', 14, N'Kim Đồng'),
('CN005', N'Thám tử lừng danh Conan tập 5', 15, N'Kim Đồng'),
('CN006', N'Thám tử lừng danh Conan tập 6', 14, N'Kim Đồng'),
('CN007', N'Thám tử lừng danh Conan tập 7', 19, N'Kim Đồng'),
('CN008', N'Thám tử lừng danh Conan tập 8', 15, N'Kim Đồng'),
('CN009', N'Thám tử lừng danh Conan tập 9', 13, N'Kim Đồng'),
('CN010', N'Thám tử lừng danh Conan tập 10', 14, N'Kim Đồng'),
('CPN001', N'Chinh Phụ Ngâm', 20, N'Văn học'),
('CRCT', N'Con Rồng Cháu Tiên', 13, N'Giáo Dục'),
('CTTĐ00', N'Cây Tre Trăm Đốt', 18, N'Kim Đồng'),
('D001', N'Doraemon tập 1', 10, N'Kim Đồng'),
('DD001', N'Doraemon truyện dài tập 1', 12, N'Kim Đồng'),
('DMPLK0', N'Dế Mèn Phiêu Lưu Ký', 17, N'Kim Đồng'),
('DN001', N'Doraemon truyện ngắn tập 1', 10, N'Kim Đồng'),
('DN002', N'Doraemon truyện ngắn tập 2', 10, N'Kim Đồng'),
('LH001', N'Lão Hạc', 18, N'Văn học'),
('LVT001', N'Lục Vân Tiên', 15, N'Trẻ'),
('NTC001', N'Nàng Tiên Cá', 15, N'Kim Đồng'),
('STTT00', N'Sơn Tinh Thủy Tinh', 19, N'Trẻ'),
('TC001', N'Tấm Cám', 15, N'Kim Đồng'),
('TG001', N'Thánh Gióng', 15, N'Kim Đồng'),
('TK001', N'Đoạn Trường Tân Thanh', 13, N'Văn học'),
('TS001', N'Thạch Sanh', 39, N'Kim Đồng'),
('TT001', N'Tu Tiên', 35, N'Kim Đồng'),
('ĐNT001', N'Đắc Nhân Tâm', 19, N'Kim Đồng');

go
INSERT INTO DOCGIA VALUES
('CT', N'Nguyễn Công Thuận', '2002-01-20', 'Nam', '0933880321', 'Thuan123@gmail.com', N'12 Trần Toản, Thành phố Dĩ An, tỉnh Bình Dương'),
('KA', N'Lê Nguyễn Kỳ Anh', '2002-08-17', 'Nam', '0375406446', '615109119@gmail.com', N'103 Đường Tân Vạn, khu phố Dĩ An, Thành phố Dĩ An,'),
('VA', N'Nguyễn Thị Vân Anh','2003-08-04', 'Nữ', '0376880987', 'lethiha08041980@gmail.com', N'10/10 khu phố Tân Bình, Thành phố Dĩ An, tỉnh Bình');

INSERT INTO PHIEUMUON VALUES
('CT001', 'CT', '2022- 05- 26',' 2022-07-08', 9),
('NC002', 'KA', '2022- 04- 02', '2022-06- 12', 1),
('VA001', 'VA', '2022- 05- 22', '2022-07-01', 3);
go

go
INSERT INTO TACGIA VALUES
('AG', N'Aoyama Gōshō', '1964-06-13'),
('DC', N'Dale Carnegie', '1988- 11- 24'),
('NC', N'Nam Cao', '1917-10-29'),
('ND', N'Nguyễn Du', '1766-01-03');
go
INSERT INTO DANHSACHMUON VALUES
('LH001', 'NC002', 2),
('CK001', 'NC002', 3),
('CN001', 'NC002', 10),
('CN006', 'NC002', 10),
('CN009', 'VA001', 2);
go

INSERT INTO  QUANLYPHIEUMUON VALUES
('NV002', 'VA001'),
('NV002', 'VA001'),
('NV003', 'CT001'),
('NV004', 'CT001'),
('NV004', 'NC002'),
('NV003', 'NC002'),
('NV003', 'CT001');

go
INSERT INTO QUANLYTRUYEN VALUES
('NV003', 'ĐNT001'),
('NV001', 'CC001'),
('NV001', 'D001'),
('NV002', 'CN006'),
('NV002', 'CN007'),
('NV003', 'CN002'),
('NV002', 'CTTĐ00');



go
SELECT * FROM NHANVIEN
WHERE TEN=N'Nguyễn Thị Vân Khánh'

SELECT * 
FROM TRUYEN 
WHERE MATRUYEN IN ( 
SELECT MATRUYEN 
FROM DANHSACHMUON AS DS,PHIEUMUON 
WHERE DS.MAPHIEUMUON= PHIEUMUON.MAPHIEUMUON 
AND MADG IN ( 
SELECT MADG 
FROM DOCGIA 
WHERE TEN =N'Nguyễn Thị Vân Anh' 
)
)
go
-- lay ra thong tin phieu muon co so luong muon nhieu nhat
create proc sp_MuonNhieuNhat
as
begin

SELECT *
FROM PHIEUMUON 
WHERE TONGSL = (
SELECT TOP 1 TONGSL
FROM PHIEUMUON
ORDER BY TONGSL DESC
)
end
go
exec sp_MuonNhieuNhat

go

--Xuất ra thông tin độc giả mượn truyện trong ngày do người dùng nhập
create proc sp_ThongTinDocGia
(@NgayMuon Date)
as
 begin
SELECT *
FROM DOCGIA AS DG,PHIEUMUON AS P
WHERE P.NGAYMUON=@NgayMuon

end
go
exec sp_ThongTinDocGia'2022-04-02'

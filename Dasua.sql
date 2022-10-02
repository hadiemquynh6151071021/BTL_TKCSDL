CREATE DATABASE DA1
go
USE DA1
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
	MATRUYEN CHAR(6)NOT NULL,
	MATG CHAR(7) NOT NULL,
	MANV CHAR(7) NOT NULL,
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
	MANV CHAR(7) NOT NULL,
	MADG CHAR(7) NOT NULL,
	NGAYMUON DATE NOT NULL,
	NGAYTRA DATE NOT NULL,
	TONGSL INT NOT NULL
)

CREATE TABLE DANHSACHMUON(
	MAPHIEUMUON CHAR(7) NOT NULL,
	MATRUYEN CHAR(6) NOT NULL,
	SOLUONG INT NOT NULL
)

--RBTV
ALTER TABLE NHANVIEN
ADD CONSTRAINT RBTV_PK_NHANVIEN PRIMARY KEY(MANV)

ALTER TABLE TACGIA
ADD CONSTRAINT RBTV_PK_TACGIA PRIMARY KEY(MATG)

ALTER TABLE TRUYEN
ADD CONSTRAINT RBTV_PK_TRUYEN PRIMARY KEY(MATRUYEN)

ALTER TABLE TRUYEN
ADD CONSTRAINT RBTV_FK1_TRUYEN FOREIGN KEY(MATG) REFERENCES TACGIA(MATG)

ALTER TABLE TRUYEN
ADD CONSTRAINT RBTV_FK2_TRUYEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE DOCGIA
ADD CONSTRAINT RBTV_PK_DOCGIA PRIMARY KEY(MADG)

ALTER TABLE PHIEUMUON
ADD CONSTRAINT RBTV_PK_PHIEUMUON PRIMARY KEY(MAPHIEUMUON)

ALTER TABLE PHIEUMUON
ADD CONSTRAINT RBTV_PF1_PHIEUMUON FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE PHIEUMUON
ADD CONSTRAINT RBTV_PF2_PHIEUMUON FOREIGN KEY (MADG) REFERENCES DOCGIA(MADG)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_SOLUONG_DANHSACHMUON CHECK (SOLUONG>0)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_PF1_DANHSACHMUON FOREIGN KEY (MATRUYEN) REFERENCES TRUYEN(MATRUYEN)

ALTER TABLE DANHSACHMUON
ADD CONSTRAINT RBTV_PF2_DANHSACHMUON FOREIGN KEY (MAPHIEUMUON) REFERENCES PHIEUMUON(MAPHIEUMUON)




go
INSERT INTO NHANVIEN VALUES
('BV001', N'Trương Hiếu Nghĩa', 'TruongHieuNghia123@gmail.com', 'Nam', '0375650483', '1978- 3 -19', N'Bình Dương', N'Bảo vệ'),
('GS001', N'Trương Tấn Hoàn', 'TruongTanHoan123@gmail.com', 'Nam', '0933771132', '2001- 7- 20', N'Long An', N'Nhân viên Giám sát'),
('GS002', N'Phan Hữu Tài', 'PhanHuuTai123@gmail.com', 'Nam', '0911770032', '1998- 8- 19', N'Đồng Nai', N'Giám sát kho'),
('K001', N'Nguyễn Ngân Trúc', 'NguyenNganTruc123@gmail.com', 'Nữ', '0988030324', '2001- 8- 13', N'Tp.Hồ Chí Minh', N'Nhân viên kho'),
('K002', N'Nguyễn Tiến Anh', 'NguyenTienAnh123@gmail.com', 'Nam', '0933990323',' 2003- 6- 16', N'Bình Dương', N'Nhân viên kho'),
('KP001', N'Nguyễn Phạm Thành Hưng', 'NguyenPhamThanhHung123@gmail.com', 'Nam', '0362107117',' 1999- 9- 6', N'Long An', N'Nhân viên Kiểm phiếu'),
('NV001', N'Nguyễn Thị Vân Khánh', 'NguyenThiVanKhanh123@gmail.com', 'Nữ', '0375650666', '2002- 9- 2', N'Tp.Hồ Chí Minh', N'Nhân viên trực quầy'),
('NV002', N'Nguyễn Thị Hoa', 'NguyenThiHoa123@gmail.com', 'Nữ', '0375650323', '12- 10- 2000', N'Tp.Hồ Chí Minh', N'Nhân viên trực quầy'),
('NV003', N'Hà Diễm Quỳnh', 'HaDiemQuynh123@gmail.com', 'Nữ', '0362108666', '1996- 9- 17', N'Tp.Hồ Chí Minh', N'Nhân viên trực quầy'),
('NV004', N'Lê Thị Hà', 'LeThiHa123@gmail.com', 'Nữ', '0362108118', '8- 4- 1980', N'Đồng Nai', N'Phó quản lý'),
('PT001', N'Nguyễn Đức Anh', 'NguyeDucAnh123@gmail.com', 'Nam', '0933770032', '1997- 5- 12', N'Tp.Hồ Chí Minh', N'Nhân viên Part time'),
('PT002', N'Nguyễn Công Anh', 'NguyeCongAnh123@gmail.com', 'Nam', '0933880778', '1992- 1- 18', N'Long An', N'Nhân viên Part time'),
('QL001', N'Nguyễn Công Hòa', 'NguyeCongHoa123@gmail.com', 'Nam', '0933880321', '1998- 9- 8', N'Bình Dương', N'Quản lý');

go
INSERT INTO TACGIA VALUES
('AG', N'Aoyama Gōshō', '1964-06-13'),
('DC', N'Dale Carnegie', '1988-11-24'),
('NC', N'Nam Cao', '1917-10-29'),
('ND', N'Nguyễn Du', '1766-01-03'),
('NQS', N'Nguyễn Quang Sáng', '1932-01-12'),
('TH', N'Tô Hoài', '1920-09-27'),
('FF', N'Fujiko Fujio', '1933-12-01');

go
INSERT INTO TRUYEN VALUES
('CLN00','NQS','NV001', N'Chiếc lược ngà', 24, N'Văn học'),
('DL000','NQS','NV003', N'Đất Lửa', 28, N'Giáo dục'),
('TB000','TH','NV002', N'Tây Bắc', 29, N'Kim Đồng'),
('CN001','AG','NV004', N'Thám tử lừng danh Conan tập 1', 27, N'Kim Đồng'),
('CN002','AG','NV004', N'Thám tử lừng danh Conan tập 2', 39, N'Kim Đồng'),
('CN003','AG','NV001', N'Thám tử lừng danh Conan tập 3', 25, N'Kim Đồng'),
('CN004','AG','NV002', N'Thám tử lừng danh Conan tập 4', 24, N'Kim Đồng'),
('CN005','AG','NV004', N'Thám tử lừng danh Conan tập 5', 35, N'Kim Đồng'),
('CN006','AG','NV001', N'Thám tử lừng danh Conan tập 6', 44, N'Kim Đồng'),
('CN007','AG','NV003', N'Thám tử lừng danh Conan tập 7', 49, N'Kim Đồng'),
('CN008','AG','NV003', N'Thám tử lừng danh Conan tập 8', 35, N'Kim Đồng'),
('CN009','AG','NV002', N'Thám tử lừng danh Conan tập 9', 23, N'Kim Đồng'),
('CN010','AG','NV003', N'Thám tử lừng danh Conan tập 10', 24, N'Kim Đồng'),
('CN011','AG','NV004', N'Thám tử lừng danh Conan tập 11', 39, N'Kim Đồng'),
('CN012','AG','NV003', N'Thám tử lừng danh Conan tập 12', 25, N'Kim Đồng'),
('CN013','AG','NV001', N'Thám tử lừng danh Conan tập 13', 33, N'Kim Đồng'),
('CN014','AG','NV004', N'Thám tử lừng danh Conan tập 14', 34, N'Kim Đồng'),
('NKUKC','TH','NV001', N'Những ký ức không chịu ngủ yên', 40, N'Văn học'),
('NN000','TH','NV002', N'Nhà nghèo', 23, N'Giáo dục'),
('CP000','NC','NV004', N'Chí Phèo', 28, N'Giáo dục'),
('D0001','FF','NV002', N'Doraemon tập 1', 40, N'Kim Đồng'),
('DD001','FF','NV003', N'Doraemon truyện dài tập 1', 32, N'Kim Đồng'),
('DMPLK','NC','NV001', N'Dế Mèn Phiêu Lưu Ký', 37, N'Kim Đồng'),
('DN001','FF','NV004', N'Doraemon truyện ngắn tập 1', 39, N'Kim Đồng'),
('DN002','FF','NV003', N'Doraemon truyện ngắn tập 2', 43, N'Kim Đồng'),
('LH001','NC','NV001', N'Lão Hạc', 38, N'Văn học'),
('LVT00','ND','NV002', N'Lục Vân Tiên', 30, N'Trẻ'),
('DDXC0','NC','NV003', N'Đầu đường xó chợ', 35, N'Văn học'),
('BCT00','NQS','NV004', N'Bông cẩm thạch', 19, N'Giáo dục'),
('TC001','NQS','NV002', N'Nhà văn về làng', 25, N'Văn học'),
('ĐNT00','DC','NV003', N'Đắc Nhân Tâm', 29, N'Kim Đồng');

go
INSERT INTO DOCGIA VALUES
('CT', N'Nguyễn Công Thuận', '2002-01-20', 'Nam', '0933880321', 'Thuan123@gmail.com', N'Dĩ An, Bình Dương'),
('KA', N'Lê Nguyễn Kỳ Anh', '2002-08-17', 'Nam', '0375406446', '615109119@gmail.com', N'Quận 9,Tp. Hồ Chí Minh'),
('VA', N'Nguyễn Thị Vân Anh','2003-08-04', 'Nữ', '0376880987', 'lethiha08041980@gmail.com', N'Quận 5, Tp. Hồ Chí Minh'),
('KC', N'Nguyễn Đỗ Khánh Chi', '2002-10-07', 'Nữ', '0394827742', 'khanhchi0503@gmail.com', N'Biên Hòa, Đồng Nai'),
('NA', N'Đặng Nhật Anh','2004-09-14', 'Nữ', '0377288135', 'nhatanh09@gmail.com', N'Cần Giuộc, Long An'),
('AH', N'Lê Anh Hào', '2001-01-19', 'Nam', '0909340321', 'anhhao1245@gmail.com', N'Quận 7, Tp. Hồ Chí Minh'),
('TT', N'Trịnh Thị Thu Thảo', '2002-02-17', 'Nữ', '0389256446', 'thaothu@gmail.com', N'Quận 1,Tp. Hồ Chí Minh'),
('TD', N'Võ Thanh Duy','2000-01-18', 'Nam', '0370176254', 'buoile001@gmail.com', N'Quận Bình Thạnh, Tp. Hồ Chí Minh'),
('BK', N'Trần Bảo Khanh', '2002-06-12', 'Nam', '0399752642', 'khanhtran11@gmail.com', N'Cần Đước, Long An'),
('VH', N'Võ Hùng','2005-05-28', 'Nam', '0379265487', 'hungvo096@gmail.com', N'Lộc Ninh, Bình Phước');

go
INSERT INTO PHIEUMUON VALUES
('PM00001','NV001', 'CT', '2022- 08- 26',' 2022-10-26', 7),
('PM00002','NV002', 'KA', '2022- 08- 29', '2022-10-29', 5),
('PM00003','NV004', 'VA', '2022- 08- 20', '2022-10-20', 4),
('PM00004','NV001', 'VH', '2022- 08- 19', '2022-10-19', 4),
('PM00005','NV003', 'CT', '2022- 08- 23', '2022-10-23', 6),
('PM00006','NV001', 'TD', '2022- 08- 25', '2022-10-25', 8),
('PM00007','NV002', 'VA', '2022- 08- 29', '2022-10-29', 9),
('PM00008','NV001', 'AH', '2022- 08- 26', '2022-10-26', 8),
('PM00009','NV001', 'TT', '2022- 08- 21',' 2022-10-21', 6),
('PM00010','NV003', 'KA', '2022- 08- 20', '2022-10-20', 6),
('PM00011','NV004', 'AH', '2022- 08- 18', '2022-10-18', 10),
('PM00012','NV002', 'NA', '2022- 08- 18', '2022-10-18', 4),
('PM00013','NV003', 'BK', '2022- 08- 29', '2022-10-29', 4),
('PM00014','NV004', 'KC', '2022- 08- 27', '2022-10-27', 6),
('PM00015','NV002', 'VH', '2022- 08- 24', '2022-10-24', 7),
('PM00016','NV004', 'TD', '2022- 08- 24', '2022-10-24', 6);

go
INSERT INTO DANHSACHMUON VALUES
('PM00001', 'CN005', 2),
('PM00002', 'DL000', 3),
('PM00003', 'BCT00', 1),
('PM00004', 'NKUKC', 2),
('PM00005', 'TB000', 1),
('PM00006', 'CN009', 2),
('PM00007', 'TB000', 1),
('PM00008', 'DD001', 1),
('PM00009', 'LH001', 2),
('PM00010', 'BCT00', 2),
('PM00011', 'CN012', 4),
('PM00012', 'CN010', 1),
('PM00013', 'CN014', 1),
('PM00014', 'CN011', 2),
('PM00015', 'LH001', 2),
('PM00016', 'BCT00', 1),
('PM00016', 'CN014', 3),
('PM00015', 'D0001', 1),
('PM00014', 'DDXC0', 1),
('PM00013', 'CP000', 1),
('PM00012', 'D0001', 2),
('PM00011', 'DN002', 3),
('PM00010', 'CN007', 1),
('PM00009', 'CN008', 1),
('PM00008', 'D0001', 2),
('PM00007', 'NN000', 2),
('PM00006', 'CLN00', 1),
('PM00005', 'DD001', 2),
('PM00004', 'CN001', 1),
('PM00003', 'ĐNT00', 1),
('PM00002', 'DMPLK', 1),
('PM00001', 'DDXC0', 3),
('PM00001', 'D0001', 1),
('PM00002', 'CP000', 1),
('PM00003', 'DN001', 1),
('PM00004', 'DN001', 1),
('PM00005', 'LH001', 3),
('PM00006', 'ĐNT00', 3),
('PM00007', 'CN001', 2),
('PM00008', 'CN006', 1),
('PM00009', 'CN002', 1),
('PM00010', 'CN011', 1),
('PM00011', 'TC001', 3),
('PM00012', 'ĐNT00', 1),
('PM00013', 'TB000', 1),
('PM00014', 'D0001', 2),
('PM00015', 'ĐNT00', 2),
('PM00016', 'DDXC0', 2),
('PM00001', 'NN000', 1),
('PM00003', 'LH001', 1),
('PM00006', 'TC001', 2),
('PM00007', 'DD001', 4),
('PM00009', 'TC001', 2),
('PM00010', 'LH001', 2),
('PM00013', 'NN000', 1),
('PM00014', 'CLN00', 1),
('PM00015', 'CLN00', 2);
 

--- Pro + Trigger

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
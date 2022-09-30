USE DA
GO

--PROC INSERT
CREATE PROC sp_InsetNV(
	@MANV CHAR(7),
	@TEN NVARCHAR(50),
	@EMAIL CHAR(50) UNIQUE,
	@GIOITINH NVARCHAR(50),
	@SDT CHAR(10) UNIQUE,
	@NGAYSINH DATE,
	@DIACHI NVARCHAR(50),
	@CHUCVU NVARCHAR(50)
)
AS 
	INSERT INTO NHANVIEN VALUES (@MANV,@TEN,@EMAIL,@GIOITINH,@SDT,@NGAYSINH,@DIACHI,@CHUCVU)

CREATE PROC sp_InsertT(
	@MATRUYEN CHAR(6),
	@TENTRUYEN NVARCHAR(50),
	@SOLUONG INT,
	@NXB NVARCHAR(50)
)
AS
	INSERT INTO TRUYEN VALUES(@MATRUYEN,@TENTRUYEN,@SOLUONG,@NXB)

CREATE PROC sp_InsertTG(
	@MATG CHAR(7),
	@TEN NVARCHAR(50),
	@NGAYSINH DATE)
AS
	INSERT INTO TACGIA VALUES(@MATG,@TEN,@NGAYSINH)

CREATE PROC sp_InsertDG(
	@MADG CHAR(7),
	@TEN NVARCHAR(50),
	@NGAYSINH DATE,
	@GIOITINH NVARCHAR(3),
	@SDT CHAR(10) UNIQUE,
	@EMAIL CHAR(50) UNIQUE,
	@DIACHI NVARCHAR(200)
)
AS
	INSERT INTO DOCGIA VALUES (@MADG,@TEN,@NGAYSINH,@GIOITINH,@SDT,@EMAIL,@DIACHI)

CREATE PROC sp_InsertPM(
	@MAPHIEUMUON CHAR(7),
	@MADG CHAR(7),
	@NGAYMUON DATE,
	@NGAYTRA DATE,
	@TONGSL INT
)
AS
	INSERT INTO PHIEUMUON VALUES (@MAPHIEUMUON,@MADG,@NGAYMUON,@NGAYTRA,@TONGSL)

CREATE PROC sp_InsertDSM(
	@MAPHIEUMUON CHAR(7),
	@MATRUYEN CHAR(6),
	@SOLUONG INT
)
AS
	INSERT INTO DANHSACHMUON VALUES (@MAPHIEUMUON,@MATRUYEN,@SOLUONG)

CREATE PROC sp_InsertQLT(
	@MANV CHAR(7),
	@MATRUYEN CHAR(6)
)
AS
	INSERT INTO QUANLYTRUYEN VALUES (@MANV,@MATRUYEN)

CREATE PROC sp_InsertQLPM(
	MANV CHAR(7),
	MAPHIEUMUON CHAR(7)
)
AS
	INSERT INTO QUANLYPHIEUMUON VALUES(@MANV,@MAPHIEUMUON)

--PROC UPDATE
CREATE PROC sp_UpdateNV(
	@MANV CHAR(7),
	@TEN NVARCHAR(50),
	@EMAIL CHAR(50) UNIQUE,
	@GIOITINH NVARCHAR(50),
	@SDT CHAR(10) UNIQUE,
	@NGAYSINH DATE,
	@DIACHI NVARCHAR(50),
	@CHUCVU NVARCHAR(50)
)
AS 
	UPDATE NHANVIEN SET (
	TEN=@TEN,
	EMAIL=@EMAIL,
	GIOITINH=@GIOITINH,
	SDT=@SDT,
	NGAYSINH=@NGAYSINH,
	DIACHI=@DIACHI,
	CHUCVU=@CHUCVU
)
	WHERE MANV=@MANV

CREATE PROC sp_UpdateT(
	@MATRUYEN CHAR(6),
	@TENTRUYEN NVARCHAR(50),
	@SOLUONG INT,
	@NXB NVARCHAR(50)
)
AS
	UPDATE TRUYEN SET (
	TENTRUYEN=@TENTRUYEN,
	SOLUONG=@SOLUONG,
	NXB=@NXB
)
	WHERE MATRUYEN=@MATRUYEN

CREATE PROC sp_UpdateTG(
	@MATG CHAR(7),
	@TEN NVARCHAR(50),
	@NGAYSINH DATE)
AS
	UPDATE TACGIA SET(
	TEN=@TEN,
	NGAYSINH=@NGAYSINH
)
	WHERE MATG=@MATG

CREATE PROC sp_UpdateDG(
	@MADG CHAR(7),
	@TEN NVARCHAR(50),
	@NGAYSINH DATE,
	@GIOITINH NVARCHAR(3),
	@SDT CHAR(10) UNIQUE,
	@EMAIL CHAR(50) UNIQUE,
	@DIACHI NVARCHAR(200)
)
AS
	UPDATE DOCGIA SET(
	TEN=@TEN,
	NGAYSINH=@NGAYSINH,
	GIOITINH=@GIOITINH,
	SDT=@SDT,
	EMAIL=@EMAIL,
	DIACHI=@DIACHI
)
	WHERE MADG=@MADG

CREATE PROC sp_UpdatePM(
	@MAPHIEUMUON CHAR(7),
	@MADG CHAR(7),
	@NGAYMUON DATE,
	@NGAYTRA DATE,
	@TONGSL INT
)
AS
	UPDATE PHIEUMUON SET (
	MADG=@MADG,
	NGAYMUON=@NGAYMUON,
	NGAYTRA=@NGAYTRA,
	TONGSL=@TONGSL
)
	WHERE MAPHIEUMUON=@MAPHIEUMUON

CREATE PROC sp_UpdateDSM(
	@MAPHIEUMUON CHAR(7),
	2MATRUYEN CHAR(6),
	@SOLUONG INT
)
AS
	UPDATE DANHSACHMUON SET (
	SOLUONG=@SOLUONG
)
	WHERE MAPHIEUMUON=@MAPHIEUMUON AND MATRUYEN=@MATRUYEN

CREATE PROC sp_UpdateQLT(
	@MANV CHAR(7),
	@MATRUYEN CHAR(6)
)
AS
	UPDATE QUANLYTRUYEN SET (
	MATRUYEN=@MATRUYEN
)
	WHERE MANV=@MANV

CREATE PROC sp_UpdateQLPM(
	@MANV CHAR(7),
	@MAPHIEUMUON CHAR(7)
)
AS
	UPDATE QUANLYPHIEUMUON SET(
	MAPHIEUMUON=@MAPHIEUMUON
)
	WHERE MANV=@MANV

--PROC DELELE
CREATE PROC sp_DeleteNV(
	@MANV CHAR(7)
)
AS 
	DELETE NHANVIEN WHERE MANV=@MANV

CREATE PROC sp_DeleteT(
	@MATRUYEN CHAR(6)
)
AS
	DELETE TRUYEN WHERE MATRUYEN=@MATRUYEN

CREATE PROC sp_DeleteTG(
	@MATG CHAR(7)
)
AS
	DELETE TACGIA WHERE MATG=@MATG

CREATE PROC sp_DeleteDG(
	@MADG CHAR(7)
)
AS
	DELETE DOCGIA WHERE MADG=@MADG

CREATE PROC sp_DeletePM(
	@MAPHIEUMUON CHAR(7)
)
AS
	DELETE PHIEUMUON WHERE MAPHIEUMUON=@MAPHIEUMUON

CREATE PROC sp_DeleteDSM(
	@MAPHIEUMUON CHAR(7),
	@MATRUYEN CHAR(6),
)
AS
	DELETE DANHSACHMUON WHERE MAPHIEUMUON=@MAPHIEUMUON AND MATRUYEN=@MATRUYEN

CREATE PROC sp_DeleteQLT(
	@MANV CHAR(7),
	@MATRUYEN CHAR(6)
)
AS
	DELETE	QUANLYTRUYEN WHERE MANV=@MANV AND MATRUYEN=@MATRUYEN

CREATE PROC sp_DeleteQLPM(
	@MANV CHAR(7),
	@MAPHIEUMUON CHAR(7)
)
AS 
	DELETE QUANLYPHIEUMUON WHERE MANV=@MANV AND MAPHIEUMUON=@MAPHIEUMUON

--PROC SEACH



CREATE DATABASE TEST
GO
USE TEST 
GO
CREATE TABLE NHANVIEN(
	MANV VARCHAR(10),
	TEN VARCHAR(50),
	CHUCVU VARCHAR(20)

	CONSTRAINT PK_CHUCVU PRIMARY KEY(MANV)
)
INSERT INTO NHANVIEN VALUES
('001','Nguyen Ha Thien Khanh','Quan ly'),
('002','Trinh Dinh Hai Ngan','Phuc vu'),
('003','Dang Vu My Yen','Thu Ngan'),
('004','Nguyen Ha Thien Nha','Phuc vu'),
('005','Do Dinh Khanh An','Giam sat ca'),
('006','Dang Ngoc Kieu Thy','Pha che'),
('007','Truong To Ngan Hoa','Thu Ngan'),
('008','To Minh Khai Hoan','Pha che'),
('009','Nguyen Hoang Khanh An','Phuc vu'),
('010','Le Minh Anh Truc','Pha che')

SELECT CHUCVU
FROM NHANVIEN
GROUP BY CHUCVU

SELECT TEN
FROM NHANVIEN
WHERE CHUCVU='Pha che'
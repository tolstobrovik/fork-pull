--  1. SELECT INTO ishlatib yangi jadval yaratish
-- Berilgan employees jadvalidan faqat id, full_name va salary ustunlarini o‘z ichiga
-- olgan high_salary_employees nomli yangi jadval yaratish. Ushbu jadvarga faqat
-- salary > 5000 bo‘lgan xodimlarni yozing.

SELECT * INTO high_salary_employees
FROM employees
WHERE salary > 5000;

--  2. SERIAL va PRIMARY KEY bilan jadval yaratish
-- departments nomli jadval yaratish. Unda quyidagi ustunlar bo‘lishi kerak:
-- • id – SERIAL PRIMARY KEY
-- • name – VARCHAR(100), UNIQUE
-- • created_at – DATE (standart qiymati hozirgi sana bo‘lsin)
-- Jadvalni yaratish uchun SQL so‘rovini yozing.

CREATE TABLE departments(
    id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE,
    created_at DATE DEFAULT CURRENT_DATE
);


--  3. SEQUENCE yaratish va ishlatish
-- customer_id_seq nomli sequence yarating. Uni ishlatib, customers jadvaliga yangi
-- mijoz qo‘shish uchun SQL yozing.
CREATE TABLE customers (
    id INT PRIMARY KEY DEFAULT NEXTVAL('customer_id_seq'),  
    name VARCHAR(50),    
    email VARCHAR(100)   
);

CREATE SEQUENCE customer_id_seq OWNED BY customers.id;

INSERT INTO customers (name, email)
VALUES ('Ali', 'ali@example.com');
SELECT * FROM customers;
--  4. IDENTITY COLUMN bilan jadval yaratish
-- orders jadvalini yaratish va identity column ishlatish:
-- • order_id – INTEGER, GENERATED ALWAYS AS IDENTITY
-- • customer_name – TEXT
-- • total_amount – NUMERIC(10, 2)
-- Jadvalni yaratish uchun SQL yozing.

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name TEXT NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);


--  5. BOOLEAN ma'lumot turini ishlatish
-- users jadvaliga is_active nomli BOOLEAN ustun qo‘shing.
-- Barcha foydalanuvchilarni tanlab, faqat faol (is_active = true) bo‘lganlarini
-- chiqaruvchi SQL so‘rovini yozing.

ALTER TABLE users ADD COLUMN is_active BOOLEAN;
SELECT * FROM users WHERE is_active = TRUE;

--  6. CHAR va VARCHAR farqini tushuntirish
-- Quyidagi ikki jadvalni yaratish kodini yozing:
-- • products_char (name CHAR(20))
-- • products_varchar (name VARCHAR(20))
-- Ikkalasiga ham 'Laptop' yozuvini qo‘shing va har ikkala jadvaldan name uzunligini
-- (LENGTH(name)) ko‘rsatuvchi so‘rov yozing.

CREATE TABLE products_char(
    name CHAR(20)
);
CREATE TABLE products_varchar(
    name VARCHAR(20)
);

INSERT INTO products_char (name) VALUES ('Laptop');
INSERT INTO products_varchar (name) VALUES ('Laptop');

SELECT LENGTH(name) FROM products_char;
SELECT LENGTH(name) FROM products_varchar;

--  7. TEXT ma'lumot turi bo‘yicha vazifa
-- articles jadvalini yaratish va unda TEXT ma'lumot turini ishlatish:
-- • id – SERIAL PRIMARY KEY
-- • title – VARCHAR(200)
-- • content – TEXT
-- Jadvalni yaratish va unga kamida 2 ta maqola qo‘shish.

CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    content TEXT
);

INSERT INTO articles(title,content)
VALUES ("First article", "Bugun bir narsa sodir bo'ldi"),("Second article","Ertaga hammasi joyiga qaytadi");



--  8. NUMERIC ma'lumot turi bilan hisob-kitob
-- products jadvalidagi price ustuni NUMERIC(10,2) formatida berilgan.
-- Shu jadvaldan mahsulotlarning o‘rtacha narxini hisoblovchi SQL yozing.
SELECT AVG(price) FROM products;




--  9. INTEGER va AUTO INCREMENT ustun bilan ishlash
-- students nomli jadval yaratib, unda student_id ustunini SERIAL PRIMARY
-- KEY qilib belgilash.
-- Keyin ushbu jadvalga 3 ta talabani qo‘shish uchun SQL yozing.

CREATE TABLE students(
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(64),
    age INTEGER
);

INSERT INTO students(name,age) VALUES ("Omonov Sohib",16);
INSERT INTO students(name,age) VALUES ("Azizov Aziz",52);
INSERT INTO students(name,age) VALUES ("Qodirov Hasan",15);

--  10. DATE ustuni bilan ishlash
-- employees jadvalidagi hire_date (DATE) ustunidan foydalanib,
-- 2000-yildan keyin ishga qabul qilingan barcha xodimlarni chiqaruvchi SQL
-- yozing.
SELECT * FROM employees
WHERE hire_date > '2000-12-31';

LOCATION
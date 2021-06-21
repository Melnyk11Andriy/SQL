use `bank`;
-- 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
select * from client where length(FirstName) < 6;

-- 2. +Вибрати львівські відділення банку.+
select * from department where DepartmentCity = 'Lviv';

-- 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from client where Education = 'high' order by LastName;

-- 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from application order by idApplication desc limit 5;

-- 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA
select * from client where lastName like '%ov' or '%ova';

-- 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select * from client where city like 'Kyiv';

-- 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
-- I didn't find any phoneNumber column in the client table.
select firstName, Passport from client order by firstName;

-- 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select * from application where CreditState = 'Not returned' and Sum > 5000;

-- 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select count(idClient) from client;
select count(idClient) from client where city = 'Lviv';

-- 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select Client_idClient, max(Sum) from application group by Client_idClient;

-- 11. Визначити кількість заявок на крдеит для кожного клієнта.

-- 12. Визначити найбільший та найменший кредити.
select max(Sum), min(Sum) from application;

-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
select count(Client_idClient) as 'credit amount' from application
join client on application.Client_idClient = client.idClient 
where Education = 'high'; 

-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.

-- 15. Вивести відділення, яке видало в кредити найбільше грошей
-- 16. Вивести відділення, яке видало найбільший кредит.

-- 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
update application join client on client.idClient = application.Client_idClient 
set Sum = '6000', Currency = 'Gryvnia' where client.Education = 'high';

-- 18. Усіх клієнтів київських відділень пересилити до Києва.
update client join department on client.Department_idDepartment = department.idDepartment
set City = 'Kyiv' where department.idDepartment = 1 and department.idDepartment = 4;
 
-- 19. Видалити усі кредити, які є повернені.
delete from application where CreditState = 'Returned';

-- 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

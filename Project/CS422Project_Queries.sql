
use CS422Project;
CREATE VIEW view as SELECT books.book_id,books.name FROM books 
inner join book_loans on books.book_id=book_loans.book_id 
inner join borrowers on book_loans.card_id=borrowers.card_id
where borrowers.bor_type='Faculty' and borrowers.department='Electric Department';
select * from view;


use CS422Project;
select avg(boc) from 
(select * from borrowers where bor_type='Graduate Student' and department='Computer Science') as bo
 inner join (select card_id,count(book_id)as boc  from book_loans GROUP BY card_id) as bk on bo.card_id=bk.card_id ;
 
 
use CS422Project;
SELECT     b.name, el.Eng_count, fo.for_count, b.bor_type
FROM         borrowers AS b INNER JOIN      (SELECT     book_Loans.card_id, COUNT(*) AS Eng_count
                            FROM          book_Loans 
                            WHERE      (loan_type = 'English')
                            GROUP BY book_Loans.card_id) AS el on b.card_id=el.card_id
                            left JOIN 
                            (SELECT Book_Loan_1.card_id, COUNT(*) AS for_count
                            FROM          book_loans AS Book_Loan_1 
                            WHERE      (loan_type= 'foreign')
                            GROUP BY Book_Loan_1.card_id) as fo on el.card_id=fo.card_id
                            WHERE b.bor_type='vocational student'
GROUP BY b.name, el.Eng_count, fo.for_count, b.bor_type
HAVING      ( el.Eng_count > CASE WHEN fo.for_count IS NULL THEN 0 ELSE fo.for_count END);


use CS422Project;
select bol.card_id,sum(fine_amount) from( (select * from borrowers where bor_type='Undergraduate Student') as bor 
inner join (select * from book_loans where due_date < curdate() group by card_id) as bol on bor.card_id = bol.card_id);


use CS422Project;
UPDATE book_loans as bl
SET due_date=STR_TO_DATE( '4/8/2015', '%m/%d/%Y' )
WHERE book_id= (select book_id as b from books as b 
where bl.card_id=101202505 and b.book_id=bl.book_id and b.name='Convex Optimization') ;
select * from book_loans;


use CS422Project;
select DISTINCT b1.name from (select DISTINCT isbn,name from books where branch_id=(select branch_id from lib_branches where branch_name='Branch A')) as b1 
where NOT EXISTS (select * from 
(select DISTINCT isbn from books where branch_id=(select branch_id from lib_branches where branch_name='Branch A') and  NOT EXISTS (select * from book_loans where books.book_id=book_loans.book_id))
as b2 where  b1.isbn=b2.isbn);


use CS422Project;
select name from books as b1 where branch_id=(select branch_id from lib_branches where branch_name='Branch B') 
and NOT exists 
(select name from books as b2 where branch_id<>(select branch_id from lib_branches where branch_name='Branch B')
 and b1.name=b2.name);
 

 use CS422Project;
 select name from borrowers inner join book_loans on borrowers.card_id=book_loans.card_id
 and borrowers.department='Finance Department' and book_loans.renew_status=1;
 

 use CS422Project;
 select DISTINCT name  from books as b1 where branch_id=(select branch_id from lib_branches where branch_name='Branch C') and Is_new=1 and 
 NOT EXISTS (select * from books as b2 where  EXISTS 
 (select * from book_loans where branch_id=(select branch_id from lib_branches where branch_name='Branch C') and book_loans.book_id=b2.book_id ) and b2.isbn=b1.isbn) ;
 

 use CS422Project;
 select lb.branch_name,fl.Maximum_book ,fl.pu from lib_branches as lb inner join 
 (select b1.cp as branchID,b1.max_br as Maximum_book,b2.publishpress as pu from (select copo.branch_id as cp,max(copo.co) as max_br from 
(select publishpress ,branch_id ,count(*) as co from books group by publishpress ,branch_id)
 as copo group by copo.branch_id) as b1 
 inner join 
(
select publishpress ,branch_id ,count(*) as co from books group by publishpress ,branch_id) as b2
on 
b1.max_br=b2.co and b1.cp=b2.branch_id) as fl on fl.branchID=lb.branch_id;
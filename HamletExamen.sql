restore database AdventureWorks2019 from disk='E:\AdventureWorks2019.bak' with replace

Create database DMAdventureWorks

USE [AdventureWorks2019]
GO

/*Creamos Inicialmente las tablas que nos indican, en este caso son 2:
CreditCardDim y CustomerDim*/


/*Aca procedemos las tablas de CreditCard, donde mandamos a llamar a Number y BillingAddress*/
CREATE TABLE [CreditCardDim](
	[CreditCardDimID] [int] IDENTITY(1,1) NOT NULL,
	[CreditCardID] int not null,
	[CardNumber] [nvarchar](25) not null,
	[CreditCardBillinAddress] int not null,
	[FechaInicio] date,
	[FechaFinal] date)

Drop Table CreditCardDim

Select
cc.CreditCardID,
cc.CardNumber,
soh.BillToAddressID as CreditCardBillinAddress
from Sales.CreditCard cc
inner join Sales.SalesOrderHeader soh
on soh.CreditCardID = cc.CreditCardID

/*Consulta Origen*/

/*En esta parte se crea la Ultima tabla CustomerDim*/
CREATE TABLE [CustomerDim](
	[CustomerDimID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] int null,
	[CustomerName] nvarchar(50)null,
	[FechaInicio] date,
	[FechaFinal] date)

dROP Table CustomerDim
Select 
c.CustomerID,
p.FirstName + ' '+ p.LastName as [CustomerName]
from Sales.Customer c
inner join Person.BusinessEntity sp
on sp.BusinessEntityID = c.PersonID
inner join Person.Person p 
on p.BusinessEntityID = sp.BusinessEntityID

Select * from CreditCardDim
Select * from CustomerDim
 --create table [dbo].[Category](
 --[Id] int primary key identity ,
 --[Name] nvarchar(200)
 --)
 
 --insert into [dbo].[Category]([Name])
  --    values(N'Audio,video')
  --  ,(N'Kompüter və ofis avadanlığı')
  --  ,(N'Planşetlər')
  --  ,(N'Telefonlar, Saatlar və Nömrələr');
  --  go

  ----------------------------------------------------------------------------------------------------

--create table [dbo].[Product] (
--[id] int primary key identity not null,
--[Name] nvarchar(200) NULL, 
--[Description] nvarchar(200) NULL, 
--[CategoryId] int NULL, 
--[CreatedDate] date NULL
--)



--INSERT INTO [dbo].[Product] ([Name], [Description], [CategoryId], [CreatedDate])
--    VALUES (N'Wonlex GW100 Pink', NULL, 4, '2019-09-15')
--    ,(N'Wonlex Q50 Charisma BLACK', NULL, 4, '2019-09-15')
--    ,(N'Samsung Galaxy S10 Dual (SM-G973) White', NULL, 4, '2019-09-15')
--    ,(N'Xiaomi Mi A3 4/128GB White', NULL, 4, '2019-09-15')
--    ,(N'Blackview BV1000 yellow', NULL, 4, '2019-09-15')
--    ,(N'Huawei Y9 2019 4/64GB Red', NULL, 4, '2019-09-15')
--    ,(N'FLY TS114 BLACK', NULL, 4, '2019-09-15')
--    ,(N'Blackview BV5500 Pro yellow', NULL, 4, '2019-09-15')
--    ,(N'Lenovo TB 7104I/3G -Wi-Fi/7 BLACK', NULL, 3, '2019-09-15')
--    ,(N'Samsung Galaxy Tab A 8.0 (SM-T295) Black', NULL, 3, '2019-09-15')
--    ,(N'Lenovo TAB E10 TB-X104F/10.1 BLACK', NULL, 3, '2019-09-15')
--    ,(N'Lenovo TAB 4 10 LTE (TB-X304L) black', NULL, 3, '2019-09-15')
--    ,(N'Samsung Galaxy Tab A (SM-T385) GOLD', NULL, 3, '2019-09-15')
--    ,(N'Huawei M5 Lite 3+32 Space Grey', NULL, 3, '2019-09-15')
--    ,(N'Apple MacBook Air 13″ MVFK2', NULL, 2, '2019-09-15')
--    ,(N'Apple MacBook Air 13″ MVFH2', NULL, 2, '2019-09-15')
--    ,(N'Monoblok HP ENVY 27-B170ur i7/16/nv4/1tb128/win10', NULL, 2, '2019-09-15')
--    ,(N'Noutbuk Asus Tuf Gaming FX505DD BQ121 ', NULL, 2, '2019-09-15')
--    ,(N'Noutbuk Acer Predator Helios 300 PH315-52-718G ', NULL, 2, '2019-09-15')
--    ,(N'Musiqi merkezi SONY MHC-V82D', NULL, 1, '2019-09-15')
--    ,(N'Speaker Sony SRS-XB21 Wireless', NULL, 1, '2019-09-15')
--    ,(N'JBL Pulse 3 Black', NULL, 1, '2019-09-15');
 


 ----------------------------------------------------------------------------------------------------------


-- USE [Task2]
--GO

--/****** Object:  StoredProcedure [dbo].[spInsertProduct]    Script Date: 9/23/2022 8:34:54 PM ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

---- =============================================
---- Author:		<Aydan>
---- Create date: <2022-09-22>
---- Description:	<Description,,>
---- =============================================
--ALTER PROCEDURE [dbo].[spInsertProduct] 
--	-- Add the parameters for the stored procedure here
--	@name nvarchar(100),
--	@description nvarchar(100),
--	@categoryName nvarchar(100)
--AS
--BEGIN
	
--	set xact_abort on;
--	SET NOCOUNT ON;

--	if not exists (select * from [dbo].[Product] where  [Name]=@name)
--	begin 

--	declare @categoryId int
--	select @categoryId=[id] from [dbo].[Category] where [Name]=@categoryName

--	if @categoryId is null
--	begin
--	  insert [dbo].[Category]([Name])
--	  values (@categoryName)
--	  set @categoryId=SCOPE_IDENTITY()

--    end
	
--	INSERT INTO [dbo].[Product]
--           ([Name]
--           ,[Description]
--           ,[CategoryId]
--           ,[CreatedDate])
--     VALUES
--           (@name,
--		   @description,
--		   @categoryId,
--		   GETDATE())

--END
--end
----select * from [dbo].[Product]
----select * from [dbo].[Category]
----execute [dbo].[spInsertProduct] N'iphone 17',null,N'klaviautra'
--GO


-----------------------------------------------------------------------------------------------

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Aydan,,Name>
---- Create date: <Create Date,,>
---- Description:	<Description,,>
---- =============================================

--alter PROCEDURE dbo.spDeleteProduct 
--@productId int
--AS
--BEGIN
--	set xact_abort on;
--	SET NOCOUNT ON;
	
--	begin try
--	begin transaction delete_product
--	insert into [Archive].[Products]
--	select [Name]
--           ,[Description]
--           ,[CategoryId]
--           ,[CreatedDate]
--		   ,getdate()
--		   from [dbo].[Product] where [id]=@productId
		
--   delete from [dbo].[Product] where [id]=@productId
--   commit
--   end try
--   begin catch
--   rollback
--   end catch
--END
--GO


----------------------------------------------------------------------------------------------------

--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:		<Aydan>
---- Create date: <2022-09-22>
---- Description:	<Description,,>
---- =============================================
--alter PROCEDURE dbo.spUpdateProduct 
--	-- Add the parameters for the stored procedure here
--	@name nvarchar(100),
--	@description nvarchar(100),
--	@categoryName nvarchar(100)
--AS
--BEGIN
	
--	set xact_abort on;
--	SET NOCOUNT ON;
--	declare @productId int
--	select @productId=[id] from [dbo].[Product] where [Name]=@name

--	declare @categoryId int
--	select @categoryId=[id] from [dbo].[Category] where [Name]=@categoryName

--	if @categoryId is null
--	begin
--	  insert [dbo].[Category]([Name])
--	  values (@categoryName)
--	  set @categoryId=SCOPE_IDENTITY()
--    end

--	if @productId is null
--	begin
--	  insert [dbo].[Product]([Name],[Description],[CategoryId],[CreatedDate])
--	  values (@name,@description,@categoryId,getdate())
--	  set @productId=SCOPE_IDENTITY()
--    end
--	else
--	begin

--    Update [dbo].[Product]
    
--	set [Name]=@name ,[Description]=@description,[CategoryId]=@categoryId,[CreatedDate]=getdate()
--	where [id]=@productId
--	end
    

--END
--GO


----------------------------------------------------------------------------------------------------------------

--create view
/*
create view VwGetProductDetails
as
SELECT 
       p.[id]
       ,p.[Name] [Product Name]
      ,p.[Description]
      ,c.[Name] [Category Name]
      ,p.[CreatedDate]
  FROM [dbo].[Product] p 
  left join [dbo].[Category] c on p.CategoryId=c.id
*/


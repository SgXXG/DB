-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddSupplier]
	@name nvarchar(50),
	@email nvarchar(50),
	@phone_number nvarchar(50),
	@address nvarchar(50)
AS
BEGIN
	IF(@email = '' OR @phone_number = '' OR @address = '')
	BEGIN
		PRINT 'Unable to add supplier. Required fields (email, phone_number, address) are missing.'
	END
	ELSE
	BEGIN
		INSERT INTO supplier (name, email, phone_number, address) VALUES (@name, @email, @phone_number, @address)
		PRINT 'Supplier added successfully.'
	END
END
GO

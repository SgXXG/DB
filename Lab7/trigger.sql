-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
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
CREATE TRIGGER trg_prevent_last_smartphone_deletion
ON [dbo].[smartphone]
FOR DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM [dbo].[smartphone])
    BEGIN
        RAISERROR('Cannot delete last smartphone from table!', 16, 1)
        ROLLBACK TRANSACTION
    END
END
GO

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
CREATE PROCEDURE [dbo].[deleteEmployeeIfContractExpired]
AS
BEGIN
    DECLARE @today DATE
    SET @today = GETDATE()

    DELETE FROM [dbo].[employee]
    WHERE id IN (
        SELECT e.id 
        FROM [dbo].[employee] e
        JOIN [dbo].[contract] c ON e.id = c.employee_id
        WHERE c.end_date < DATEADD(YEAR, -1, @today)
    )

    DELETE FROM [dbo].[contract]
    WHERE end_date < DATEADD(YEAR, -1, @today)
END
GO

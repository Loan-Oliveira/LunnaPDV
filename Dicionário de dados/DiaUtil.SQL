USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[IsDiaUtil]    Script Date: 31/08/2024 15:49:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna se a data é dia útil.
-- Como usar : SELECT dbo.IsDiaUtil(GETDATE())
-- =============================================
CREATE FUNCTION [dbo].[IsDiaUtil](@Data DATETIME)
RETURNS CHAR
AS
BEGIN
  DECLARE @RESULTADO CHAR
  IF DATEPART(WEEKDAY, @Data) IN (7,1)
    SET @RESULTADO = 'N'
  ELSE
    SET @RESULTADO = 'S'

  RETURN @RESULTADO
END
GO



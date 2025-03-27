USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[GetUltimoDiaMes]    Script Date: 31/08/2024 15:49:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna o ultimo dia do mês.
-- Como usar : SELECT dbo.GetUltimoDiaMes(2024, 8)
-- =============================================
CREATE FUNCTION [dbo].[GetUltimoDiaMes](@ANO INT, @MES INT)
RETURNS INT
AS
BEGIN
  RETURN
    DATEPART(DAY, EOMONTH(DATEFROMPARTS(@ANO, @MES, 1)))
END
GO



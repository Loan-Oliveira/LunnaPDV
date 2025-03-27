USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[GetDiaExtenso]    Script Date: 31/08/2024 15:48:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna o dia da semana por extenso.
-- Como usar : SELECT dbo.GetDiaExtenso(GETDATE())
-- =============================================
CREATE FUNCTION [dbo].[GetDiaExtenso](@Data DATETIME)
RETURNS VARCHAR(13)
AS
BEGIN 
  DECLARE @RESULTADO VARCHAR(13)
  SET @RESULTADO =
  CASE DATEPART(WEEKDAY, @DATA)
    WHEN 1 THEN 'Domingo'
	WHEN 2 THEN 'Segunda-Feira'
	WHEN 3 THEN 'Terça-Feira'
	WHEN 4 THEN 'Quarta-Feira'
	WHEN 5 THEN 'Quinta-Feira'
	WHEN 6 THEN 'Sexta-Feira'
	ELSE 'Sábado'
  END

  RETURN @RESULTADO
END
GO



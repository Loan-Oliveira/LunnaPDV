USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[GetHoraServidor]    Script Date: 31/08/2024 15:48:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna a hora atual.
-- Como usar : SELECT dbo.GetHoraServidor()
-- =============================================
CREATE FUNCTION [dbo].[GetHoraServidor]()
RETURNS VARCHAR(8)
AS
BEGIN
  DECLARE @HORA VARCHAR(8)
  SET @HORA = CONVERT(CHAR(8), CURRENT_TIMESTAMP, 108)
  RETURN @HORA
END
GO



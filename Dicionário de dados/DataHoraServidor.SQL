USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[GetDataHoraServidor]    Script Date: 31/08/2024 15:48:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna a data e a hora atual.
-- Como usar : SELECT FORMAT(dbo.GetDataHoraServidor(), 'dd/MM/yyyy hh:mm:ss')
-- =============================================
CREATE FUNCTION [dbo].[GetDataHoraServidor]()
RETURNS DATETIME
AS
BEGIN
  DECLARE @DATAHORA DATETIME
  SET @DATAHORA = FORMAT(GETDATE(), 'dd/MM/yyyy hh:mm:ss')
  RETURN @DATAHORA
END
GO



USE [LUNA]
GO

/****** Object:  UserDefinedFunction [dbo].[GetDataServidor]    Script Date: 31/08/2024 15:48:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan
-- Create date: 31/08/2024
-- Description:	Retorna a data atual.
-- Como usar : SELECT FORMAT(dbo.GetDataServidor(), 'dd/MM/yyyy')
-- =============================================
CREATE FUNCTION [dbo].[GetDataServidor]()
RETURNS DATE
AS
BEGIN
  DECLARE @DATA DATE;
  SET @DATA = FORMAT(GETDATE(), 'dd/MM/yyyy');
  RETURN @DATA
END
GO



USE [LUNNA]
GO

/****** Object:  StoredProcedure [dbo].[ValidaSenhaUsuario]    Script Date: 01/09/2024 07:56:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Loan Oliveira
-- Create date: 01/09/2024
-- Description:	Valida usuário com senha criptografada
-- Como usar: exec dbo.ValidaSenhaUsuario 'USUARIO', 'SENHA'
-- =============================================
CREATE PROCEDURE [dbo].[ValidaSenhaUsuario]
@T001_USUARIO VARCHAR(100),
@T001_SENHA VARCHAR(100)
AS
BEGIN
	DECLARE @SENHA_HASH VARCHAR (500)
    DECLARE @SENHA_INFORMADA VARCHAR(500)
	-- DECLARE @VALIDO CHAR(1)

	SELECT @SENHA_HASH = T001_SENHA FROM T001_USUARIOS WHERE T001_USUARIO = @T001_USUARIO

	SET @SENHA_INFORMADA = HASHBYTES('sha2_512', @T001_SENHA)

	IF @SENHA_INFORMADA = (@SENHA_HASH)
		RETURN 1
	ELSE
		RETURN 0

	-- SELECT @VALIDO AS VALIDO
END
GO



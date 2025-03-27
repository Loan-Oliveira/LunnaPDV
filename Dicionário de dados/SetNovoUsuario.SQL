USE [LUNNA]
GO

/****** Object:  StoredProcedure [dbo].[SetNovoUsuario]    Script Date: 01/09/2024 07:00:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Loan Oliveira
-- Create date: 01/09/2024
-- Description:	Insere novo usuário com senha criptografada
-- Como usar: exec dbo.SetNovoUsuario 'admin', 'admin', 'Administrador', 'Lunna', null
-- =============================================
CREATE PROCEDURE [dbo].[SetNovoUsuario]
@T001_USUARIO VARCHAR(100),
@T001_SENHA VARCHAR(100),
@T001_NOME VARCHAR(100),
@T001_SOBRENOME VARCHAR(100),
@T001_FOTO VARCHAR(500)
AS
BEGIN
	DECLARE @SENHA_HASH VARCHAR (500)

	SET @SENHA_HASH = HASHBYTES('sha2_512', @T001_SENHA)

	INSERT INTO T001_USUARIOS
				(T001_USUARIO,
				T001_SENHA,
				T001_NOME,
				T001_SOBRENOME,
				T001_FOTO)
     VALUES
           (@T001_USUARIO,
           @SENHA_HASH,
           @T001_NOME,
           @T001_SOBRENOME,
           @T001_FOTO)
END
GO



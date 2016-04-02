-- ########################### GENERATE QUERIES TO INSERT OR UPDATE ##################### 

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para inserir ou atualizar registros na tabela tbCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_SaveCliente'
AND type = 'P')
DROP PROCEDURE usp_SaveCliente 
go

create proc usp_SaveCliente
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
if( @idCliente is null or @idCliente = 0 )
begin
	insert into tbCliente ([nome]) 
	values (@nome) 
	select SCOPE_IDENTITY() as 'identity'
end
else 
begin
	update tbCliente set [nome] = @nome
	Where [idCliente] = @idCliente 
	select @idCliente
end

go

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para inserir ou atualizar registros na tabela tbGrupo
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_SaveGrupo'
AND type = 'P')
DROP PROCEDURE usp_SaveGrupo 
go

create proc usp_SaveGrupo
@idGrupo int = null,
@nome varchar(50)  = null
as
set nocount on
if( @idGrupo is null or @idGrupo = 0 )
begin
	insert into tbGrupo ([nome]) 
	values (@nome) 
	select SCOPE_IDENTITY() as 'identity'
end
else 
begin
	update tbGrupo set [nome] = @nome
	Where [idGrupo] = @idGrupo 
	select @idGrupo
end

go

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para inserir ou atualizar registros na tabela tbGrupoCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_SaveGrupoCliente'
AND type = 'P')
DROP PROCEDURE usp_SaveGrupoCliente 
go

create proc usp_SaveGrupoCliente
@idGrupo int = null,
@idCliente int = null
as
set nocount on
insert into tbGrupoCliente ([idGrupo], [idCliente]) 
values (@idGrupo, @idCliente) 


go

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para inserir ou atualizar registros na tabela tbPedido
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_SavePedido'
AND type = 'P')
DROP PROCEDURE usp_SavePedido 
go

create proc usp_SavePedido
@idPedido int = null,
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
if( @idPedido is null or @idPedido = 0 )
begin
	insert into tbPedido ([idCliente], [nome]) 
	values (@idCliente, @nome) 
	select SCOPE_IDENTITY() as 'identity'
end
else 
begin
	update tbPedido set [idCliente] = @idCliente, [nome] = @nome
	Where [idPedido] = @idPedido 
	select @idPedido
end

go


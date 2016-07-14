-- ########################### GENARATE QUERIES TO SELECT ##################### 

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para selecionar registros na tabela tbCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_GetCliente'
AND type = 'P')
DROP PROCEDURE usp_GetCliente 
go

create proc usp_GetCliente
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'select [idCliente], [nome]  from tbCliente where 1=1 ' 
if( @idCliente is not null ) set @sql = @sql + ' and [idCliente] = ' + convert(varchar(30), @idCliente) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go


-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para selecionar registros na tabela tbGrupo
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_GetGrupo'
AND type = 'P')
DROP PROCEDURE usp_GetGrupo 
go

create proc usp_GetGrupo
@idGrupo int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'select [idGrupo], [nome]  from tbGrupo where 1=1 ' 
if( @idGrupo is not null ) set @sql = @sql + ' and [idGrupo] = ' + convert(varchar(30), @idGrupo) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go


-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para selecionar  registros na tabela tbGrupoCliente & tbCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_GetGrupoClienteCliente'
AND type = 'P')
DROP PROCEDURE usp_GetGrupoClienteCliente 
go

create proc usp_GetGrupoCliente
@idGrupo int
as
set nocount on
select idCliente, nome from tbCliente 
where idCliente in 
(
	select idCliente from tbGrupoCliente 
	where idGrupo = @idGrupo
)

go


-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para selecionar  registros na tabela tbGrupoCliente & tbGrupo
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_GetGrupoClienteGrupo'
AND type = 'P')
DROP PROCEDURE usp_GetGrupoClienteGrupo 
go

create proc usp_GetGrupoCliente
@idCliente int
as
set nocount on
select idGrupo, nome from tbGrupo 
where idGrupo in 
(
	select idGrupo from tbGrupoCliente 
	where idCliente = @idCliente
)

go


-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para selecionar registros na tabela tbPedido
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_GetPedido'
AND type = 'P')
DROP PROCEDURE usp_GetPedido 
go

create proc usp_GetPedido
@idPedido int = null,
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'select [idPedido], [idCliente], [nome]  from tbPedido where 1=1 ' 
if( @idPedido is not null ) set @sql = @sql + ' and [idPedido] = ' + convert(varchar(30), @idPedido) + ' '
if( @idCliente is not null ) set @sql = @sql + ' and [idCliente] = ' + convert(varchar(30), @idCliente) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go



-- ########################### GENARATE QUERIES TO DELETE ##################### 

-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para excluir registros na tabela tbCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_DelCliente'
AND type = 'P')
DROP PROCEDURE usp_DelCliente 
go

create proc usp_DelCliente
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'delete from tbCliente where 1=1 '
if( @idCliente is not null ) set @sql = @sql + ' and [idCliente] = ' + convert(varchar(30), @idCliente) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go
-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para excluir registros na tabela tbGrupo
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_DelGrupo'
AND type = 'P')
DROP PROCEDURE usp_DelGrupo 
go

create proc usp_DelGrupo
@idGrupo int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'delete from tbGrupo where 1=1 '
if( @idGrupo is not null ) set @sql = @sql + ' and [idGrupo] = ' + convert(varchar(30), @idGrupo) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go
-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para excluir registros na tabela tbGrupoCliente
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_DelGrupoCliente'
AND type = 'P')
DROP PROCEDURE usp_DelGrupoCliente 
go

create proc usp_DelGrupoCliente
@idGrupo int = null,
@idCliente int = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'delete from tbGrupoCliente where 1=1 '
if( @idGrupo is not null ) set @sql = @sql + ' and [idGrupo] = ' + convert(varchar(30), @idGrupo) + ' '
if( @idCliente is not null ) set @sql = @sql + ' and [idCliente] = ' + convert(varchar(30), @idCliente) + ' '
exec sp_sqlexec @sql

go
-- *****************************************************
-- *** Criado em ........ 21/02/2008 10:42
-- *** Criado por ....... CSGen
-- *** Descricao ........ Procedure criada para excluir registros na tabela tbPedido
-- *** Alterado em ......
-- *** Alterado por .....
-- *** Motivo alteracao .
-- *****************************************************

IF EXISTS (SELECT * FROM sysobjects 
WHERE name = N'usp_DelPedido'
AND type = 'P')
DROP PROCEDURE usp_DelPedido 
go

create proc usp_DelPedido
@idPedido int = null,
@idCliente int = null,
@nome varchar(50)  = null
as
set nocount on
declare @sql varchar(8000)
set @sql = 'delete from tbPedido where 1=1 '
if( @idPedido is not null ) set @sql = @sql + ' and [idPedido] = ' + convert(varchar(30), @idPedido) + ' '
if( @idCliente is not null ) set @sql = @sql + ' and [idCliente] = ' + convert(varchar(30), @idCliente) + ' '
if( @nome is not null ) set @sql = @sql + ' and [nome] = ''' + @nome + ''' '
exec sp_sqlexec @sql

go

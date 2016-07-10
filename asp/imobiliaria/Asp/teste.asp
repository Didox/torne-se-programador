<!--#INCLUDE FILE ="chamar_banco.asp"-->
<html>
<head>
<title>teste</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<%conn.execute("CREATE TABLE [dbo].[Cliente_imovel_net] ([codigo] [int] IDENTITY (1, 1) NOT NULL ,[cod_imovel] [int] NULL ,[cod_cliente_imovel] [int] NULL ) ON [PRIMARY]")%>
<%conn.execute("ALTER TABLE [dbo].[Cliente_imovel_net] WITH NOCHECK ADD CONSTRAINT [PK_Cliente_imovel_net] PRIMARY KEY  CLUSTERED ([codigo])  ON [PRIMARY] ")%>
OK!
</body>
</html>
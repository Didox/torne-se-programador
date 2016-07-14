-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/03/2016 às 16:01
-- Versão do servidor: 5.6.25
-- Versão do PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(50) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `telefone_cliente` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `cliente`
--

INSERT INTO `cliente` (`id`, `email_cliente`, `nome_cliente`, `telefone_cliente`) VALUES
(2, 'gtotti2@gmail.com', 'GIAN LUCCA RICUPITO DOS SANTOS', '(11) 9655-50306');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(50) NOT NULL,
  `id_produto` int(50) NOT NULL,
  `id_cliente` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_produto`, `id_cliente`) VALUES
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(50) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `descricao_produto` varchar(100) NOT NULL,
  `preco_produto` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `produto`
--

INSERT INTO `produto` (`id`, `nome_produto`, `descricao_produto`, `preco_produto`) VALUES
(2, 'GIAN LUCCA RICUPITO DOS SANTOS', 'sdsadsa', 'R$ 465.00');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

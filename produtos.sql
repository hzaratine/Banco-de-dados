-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/05/2026 às 00:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtd` int(11) NOT NULL,
  `data` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtd`, `data`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Acém peça', 39.99, 50, '2026-05-13', b'1', 3, 'Sem gordura', NULL),
(2, 'Sabão em pó', 15.99, 30, '2026-05-13', b'1', 4, '', NULL),
(3, 'Ervilha', 5.56, 10, '2026-05-13', b'0', 1, '', NULL),
(4, 'Leite', 25.45, 40, '2026-05-13', b'1', 2, '', 'Itambé'),
(5, 'Refrigerante Cola 2L', 8.99, 60, '2026-05-26', b'1', 1, 'Gelado', 'Coca-Cola'),
(6, 'Barra de Chocolate', 5.49, 100, '2026-05-26', b'1', 2, 'Ao leite', 'Nestlé'),
(7, 'Salgadinho de Batata', 9.50, 45, '2026-05-26', b'1', 2, NULL, 'Pringles'),
(8, 'Café Torrado Tradicional 500g', 18.50, 40, '2026-05-26', b'1', 3, 'Vácuo', 'Pilao'),
(9, 'Azeite de Oliva Extra Virgem', 34.90, 25, '2026-05-26', b'1', 1, 'Acidez máxima 0.5%', 'Gallo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

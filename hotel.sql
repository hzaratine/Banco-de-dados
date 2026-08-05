-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/08/2026 às 22:44
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Henrique', 'henriquezarap@gmail.com', '123.456.789-00'),
(2, 'Mariana Costa', 'mariana.costa@email.com', '882.491.119-66'),
(3, 'Carlos Souza', 'carlos.souza@email.com', '022.415.439-77'),
(4, 'Ana Beatriz', 'ana.beatriz@email.com', '416.133.037-50'),
(5, 'Rodrigo Alves', 'rodrigo.alves@email.com', '772.157.903-12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `datadeentrada` date NOT NULL,
  `datadesaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `datadeentrada`, `datadesaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(1, '2026-08-05', '2026-08-10', '14:00:00', '12:00:00', 500.00, 1, 4),
(2, '2026-08-05', '2026-08-10', '13:58:28', '19:58:28', 670.00, 3, 5),
(3, '2026-08-05', '2026-08-10', '14:00:00', '12:00:00', 500.00, 1, 4),
(4, '2026-08-05', '2026-08-10', '13:58:28', '19:58:28', 670.00, 3, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(225) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(4, '101', '1º Andar', 'Standard'),
(5, '102', '1º Andar', 'Standard'),
(6, '103', '1º Andar', 'Luxo'),
(7, '201', '2º Andar', 'Standard'),
(8, '202', '2º Andar', 'Luxo'),
(9, '203', '2º Andar', 'Master'),
(10, '301', '3º Andar', 'Luxo'),
(11, '302', '3º Andar', 'Presidencial');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(225) NOT NULL,
  `qtde` varchar(100) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(9, 'Café da Manhã no Quarto', '', 35.00, 'Alimentação'),
(10, 'Lavanderia - Lavagem Seca', '', 50.00, 'Limpeza'),
(11, 'Frigobar - Refrigerante Lata', '', 7.50, 'Consumo'),
(12, 'Uso da Sala de Reuniões (Hora)', '', 60.00, 'Corporativo'),
(13, 'Aluguel de Toalha de Praia', '', 10.00, 'Lazer'),
(14, 'Jantar - Prato À La Carte', '', 89.00, 'Alimentação'),
(15, 'Frigobar - Porção de Castanhas', '', 14.00, 'Consumo'),
(16, 'Early Check-in (Entrada Antecipada)', '', 80.00, 'Taxa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicohospedagem`
--

CREATE TABLE `servicohospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `idservico` int(11) NOT NULL,
  `dataservico` date NOT NULL,
  `horaservico` time NOT NULL,
  `total` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicohospedagem`
--

INSERT INTO `servicohospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`, `total`) VALUES
(1, 13, '2026-08-05', '21:07:08', NULL),
(2, 14, '2026-08-05', '06:07:08', NULL),
(3, 16, '2026-08-05', '06:07:08', 49.00),
(4, 12, '2026-08-05', '21:07:08', 60.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD PRIMARY KEY (`idhospedagem`,`idservico`,`dataservico`,`horaservico`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD CONSTRAINT `servicohospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicohospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

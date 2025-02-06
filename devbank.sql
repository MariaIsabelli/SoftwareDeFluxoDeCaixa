-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Fev-2025 às 20:29
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `devbank`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `entradavalores`
--

CREATE TABLE `entradavalores` (
  `ID` int(11) NOT NULL,
  `ValorEntrada` double DEFAULT NULL,
  `TipoDeEntrada` varchar(255) DEFAULT NULL,
  `Data_Entrada` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `entradavalores`
--

INSERT INTO `entradavalores` (`ID`, `ValorEntrada`, `TipoDeEntrada`, `Data_Entrada`, `ativo`) VALUES
(1, 1500, 'Venda de Produto', '2024-02-01', 1),
(2, 3000, 'Serviço Prestado', '2024-02-05', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fluxodecaixa`
--

CREATE TABLE `fluxodecaixa` (
  `ID` int(11) NOT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Id_EntradaDeValores` int(11) DEFAULT NULL,
  `Id_SaidaDeValores` int(11) DEFAULT NULL,
  `ValorEntrada` double DEFAULT NULL,
  `ValorSaida` double DEFAULT NULL,
  `Data_Entrada` date DEFAULT NULL,
  `Data_Saida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `fluxodecaixa`
--

INSERT INTO `fluxodecaixa` (`ID`, `Id_Usuario`, `Id_EntradaDeValores`, `Id_SaidaDeValores`, `ValorEntrada`, `ValorSaida`, `Data_Entrada`, `Data_Saida`) VALUES
(1, 1, 1, 1, 1500, 500, '2024-02-01', '2024-02-03'),
(2, 2, 2, 2, 3000, 200, '2024-02-05', '2024-02-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID` int(11) NOT NULL,
  `ID_EntradaDeValores` int(11) DEFAULT NULL,
  `ID_SaidaDeValores` int(11) DEFAULT NULL,
  `TipoDeEntrada` varchar(255) DEFAULT NULL,
  `Data_Entrada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`ID`, `ID_EntradaDeValores`, `ID_SaidaDeValores`, `TipoDeEntrada`, `Data_Entrada`) VALUES
(1, 1, 1, 'Eletrônico', '2024-02-01'),
(2, 2, 2, 'Serviço', '2024-02-05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saidavalores`
--

CREATE TABLE `saidavalores` (
  `ID` int(11) NOT NULL,
  `ValorSaida` double DEFAULT NULL,
  `TipoDeSaida` varchar(255) DEFAULT NULL,
  `Data_Saida` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `saidavalores`
--

INSERT INTO `saidavalores` (`ID`, `ValorSaida`, `TipoDeSaida`, `Data_Saida`, `ativo`) VALUES
(1, 500, 'Pagamento de Fornecedor', '2024-02-03', 1),
(2, 200, 'Despesas Operacionais', '2024-02-07', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `CPF` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `nome`, `CPF`, `Email`, `Senha`, `Ativo`) VALUES
(1, 'Maria Silva', '12345678901', 'maria@email.com', 'senha123', 1),
(2, 'João Souza', '98765432100', 'joao@email.com', 'senha456', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `entradavalores`
--
ALTER TABLE `entradavalores`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `fluxodecaixa`
--
ALTER TABLE `fluxodecaixa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_EntradaDeValores` (`Id_EntradaDeValores`),
  ADD KEY `Id_SaidaDeValores` (`Id_SaidaDeValores`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_EntradaDeValores` (`ID_EntradaDeValores`),
  ADD KEY `ID_SaidaDeValores` (`ID_SaidaDeValores`);

--
-- Índices para tabela `saidavalores`
--
ALTER TABLE `saidavalores`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `entradavalores`
--
ALTER TABLE `entradavalores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `fluxodecaixa`
--
ALTER TABLE `fluxodecaixa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `saidavalores`
--
ALTER TABLE `saidavalores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fluxodecaixa`
--
ALTER TABLE `fluxodecaixa`
  ADD CONSTRAINT `fluxodecaixa_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `fluxodecaixa_ibfk_2` FOREIGN KEY (`Id_EntradaDeValores`) REFERENCES `entradavalores` (`ID`),
  ADD CONSTRAINT `fluxodecaixa_ibfk_3` FOREIGN KEY (`Id_SaidaDeValores`) REFERENCES `saidavalores` (`ID`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`ID_EntradaDeValores`) REFERENCES `entradavalores` (`ID`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`ID_SaidaDeValores`) REFERENCES `saidavalores` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

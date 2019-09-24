-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 24, 2019 at 03:01 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

--
-- Database: `dbGestaoTCC`
--

-- --------------------------------------------------------

--
-- Table structure for table `id_Local`
--

CREATE TABLE IF NOT EXISTS `id_Local` (
  `idLocal` int(4) NOT NULL,
  `nomeLocal` varchar(20) NOT NULL,
  `tipoLocal` varchar(20) NOT NULL,
  `localizacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Apresentacao`
--

CREATE TABLE IF NOT EXISTS `tb_Apresentacao` (
  `protocoloApresentacao` int(6) NOT NULL,
  `idProjeto_FK` int(4) NOT NULL,
  `apresentacaoData` date NOT NULL,
  `apresentacaoHora` time NOT NULL,
  `idLocal_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_AreaPesquisa`
--

CREATE TABLE IF NOT EXISTS `tb_AreaPesquisa` (
  `idAreaConhecimento` int(4) NOT NULL,
  `areaConhecimento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Banca`
--

CREATE TABLE IF NOT EXISTS `tb_Banca` (
  `idBanca` int(4) NOT NULL,
  `idMembros_FK` int(4) NOT NULL,
  `statusComparecimento` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_CEP`
--

CREATE TABLE IF NOT EXISTS `tb_CEP` (
  `CEP` int(8) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Convidado`
--

CREATE TABLE IF NOT EXISTS `tb_Convidado` (
  `idConvidado` int(4) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `idAreaConhecimento_FK` int(4) NOT NULL,
  `instituicao` varchar(30) NOT NULL,
  `profissao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_DescritoresIBICT`
--

CREATE TABLE IF NOT EXISTS `tb_DescritoresIBICT` (
  `descritorID` int(4) NOT NULL,
  `palavraChave` varchar(30) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Estudante`
--

CREATE TABLE IF NOT EXISTS `tb_Estudante` (
  `estMatricula` int(11) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `estPeriodoIngresso` char(6) NOT NULL,
  `estPeriodoAtual` char(6) NOT NULL,
  `estCurso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Membros`
--

CREATE TABLE IF NOT EXISTS `tb_Membros` (
  `idMembros` int(4) NOT NULL,
  `profSIAPE_FK` int(11) NOT NULL,
  `idMembro1_FK` int(11) NOT NULL,
  `idMembro2_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Orientacao`
--

CREATE TABLE IF NOT EXISTS `tb_Orientacao` (
  `idOrientacao` int(4) NOT NULL,
  `estMatricula_FK` int(11) NOT NULL,
  `profSIAPE_FK` int(11) NOT NULL,
  `idProjeto_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_Pessoa` (
  `CPF` int(11) NOT NULL,
  `pessoaNome` varchar(100) NOT NULL,
  `CEP_FK` int(8) NOT NULL,
  `endNumero` int(4) NOT NULL,
  `endComplemento` varchar(50) NOT NULL,
  `idTelefone_FK` int(4) NOT NULL,
  `pessoaEmail` varchar(30) NOT NULL,
  `pessoaSexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Professor`
--

CREATE TABLE IF NOT EXISTS `tb_Professor` (
  `profSIAPE` int(11) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `idAreaConhecimento_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ProjetoTCC`
--

CREATE TABLE IF NOT EXISTS `tb_ProjetoTCC` (
  `idProjeto` int(4) NOT NULL,
  `projTitulo` varchar(100) NOT NULL,
  `projOrienta_FK` int(4) NOT NULL,
  `projTipo` varchar(20) NOT NULL,
  `projTema_FK` int(4) NOT NULL,
  `projArea_FK` int(4) NOT NULL,
  `projStatus` char(10) NOT NULL,
  `documentoTCC` longblob NOT NULL,
  `idBanca_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Telefone`
--

CREATE TABLE IF NOT EXISTS `tb_Telefone` (
  `idTel` int(4) NOT NULL,
  `dddTel` int(3) NOT NULL,
  `numeroTel` int(8) NOT NULL,
  `tipoCel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_Tema`
--

CREATE TABLE IF NOT EXISTS `tb_Tema` (
  `temaID` int(4) NOT NULL,
  `temaNome` varchar(20) NOT NULL,
  `palavraChave1` varchar(20) NOT NULL,
  `palavraChave2` varchar(20) NOT NULL,
  `palavraChave3` varchar(20) NOT NULL,
  `palavraChave4` varchar(20) NOT NULL,
  `palavraChave5` varchar(20) NOT NULL,
  `descritorID_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `id_Local`
--
ALTER TABLE `id_Local`
  ADD PRIMARY KEY (`idLocal`);

--
-- Indexes for table `tb_Apresentacao`
--
ALTER TABLE `tb_Apresentacao`
  ADD PRIMARY KEY (`protocoloApresentacao`);

--
-- Indexes for table `tb_AreaPesquisa`
--
ALTER TABLE `tb_AreaPesquisa`
  ADD PRIMARY KEY (`idAreaConhecimento`);

--
-- Indexes for table `tb_Banca`
--
ALTER TABLE `tb_Banca`
  ADD PRIMARY KEY (`idBanca`);

--
-- Indexes for table `tb_CEP`
--
ALTER TABLE `tb_CEP`
  ADD PRIMARY KEY (`CEP`);

--
-- Indexes for table `tb_Convidado`
--
ALTER TABLE `tb_Convidado`
  ADD PRIMARY KEY (`idConvidado`);

--
-- Indexes for table `tb_DescritoresIBICT`
--
ALTER TABLE `tb_DescritoresIBICT`
  ADD PRIMARY KEY (`descritorID`);

--
-- Indexes for table `tb_Estudante`
--
ALTER TABLE `tb_Estudante`
  ADD PRIMARY KEY (`estMatricula`);

--
-- Indexes for table `tb_Membros`
--
ALTER TABLE `tb_Membros`
  ADD PRIMARY KEY (`idMembros`);

--
-- Indexes for table `tb_Orientacao`
--
ALTER TABLE `tb_Orientacao`
  ADD PRIMARY KEY (`idOrientacao`);

--
-- Indexes for table `tb_Pessoa`
--
ALTER TABLE `tb_Pessoa`
  ADD PRIMARY KEY (`CPF`);

--
-- Indexes for table `tb_Professor`
--
ALTER TABLE `tb_Professor`
  ADD PRIMARY KEY (`profSIAPE`);

--
-- Indexes for table `tb_ProjetoTCC`
--
ALTER TABLE `tb_ProjetoTCC`
  ADD PRIMARY KEY (`idProjeto`);

--
-- Indexes for table `tb_Telefone`
--
ALTER TABLE `tb_Telefone`
  ADD PRIMARY KEY (`idTel`);

--
-- Indexes for table `tb_Tema`
--
ALTER TABLE `tb_Tema`
  ADD PRIMARY KEY (`temaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `id_Local`
--
ALTER TABLE `id_Local`
  MODIFY `idLocal` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_AreaPesquisa`
--
ALTER TABLE `tb_AreaPesquisa`
  MODIFY `idAreaConhecimento` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Banca`
--
ALTER TABLE `tb_Banca`
  MODIFY `idBanca` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Convidado`
--
ALTER TABLE `tb_Convidado`
  MODIFY `idConvidado` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_DescritoresIBICT`
--
ALTER TABLE `tb_DescritoresIBICT`
  MODIFY `descritorID` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Membros`
--
ALTER TABLE `tb_Membros`
  MODIFY `idMembros` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Orientacao`
--
ALTER TABLE `tb_Orientacao`
  MODIFY `idOrientacao` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_ProjetoTCC`
--
ALTER TABLE `tb_ProjetoTCC`
  MODIFY `idProjeto` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Telefone`
--
ALTER TABLE `tb_Telefone`
  MODIFY `idTel` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Tema`
--
ALTER TABLE `tb_Tema`
  MODIFY `temaID` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

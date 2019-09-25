-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 25-Set-2019 às 16:08
-- Versão do servidor: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbGestaoTCC`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `id_Local`
--

CREATE TABLE IF NOT EXISTS `id_Local` (
  `idLocal` int(4) NOT NULL,
  `nomeLocal` varchar(20) NOT NULL,
  `tipoLocal` varchar(20) NOT NULL,
  `localizacao` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `id_Local`
--

INSERT INTO `id_Local` (`idLocal`, `nomeLocal`, `tipoLocal`, `localizacao`) VALUES
(1, 'Sala 404', 'Sala', 'CCHLA - BL 15'),
(2, 'Sala 306', 'Sala', 'DEMID - BL 1'),
(3, 'AuditÃ³rio 305', 'AuditÃ³rio', 'CCHLA - BL3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Apresentacao`
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
-- Estrutura da tabela `tb_AreaConhecimento`
--

CREATE TABLE IF NOT EXISTS `tb_AreaConhecimento` (
  `idAreaConhecimento` int(2) NOT NULL,
  `areaDeConhecimento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_AreaConhecimento`
--

INSERT INTO `tb_AreaConhecimento` (`idAreaConhecimento`, `areaDeConhecimento`) VALUES
(1, 'Teorias da Comunicacao Social'),
(2, 'Comunicacao Aplicada as Midias Digitais'),
(3, 'Editoracao Eletronica'),
(4, 'Imagem Digital'),
(5, 'Imagem Digital - Infografia'),
(6, 'Fotografia Digital'),
(7, 'Audio Digital'),
(8, 'Video Digital'),
(9, 'Aplicacoes Multimidia'),
(10, 'Empreendedorismo'),
(11, 'Internet e Aplicacoes Web - Design'),
(12, 'Internet e Aplicacoes Web - Development'),
(13, 'Internet e Aplicacoes Web - Internet das Coisas'),
(14, 'Internet e Aplicacoes Web - Mobile'),
(15, 'Internet e Aplicacoes Web - eCommerce'),
(16, 'Animacao 2D'),
(17, 'Animacao 3D'),
(18, 'Animacao 3D - Games'),
(19, 'Teorias da Comunicacao Digital');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Banca`
--

CREATE TABLE IF NOT EXISTS `tb_Banca` (
  `idBanca` int(4) NOT NULL,
  `idMembros_FK` int(4) NOT NULL,
  `statusComparecimento` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Banca`
--

INSERT INTO `tb_Banca` (`idBanca`, `idMembros_FK`, `statusComparecimento`) VALUES
(1, 1, 'Aguardando');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_CEP`
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
-- Estrutura da tabela `tb_Convidado`
--

CREATE TABLE IF NOT EXISTS `tb_Convidado` (
  `idConvidado` int(4) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `idAreaConhecimento_FK` int(4) NOT NULL,
  `instituicao` varchar(30) NOT NULL,
  `profissao` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Convidado`
--

INSERT INTO `tb_Convidado` (`idConvidado`, `pessoaCPF_FK`, `idAreaConhecimento_FK`, `instituicao`, `profissao`) VALUES
(8, 294586690, 2, 'Universidade particular', 'Professor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_DescritoresCNPQ`
--

CREATE TABLE IF NOT EXISTS `tb_DescritoresCNPQ` (
  `descritorID` int(4) NOT NULL,
  `palavraChave` varchar(30) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Estudante`
--

CREATE TABLE IF NOT EXISTS `tb_Estudante` (
  `estMatricula` int(11) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `estPeriodoIngresso` char(6) NOT NULL,
  `estPeriodoAtual` char(6) NOT NULL,
  `estCurso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Estudante`
--

INSERT INTO `tb_Estudante` (`estMatricula`, `pessoaCPF_FK`, `estPeriodoIngresso`, `estPeriodoAtual`, `estCurso`) VALUES
(2016025899, 2147483647, '2016.1', '2019.1', 'MÃ­dias Digitais'),
(2016789425, 2147483647, '2016.1', '2019.1', 'FÃ­sica');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Membros`
--

CREATE TABLE IF NOT EXISTS `tb_Membros` (
  `idMembros` int(4) NOT NULL,
  `profSIAPE_FK` int(11) NOT NULL,
  `idMembro1_FK` int(11) NOT NULL,
  `idMembro2_FK` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Membros`
--

INSERT INTO `tb_Membros` (`idMembros`, `profSIAPE_FK`, `idMembro1_FK`, `idMembro2_FK`) VALUES
(1, 28373822, 2147483647, 2147483647);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Orientacao`
--

CREATE TABLE IF NOT EXISTS `tb_Orientacao` (
  `idOrientacao` int(4) NOT NULL,
  `estMatricula_FK` int(11) NOT NULL,
  `profSIAPE_FK` int(11) NOT NULL,
  `idProjeto_FK` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Orientacao`
--

INSERT INTO `tb_Orientacao` (`idOrientacao`, `estMatricula_FK`, `profSIAPE_FK`, `idProjeto_FK`) VALUES
(185, 2016065122, 28373822, 0),
(186, 2016025899, 2633569, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Pessoa`
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

--
-- Extraindo dados da tabela `tb_Pessoa`
--

INSERT INTO `tb_Pessoa` (`CPF`, `pessoaNome`, `CEP_FK`, `endNumero`, `endComplemento`, `idTelefone_FK`, `pessoaEmail`, `pessoaSexo`) VALUES
(2633569, 'Maria Andrade', 58040360, 23, 'Casa', 17, 'maria@google.com.br', 'F'),
(241563693, 'João Gomes', 58040360, 12, 'Apto 236B', 15, 'joao@bol.com.br', 'M'),
(294586690, 'Victor ', 58040630, 988745636, 'apto 101', 18, 'victor@terra.com.br', 'M'),
(297884165, 'Andressa ', 58040630, 955881234, 'casa', 0, 'andressa@gmail.com', 'F'),
(2147483647, 'Carlos Moreira SÃ¡', 58040630, 988654523, 'casa', 14, 'carlos@terra.com.br', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Professor`
--

CREATE TABLE IF NOT EXISTS `tb_Professor` (
  `profSIAPE` int(11) NOT NULL,
  `pessoaCPF_FK` int(11) NOT NULL,
  `idAreaConhecimento_FK` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Professor`
--

INSERT INTO `tb_Professor` (`profSIAPE`, `pessoaCPF_FK`, `idAreaConhecimento_FK`) VALUES
(896523, 0, 12),
(2633569, 2147483647, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ProjetoTCC`
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
-- Estrutura da tabela `tb_Telefone`
--

CREATE TABLE IF NOT EXISTS `tb_Telefone` (
  `idTel` int(4) NOT NULL,
  `dddTel` int(3) NOT NULL,
  `numeroTel` int(9) NOT NULL,
  `tipoCel` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_Telefone`
--

INSERT INTO `tb_Telefone` (`idTel`, `dddTel`, `numeroTel`, `tipoCel`) VALUES
(14, 83, 988654523, 'fixo'),
(15, 83, 988756548, 'Celular '),
(17, 83, 988756425, 'celular'),
(18, 83, 988745636, 'celular '),
(19, 83, 955881234, 'fixo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Tema`
--

CREATE TABLE IF NOT EXISTS `tb_Tema` (
  `temaID` int(4) NOT NULL,
  `temaNome` varchar(20) NOT NULL,
  `palavraChave1` varchar(20) NOT NULL,
  `palavraChave2` varchar(20) NOT NULL,
  `palavraChave3` varchar(20) NOT NULL,
  `palavraChave4` varchar(20) DEFAULT NULL,
  `palavraChave5` varchar(20) DEFAULT NULL,
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
-- Indexes for table `tb_AreaConhecimento`
--
ALTER TABLE `tb_AreaConhecimento`
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
-- Indexes for table `tb_DescritoresCNPQ`
--
ALTER TABLE `tb_DescritoresCNPQ`
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
  MODIFY `idLocal` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_Banca`
--
ALTER TABLE `tb_Banca`
  MODIFY `idBanca` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_Convidado`
--
ALTER TABLE `tb_Convidado`
  MODIFY `idConvidado` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_Membros`
--
ALTER TABLE `tb_Membros`
  MODIFY `idMembros` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_Orientacao`
--
ALTER TABLE `tb_Orientacao`
  MODIFY `idOrientacao` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `tb_ProjetoTCC`
--
ALTER TABLE `tb_ProjetoTCC`
  MODIFY `idProjeto` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_Telefone`
--
ALTER TABLE `tb_Telefone`
  MODIFY `idTel` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tb_Tema`
--
ALTER TABLE `tb_Tema`
  MODIFY `temaID` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE `medico` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `CPF` int(11),
  `especialidade` varchar(50),
  `telefone` varchar(20),
  `CRE` varchar(50),
  `email` varchar(100),
  `endereco` varchar(100)
);

CREATE TABLE `paciente` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `CPF` int(11),
  `endereco` varchar(200),
  `telefone` varchar(20),
  `convenio_id` int,
  `email` varchar(100)
);

CREATE TABLE `consulta` (
  `id` int PRIMARY KEY,
  `medico_id` int,
  `paciente_id` int,
  `data_hora` datetime,
  `descricao` varchar(200),
  `valor` float(6),
  `especialidade` varchar(50)
);

CREATE TABLE `convenio` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `descricao` varchar(200),
  `CNPJ` int(14)
);

CREATE TABLE `enfermeiro` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `especialidade` varchar(50),
  `telefone` varchar(20),
  `CRE` varchar(50),
  `CPF` int(11),
  `endereco` varchar(100)
);

CREATE TABLE `internacao` (
  `id` int PRIMARY KEY,
  `paciente_id` int,
  `enfermeiro_id` int,
  `quarto_id` int,
  `data_inicio` datetime,
  `data_fim` datetime
);

CREATE TABLE `quarto` (
  `id` int PRIMARY KEY,
  `tipo_quarto_id` int,
  `numero` int
);

CREATE TABLE `tipo_quarto` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `descricao` varchar(200)
);

ALTER TABLE `paciente` ADD FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_id`) REFERENCES `enfermeiro` (`id`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`quarto_id`) REFERENCES `quarto` (`id`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo_quarto_id`) REFERENCES `tipo_quarto` (`id`);

CREATE TABLE `acao` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `aprovacao_modelo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `classificacao` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000),
  `tipo_tarefa` int
);

CREATE TABLE `tarefa_tipo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `pasta` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tipo` int,
  `projeto_id` int,
  `nome` varchar(255),
  `descricao` varchar(1000)
);

CREATE TABLE `pasta_pasta` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pai_id` int,
  `filha_id` int
);

CREATE TABLE `pasta_tarefa` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pasta_id` int,
  `tarefa_id` int
);

CREATE TABLE `projeto` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(255),
  `tipo` int
);

CREATE TABLE `projeto_tarefas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `projeto_id` int,
  `tarefa_id` int
);

CREATE TABLE `projeto_tipo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `solicitacao_modelo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `modelo_id` int,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `tarefa` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `tipo` int,
  `classificacao` int,
  `status` int,
  `conteudo` varchar(5000)
);

CREATE TABLE `tarefa_aprovacao` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `modelo_id` int,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `tarefa_aprovacao_usuario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `aprovacao_id` int,
  `usuario_id` int,
  `aprovado` int,
  `obrigatorio` int,
  `observacao` varchar(1000)
);

CREATE TABLE `tarefa_cronograma` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `usuario_id` int,
  `inicio` datetime,
  `fim` datetime,
  `anterior_id` int,
  `proximo_id` int
);

CREATE TABLE `tarefa_etapa` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `tipo` int,
  `status` int
);

CREATE TABLE `tarefa_etapa_historico_tempo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `etapa_id` int,
  `inicio` datetime,
  `fim` datetime
);

CREATE TABLE `tarefa_etapa_status` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000),
  `ativo` int
);

CREATE TABLE `tarefa_etapa_tipo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000),
  `ativo` int
);

CREATE TABLE `tarefa_status` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `tarefa_usuario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `tarefa_id` int,
  `usuario_id` int,
  `funcao` int
);

CREATE TABLE `usuario` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `perfil` int,
  `login` varchar(255),
  `senha` varchar(255),
  `tipo` int
);

CREATE TABLE `usuario_tipo` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

CREATE TABLE `usuario_funcao` (
  `id` int PRIMARY KEY,
  `nome` varchar(100),
  `descricao` varchar(1000)
);

ALTER TABLE `classificacao` ADD FOREIGN KEY (`tipo_tarefa`) REFERENCES `tarefa_tipo` (`id`);

ALTER TABLE `pasta` ADD FOREIGN KEY (`projeto_id`) REFERENCES `projeto` (`id`);

ALTER TABLE `pasta_pasta` ADD FOREIGN KEY (`pai_id`) REFERENCES `pasta` (`id`);

ALTER TABLE `pasta_pasta` ADD FOREIGN KEY (`filha_id`) REFERENCES `pasta` (`id`);

ALTER TABLE `pasta_tarefa` ADD FOREIGN KEY (`pasta_id`) REFERENCES `pasta` (`id`);

ALTER TABLE `pasta_tarefa` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `projeto` ADD FOREIGN KEY (`tipo`) REFERENCES `projeto_tipo` (`id`);

ALTER TABLE `tarefa` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa` ADD FOREIGN KEY (`status`) REFERENCES `tarefa_status` (`id`);

ALTER TABLE `tarefa_aprovacao` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa_aprovacao_usuario` ADD FOREIGN KEY (`aprovacao_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `tarefa_cronograma` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa_etapa` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa_etapa` ADD FOREIGN KEY (`tipo`) REFERENCES `tarefa_etapa_tipo` (`id`);

ALTER TABLE `tarefa_etapa` ADD FOREIGN KEY (`status`) REFERENCES `tarefa_etapa_status` (`id`);

ALTER TABLE `tarefa_etapa_historico_tempo` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa_usuario` ADD FOREIGN KEY (`tarefa_id`) REFERENCES `tarefa` (`id`);

ALTER TABLE `tarefa_usuario` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

ALTER TABLE `tarefa_usuario` ADD FOREIGN KEY (`funcao`) REFERENCES `usuario_funcao` (`id`);

ALTER TABLE `usuario` ADD FOREIGN KEY (`tipo`) REFERENCES `usuario_tipo` (`id`);

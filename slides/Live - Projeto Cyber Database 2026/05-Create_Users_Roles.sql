-- root : root@2202

-- Acesso restrito a algumas colunas. 
create user 'app_relatorio'@'localhost' identified by 'app$%89675'; 
GRANT SELECT (COD_TUTOR, NOME, TELEFONE) ON dbpetshop.TUTOR TO 'app_relatorio'@'localhost';
GRANT SELECT (COD_PET, COD_TUTOR, NOME, RACA) ON dbpetshop.PET TO 'app_relatorio'@'localhost';
GRANT SELECT ON dbpetshop.ATENDIMENTO to 'app_relatorio'@'localhost';
GRANT SELECT (COD_SERVICO,DESCRICAO_SERVICO, VALOR) ON dbpetshop.SERVICO TO 'app_relatorio'@'localhost';

-- Acesso Genérico:
create user 'app_crud'@'localhost' identified by 'crud%*90878';
GRANT SELECT, INSERT, UPDATE, DELETE ON dbpetshop.* TO 'app_crud'@'localhost'; 

-- Criando Roles de acesso para usuários:
	-- Role de Leitura: 
	CREATE ROLE db_ro; -- ro = read only
	GRANT SELECT ON dbpetshop.* TO 'db_ro'; 

	-- Role de Escrita e Leitura:
	CREATE ROLE db_rw; -- rw = read & write
    GRANT SELECT, INSERT, UPDATE, DELETE ON dbpetshop.* TO 'db_rw';

-- Criando usuários finais:
create user 'crocha'@'localhost' identified by 'cr@8976';
create user 'bguimaraes'@'localhost' identified by 'bg#4789'; 

GRANT  'db_ro' TO 'crocha'@'localhost'; 
SET DEFAULT ROLE 'db_ro' TO 'crocha'@'localhost'; 

GRANT  'db_rw' TO 'bguimaraes'@'localhost'; 
SET DEFAULT ROLE 'db_rw' TO 'bguimaraes'@'localhost'; 

-- Verificando os Grants: 
show grants for db_ro;
show grants for db_rw;

show grants for 'bguimaraes'@'localhost';
show grants for 'crocha'@'localhost';
show grants for 'app_relatorio'@'localhost';
show grants for 'app_crud'@'localhost';

-- Testando Insert: 
INSERT INTO `dbpetshop`.`TUTOR` (`COD_TUTOR`,`NOME`,`CPF`,`TELEFONE`,`EMAIL`,`ENDERECO`,`CEP`,`DATA_CADASTRO`,`DATA_DESATIVACAO`,`STATUS_CADASTRO`,`ATUALIZADO_EM`,`ATUALIZADO_POR`) VALUES
(51,'Ana Pedrita','000.000.000-00','(81) 990000071','tutor99@exemplo.test','Rua das Flores, 101 - Boa Viagem, Recife/PE','50017-31','2025-02-02 09:01:00',NULL,'ATIVO',NULL,NULL);

-- Testando Update:
UPDATE dbpetshop.TUTOR set nome = 'Pedrita Ana da Silva' where cod_tutor = 51;

-- Testando Delete:
DELETE FROM dbpetshop.TUTOR where cod_tutor = 51; 
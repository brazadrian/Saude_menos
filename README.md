# Saude_menos
Repositório para a criação de Banco de Dados ficcional relativo à rotinas de um Hospital de Saúde.

Projeto:
- Teste
  - Modelagem

- Defina uma equipe de no máximo 3 pessoas;
- Escolha um dos minimundos abaixo e desenvolva o seu projeto;
- Elabora os diagramas do minimundo (domínios de negócio) escolhido:
- Modelagens de entidade relacionamento (MER)
- Modelagem relacional (MR)
- Crie um documento simples do seu projeto de Banco de Dados que:
  - Descreva em mais detalhes o seu minimundo;
  - Descreva o modelo lógico (Diagrama MER);
  - Descreva o modelo físico (Diagrama MR);
  - Descreva as perguntas/relatórios (20) importantes que deverão ser implementados pelo seu projeto.
  - Anexe a esse documento os Scripts abaixo de uma forma organizada e bem documentada.
  - Crie um script que irá conter todos dos scripts de criação (DDL) das tabelas e views do seu banco de dados (Todos os CREATES TABLE...);
- Crie alguns scripts (no mínimo 5) para alterar (DDL) as estruturas das tabelas;
- Crie um script para destruir (DDL) todas as tabelas, views, procedimentos, funções e dependências do seu banco de dados;
- Crie um script que irá realizar todos os inserts (DML) nas tabelas do seu banco de dados.
  - Cada tabela deve ter no mínimo 10 registros, use o bom senso;
- Crie scripts (no mínimo 20) para deletar ou atualizar (DML) os dados inseridos nas tabelas.
- Crie um script que irá realizar todas as suas consultas/perguntas/relatórios (DQL), é obrigatório uso de join e subselect na maioria das consultas. Devem criar no mínimo 20 scripts de SELECT;
- Crie um script para criar todas as views (DDL) (no mínimo 10) dos principais relatórios do seu projeto.
- Crie um script que irá executar as procedures e funções do seu banco de dados. Use o PLSQL, como colocado em sala de aula, e devem fazer no mínimo 10 procedures/funções;

# O Mini-mundo escolhido foi o de Sistema de saúde
**Hospitais** são formados por um ou mais **Ambulatórios** e cada um destes está em um único Hospital;

**Médicos** clinicam em um único **Hospital**, cada um deles agregando vários Médicos;


**Hospitais** solicitam exames clínicos em vários **Laboratórios**, cada um destes pode ter solicitações de vários Hospitais;


**Pacientes** consultam vários **Médicos**, e estes são consultados por vários Pacientes;


**Ambulatórios** atendem vários **Pacientes**, enquanto estes só podem ser atendidos em um único Ambulatório;


**Pessoal** de apoio está alocado a cada **Ambulatório**, e cada um destes conta com vários integrantes do Pessoal de apoio;


**Laboratórios** fazem vários **Exames**, e cada um dos Exames é feito em um único Laboratório;


**Pacientes** realizam vários **Exames**, e cada Exame é realizado por um único Paciente;


Cada **Paciente** pode receber vários **Diagnósticos**, e cada Diagnóstico é de um único Paciente.

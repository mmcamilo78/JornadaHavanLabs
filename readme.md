### Desafio Programação Jornada Labs HAVAN-Proway
---

#### Informação do Participante 
```
Candidato > Márcio Moreira Camilo
   E-mail > mmcamilo@gmail.com
 Telefone > (47)98867-7130
     Data > 21/05/2021
```
#### Recursos
    Ferramenta de Desenvolvimento------> RadStudio Delphi Versão 10.3 
    Sistema Gerenciador Banco de Dados-> Firebird-2.5.8.27089_0_Win32
    Nome do Banco de Dados-------------> CASACAMBIO 

### Estrutura de Pastas
```
\CasaCambio   <- Pasta Default do projeto CasaCambio - Muito Dinheiro e do arquivo .exe do programa 
\Arquivos     <- Pasta de retorno dos arquivos .CSV do Banco Central do Brasil com as cotações das moedas 
\BD           <- Pasta que contém o arquivo de Banco de Dados DADOS.FDB 
\Img          <- Pasta que contém as imagens utilizadas no programa
\Source       <- Pasta com os Códigos Fonte do programa
.\Win32       <- Pasta de Versão de Compilação da Plataforma
.\Win32\Debug <- Pasta de Arquivos .DCU 
\Utils        <- Pasta com o instalador do SGBD Firebird, caso ainda não o tenha instalado no computador destino
```

### Configurações
- Instalar o SGBD caso ainda não exista no computador destino, instalação padrão sem seleções específicas. Basicamente Next, Next, Fim.

- Se a estrutura permanecer a mesma acima, o programa pode ser compilado/executado, caso contrário, existe um arquivo `conexao.ini` na pasta `\CasaCambio` onde poderá ser feito o redirecionamento do IP/Destino do arquivo `DADOS.FDB` para o novo local onde se encontra.

### Programa
Com base no escopo proposto, como tela principal onde fiz a divisão em seis partes sendo:

`Lojas de Câmbio | Moedas de Câmbio | Cotação de Moedas | Calculadora | Operações de Câmbio | Relatórios`

### Lojas de Câmbio
- Observando atentamente toda a descrição contida no case ***O Problema***, numa determinada parte diz: "...utiliza uma planilha para converter e registrar os saldos em caixa `de cada loja`"... e quando li a descrição considerando os seguintes critérios fictícios para desenvolver sistema Gerenciador de Operações, na parte que diz: "O cadastro deverá conter os seguintes dados", e então foi nesse ponto que fiquei numa dúvida muito desconfortável, :) :)  Não existia nos dados informados o campo Loja, e sinceramente não conseguia parar de pensar sobre o que fazer; *Inserir o campo Loja* e correr o risco, ou *não inserir o campo Loja* e ficar fora do contexto do problema. Analisando a ideia novamente e pensando muito numa solução ideal para **resolver o Problema do cliente**, decidi assumir o risco e incluir o campo Loja além de relacioná-lo e exibí-lo na tabela de Operações de Câmbio como também nos relatórios. Espero que nesse momento, seja considerado uma outra parte do Desafio que diz: ***"Quem sabe você nos surprienda!"***

- Cadastro simples das Lojas de Câmbio com CRUD básico, apenas para relacionar as operações com uma loja.

### Moedas de Câmbio
- Cadastro simples de Moedas de Câmbio, com CRUD básico
  * **Importante** Cadastrar as moedas com os código pré-estabelecido pelo Banco Central do Brasil, já que existe a possibilidade de usar um recurso extra não solicitado no escopo mas que fará uma grande diferença para o usuário. Obter os valores da cotação das moedas no repositório do BCB de acordo com a data de cotação selecionada pelo mesmo.

### Cotação de Moedas
- Local onde o usuário poderá definir quais as moedas serão cotadas para em seguida, utilizar a `Calculadora de Câmbio` ou as `Operações de Câmbio`.
- Os valores referentes as Taxas e Paridades das moedas poderão ser informados manualmente pelo usuário ou então utilizar o recurso de `Importar Cotações do Banco Central do Brasil`, onde ao executar o recurso, o programa irá buscar as cotações das moedas pré-selecionadas e atualizará os valores correspondentes, de acordo com o fechamento da cotação na data selecionada pelo usuário. 
 
    **Importante** é necessário possuir conexão com a internet para utilizar essa funcionalidade.

- A rotina de importação dos valores, também possui o recurso de importar um arquivo existente no computador desde que esse arquivo esteja de acordo com o Layout do BCB.
- Outro recurso dentro da rotina de importação é retornar a cotação de Todas as moedas disponiveis no Repositório do BCB, dessa forma não é necessário realizar a pré-inclusão das moedas na tela de Cotação.

### Calculadora de Câmbio | Desafio - Parte 1
- Conforme solicitado, aqui o usuário informa o valor, a moeda de origem e a moeda de destino, e com base na cotação a Calculadora realiza a conversão entre as moedas.

- Poderá ser realizado a conversão de todas as moedas disponíveis na tela de Cotação de Moedas, desde que os valores das Taxas e Paridades sejam maior que zero.
- Se o usuário retornou as cotações de por exemplo 05 Moedas (USD/EUR/BRL/JPY/CAD) a Calculadora realizará a conversão entre essas moedas, se decidir, ele poderá incluir outras moedas, atualizar os valores das Taxas e Paridades, em seguida, as novas moedas ficam disponíveis para as conversões. 
- Se ele retornou todas as moedas disponíveis no repositório do BCB, então ele poderá converter todas as moedas disponíveis respectivamente.

  **Importante** é necessário incluir a moeda BRL (Real do Brasil) para que seja possível a conversão de moedas para BRL e de BRL para outras moedas

### Operações de Câmbio | Desafio - Parte 2 
- Conforme proposto no escopo do desafio, o *controle de operações deverá fazer a conversão de cada moeda para Reais (BRL)*, não ficou definido nesse caso se também haveria necessidade de converter de Reais para outras moedas, então segui o escopo conforme citado. De qualquer forma, contemplei essa conversão na Calculadora e se necessário, realizo a melhoria na tela de Operações de Câmbio também.

- Também possui um CRUD básico, porém na inclusão de uma nova operação, não foi solicitado um campo tipo `chave única` do cliente, a fim de evitar duplicidade no cadastro do mesmo cliente com as variações do seu próprio nome por exemplo, então na implementação do código, ao começar a digitar o nome do cliente, um mini grid será exibido trazendo os nomes já cadastrados, e caso o nome já tenha sido informado anteriormente, o usuário poderá selecioná-lo, não é a solução ideal mas já irá ajudar na questão de variações com o mesmo nome de um mesmo cliente.
- Conforme informado no case o ***O Problema***, considerei nas operações a `Taxa 10%` sobre o valor convertido que a empresa cobraria pela operação.
 
### Relatórios

Conforme o escopo os ***Relatórios poderão ser filtrados por intervalo de tempo e cliente***.
```
( ) Todos os Registros
( ) Filtro de Pesquisa
```

    ( ) Listagem de Operações
    ( ) Valor Total das Operações
    ( ) Valor Total das Taxas Cobradas
    ---
    ( ) Listagem de Operações por Loja (Recurso Adicional)
 
### Banco de Dados

Para este desafio utilizei o banco de dados Firebird por considerar Portátil, Free e Confiável para o escopo proposto.

~~~SQL
/*CASACAMBIO*/
SET SQL DIALECT 3;
SET NAMES WIN1252;
SET CLIENTLIB 'C:\Softwares\CasaCambio\Source\fbclient.dll';
CREATE DATABASE 'localhost:C:\Softwares\CasaCambio\BD\dados.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;
~~~

### Tabelas
> LOJAS | MOEDAS | COTACOES | OPERACOES

### Script

~~~SQL
/*LOJAS*/
CREATE GENERATOR GEN_LOJAS_ID;
CREATE TABLE LOJAS (
    ID      INTEGER NOT NULL,
    NOME    VARCHAR(40),
    CIDADE  VARCHAR(40),
    UF      CHAR(2)
);

ALTER TABLE LOJAS ADD CONSTRAINT PK_LOJAS PRIMARY KEY (ID);
~~~

~~~SQL
/*MOEDAS*/
CREATE GENERATOR GEN_MOEDAS_ID;
CREATE TABLE MOEDAS (
    ID        INTEGER NOT NULL,
    CODIGO    SMALLINT,
    NOME      VARCHAR(60),
    SIMBOLO   VARCHAR(10),
    TIPO      CHAR(1),
    COD_PAIS  SMALLINT,
    PAIS      VARCHAR(50)
);

ALTER TABLE MOEDAS ADD CONSTRAINT UNQ1_MOEDAS UNIQUE (CODIGO);
ALTER TABLE MOEDAS ADD CONSTRAINT PK_MOEDAS PRIMARY KEY (ID);
~~~

~~~SQL
/*COTACOES*/ 
CREATE GENERATOR GEN_COTACOES_ID;
CREATE TABLE COTACOES (
    ID               INTEGER NOT NULL,
    DATA_COTACAO     DATE,
    CODIGO           SMALLINT,
    TAXA_COMPRA      DOUBLE PRECISION,
    TAXA_VENDA       DOUBLE PRECISION,
    PARIDADE_COMPRA  DOUBLE PRECISION,
    PARIDADE_VENDA   DOUBLE PRECISION
);

ALTER TABLE COTACOES ADD CONSTRAINT PK_COTACOES PRIMARY KEY (ID);
ALTER TABLE COTACOES ADD CONSTRAINT FK_COTACOES_1 FOREIGN KEY (CODIGO) REFERENCES MOEDAS (CODIGO);
~~~

~~~SQL
/*OPERACOES*/
CREATE GENERATOR GEN_OPERACOES_ID;
CREATE TABLE OPERACOES (
    ID                    INTEGER NOT NULL,
    ID_LOJA               INTEGER NOT NULL,
    NOME_CLIENTE          VARCHAR(60),
    MOEDA_ORIGEM          VARCHAR(3),
    MOEDA_DESTINO         VARCHAR(3),
    DATA_OPERACAO         DATE,
    VALOR_ORIGINAL        DOUBLE PRECISION,
    VALOR_CONVERTIDO      DOUBLE PRECISION,
    TAXA_COBRADA          DOUBLE PRECISION,
    VALOR_COTACAO         DOUBLE PRECISION,
    IND_CBBMOEDA          SMALLINT,
    CODIGO_MOEDA_ORIGEM   SMALLINT,
    CODIGO_MOEDA_DESTINO  SMALLINT
);

ALTER TABLE OPERACOES ADD CONSTRAINT PK_OPERACOES PRIMARY KEY (ID);
ALTER TABLE OPERACOES ADD CONSTRAINT FK_OPERACOES_1 FOREIGN KEY (ID_LOJA) REFERENCES LOJAS (ID);
~~~

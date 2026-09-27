# Lista de DESAFIOS
1. Descreva alguns fatores que levam alguém a preferir o uso de arquivos convencionais ao uso de um Sistema de Banco de Dados. 

2. Descreva alguns fatores que levam alguém a preferir o uso de Sistemas de Banco Dados ao uso de arquivos convencionais.

3. Defina os seguintes conceitos relacionados a modelagem de dados: modelo conceitual, modelo lógico, e modelo físico. 

4. A definição do fator de bloco de um arquivo faz parte de que modelo: do modelo conceitual, do modelo lógico ou do modelo físico?

5. A definição do tipo de um dado (numérico, alfanumérico,…) faz parte de que modelo: do modelo conceitual, do modelo lógico ou do modelo físico?

6. Qual a diferença entre a redundância de dados controlada e a redundância de dados não controlada? Dê exemplos de cada uma delas.

7. Desenvolva um modelo de formulário destinado a fazer o cadastro de empregados de uma empresa. O formulário deverá garantir que os dados sejam informados da forma mais fidedigna possível. Destacar no formulário os campos obrigatórios (usando * ao lado do campo) O formulário deverá conter no mínimo os seguintes campos:

- Matrícula;
- Nome;
- Data de nascimento;
- Sexo;
- Filiação (Nome do pai e da mãe);
- Nome do (a) cônjuge;
- Logradouro (endereço), Número e Complemento;
- CEP;
- Bairro;
- Cidade;
- UF.

# DESAFIO DA AULA 5
- Uma firma vende produtos de limpeza, e deseja melhor controlar os produtos que vende, seus clientes e os pedidos. Cada produto é caracterizado por um código, nome do produto, categoria (ex. detergente, sabão em pó, sabonete, etc.), e seu preço. A firma possui informações sobre todos seus clientes. Cada cliente é identificado por um código, nome, endereço, telefone, status (ex. "bom", "médio", "ruim"), e o seu limite de crédito.
- Guarda-se igualmente a informação dos pedidos feitos pelos clientes. Cada pedido possui um número e guarda-se a data de elaboração do pedido. Cada pedido pode envolver de um a vários produtos, e para cada produto, indica-se a quantidade deste pedida.

# DESAFIO DA AULA 6
- 1) Elaborar o Diagrama Entidade-Relacionamento satisfazendo as seguintes restrições e requisitos:
a) Para um Vendedor, armazenar seu código, nome, endereço e comissão;
b) Para um Cliente, armazenar o seu código, nome, endereço, faturamento acumulado e limite de crédito. Além disso, armazenar o código e o nome do vendedor que o atende. Um vendedor pode atender muitos clientes, porém um cliente deve ser atendido por exatamente um vendedor;
c) Para uma peça, armazenar seu código, descrição, preço quantidade em estoque e o número do armazém onde a peça está estocada. Uma peça somente pode estar estocada num único armazém. Para um armazém, armazenar seu código e endereço;
d) Para um pedido, armazenar seu número, data, código, nome e endereço do cliente, que fez o pedido e o código do vendedor para cálculo da comissão. Além disso, para cada item do pedido armazenar o código da peça, quantidade e preço cotado. Há somente um cliente por pedido e um vendedor;
e) O preço cotado no pedido pode ser mesmo que o preço corrente no arquivo de peças, mas não necessariamente.

- 2) Projetar o modelo lógico no MySQL Workbench.









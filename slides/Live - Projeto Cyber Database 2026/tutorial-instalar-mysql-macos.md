# Guia: MySQL no Mac com chip Apple

## Combinação deste guia

- **MySQL Workbench 8.0.47**: inclui o modelador visual de diagramas EER.
- **MySQL Community Server 8.0.46**: serviço que armazena e processa os bancos de dados.
- **Mac com Apple silicon**: escolha os instaladores **ARM 64-bit / ARM64**.

> Este guia usa **MySQL Workbench 8.0.47 + MySQL Community Server 8.0.46**. O modelador EER está incluído no Workbench; não é uma extensão separada.

> **Atenção:** a série Server 8.0 chegou ao fim de manutenção em abril de 2026, e o Workbench 8 também é uma linha antiga. Esta combinação está indicada para acompanhar seu material e usar localmente para aprendizado; evite expor o servidor à internet.

## Antes de começar: confira a versão do macOS

1. Abra o menu Apple  e escolha **Sobre Este Mac**.
2. Anote a versão do macOS.
3. Nos downloads oficiais, selecione o pacote ARM64 compatível com essa versão. Não escolha `x86_64`, que é para Mac Intel.

## 1. Baixe e instale o MySQL Community Server 8.0.46

1. Acesse a página oficial [MySQL Community Server 8.0.46](https://dev.mysql.com/downloads/mysql/8.0.html).
2. Selecione **macOS 15 (ARM, 64-bit), DMG Archive** — o nome do pacote deve ser `mysql-8.0.46-macos15-arm64.dmg`. Se a página oferecer outra versão de macOS compatível com o seu, escolha a correspondente.
3. Se a Oracle pedir login, escolha **No thanks, just start my download**.
4. Abra o arquivo `.dmg` baixado e, na janela montada, abra o pacote `.pkg`.
5. Siga o instalador: aceite a licença e use **Install**. Se houver **Customize**, mantenha selecionados **MySQL Server**, **Preference Pane** e **Launchd Support**.
6. Autorize a instalação com a senha de administrador do Mac, se solicitado.
7. Na configuração final, crie e guarde em local seguro uma senha forte para o usuário MySQL `root`. Essa senha é diferente da senha de login do Mac.
8. Escolha iniciar o servidor ao concluir.

O instalador oficial usa um pacote DMG e configura a senha inicial do `root`; ele também pode instalar itens de suporte para iniciar o servidor. Consulte as [instruções oficiais para macOS](https://dev.mysql.com/doc/refman/8.0/en/macos-installation-pkg.html).

## 2. Confirme que o Server está instalado

Abra o Terminal e rode:

```bash
/usr/local/mysql/bin/mysql --version
```

A saída deve indicar a versão 8.0.46. Para verificar o serviço:

```bash
sudo /usr/local/mysql/support-files/mysql.server status
```

Se estiver parado, inicie-o:

```bash
sudo /usr/local/mysql/support-files/mysql.server start
```

### Teste a conexão pelo Terminal

Com o servidor iniciado, conecte-se usando o usuário `root`:

```bash
/usr/local/mysql/bin/mysql -u root -p
```

Digite a senha do MySQL `root` quando aparecer `Enter password:`. Os caracteres não aparecem enquanto você digita. Se a conexão funcionar, o prompt mudará para `mysql>`. Execute uma consulta para confirmar a versão e, em seguida, saia:

```sql
SELECT VERSION();
exit
```

Se `SELECT VERSION();` retornar `8.0.46`, a conexão pelo Terminal está funcionando.

## 3. Baixe e instale o MySQL Workbench 8.0.47

1. Acesse a página oficial da versão [MySQL Workbench 8.0.47](https://dev.mysql.com/downloads/workbench/8.0.html).
2. Selecione o pacote **macOS (ARM, 64-bit), DMG Archive**. O nome do arquivo deve conter `macos-arm64`.
3. Abra o `.dmg` e arraste **MySQL Workbench** para **Applications/Aplicativos**.
4. Abra o Workbench pela pasta **Aplicativos**. Se o macOS pedir confirmação para abrir um aplicativo baixado, confirme que o arquivo veio do site oficial da Oracle/MySQL e autorize em **Privacidade e Segurança**, se necessário.

A instalação no Mac é feita arrastando o aplicativo do DMG para Aplicativos, conforme o [manual oficial do Workbench](https://dev.mysql.com/doc/workbench/en/wb-installing-mac.html).

## 4. Crie e salve seu primeiro modelo EER

É possível desenhar um modelo sem estar conectado a um servidor.

1. No Workbench, escolha **File → New Model**.
2. Na tela **MySQL Model**, clique duas vezes em **Add Diagram**.
3. No diagrama EER, use a ferramenta de tabela para adicionar tabelas e defina colunas, chaves e relacionamentos.
4. Salve em **File → Save Model**. O arquivo terá a extensão `.mwb`.

Para criar um diagrama a partir de um banco já existente, conecte-se ao servidor e use o assistente **Database → Reverse Engineer**. A documentação oficial descreve a criação de modelos e diagramas no [tutorial de modelagem](https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-creating-a-model.html).

## 5. Crie uma conexão do Workbench ao servidor local

1. Na tela inicial do Workbench, clique no botão **+** ao lado de conexões.
2. Use estes parâmetros:
   - **Connection Method:** Standard (TCP/IP)
   - **Hostname:** `127.0.0.1`
   - **Port:** `3306`
   - **Username:** `root`
3. Clique em **Store in Keychain** se quiser guardar a senha no macOS; informe a senha do `root` do MySQL.
4. Clique em **Test Connection** e depois em **OK**.

Para testar uma consulta, abra a conexão e execute:

```sql
SELECT VERSION();
```

A resposta deve mostrar MySQL Server 8.0.46.

## Se algo não funcionar

- **O menu File não mostra New Model:** confirme que abriu o **MySQL Workbench 8.0.47** em **Aplicativos**. Em **Help → About MySQL Workbench**, confira a versão.
- **Connection refused / erro 61:** inicie o Server e confirme se ele está ouvindo na porta 3306.
- **Access denied:** verifique usuário e senha de MySQL `root`; a senha do Mac não serve para a conexão.

## Checklist

- [ ] MySQL Community Server 8.0.46 instalado para ARM64.
- [ ] Senha MySQL `root` guardada em local seguro.
- [ ] Server iniciado e respondendo na porta 3306.
- [ ] Workbench 8.0.47 para ARM64 instalado em Aplicativos.
- [ ] **File → New Model** abre um modelo.
- [ ] **Add Diagram** abre o editor EER.
- [ ] Arquivo `.mwb` salvo.
- [ ] Conexão local testada, se necessário.

## Fontes oficiais

- [MySQL Community Server 8.0.46](https://dev.mysql.com/downloads/mysql/8.0.html)
- [MySQL Workbench 8.0.47](https://dev.mysql.com/downloads/workbench/8.0.html)
- [Instalação do MySQL Server no macOS](https://dev.mysql.com/doc/refman/8.0/en/macos-installation-pkg.html)
- [Instalação do Workbench no macOS](https://dev.mysql.com/doc/workbench/en/wb-installing-mac.html)
- [Criar modelo e diagrama EER](https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-creating-a-model.html)

*Revisado em 17 de novembro de 2026. Confira nas páginas oficiais se o pacote ARM64 continua compatível com a versão do macOS instalada.*

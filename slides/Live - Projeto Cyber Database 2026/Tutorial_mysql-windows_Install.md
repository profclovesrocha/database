# Tutorial: instalar MySQL no Windows

## Versões deste tutorial

- **MySQL Community Server 8.0.46**: servidor de banco de dados.
- **MySQL Workbench 8.0.47**: interface gráfica com o modelador visual de diagramas EER.

O MySQL Installer 8.0.46 pode instalar o Server e outros produtos, mas este guia instala o Workbench 8.0.47 separadamente para usar a versão indicada. O modelador EER já faz parte do Workbench; não é uma extensão.

> **Atenção:** a série MySQL Server 8.0 encerrou a manutenção em abril de 2026. Esta combinação é indicada para acompanhar materiais de estudo e uso local. Evite expor o servidor à internet.

## 1. Requisitos

- Windows 11 de 64 bits (ou Windows Server 2022, em ambiente de servidor).
- Conta do Windows com permissão de administrador para instalar programas.
- Conexão com a internet se escolher o instalador web.

O MySQL Server requer o Microsoft Visual C++ Redistributable; o Workbench também pode exigir o .NET Framework 4.5.2 e o Microsoft Visual C++ 2015–2022 Redistributable. Se o instalador indicar que algum componente está ausente, use o [Microsoft Download Center](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist).

## 2. Baixe e instale o MySQL Server 8.0.46

1. Acesse a página oficial do [MySQL Installer 8.0.46](https://dev.mysql.com/downloads/installer/).
2. Baixe uma das opções:
   - `mysql-installer-web-community-8.0.46.0.msi`: menor; baixa os produtos selecionados durante a instalação e requer internet.
   - `mysql-installer-community-8.0.46.0.msi`: pacote completo, maior; adequado para instalar sem baixar os produtos durante o assistente.
3. Clique duas vezes no arquivo `.msi` e autorize o instalador a fazer alterações no dispositivo.
4. Na escolha do tipo de instalação, selecione **Server Only** para instalar apenas o servidor. Se usar **Custom**, selecione **MySQL Server 8.0.46 (x64)**.
5. Avance e clique em **Execute** para baixar/instalar o servidor. Se o assistente solicitar, aceite instalar dependências oficiais necessárias.

## 3. Configure o servidor

O assistente de configuração inicia depois da instalação do Server. Os nomes exatos das telas podem variar um pouco.

1. Em **Type and Networking**, para uso de aprendizado no próprio computador, escolha **Development Computer**. Mantenha **TCP/IP** habilitado e a porta padrão **3306**.
2. Em **Authentication Method**, mantenha **Use Strong Password Encryption**.
3. Em **Accounts and Roles**, defina uma senha forte para o usuário `root` e guarde-a em local seguro. Essa senha é do MySQL, não da conta do Windows.
4. Em **Windows Service**, mantenha a configuração como serviço do Windows. O nome padrão costuma ser `MySQL80`; deixe habilitado para iniciar com o Windows.
5. Clique em **Execute** para aplicar as configurações e aguarde todas as etapas concluírem. Clique em **Finish**.

O MySQL Installer configura o servidor e pode registrá-lo como serviço, para que ele inicie junto com o Windows. Consulte a [documentação oficial do MySQL Installer](https://dev.mysql.com/doc/refman/8.0/en/windows-installation.html).

## 4. Baixe e instale o MySQL Workbench 8.0.47

1. Abra o [arquivo oficial de versões do MySQL Workbench](https://downloads.mysql.com/archives/workbench/).
2. Selecione a versão **8.0.47**, o sistema **Microsoft Windows** e o pacote **Windows (x86, 64-bit), MSI Installer**.
3. Baixe o arquivo `mysql-workbench-community-8.0.47-winx64.msi`.
4. Clique duas vezes no `.msi` e siga o assistente. Escolha **Complete** para instalar todos os recursos do Workbench.
5. Abra o Workbench pelo menu **Iniciar** do Windows.

## 5. Teste o servidor pelo terminal

O MySQL Installer normalmente instala o atalho **MySQL 8.0 Command Line Client** no menu Iniciar.

1. Abra o menu **Iniciar** e procure **MySQL 8.0 Command Line Client**.
2. Digite a senha do `root` definida na configuração. A senha não aparece enquanto você digita.
3. No prompt `mysql>`, rode:

```sql
SELECT VERSION();
```

A resposta deve mostrar `8.0.46`. Para sair, digite:

```sql
exit
```

Se o atalho não estiver disponível, abra o Prompt de Comando e execute o cliente pelo caminho padrão:

```bat
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p
```

Se você escolheu outro diretório na instalação, ajuste o caminho do comando.

## 6. Conecte o Workbench ao servidor local

1. Na tela inicial do Workbench, clique em **+** ao lado de **MySQL Connections**.
2. Informe:
   - **Connection Name:** `MySQL local`
   - **Connection Method:** `Standard (TCP/IP)`
   - **Hostname:** `127.0.0.1`
   - **Port:** `3306`
   - **Username:** `root`
3. Clique em **Store in Vault** (ou **Store in Keychain**, dependendo da tela) para informar/guardar a senha do MySQL `root`.
4. Clique em **Test Connection**. Se o teste funcionar, clique em **OK** e abra a conexão.
5. No editor SQL, execute:

```sql
SELECT VERSION();
```

O resultado deve indicar MySQL Server `8.0.46`.

## 7. Crie um diagrama EER

1. No Workbench, escolha **File → New Model**.
2. Na tela **MySQL Model**, clique duas vezes em **Add Diagram**.
3. Adicione tabelas, colunas e relacionamentos no diagrama.
4. Salve o projeto pelo menu **File → Save Model**. O arquivo será salvo com a extensão `.mwb`.

É possível criar um modelo EER sem se conectar ao servidor. Para gerar um modelo de um banco já existente, conecte-se e use **Database → Reverse Engineer**. Veja o [tutorial oficial de criação de modelos](https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-creating-a-model.html).

## Solução de problemas

### O Workbench não conecta ou aparece erro de conexão recusada

1. Abra o menu Iniciar e pesquise **Services** ou **Serviços**.
2. Localize o serviço **MySQL80** (ou o nome escolhido durante a configuração).
3. Se estiver parado, clique com o botão direito e selecione **Start/Iniciar**.
4. Confira se a conexão do Workbench usa `127.0.0.1`, porta `3306` e método **Standard (TCP/IP)**.

### Aparece `Access denied`

Confira se o usuário é `root` e use a senha criada na configuração do MySQL. Não é a senha da conta do Windows.

### `mysql.exe` não é reconhecido no Prompt de Comando

Use o caminho completo mostrado na seção de teste pelo terminal. Se o Server foi instalado em outra pasta, substitua pelo caminho escolhido na instalação.

### Não aparece `File → New Model`

Confirme em **Help → About MySQL Workbench** que está usando o **Workbench 8.0.47**. O menu de modelagem e o editor EER estão incluídos nessa versão.

## Checklist

- [ ] MySQL Community Server 8.0.46 instalado.
- [ ] Serviço MySQL iniciado.
- [ ] Senha de `root` guardada em local seguro.
- [ ] `SELECT VERSION();` retorna `8.0.46` no cliente de linha de comando.
- [ ] MySQL Workbench 8.0.47 instalado.
- [ ] Test Connection funciona no Workbench.
- [ ] **File → New Model → Add Diagram** abre o editor EER.
- [ ] Arquivo `.mwb` salvo.

## Fontes oficiais

- [MySQL Installer 8.0.46 para Windows](https://dev.mysql.com/downloads/installer/)
- [Arquivo oficial de versões do MySQL Workbench](https://downloads.mysql.com/archives/workbench/)
- [Instalação do MySQL no Windows](https://dev.mysql.com/doc/refman/8.0/en/windows-installation.html)
- [Instalação do Workbench no Windows](https://dev.mysql.com/doc/workbench/en/wb-installing-windows.html)
- [Criar modelo e diagrama EER](https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-creating-a-model.html)

*Revisado em 19 de novembro de 2026. Confira nas páginas oficiais a disponibilidade dos pacotes e a compatibilidade com sua versão do Windows.*

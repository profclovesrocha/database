# Solução: arquivos aparecem como não rastreados após clonar um repositório Git no macOS

## Resumo do problema

Após clonar o repositório `database` no macOS, o GitHub Desktop mostrava
10 arquivos como adicionados/não rastreados na aba **Changes**, mesmo
sem nenhuma alteração feita pelo usuário.

No terminal, o comando:

``` bash
git status --short
```

mostrava os arquivos com o prefixo `??`, indicando que o Git os
considerava não rastreados.

## Ambiente identificado

-   Sistema: macOS em Apple Silicon (ARM64)
-   Git instalado via Homebrew: `/opt/homebrew/bin/git`
-   Versão do Git observada: `2.55.0`
-   Configuração inicial `core.precomposeunicode`: `true`
-   Configuração inicial `core.ignorecase`: `true`

## Diagnóstico

Os testes indicaram que:

-   Os arquivos locais tinham correspondentes no índice do Git após
    normalização Unicode NFC.
-   Os caminhos local e rastreado apontavam para o mesmo arquivo físico
    (`Mesmo arquivo físico: True`).
-   O conteúdo era idêntico (`Conteúdo idêntico: True`), confirmado por
    hashes SHA-256 iguais.
-   A situação estava relacionada à representação/normalização Unicode
    dos nomes dos arquivos entre o Git e o filesystem do macOS.

Não era um caso de arquivos duplicados, conteúdo diferente ou corrupção
dos documentos.

## Solução aplicada

Na raiz do repositório, primeiro foi executado um teste temporário:

``` bash
git -c core.precomposeunicode=false status --short
```

O teste funcionou: os arquivos deixaram de aparecer como não rastreados.

Em seguida, a configuração foi aplicada permanentemente **apenas para
esse repositório**:

``` bash
git config --local core.precomposeunicode false
```

## Como conferir se foi resolvido

Execute:

``` bash
git status
```

O resultado esperado é semelhante a:

``` text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

Depois, confira a aba **Changes** no GitHub Desktop. Ela também deve
deixar de listar esses arquivos como alterações pendentes.

## Importante: ao clonar novamente

A configuração `--local` fica armazenada no `.git/config` do repositório
local. Portanto, ela não é enviada ao GitHub e não acompanha novos
clones.

Se o problema aparecer em outro clone desse repositório no macOS,
execute novamente, dentro da pasta clonada:

``` bash
git config --local core.precomposeunicode false
```

## Como reverter a configuração

Para restaurar o valor original observado neste caso:

``` bash
git config --local core.precomposeunicode true
```

## Cuidados

-   Não é necessário apagar os arquivos.
-   Não é necessário executar `git clean` ou `git reset --hard`.
-   A solução não altera o conteúdo dos documentos.
-   A configuração é local ao clone e não modifica o repositório remoto.

------------------------------------------------------------------------

**Observação:** esta documentação registra a solução que funcionou neste
ambiente e neste repositório. Se o mesmo sintoma ocorrer em outro
projeto, confirme o resultado do teste temporário antes de aplicar a
configuração permanentemente.

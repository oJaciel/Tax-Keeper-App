# Tax-Keeper
Aplicativo para controle de impostos em itens.

## Funcionalidades
O aplicativo possui funcionalidades de CRUD para os itens cadastrados, bem como calculadoras e guias fiscais.

- Navegar por itens: a tela inicial da aplicação é dedicada a navegação pelos itens cadastrados, visualizando em detalhes nome, NCM, código de barras, código CEST, CSTs, alíquotas e demais informações fiscais.
- CRUD de item: na tela de gerenciamento de itens, o usuário pode manipular as informações relevantes aos itens, adicionando, editando e excluindo os dados. 
- Calculadora Fiscal: aplicação possui calculadora fiscal dedicada, que permite o cálculo de impostos tanto de maneira avulsa, quanto buscando dados de alíquotas dos itens cadastrados.
- Assistente de Consulta CST: o app possui telas e botões dedicados a auxiliar o usuário na busca e identificação das CST, tanto no cadastro/edição, quanto na visualização dos itens.


## Instalação

Siga as etapas abaixo para configurar e executar o projeto localmente:

### Pré-requisitos
Certifique-se de que você tenha o seguinte instalado:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versão compatível com o projeto)
- [Android Studio](https://developer.android.com/studio) ou outro editor de sua preferência (opcional, mas recomendado)
- Emulador ou dispositivo físico conectado

### Passo 1: Clone o repositório
No terminal, execute:
```bash
git clone https://github.com/oJaciel/Tax-Keeper-App
cd Tax-Keeper-App
```

### Passo 2: Instale as dependências
Execute o comando:
```bash
flutter pub get
```

### Passo 3: Execute o projeto
Inicie o aplicativo com o comando:
```bash
flutter run
```

Certifique-se de que um dispositivo emulador ou físico esteja conectado para que o app seja executado.
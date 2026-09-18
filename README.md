# 📝 Aplicativo de Notas

Aplicativo mobile desenvolvido em **Flutter e Dart** para a **Aula 04 — Consumo de APIs Externas**.

O projeto consiste em um aplicativo de **bloco de notas**, desenvolvido com uma interface moderna em tons de rosa. O aplicativo possui tela Splash, autenticação utilizando a API DummyJSON e uma tela principal para visualização e criação de anotações.

---

## 📱 Sobre o projeto

O objetivo do projeto é aplicar conceitos de desenvolvimento de aplicativos mobile utilizando Flutter, incluindo:

* Desenvolvimento de interfaces mobile;
* Consumo de API REST;
* Autenticação através de API externa;
* Requisições HTTP;
* Manipulação de dados JSON;
* Persistência de dados no dispositivo;
* Navegação entre telas;
* Programação orientada a objetos;
* Criação de interfaces intuitivas e responsivas.

---

## ✨ Funcionalidades

### 🌸 Tela Splash

Ao iniciar o aplicativo, é apresentada uma tela Splash com uma animação de entrada e saída.

Após a animação, o usuário é direcionado para a tela de login.

A Splash também pode ser acessada novamente através do menu lateral.

---

### 🔐 Tela de Login

A tela de login utiliza a **API DummyJSON** para realizar a autenticação do usuário.

O usuário deve informar:

* Nome de usuário;
* Senha.

Os dados são enviados para a API através de uma requisição `POST`.

Caso os dados estejam corretos, o usuário consegue acessar o aplicativo.

Caso estejam incorretos, uma mensagem informa que o acesso foi negado.

#### 👤 Login para teste

Utilize os seguintes dados para testar o aplicativo:

**Usuário:**

```text
emilys
```

**Senha:**

```text
emilyspass
```

### 🌐 API utilizada

```text
https://dummyjson.com/auth/login
```

---

## 🏠 Tela Home

Após realizar o login, o usuário é direcionado para a tela principal do aplicativo.

A Home possui:

* Cabeçalho;
* Menu lateral;
* Lista de anotações;
* Botão `+` para adicionar uma nova anotação;
* Cards para organização das anotações;
* Interface em tons de rosa;
* Navegação simples e intuitiva.

---

## 📝 Sistema de Anotações

O aplicativo funciona como um bloco de notas.

O usuário pode:

* Visualizar suas anotações;
* Adicionar novas anotações;
* Organizar suas informações;
* Acessar as anotações através da tela principal.

O botão `+` localizado na Home permite adicionar uma nova anotação.

---

## ☰ Menu Lateral

O aplicativo possui um menu lateral do tipo **hamburger/sandwich**.

Nele estão disponíveis as principais opções:

* 🏠 Home
* 🌸 Splash
* 📝 Anotações
* 🚪 Sair

### 🌸 Splash

Permite acessar novamente a tela Splash e visualizar sua animação.

### 🚪 Sair

Permite encerrar a sessão/aplicativo conforme o funcionamento implementado no projeto.

> A função de sair pode apresentar comportamentos diferentes dependendo da execução em emulador, dispositivo físico ou navegador.

---

## 🎨 Interface

O aplicativo possui uma identidade visual baseada em **tons de rosa**, buscando uma aparência:

* Moderna;
* Delicada;
* Simples;
* Intuitiva;
* Organizada.

Também foi utilizada uma fonte externa para melhorar a aparência da interface.

---

# 📸 Prints das telas

Os prints das telas do aplicativo estão dentro da pasta chamada print


## 📁 Organização dos prints

A pasta deve estar organizada da seguinte maneira:

```text
projeto/
│
├── prints/
│   ├── splash.png
│   ├── login.png
│   ├── home.png
│   ├── menu.png
│   └── anotacoes.png
│
├── lib/
├── android/
├── pubspec.yaml
└── README.md
```

---

# 📦 Dependências

O projeto foi desenvolvido utilizando **Flutter** e **Dart**.

As principais dependências utilizadas são:

```yaml
dependencies:
  flutter:
    sdk: flutter

  http: ^1.5.0
  shared_preferences: ^2.5.3
  google_fonts: ^6.3.0
  cupertino_icons: ^1.0.8
```

### Utilização das dependências

| Dependência          | Função                                         |
| -------------------- | ---------------------------------------------- |
| `flutter`            | Framework utilizado no desenvolvimento         |
| `http`               | Realização de requisições para a API DummyJSON |
| `shared_preferences` | Armazenamento de informações localmente        |
| `google_fonts`       | Utilização de fontes personalizadas            |
| `cupertino_icons`    | Ícones utilizados na aplicação                 |

---

# ⚙️ Requisitos

Para executar o projeto, é necessário possuir:

* Flutter SDK;
* Dart SDK;
* Android Studio ou VS Code;
* Android SDK;
* Emulador Android ou dispositivo físico;
* Conexão com a internet para realizar o login através da API.

Para verificar se o Flutter está instalado corretamente:

```bash
flutter doctor
```

---

# 🚀 Como executar

## 1. Clonar o projeto

```bash
git clone LINK_DO_SEU_REPOSITORIO
```

Depois, entre na pasta do projeto:

```bash
cd nome_do_projeto
```

---

## 2. Instalar as dependências

Execute:

```bash
flutter pub get
```

---

## 3. Verificar os dispositivos

Execute:

```bash
flutter devices
```

---

## 4. Executar o aplicativo

Execute:

```bash
flutter run
```

---

# 🔐 Como testar o login

Ao abrir o aplicativo:

### 1. Aguarde a Splash

A animação será executada automaticamente.

### 2. Informe os dados de acesso

```text
Usuário: emilys
Senha: emilyspass
```

### 3. Realize o login

O aplicativo enviará os dados para a API DummyJSON.

### 4. Acesse a Home

Após a autenticação, o usuário será direcionado para a tela principal, onde poderá visualizar e adicionar anotações.

---

# 🌐 API utilizada

O projeto utiliza a **DummyJSON** para realizar a autenticação do usuário.

### Endpoint de login

```text
POST https://dummyjson.com/auth/login
```

Os dados são enviados em formato JSON:

```json
{
  "username": "emilys",
  "password": "emilyspass"
}
```

A API retorna os dados de autenticação quando o usuário é válido.

---

# 💾 Persistência de dados

O aplicativo utiliza armazenamento local para manter informações necessárias ao funcionamento da aplicação.

Para isso, foi utilizada a biblioteca:

```text
shared_preferences
```

---

# 📁 Estrutura do projeto

A estrutura principal do projeto está organizada da seguinte forma:

```text
lib/
│
├── main.dart
│
├── services/
│   └── auth_service.dart
│
├── telas/
│   ├── splash.dart
│   ├── login.dart
│   ├── home.dart
│   └── ...
│
└── widgets/
    └── ...
```

> A estrutura apresentada representa a organização utilizada no aplicativo.

---

# 🛠️ Tecnologias utilizadas

* **Flutter**
* **Dart**
* **API REST**
* **DummyJSON**
* **HTTP**
* **JSON**
* **SharedPreferences**
* **Google Fonts**

---

# 📲 APK

O arquivo APK do aplicativo pode ser disponibilizado através de um link para download.

### ⬇️ Download do APK

**[BAIXAR APK](LINK_DO_APK)**

> Substitua `LINK_DO_APK` pelo link real do arquivo `.apk`.

---

# 🔨 Gerando o APK

Para gerar o APK em modo release, execute:

```bash
flutter build apk --release
```

O arquivo será gerado em:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🎯 Capacidades técnicas

O projeto atende às capacidades propostas na atividade:

### 7 — Persistir dados em dispositivos móveis

Utilização de armazenamento local através do `SharedPreferences`.

### 8 — Realizar integração de dispositivos móveis aos serviços web

Integração do aplicativo Flutter com a API DummyJSON para realizar a autenticação.

### 11 — Utilizar elementos da programação orientada a objetos

Utilização de classes, objetos e organização do código em diferentes arquivos.

---

# 📚 Conhecimentos trabalhados

Durante o desenvolvimento do projeto foram trabalhados:

* Consumo de serviços RESTful;
* Requisições HTTP;
* Método `POST`;
* Manipulação de dados;
* JSON;
* Autenticação através de API;
* Persistência de dados;
* Desenvolvimento de interfaces mobile;
* Navegação entre telas;
* Organização de projetos Flutter.

---

# 🎓 Projeto acadêmico

**Aula 04 — Consumo de APIs Externas**

Projeto desenvolvido para a disciplina de **Programação para Dispositivos Móveis 2 (PPDM2)**.

**Curso:** Desenvolvimento de Sistemas
**Tecnologia:** Flutter / Dart

---

## 💗 Desenvolvido com Flutter

Aplicativo desenvolvido como atividade acadêmica, aplicando conceitos de desenvolvimento mobile, consumo de API, autenticação, persistência de dados e criação de interfaces.

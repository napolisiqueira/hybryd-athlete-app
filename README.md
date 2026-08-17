# 🏃 Hybrid Athlete App

App mobile para atletas híbridos — treino de força, dieta, corrida e saúde em um só lugar, com histórico, progressão e recomendações por IA. Construído em **Flutter**, consumindo a [Hybrid Athlete Backend API](https://github.com/seu-usuario/hybrid-athlete-backend).

> Pensa em Hevy + MyFitnessPal + Nike Run Club, só que tudo integrado e puxando dados uns dos outros (sono e clima afetando treino, por exemplo).

---

## 📋 Sobre o projeto

Este é o app mobile do ecossistema **Hybrid Athlete** — a interface que o usuário realmente usa no dia a dia:

- 🏋️ **Treino** — montar treinos, iniciar sessões, registrar séries/reps/carga em tempo real, ver histórico e gráficos de progressão (estilo Hevy)
- 🥗 **Dieta** — montar refeições a partir da Tabela TACO, acompanhar macros e calorias do dia, controle de hidratação (estilo MyFitnessPal)
- 🏃 **Corrida** — registrar corridas, ver pace e rota no mapa (estilo Nike Run Club)
- ❤️ **Saúde** — sono, clima e histórico de dores/lesões
- 🤖 **IA** — conselhos personalizados de treino, dieta e sono com base no seu histórico

Este repositório contém **apenas o app (frontend)**. Toda a lógica de negócio e o banco de dados ficam no [repositório do backend](https://github.com/seu-usuario/hybrid-athlete-backend), construído em Python/FastAPI + MongoDB.

---

## 🛠️ Stack

| Camada | Tecnologia |
|---|---|
| Framework | [Flutter](https://flutter.dev/) |
| Linguagem | Dart |
| Gerenciamento de estado | Riverpod |
| Navegação | GoRouter |
| Requisições HTTP | http / Dio |
| Gráficos | fl_chart |
| Mapas/GPS (corrida) | geolocator + flutter_map |
| Armazenamento seguro (token JWT) | flutter_secure_storage |

---

## 🚀 Rodando o projeto localmente

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (`flutter doctor` sem erros no Android toolchain)
- Um emulador Android configurado (ou dispositivo físico com depuração USB) — ou Xcode/simulador iOS no Mac
- O [backend](https://github.com/seu-usuario/hybrid-athlete-backend) rodando localmente ou publicado

### Passo a passo

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/hybrid-athlete-app.git
cd hybrid-athlete-app

# Instale as dependências
flutter pub get

# Rode o app (com um emulador/dispositivo já conectado)
flutter run
```

### Configurando a URL da API

O app precisa saber onde está o backend. Configure isso em `lib/core/config/api_config.dart` (ou arquivo equivalente):

```dart
const String apiBaseUrl = "http://10.0.2.2:8000"; // 10.0.2.2 = localhost do emulador Android
```

> No emulador Android, `10.0.2.2` aponta pro `localhost` da sua máquina. Em dispositivo físico, use o IP da sua rede local ou a URL do backend já publicado.

---

## 📁 Estrutura do projeto

```
hybrid-athlete-app/
├── lib/
│   ├── core/            # Configurações, cliente HTTP, temas, rotas
│   ├── features/
│   │   ├── treino/       # Telas e lógica de treino
│   │   ├── dieta/        # Telas e lógica de dieta
│   │   ├── corrida/      # Telas e lógica de corrida
│   │   ├── saude/        # Telas e lógica de saúde
│   │   └── perfil/       # Perfil e configurações
│   └── main.dart          # Ponto de entrada do app
├── pubspec.yaml            # Dependências do projeto
└── android/ ios/             # Configurações nativas de cada plataforma
```

---

## 🗺️ Roadmap

- [x] Fase 1 — Setup do projeto e telas iniciais (exercícios e alimentos)
- [ ] Fase 2 — Treinos: criação, execução e gráficos de progressão
- [ ] Fase 3 — Dieta: refeições, macros e hidratação
- [ ] Fase 4 — Corrida: registro, GPS e mapa
- [ ] Fase 5 — Saúde: sono, clima, lesões e autenticação (login/JWT)
- [ ] Fase 6 — Tela de conselhos da IA e build de release

---

## 🔗 Backend

A API que este app consome está em: **[hybrid-athlete-backend](https://github.com/seu-usuario/hybrid-athlete-backend)** (Python + FastAPI + MongoDB)

---

## 📄 Licença

Este projeto está sob a licença MIT — veja o arquivo [LICENSE](LICENSE) para mais detalhes.
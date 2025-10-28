# 🏠 RealState — Sistema Didático de Imobiliária (Ruby on Rails + RSpec)

Projeto didático para demonstração de **testes automatizados em Ruby on Rails**, cobrindo desde testes unitários até de sistema, com exemplos práticos usando **RSpec**, **FactoryBot**, **ShouldaMatchers**, **Capybara** e **SimpleCov**.

---

## 🧩 Visão Geral

O **RealState** é um sistema de imobiliária simplificado que gerencia **proprietários, imóveis, leads, visitas e negociações**.

Além de servir como base para aprendizado de **Rails 8**, o foco do projeto é **ensinar boas práticas de testes**:
- Testes de **modelos** (validações, enums, escopos)
- Testes de **serviços e jobs**
- Testes de **controllers / API (request specs)**
- Testes de **integração e sistema (Capybara)**
- Testes com **stubs e mocks de APIs externas (WebMock/VCR)**
- Medição de **cobertura de código (SimpleCov)**
- Execução contínua com **GitHub Actions (CI)**

---

## 🏗️ Estrutura do Sistema

### Modelos principais

| Entidade  | Descrição |
|------------|------------|
| **Owner**  | Representa o proprietário de um ou mais imóveis |
| **Property** | Imóvel com título, endereço, preço e status (`available`, `reserved`, `sold`) |
| **Lead** | Pessoa interessada em um imóvel |
| **Visit** | Agendamento de visita entre um lead e um imóvel |
| **Deal** | Fechamento de uma negociação (compra/venda) |

---

## ⚙️ Tecnologias Utilizadas

### Backend
- Ruby **3.3+**
- Rails **8.0+**
- PostgreSQL
- Sidekiq (para jobs assíncronos)
- ActionMailer (envio de e-mails)

### Testes
- **RSpec** — framework principal de testes
- **FactoryBot** — geração de dados de teste
- **Faker** — dados falsos (nomes, e-mails, endereços)
- **Shoulda Matchers** — simplifica validações e associações
- **Capybara + Selenium/Chrome** — testes de sistema
- **SimpleCov** — relatório de cobertura
- **WebMock / VCR** — simulação de APIs externas

---

### 1. Clone o repositório
```bash
git clone git@github.com:Did-tica-Testes-Ruby-On-Rails/realstate.git
cd realstate

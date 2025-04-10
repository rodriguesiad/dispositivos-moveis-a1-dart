# 💊 Lista de Medicamentos - Avaliação A1

Este é um aplicativo desenvolvido como **avaliação da A1** da disciplina **Programação para Dispositivos Móveis II**, do curso de **Sistemas de Informação da UNITINS**.

---

## 🎯 Objetivo

Construir um aplicativo funcional utilizando **Flutter**, capaz de realizar as seguintes operações consumindo uma **API externa**:

- ✅ Cadastro de medicamentos
- ✅ Listagem de medicamentos
- ✅ Edição de medicamentos
- ✅ Exclusão de medicamentos
- ✅ Filtro de busca por nome

---

## 🚀 Funcionalidades

- A tela principal exibe uma **lista de medicamentos a tomar**, com **campo de busca** visível somente quando há itens cadastrados.
- O botão **“+”** permite adicionar novos medicamentos com nome, horário e quantidade.
- Cada item da lista possui ícones de **editar** ✏️ e **deletar** 🗑️.
- A busca é realizada em tempo real com base no nome do medicamento.
- As operações de CRUD (Create, Read, Update, Delete) são feitas consumindo uma API criada com o **MockAPI**.

---

## 🌐 API utilizada

O app consome dados da seguinte API:

https://67f7324c42d6c71cca6450cc.mockapi.io/api/pdm/medicamentos


- **GET**: Buscar todos os medicamentos
- **POST**: Criar novo medicamento
- **PUT**: Atualizar medicamento existente
- **DELETE**: Remover medicamento

---

## 📦 Tecnologias Utilizadas

- Flutter SDK
- Linguagem Dart
- HTTP requests com pacote `http`
- FutureBuilder para dados assíncronos
- Organização em componentes (`widgets`, `models`, `pages`)
- API pública com MockAPI

---

Este projeto demonstra o uso de chamadas HTTP no Flutter para realizar operações de CRUD em uma API real, com tratamento de erros, interface amigável e código organizado.

---

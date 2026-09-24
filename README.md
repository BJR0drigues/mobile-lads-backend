# mobile-lads-backend

> Backend API do app mobile **LADS** — Node.js, Express e Prisma ORM (MySQL).

API REST que dá suporte ao aplicativo mobile do LADS: autenticação de usuários,
perfis, recuperação de senha por e-mail e modelagem de dados via Prisma.

## Stack

- **Node.js** + **TypeScript**
- **Express** (API REST)
- **Prisma ORM** com **MySQL** (`mysql2`)

## Estrutura

```
prisma/
  schema.prisma      # modelo de dados
  migrations/        # histórico de migrações
  seed.ts            # popular banco com dados iniciais
src/                 # código da API
Prototipo-DB-LADS.md # dicionário de tabelas e colunas
```

## Como rodar

```bash
# 1. instalar dependências
npm install

# 2. configurar variáveis de ambiente
cp .env.example .env   # ajuste DATABASE_URL e demais chaves

# 3. aplicar migrações e popular o banco
npx prisma migrate dev
npm run seed

# 4. subir em desenvolvimento
npm run dev
```

## Scripts

| comando | o que faz |
|---------|-----------|
| `npm run dev`   | sobe a API em modo desenvolvimento (ts-node) |
| `npm run build` | compila o TypeScript (`tsc`) |
| `npm run seed`  | popula o banco com dados iniciais |

## Licença

[MIT](LICENSE) © 2026 Brayan J. Rodrigues

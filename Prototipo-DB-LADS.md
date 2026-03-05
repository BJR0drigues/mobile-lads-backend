# 📋 Lista Completa de Tabelas e Colunas - LADS

---

## 1. USERS (Usuários do Sistema)

**Tabela**: `users`

**Colunas**:
- id (UUID, PK)
- first_name (VARCHAR 100)
- last_name (VARCHAR 100)
- email (VARCHAR 255, UNIQUE)
- phone (VARCHAR 20)
- password_hash (VARCHAR 255)
- password_reset_token (VARCHAR 255)
- password_reset_expires (TIMESTAMP)
- email_verified (BOOLEAN)
- email_verified_at (TIMESTAMP)
- avatar_url (VARCHAR 500)
- bio (TEXT)
- location (VARCHAR 255)
- date_of_birth (DATE)
- gender (VARCHAR 50)
- institution (VARCHAR 255)
- course (VARCHAR 255)
- enrollment_number (VARCHAR 100)
- graduation_year (INTEGER)
- is_professional (BOOLEAN)
- is_lads_member (BOOLEAN)
- is_admin (BOOLEAN)
- account_status (VARCHAR 50)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
- last_login (TIMESTAMP)
- deleted_at (TIMESTAMP)

---

## 2. PROFESSIONALS (Dados Profissionais)

**Tabela**: `professionals`

**Colunas**:
- id (UUID, PK)
- user_id (UUID, FK, UNIQUE)
- title (VARCHAR 255)
- company (VARCHAR 255)
- position (VARCHAR 255)
- bio_professional (TEXT)
- linkedin_url (VARCHAR 500)
- github_url (VARCHAR 500)
- portfolio_url (VARCHAR 500)
- website_url (VARCHAR 500)
- twitter_url (VARCHAR 500)
- lads_join_date (DATE)
- lads_role (VARCHAR 100)
- lads_bio (TEXT)
- certifications (TEXT[])
- achievements (TEXT[])
- available_for_consulting (BOOLEAN)
- available_for_mentoring (BOOLEAN)
- available_for_speaking (BOOLEAN)
- total_projects (INTEGER)
- total_mentees (INTEGER)
- average_rating (DECIMAL 3,2)
- total_ratings (INTEGER)
- total_followers (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 3. EXPERTISE (Áreas de Especialização)

**Tabela**: `expertise`

**Colunas**:
- id (UUID, PK)
- professional_id (UUID, FK)
- skill_name (VARCHAR 255)
- category (VARCHAR 100)
- proficiency_level (VARCHAR 50)
- years_of_experience (INTEGER)
- description (TEXT)
- certification_id (UUID)
- certification_url (VARCHAR 500)
- endorsements (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 4. EVENTS (Eventos do LADS)

**Tabela**: `events`

**Colunas**:
- id (UUID, PK)
- title (VARCHAR 255)
- description (TEXT)
- short_description (VARCHAR 500)
- cover_image_url (VARCHAR 500)
- thumbnail_url (VARCHAR 500)
- start_date (TIMESTAMP)
- end_date (TIMESTAMP)
- registration_start (TIMESTAMP)
- registration_deadline (TIMESTAMP)
- location (VARCHAR 500)
- location_lat (DECIMAL 10,8)
- location_lng (DECIMAL 11,8)
- is_online (BOOLEAN)
- online_link (VARCHAR 500)
- event_type (VARCHAR 100)
- category (VARCHAR 100)
- max_participants (INTEGER)
- current_participants (INTEGER)
- organizer_id (UUID, FK)
- co_organizers (UUID[])
- status (VARCHAR 50)
- visibility (VARCHAR 50)
- total_views (INTEGER)
- total_registrations (INTEGER)
- total_attendees (INTEGER)
- tags (TEXT[])
- agenda (TEXT)
- requirements (TEXT)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
- deleted_at (TIMESTAMP)

---

## 5. EVENT_PARTICIPANTS (Participantes dos Eventos)

**Tabela**: `event_participants`

**Colunas**:
- id (UUID, PK)
- event_id (UUID, FK)
- user_id (UUID, FK)
- registration_status (VARCHAR 50)
- registered_at (TIMESTAMP)
- confirmed_at (TIMESTAMP)
- checked_in_at (TIMESTAMP)
- cancelled_at (TIMESTAMP)
- registration_notes (TEXT)
- team_name (VARCHAR 255)
- team_id (UUID)
- certificate_issued (BOOLEAN)
- certificate_url (VARCHAR 500)
- certificate_issued_at (TIMESTAMP)
- feedback_given (BOOLEAN)
- rating (INTEGER)
- review (TEXT)
- feedback_given_at (TIMESTAMP)

---

## 6. FORUMS (Fórum de Eventos)

**Tabela**: `forums`

**Colunas**:
- id (UUID, PK)
- event_id (UUID, FK, UNIQUE)
- title (VARCHAR 255)
- description (TEXT)
- is_moderated (BOOLEAN)
- moderator_ids (UUID[])
- total_topics (INTEGER)
- total_comments (INTEGER)
- total_members (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 7. TOPICS (Tópicos de Discussão)

**Tabela**: `topics`

**Colunas**:
- id (UUID, PK)
- forum_id (UUID, FK)
- author_id (UUID, FK)
- title (VARCHAR 500)
- content (TEXT)
- category (VARCHAR 100)
- is_pinned (BOOLEAN)
- is_locked (BOOLEAN)
- is_archived (BOOLEAN)
- is_spam (BOOLEAN)
- total_views (INTEGER)
- total_comments (INTEGER)
- total_likes (INTEGER)
- last_activity_at (TIMESTAMP)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)
- deleted_at (TIMESTAMP)

---

## 8. COMMENTS (Comentários em Tópicos)

**Tabela**: `comments`

**Colunas**:
- id (UUID, PK)
- topic_id (UUID, FK)
- author_id (UUID, FK)
- parent_comment_id (UUID, FK)
- content (TEXT)
- is_edited (BOOLEAN)
- edited_at (TIMESTAMP)
- is_spam (BOOLEAN)
- is_deleted (BOOLEAN)
- total_likes (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 9. LIKES (Sistema de Likes)

**Tabela**: `likes`

**Colunas**:
- id (UUID, PK)
- user_id (UUID, FK)
- likeable_type (VARCHAR 50)
- likeable_id (UUID)
- created_at (TIMESTAMP)

---

## 10. SERVICES (Tipos de Serviços)

**Tabela**: `services`

**Colunas**:
- id (UUID, PK)
- name (VARCHAR 255)
- slug (VARCHAR 255, UNIQUE)
- description (TEXT)
- icon (VARCHAR 50)
- category (VARCHAR 100)
- subcategory (VARCHAR 100)
- estimated_duration (VARCHAR 100)
- base_price (DECIMAL 10,2)
- is_custom_price (BOOLEAN)
- technologies (TEXT[])
- deliverables (TEXT[])
- is_active (BOOLEAN)
- total_requests (INTEGER)
- average_rating (DECIMAL 3,2)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 11. SERVICE_REQUESTS (Requisições de Serviço)

**Tabela**: `service_requests`

**Colunas**:
- id (UUID, PK)
- request_number (VARCHAR 50, UNIQUE)
- service_id (UUID, FK)
- requester_id (UUID, FK)
- assigned_to_id (UUID, FK)
- title (VARCHAR 500)
- description (TEXT)
- requirements (TEXT)
- budget_estimation (DECIMAL 10,2)
- final_price (DECIMAL 10,2)
- price_status (VARCHAR 50)
- request_date (TIMESTAMP)
- deadline (DATE)
- estimated_start_date (DATE)
- estimated_end_date (DATE)
- actual_start_date (TIMESTAMP)
- actual_end_date (TIMESTAMP)
- status (VARCHAR 50)
- priority (VARCHAR 50)
- attachments (JSON)
- last_message_date (TIMESTAMP)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 12. SERVICE_REQUEST_UPDATES (Histórico de Requisições)

**Tabela**: `service_request_updates`

**Colunas**:
- id (UUID, PK)
- service_request_id (UUID, FK)
- updated_by_id (UUID, FK)
- update_type (VARCHAR 100)
- title (VARCHAR 255)
- description (TEXT)
- field_changed (VARCHAR 100)
- old_value (VARCHAR 500)
- new_value (VARCHAR 500)
- created_at (TIMESTAMP)

---

## 13. RATINGS (Avaliações de Profissionais)

**Tabela**: `ratings`

**Colunas**:
- id (UUID, PK)
- professional_id (UUID, FK)
- rater_id (UUID, FK)
- score (INTEGER)
- title (VARCHAR 255)
- review (TEXT)
- context_type (VARCHAR 50)
- context_id (UUID)
- is_verified (BOOLEAN)
- is_helpful (BOOLEAN)
- helpful_count (INTEGER)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 14. FOLLOWS (Sistema de Seguir Profissionais)

**Tabela**: `follows`

**Colunas**:
- id (UUID, PK)
- follower_id (UUID, FK)
- professional_id (UUID, FK)
- is_active (BOOLEAN)
- mute_notifications (BOOLEAN)
- created_at (TIMESTAMP)
- unfollowed_at (TIMESTAMP)

---

## 15. CONNECTIONS (Conexões entre Usuários)

**Tabela**: `connections`

**Colunas**:
- id (UUID, PK)
- user_id_1 (UUID, FK)
- user_id_2 (UUID, FK)
- status (VARCHAR 50)
- initiated_by_id (UUID)
- last_message_date (TIMESTAMP)
- created_at (TIMESTAMP)
- accepted_at (TIMESTAMP)
- blocked_at (TIMESTAMP)

---

## 16. MESSAGES (Mensagens Diretas)

**Tabela**: `messages`

**Colunas**:
- id (UUID, PK)
- sender_id (UUID, FK)
- recipient_id (UUID, FK)
- connection_id (UUID, FK)
- content (TEXT)
- message_type (VARCHAR 50)
- attachment_url (VARCHAR 500)
- attachment_type (VARCHAR 50)
- is_read (BOOLEAN)
- read_at (TIMESTAMP)
- is_edited (BOOLEAN)
- edited_at (TIMESTAMP)
- is_deleted (BOOLEAN)
- deleted_at (TIMESTAMP)
- reactions (JSON)
- created_at (TIMESTAMP)
- updated_at (TIMESTAMP)

---

## 17. NOTIFICATIONS (Sistema de Notificações)

**Tabela**: `notifications`

**Colunas**:
- id (UUID, PK)
- user_id (UUID, FK)
- actor_id (UUID, FK)
- type (VARCHAR 100)
- title (VARCHAR 255)
- message (TEXT)
- object_type (VARCHAR 50)
- object_id (UUID)
- related_url (VARCHAR 500)
- is_read (BOOLEAN)
- read_at (TIMESTAMP)
- is_archived (BOOLEAN)
- notification_channel (VARCHAR 50)
- created_at (TIMESTAMP)
- sent_at (TIMESTAMP)

---

## 18. AUDIT_LOG (Log de Auditoria)

**Tabela**: `audit_log`

**Colunas**:
- id (UUID, PK)
- user_id (UUID, FK)
- action (VARCHAR 100)
- entity_type (VARCHAR 100)
- entity_id (UUID)
- description (TEXT)
- changes (JSON)
- ip_address (VARCHAR 45)
- user_agent (VARCHAR 500)
- created_at (TIMESTAMP)

---

## 📊 Resumo Estatístico

| Métrica | Valor |
|---------|-------|
| **Total de Tabelas** | 18 |
| **Total de Colunas** | 250+ |
| **Chaves Primárias (UUID)** | 18 |
| **Chaves Estrangeiras** | 35+ |
| **Índices Principais** | 50+ |
| **Colunas com Arrays** | 6 |
| **Colunas com JSON** | 4 |
| **Soft Deletes** | 3 tabelas |
| **Timestamps** | Em todas as tabelas |

---

## 🔑 Resumo de Relacionamentos

| Tabela 1 | Relacionamento | Tabela 2 |
|----------|---|----------|
| users | 1:1 | professionals |
| professionals | 1:N | expertise |
| professionals | 1:N | ratings |
| professionals | 1:N | follows |
| users | 1:N | events (como organizer) |
| events | 1:N | event_participants |
| events | 1:1 | forums |
| forums | 1:N | topics |
| topics | 1:N | comments |
| comments | 1:N | comments (parent) |
| topics/comments | N:N | users (likes) |
| services | 1:N | service_requests |
| service_requests | 1:N | service_request_updates |
| users | N:N | users (connections/messages) |
| users | 1:N | notifications |
| users | 1:N | audit_log |

---

## ✅ Tipos de Dados Utilizados

- **UUID** - Identificadores únicos
- **VARCHAR** - Strings com limite
- **TEXT** - Strings longas
- **BOOLEAN** - Verdadeiro/Falso
- **INTEGER** - Números inteiros
- **DECIMAL** - Números decimais
- **DATE** - Data (YYYY-MM-DD)
- **TIMESTAMP** - Data e hora
- **TEXT[]** - Array de strings
- **UUID[]** - Array de UUIDs
- **JSON** - Dados estruturados

---

**Versão**: 1.0  
**Data**: 2026-03-05  
**Status**: Pronto para implementação
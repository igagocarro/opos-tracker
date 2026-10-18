-- Opos Tracker · Esquema Supabase
-- Ejecuta este SQL en el SQL Editor de tu proyecto Supabase
-- (Supabase Dashboard → SQL Editor → New query → pega esto → Run)

-- ─── Tabla: topic_status ────────────────────────────────────────────
-- Guarda el estado de cada tema: 'ok', 'review' o 'weak'
create table if not exists topic_status (
  topic_num   integer primary key,       -- número del tema (1-58)
  status      text not null              -- 'ok' | 'review' | 'weak'
                check (status in ('ok','review','weak')),
  updated_at  timestamptz default now()
);

-- ─── Tabla: sessions ────────────────────────────────────────────────
-- Guarda si cada sesión del día está hecha ('done') o saltada ('skipped')
-- La clave es "YYYY-MM-DD:tipo", p.ej. "2026-10-20:especifica"
create table if not exists sessions (
  session_key text primary key,          -- "YYYY-MM-DD:tipo"
  status      text not null              -- 'done' | 'skipped'
                check (status in ('done','skipped')),
  updated_at  timestamptz default now()
);

-- ─── Tabla: tests ───────────────────────────────────────────────────
-- Diario de tests: fecha, tema, aciertos, total y notas de fallos
create table if not exists tests (
  id          bigserial primary key,
  date        date not null,
  tema        integer not null,          -- número del tema (1-58)
  correct     integer not null,
  total       integer not null,
  notes       text default '',
  created_at  timestamptz default now()
);

-- ─── Row Level Security ─────────────────────────────────────────────
-- Por ahora sin RLS (app personal, sin cuentas de usuario).
-- Si en el futuro añades auth, activa RLS y añade políticas.
alter table topic_status disable row level security;
alter table sessions     disable row level security;
alter table tests        disable row level security;

-- ─── Índices útiles ─────────────────────────────────────────────────
create index if not exists tests_date_idx on tests(date desc);
create index if not exists tests_tema_idx on tests(tema);

# Opos Tracker

App personal de seguimiento para las oposiciones de Estadística del Gobierno Vasco (Eustat).

## Funciones

- **Semana** — sesiones del día (específica + bus) marcables como hechas/saltadas
- **Temas** — estado de los 58 temas de la parte específica (✅/🔄/❌)
- **Tests** — diario de tests con puntuación y notas de fallos
- **Resumen** — progreso global, fase actual y últimos tests

## Stack

- Vanilla HTML/JS/CSS — sin frameworks, sin build step
- Supabase (PostgreSQL) — sincronización cross-device
- Vercel — hosting con deploy automático desde GitHub

## Despliegue

### 1. Supabase

1. Crea un proyecto en [supabase.com](https://supabase.com)
2. Ve a **SQL Editor** y ejecuta el contenido de `supabase-schema.sql`
3. Copia **Project URL** y **anon public key** de Settings → API

### 2. Vercel

1. Importa este repo en [vercel.com](https://vercel.com)
2. En **Settings → Environment Variables** añade:
   - `SUPABASE_URL` → tu Project URL
   - `SUPABASE_ANON_KEY` → tu anon key
3. Redeploy

## Desarrollo local

Abre `public/index.html` directamente en el navegador.  
Sin Supabase configurado, los datos se guardan en `localStorage`.

## Privacidad

El código es público (GitHub). Los datos son privados (Supabase, proyecto personal).  
Las credenciales de Supabase **nunca** se suben a GitHub — solo en variables de entorno de Vercel.

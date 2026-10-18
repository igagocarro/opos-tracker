#!/bin/sh
# Genera public/_env.js con las variables de entorno de Vercel
# Vercel ejecuta este script antes del deploy (configurado en vercel.json)

cat > public/_env.js << EOF
window.__ENV = {
  SUPABASE_URL: "${SUPABASE_URL:-}",
  SUPABASE_ANON_KEY: "${SUPABASE_ANON_KEY:-}"
};
EOF

echo "✓ _env.js generado"

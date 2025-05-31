#!/bin/sh

echo "Generating runtime env.js from container environment..."

cat <<EOF > /usr/share/nginx/html/env.js
window.__ENV__ = {
  VITE_GOOGLE_CLIENT_ID: "${VITE_GOOGLE_CLIENT_ID}",
  VITE_NODE_ENV: "${VITE_NODE_ENV}"
};
EOF

echo "Starting Nginx..."
exec nginx -g 'daemon off;'
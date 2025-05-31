#!/bin/sh

echo "Generating env.js from runtime environment..."

cat <<EOF > /usr/share/nginx/html/env.js
window.__ENV__ = {
  VITE_GOOGLE_CLIENT_ID: '${VITE_GOOGLE_CLIENT_ID}',
  VITE_NODE_ENV: '${VITE_NODE_ENV}'
};
EOF

exec nginx -g 'daemon off;'
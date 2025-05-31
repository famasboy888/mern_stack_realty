interface RuntimeEnv {
  VITE_GOOGLE_CLIENT_ID: string;
  VITE_NODE_ENV: string;
}

declare global {
  interface Window {
    __ENV__?: RuntimeEnv;
  }
}

export const GOOGLE_CLIENT_ID =
  window.__ENV__?.VITE_GOOGLE_CLIENT_ID ??
  import.meta.env.VITE_GOOGLE_CLIENT_ID;
export const NODE_ENV =
  window.__ENV__?.VITE_NODE_ENV ?? import.meta.env.VITE_NODE_ENV;

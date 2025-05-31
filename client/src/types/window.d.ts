export interface RuntimeEnv {
  VITE_GOOGLE_CLIENT_ID: string;
  VITE_NODE_ENV: string;
}

export declare global {
  interface Window {
    __ENV__?: RuntimeEnv;
  }
}

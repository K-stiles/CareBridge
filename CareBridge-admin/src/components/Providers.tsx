"use client";

import { SessionProvider } from "next-auth/react";
// import { ThemeProvider } from "next-themes";
import { Provider as StoreProvider } from "react-redux";
import type { FC, ReactNode } from "react";
import { store } from "@/store";

interface ProvidersProps {
  children: ReactNode;
}

const Providers: FC<ProvidersProps> = ({ children }) => {
  return (
    // <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
    <SessionProvider>
      <StoreProvider store={store}>{children}</StoreProvider>
    </SessionProvider>
    // </ThemeProvider>
  );
};

export default Providers;

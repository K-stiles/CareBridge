import "@/styles/globals.css";
import { cn } from "@/lib/utils";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Providers } from "@/components";

export const metadata: Metadata = {
  title: "Carebridge",
  description:
    "Welcome to the carebridge administrator dashboard. This platform is used to manage data flow between doctors and their respective patients",
};

const inter = Inter({ subsets: ["latin"] });

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body
        suppressHydrationWarning={true}
        className={cn(`min-h-screen ${inter.className} bg-slate-200 font-sans`)}
      >
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}

import type { Metadata } from "next";
import { LandNav, LandFooter } from "@/components";
import { cn } from "@/lib/utils";

export const metadata: Metadata = {
  title: "Purple Care | Everywhere",
  description: "Purple care ",
};

export default function LandLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className={cn(`min-h-screen  font-sans`)}>
      <LandNav />
      {children}
      <LandFooter />
    </div>
  );
}

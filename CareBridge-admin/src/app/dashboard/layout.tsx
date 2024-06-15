// "use client";
import { ReactNode } from "react";
import { Metadata } from "next";
import { Navbar, Sidebar } from "@/components";
import { cn } from "@/lib/utils";
// import { useAppSelector } from "@/types/useAppStore";
// import { useAppSelector } from "@/types/useAppStore";

export const metadata: Metadata = {
  title: "carebridge | Admin Dashboard",
  description: "Dashboard to manage doctors, patience and System resources",
};

export default function DashboardLayout({ children }: { children: ReactNode }) {
  // const openned = useAppSelector((state) => state.sidebarState.openned);

  return (
    <div
      className={cn(`min-h-screen h-full w-screen relative overflow-x-hidden`)}
    >
      <Sidebar />
      <div
        className={`relative min-h-screen overflow-x-hidden w-full duration-300 lg:expand`}
      >
        <Navbar />
        {children}
      </div>
    </div>
  );
}

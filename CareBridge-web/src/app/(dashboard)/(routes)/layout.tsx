import { SideBar } from "@/components";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Purple Care",
  description: "Purple care | Dashboard",
};

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="h-full">
      <div className="h-[80px] w-full md:pl-56 fixed inset-y-0 z-50">
        {/* <NavBar /> */}
        <h1>Nave bar</h1>
      </div>
      <div className="hidden md:flex h-full w-56 fixed flex-col inset-y-0 z-50">
        <SideBar />
      </div>

      <main className="md:pl-56 pt-[80px]">{children}</main>
    </div>
  );
}

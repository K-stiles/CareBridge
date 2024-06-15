"use client";
import React, { useEffect, useRef, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { signOut } from "next-auth/react";

import { SidebarTile } from "@/components";
import dashboardRoutes from "@/routes";
import { cn } from "@/lib/utils";
import { useRouter } from "next/navigation";
import { useAppSelector } from "@/types/useAppStore";

interface SidebarProps
  extends React.DetailedHTMLProps<
    React.HTMLAttributes<HTMLElement>,
    HTMLElement
  > {}

const Sidebar = ({ className }: SidebarProps) => {
  const router = useRouter();
  const [sidebarOpen, setSidebarOpen] = useState<boolean>(true);
  const trigger = useRef<any>(null);
  const sidebar = useRef<any>(null);
  const openned = useAppSelector((state) => state.sidebarState.openned);

  // close on click outside
  useEffect(() => {
    const clickHandler = ({ target }: MouseEvent) => {
      if (!sidebar.current || !trigger.current) return;
      if (
        !sidebarOpen ||
        sidebar.current.contains(target) ||
        trigger.current.contains(target)
      )
        return;
      setSidebarOpen(false);
    };
    document.addEventListener("click", clickHandler);
    return () => document.removeEventListener("click", clickHandler);
  });

  // close if the esc key is pressed
  useEffect(() => {
    const keyHandler = ({ keyCode }: KeyboardEvent) => {
      if (!sidebarOpen || keyCode !== 27) return;
      setSidebarOpen(false);
    };
    document.addEventListener("keydown", keyHandler);
    return () => document.removeEventListener("keydown", keyHandler);
  });

  const logout = () => signOut();

  return (
    <aside
      ref={sidebar}
      // ${ openned ? "block" : "hidden" }
      className={cn(
        ` 
        hidden lg:block fixed top-0 left-0 z-10 h-screen bg-slate-100 duration-300 text-slate-100 ease-linear dark:bg-slate-900 lg:translate-x-0 ${
          sidebarOpen ? "w-64 translate-x-0" : "w-24 -translate-x-full"
        }`,
        className
      )}
    >
      {/* <!-- SIDEBAR HEADER --> */}
      <div className=" w-full h-[90px]">
        <Link
          href="/dashboard"
          className="m-auto grid place-content-center w-full h-full mt-4"
        >
          <Image
            src={"/carebridge logo fonts.svg"}
            alt="ark logo"
            width={120}
            height={120}
            className="w-full h-full object-cover -ml-4"
          />
        </Link>
      </div>

      {/* <!-- Sidebar Menu --> */}
      <div className="sidenav-height no-scrollbar duration-300 ease-linear text-slate-800">
        <nav className="h-full flex flex-col py-10">
          {/* <!-- Menu Group --> */}
          <div className="">
            <h3 className="mb-4 ml-4 text-sm font-semibold text-bodydark2 ">
              MENU
            </h3>

            <ul className="mb-6 flex flex-col gap-1.5">
              {/* <!-- Menu Item Dashboard --> */}
              {dashboardRoutes &&
                dashboardRoutes.map((tile) => {
                  //TODO:REMOVE
                  // let isActive = tile.path === pathname;
                  // console.log("isActive; ", isActive);
                  return (
                    <Link href={tile.path} key={tile.id}>
                      <SidebarTile tile={tile} />
                    </Link>
                  );
                })}
              {/* <SidebarLinkGroup
                activeCondition={
                  pathname === "/" || pathname.includes("dashboard")
                }
              >
                {(handleClick, open) => {
                  return (
                    <>
                      <Link
                        href="#"
                        className={`bg-primary/50 group relative flex items-center gap-2.5 rounded-sm py-4 px-4 font-medium text-slate-100 duration-300 ease-in-out hover:hover:bg-primary dark:hover:bg-primary ${
                          (pathname === "/" ||
                            pathname.includes("dashboard")) &&
                          "bg-graydark dark:bg-meta-4"
                        }`}
                        onClick={(e) => {
                          e.preventDefault();
                          sidebarExpanded
                            ? handleClick()
                            : setSidebarExpanded(true);
                        }}
                      >
                        <Icons.CalendarRange />
                        Requests
                        <Icons.ChevronDown
                          className={`absolute right-4 top-1/2 -translate-y-1/2 duration-150 ${
                            open && "rotate-180 duration-150"
                          }`}
                        />
                      </Link>
                      {/*href!-- Dropdown Menu Start --> *
                      <div
                        className={`translate transform overflow-hidden ${
                          !open && "hidden"
                        }`}
                      >
                        <ul className="mt-1 mb-5.5 flex flex-col gap-1 bg-slate-200">
                          <Sub_SidebarTile name="consultation booking" />
                          <Sub_SidebarTile name="individual lab" />
                          <Sub_SidebarTile name="facility lab" />
                        </ul>
                      </div>
                      {/* <!-- Dropdown Menu End --> *
                    </>
                  );
                }}
              </SidebarLinkGroup> */}
            </ul>
          </div>

          {/* <!-- Others Group --> */}
          <div className="mt-auto">
            {/* <h3 className="mb-4 ml-4 text-sm font-semibold text-bodydark2">
              OTHERS
            </h3> */}

            {/* <!-- Menu Items List --> */}
            <ul className="mb-6 flex flex-col gap-1.5">
              <div className="" onClick={logout}>
                <SidebarTile name="Logout Account" />
              </div>
            </ul>
          </div>
        </nav>
      </div>
      {/* <!-- Sidebar Menu --> */}
    </aside>
  );
};

export default Sidebar;

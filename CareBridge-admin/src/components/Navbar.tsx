"use client";

import { FC } from "react";
import Image from "next/image";
import Icons from "./ui/Icons";
import Link from "next/link";
import { Input } from "./ui/input";
import Button from "./ui/Button";
import ProfileDropdown from "./ProfileDropdown";
import { useAppDispatch, useAppSelector } from "@/types/useAppStore";
import { openSide } from "@/store/features/sidebar";
import dashboardRoutes from "@/routes";
import SidebarTile from "./SidebarTile";
import { useRouter } from "next/navigation";
import Heading from "./ui/Heading";

interface NavbarProps {}

const Navbar: FC<NavbarProps> = ({}) => {
  const notifications = 250;

  const router = useRouter();
  const dispatch = useAppDispatch();

  const toggleSideBar = () => dispatch(openSide());
  const openned = useAppSelector((state) => state.sidebarState.openned);

  const goto = (path: string) => {
    router.push(path);
    toggleSideBar();
  };
  const gotoNotificationsPage = () => {
    router.push("/dashboard/notifications");
  };
  // console.log("openned: ", openned);

  return (
    // <div className=" fixed top-0 left-0 z-10 w-full"></div>
    <div className="">
      <div className="bg-primary/90 bg-late-100 w-full py-4 mb-4 flex items-center justify-between pl-14 pr-8">
        {/* logo */}
        <Link
          href="/dashboard"
          className=" bg-slate-100 rounded-full p-2 md:hidden"
        >
          <Image
            src={"/carebridge_logo.png"}
            alt="ark logo"
            width={100}
            height={100}
            className="w-8 h-8"
          />
        </Link>

        {/* search bar */}
        <div className="w-1/2 md:w-1/4 hidden md:block">
          <Input />
        </div>

        <div className="flex items-center gap-2">
          {/* notification */}
          <Button
            onClick={gotoNotificationsPage}
            className="bg-slate-50/20 mr-4 hover:bg-slate-50/40 focus:ring-2 ring-slate-100 group relative"
          >
            <Icons.Bell
              className="text-slate-100 fill-slate-100 group-hover:text-slate-100 group-hover:fill-slate-100"
              size={20}
            />
            <div className="rounded-full bg-slate-100 grid place-content-center absolute -top-2 -right-3 p-1">
              <p className="text-primary font-bold text-xs">{notifications}</p>
            </div>
          </Button>

          <ProfileDropdown />

          {/* menu */}
          <Button
            variant={"ghost"}
            className="lg:hidden hover:bg-transparent focus:ring-2 ring-slate-100"
            onClick={toggleSideBar}
          >
            <Icons.Menu className="text-slate-100 lg:hidden" />
          </Button>
        </div>
      </div>

      {/* mobile nav */}
      <nav
        className={`${
          openned ? "block" : "hidden"
        } lg:hidden absolute top-0 left-0 z-20 h-screen w-full bg-slate-200 p-8`}
      >
        <div className="flex items-center justify-between mb-4">
          <Heading>Menu</Heading>
          <Button
            variant={"ghost"}
            className="lg:hidden hover:bg-transparent focus:ring-2 ring-slate-100"
            onClick={toggleSideBar}
          >
            <Icons.X className="font-extrabold text-slate-800 lg:hidden" />
          </Button>
        </div>

        {/* body */}
        <div>
          <ul className="mb-6 flex flex-col gap-1.5">
            {dashboardRoutes &&
              dashboardRoutes.map((tile) => {
                return (
                  <div onClick={() => goto(tile.path)} key={tile.id}>
                    <SidebarTile tile={tile} />
                  </div>
                );
              })}
          </ul>
        </div>
      </nav>
      {/* mobile nav */}
    </div>
  );
};

export default Navbar;

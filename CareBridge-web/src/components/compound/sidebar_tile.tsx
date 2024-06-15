"use client";

import { FC } from "react";
import { usePathname, useRouter } from "next/navigation";
import { cn } from "@/lib/utils";

interface sidebar_tileProps {
  route: SideRoute;
  // icon:Icon // re-mapping icon -to- Icon to be rendered as a component
}

/** Destructured routes and re-mapped icon -to- Icon to be rendered as a component */
const Sidebar_Tile: FC<sidebar_tileProps> = ({
  route: { label, icon: Icon, href },
}) => {
  const pathname = usePathname();
  const router = useRouter();

  const isActive =
    (pathname === "/" && href === "/") ||
    pathname === href ||
    pathname.startsWith(`${href}/`);

  const onTap = () => router.push(href);

  return (
    <button onClick={onTap} type="button">
      <div
        className={cn(
          "mr-auto opacity-100 border-r-2 border-sky-700 h-full transition-all",
          isActive && "opacity-100"
        )}
      />
      <div className="flex items-center gap-x-2 py-4">
        <Icon className={cn("text-slate-600", isActive && "text-amber-500")} />
        {label}
      </div>
    </button>
  );
};

export default Sidebar_Tile;

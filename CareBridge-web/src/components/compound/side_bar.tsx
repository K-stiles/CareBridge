import { FC } from "react";
import Logo from "@/simple/logo";
import SideBarRoutes from "@/compound/sidebar_routes";

interface side_barProps {}

const SideBar: FC<side_barProps> = ({}) => {
  return (
    <div className="h-full border-r shadow-sm flex flex-col overflow-y-auto bg-emerald-500">
      <div className="p-6">
        <Logo />
      </div>

      <div className="flex flex-col w-full">
        <SideBarRoutes />
      </div>
    </div>
  );
};

export default SideBar;

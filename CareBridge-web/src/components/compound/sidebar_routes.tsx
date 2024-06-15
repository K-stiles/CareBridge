"use client";

import { FC } from "react";
import Sidebar_Tile from "@/compound/sidebar_tile";
import { side_routes } from "@/templates/sidebarroutes";

interface sidebar_routesProps {}

const SideBarRoutes: FC<sidebar_routesProps> = ({}) => {
  return (
    <div className="flex flex-col w-full">
      {side_routes.map((route) => (
        <Sidebar_Tile key={route.href} route={route} />
      ))}
    </div>
  );
};

export default SideBarRoutes;

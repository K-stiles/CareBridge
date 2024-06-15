import { FC } from "react";
import NavLink_Tile from "@/compound/navlink_tile";
import { land_nav_routes } from "@/templates/landnavroutes";

interface landnav_linksProps {}

const LandNavLinks: FC<landnav_linksProps> = ({}) => {
  return (
    <div className="flex items-center gap-2">
      {/* NAVIGATION LINKS */}
      {land_nav_routes.map((route, index) => (
        <NavLink_Tile key={index} route={route} />
      ))}
    </div>
  );
};

export default LandNavLinks;

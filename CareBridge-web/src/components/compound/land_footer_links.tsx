import { FC } from "react";
import { land_nav_routes } from "@/templates/landnavroutes";
import FooterLink_Tile from "./footer_link_tile";

interface landnav_linksProps {}

const LandFooterLinks: FC<landnav_linksProps> = ({}) => {
  return (
    <div className="lg:flex items-center gap-32 w-full">
      {/* FOOTER COL 1 */}
      <div className="flex flex-col items-center gap-2">
        {land_nav_routes.map((route, index) => (
          <FooterLink_Tile key={index} />
        ))}
      </div>

      {/* FOOTER COL 2 */}
      <div className="flex flex-col items-center gap-2">
        {land_nav_routes.map((route, index) => (
          <FooterLink_Tile key={index} />
        ))}
      </div>
    </div>
  );
};

export default LandFooterLinks;

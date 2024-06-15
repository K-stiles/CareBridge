import { FC } from "react";
import Logo from "@/simple/logo";
import LandNavLinks from "./landnav_links";
import ToggleNav from "./toggle_nav";

interface landNavProps {}

const LandNav: FC<landNavProps> = ({}) => {
  return (
    <div className="w-full border-b shadow-sm">
      <div className="max-w-7xl mx-auto flex items-center justify-between px-10 lg:p-0">
        <Logo />

        <ToggleNav />

        <div className="hidden lg:block">
          <LandNavLinks />
        </div>
      </div>
    </div>
  );
};

export default LandNav;

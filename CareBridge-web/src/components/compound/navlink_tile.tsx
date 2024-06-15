import Link from "next/link";
import { FC } from "react";

interface navlink_tileProps {
  route: LandNavRoute;
}

const NavLink_Tile: FC<navlink_tileProps> = ({ route }) => {
  return (
    <Link
      href={route.href}
      className="relative px-4 py-2  before:content-[''] before:absolute before:bottom-0 before:left-0 before:w-0 before:h-1 before:border-b-2 before:border-primary  before:duration-300 before:hover:w-2/3"
    >
      {route.label}
    </Link>
  );
};

export default NavLink_Tile;

import { DetailedHTMLProps, FC, LiHTMLAttributes } from "react";
import Icons from "@/ui/Icons";
import Link from "next/link";
import { usePathname } from "next/navigation";

interface SidebarTileProps
  extends DetailedHTMLProps<LiHTMLAttributes<HTMLLIElement>, HTMLLIElement> {
  name?: string;
  icon?: React.ReactNode;
  tile?: Route;
}

const SidebarTile: FC<SidebarTileProps> = ({ name, icon, tile }) => {
  let active = usePathname();
  return (
    <li
      className={`group cursor-pointer hover:bg-primary/75 hover:text-slate-50 flex items-center gap-2.5 rounded-sm px-4 py-4 font-medium duration-300 ease-in-out ${
        tile?.path === active
          ? "text-primary border-r-4 border-primary/80 bg-primary/5"
          : "text-slate-600"
      }`}
    >
      {!icon && !tile && <Icons.LogOut />}
      {(icon && icon) || (tile && tile.icon)}
      {name || tile?.name}
    </li>
  );
};
export const Sub_SidebarTile: FC<SidebarTileProps> = ({ name }) => {
  return (
    <Link href="/" className="py-4 pl-10 inline-block w-full">
      {name}
    </Link>
  );
};

export default SidebarTile;

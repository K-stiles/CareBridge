import { Menu } from "lucide-react";
import { FC } from "react";

interface toggle_navProps {}

const ToggleNav: FC<toggle_navProps> = ({}) => {
  return (
    <div className="lg:hidden cursor-pointer p-4">
      <Menu />
    </div>
  );
};

export default ToggleNav;

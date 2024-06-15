import { FC } from "react";
import Logo from "@/simple/logo";
import LandFooterLinks from "./land_footer_links";
import Paragraph from "@/simple/paragraph";

interface land_footerProps {}

const LandFooter: FC<land_footerProps> = ({}) => {
  return (
    <div className="w-full border-t shadow-sm">
      <div className="max-w-7xl mx-auto lg:flex items-start gap-48 py-10">
        {/* LOGO */}
        <Logo />

        <LandFooterLinks />
      </div>
      <div className="max-w-7xl mx-auto lg:flex items-center justify-between py-8">
        <Paragraph className="text-primary font-bold underline underline-offset-8">
          PURPLE CARE
        </Paragraph>
        <Paragraph className="text-primary pt-5 lg:pt-0">
          &copy; copyright 2023
        </Paragraph>
      </div>
    </div>
  );
};

export default LandFooter;

import { LANDROUTES } from "@/templates/routes";
import Image from "next/image";
import Link from "next/link";

const Logo = ({}) => {
  return (
    <Link href={LANDROUTES.HOME}>
      <Image
        src="/carebridge.png"
        alt="carebridge care logo"
        width={80}
        height={50}
      />
    </Link>
  );
};

export default Logo;

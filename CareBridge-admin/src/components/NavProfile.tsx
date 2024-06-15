"use client";
import { FC } from "react";
import Image from "next/image";
import Link from "next/link";
import { useSession } from "next-auth/react";

import Paragraph from "@/ui/Paragraph";
import Icons from "@/ui/Icons";

interface NavProfileProps {}

const NavProfile: FC<NavProfileProps> = ({}) => {
  const { data: session } = useSession();
  return (
    <div>
      {session && (
        <div
          // href="/dashboard/profile"
          className="hidden lg:flex items-center gap-4 cursor-pointer"
        >
          {/* user-image */}
          <div className="ring-2 ring-slate-100 ring-offset-2 rounded-full">
            <Image
              src={"/admin.jpg"}
              alt="ark logo"
              width={100}
              height={100}
              className="w-10 h-10 object-cover rounded-full"
            />
          </div>
          {/* username */}
          <Paragraph size={"sm"} className="text-slate-100">
            {session?.user.email}
          </Paragraph>
          <Icons.ChevronDown className="text-slate-100 -mt-2" size={20} />
        </div>
      )}
    </div>
  );
};

export default NavProfile;

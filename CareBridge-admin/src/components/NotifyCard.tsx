import { FC } from "react";
import Paragraph from "@/ui/Paragraph";
import Image from "next/image";
import Icons from "./ui/Icons";

interface notifyProps {}

const NotifyCard: FC<notifyProps> = ({}) => {
  return (
    <div className="bg-slate-100 rounded-md p-4 w-full mb-4">
      <div className="flex items-start justify-between mb-2">
        <div className="flex items-center gap-4">
          <Image
            src={"/admin.jpg"}
            alt="ark logo"
            width={100}
            height={100}
            className="w-10 h-10 object-cover rounded-full ring-4 ring-slate-100"
          />
          <div>
            <Paragraph size={"xs"} className="font-bold">
              Kennedy Appiah
            </Paragraph>
            <Paragraph size={"xs"}>Dental Specialist</Paragraph>
          </div>
        </div>
        <p className="text-slate-500 lg:mr-5">5 minutes ago</p>
      </div>

      {/* desc */}
      <div className="px-2">
        <p className="text-slate-500 text-sm w-full">
          For example, say youre using a Windows laptop to develop a Flutter
          app. If you choose Android as your ...more
        </p>
      </div>
    </div>
  );
};

export default NotifyCard;

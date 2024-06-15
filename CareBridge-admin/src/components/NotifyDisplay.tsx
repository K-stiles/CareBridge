import Image from "next/image";
import { FC } from "react";

import Paragraph from "@/ui/Paragraph";

interface NotifyDisplayProps {}

const NotifyDisplay: FC<NotifyDisplayProps> = ({}) => {
  return (
    <div className="bg-slate-100 p-4 rounded-md w-full h-full max-w-[calc(100w_-_120px)]">
      <div className="flex items-start justify-between">
        <div className="flex items-center gap-4 mb-6">
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
      <div className="px-2 ">
        <p className="text-slate-500 text-sm w-full mb-4">
          For example, say youre using a Windows laptop to develop a Flutter
          app. If you choose Android as your development target, you typically
          attach an Android device to your Windows laptop with a USB cable, and
          your app-in-development runs on that attached Android device. But you
          could also choose Windows as the development target, which means your
          app-in-development runs as a Windows app alongside your editor.
        </p>
        <p className="text-slate-500 text-sm w-full">
          For example, say youre using a Windows laptop to develop a Flutter
          app. If you choose Android as your development target, you typically
          attach an Android device to your Windows laptop with a USB cable, and
          your app-in-development runs on that attached Android device. But you
          could also choose Windows as the development target, which means your
          app-in-development runs as a Windows app alongside your editor.
        </p>
      </div>
    </div>
  );
};

export default NotifyDisplay;

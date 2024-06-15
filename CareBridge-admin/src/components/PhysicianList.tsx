import { FC } from "react";
import { Icons, Paragraph } from "@/components";
import Image from "next/image";
interface PhysicianListProps {}

const PhysicianList: FC<PhysicianListProps> = ({}) => {
  return (
    <div className="px-8 py-2 my-4 bg-slate-300 rounded-md flex items-center gap-6 justify-between ring-2 ring-slate-100">
      <div className="flex items-center gap-6 ">
        <Image
          src={"/admin.jpg"}
          alt="ark logo"
          width={100}
          height={100}
          className="w-10 h-10 object-cover rounded-full ring-4 ring-slate-100"
        />
        <div className="flex flex-col">
          <Paragraph size={"sm"} className="font-bold">
            Jame Philips
          </Paragraph>
          <Paragraph size={"s"}>Denntist - from carebridge</Paragraph>
        </div>

        <div className="flex flex-col ml-14">
          <Paragraph size={"s"}>active </Paragraph>
          <Paragraph size={"s"}>8 minutes ago</Paragraph>
        </div>
      </div>

      <div className="flex items-center gap-4">
        <Icons.CircleDotDashed className="text-slate-200" />
        <Icons.MoreHorizontal className="text-slate-500" size={18} />
      </div>
    </div>
  );
};

export default PhysicianList;

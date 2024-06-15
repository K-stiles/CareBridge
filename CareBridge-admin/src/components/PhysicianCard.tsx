import Image from "next/image";
import { FC } from "react";
import Paragraph from "@/ui/Paragraph";

interface PhysicianCardProps {}

const PhysicianCard: FC<PhysicianCardProps> = ({}) => {
  return (
    <div className="bg-slate-100 rounded-md p-4 w-full flex items-center gap-4">
      <Image
        src={"/admin.jpg"}
        alt="ark logo"
        width={100}
        height={100}
        className="w-10 h-10 object-cover rounded-full ring-4 ring-slate-100"
      />
      <div>
        <Paragraph size={"xs"} className="font-bold">
          Doctor Kennedy Appiah
        </Paragraph>
        <Paragraph size={"xs"}>Dental Specialist</Paragraph>
      </div>
    </div>
  );
};

export default PhysicianCard;

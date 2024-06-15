import { FC } from "react";
import Paragraph from "@/ui/Paragraph";
import Heading from "@/ui/Heading";
import Image from "next/image";

interface DrugCardProps {
  drug: Drug;
}

const DrugCard: FC<DrugCardProps> = ({ drug }) => {
  return (
    <div className="w-full h-full bg-slate-200 px-8 py-4 rounded ring-2 ring-slate-50 shadow-md">
      <div className="mb-3">
        <div className="flex items-center justify-between mb-1">
          <Paragraph size={"sm"} className="">
            data.
          </Paragraph>
        </div>

        <div className="rounded-md w-full h-[200px] my-2">
          <Image
            src={drug.src}
            alt="drug image"
            width={150}
            height={200}
            className="w-full h-full object-cover rounded-md"
          />
        </div>

        <Heading size={"xs"} className="text-left">
          {drug.name}
        </Heading>
      </div>
      <p className="text-sm text-slate-500">{drug.desc}</p>
    </div>
  );
};

export default DrugCard;

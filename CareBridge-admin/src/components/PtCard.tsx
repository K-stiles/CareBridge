import { FC } from "react";
import Heading from "./ui/Heading";
import Paragraph from "./ui/Paragraph";

interface PtCardProps {
  data: PTData;
}

const PtCard: FC<PtCardProps> = ({ data }) => {
  return (
    <div className="w-full h-full bg-slate-200 px-8 py-4 rounded ring-2 ring-slate-50 shadow-md">
      <div className="mb-3">
        <div className="flex items-center justify-between mb-1">
          <Paragraph size={"sm"} className="">
            {data.title}
          </Paragraph>
          {/* <Paragraph
            size={"sm"}
            className="font-bold underline underline-offset-2"
          > */}
          {data.icon}
          {/* </Paragraph> */}
        </div>
        <Heading size={"xs"} className="text-left">
          {data.number}
        </Heading>
      </div>
      <p className="text-sm text-slate-500">{data.desc}</p>
    </div>
  );
};

export default PtCard;

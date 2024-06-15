import { DetailedHTMLProps, FC, HTMLAttributes } from "react";
import Heading from "@/ui/Heading";
import Paragraph from "@/ui/Paragraph";
import Icons from "@/ui/Icons";
import { cn } from "@/lib/utils";
import Progress from "@/ui/progress";
import { CardData } from "@/app/dashboard/page";
import MiniBarGraph from "./graphs/MiniBarGraph";

interface chartCard
  extends DetailedHTMLProps<HTMLAttributes<HTMLDivElement>, HTMLDivElement> {
  data: CardData;
}

const ChartCard: FC<chartCard> = ({ data, className }) => {
  return (
    <div
      className={cn(
        "bg-slate-100 p-6 rounded-md border-2 border-white w-full h-full",
        className
      )}
    >
      {/* sectionn 1 */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-1.5">
          <div className="bg-slate-300 p-1 rounded">
            <Icons.TrendingUp
              size={16}
              className="text-emerald-700 font-bold"
            />
          </div>
          <Paragraph size="xs">{data.title}</Paragraph>
        </div>
        <Icons.MoreHorizontal className="text-slate-400" />
      </div>

      {/* section 2 */}
      <div className="flex items-center gap-4 mb-6">
        <Heading size="sm">10.525</Heading>
        <Paragraph className="bg-slate-300 py-1 px-2 rounded-full" size="s">
          +15.2%
        </Paragraph>
      </div>

      {/* section 3 */}
      {data.showProgressBar && (
        <div>
          <Paragraph size="s" className="text-slate-500 mb-4">
            {data.desc}
          </Paragraph>
          <Progress value={33} />
        </div>
      )}

      {/* setion 4 */}
      {/* {data.showMiniBarGraph && <MiniBarGraph />} */}
    </div>
  );
};

export default ChartCard;

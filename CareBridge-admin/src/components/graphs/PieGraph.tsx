import { FC } from "react";
import { Pie, PieChart } from "recharts";

interface PieGraphProps {}
const data01 = [
  {
    name: "Group A",
    value: 400,
  },
  {
    name: "Group B",
    value: 300,
  },
  {
    name: "Group C",
    value: 300,
  },
  {
    name: "Group D",
    value: 200,
  },
  {
    name: "Group E",
    value: 278,
  },
  {
    name: "Group F",
    value: 189,
  },
];
const data02 = [
  {
    name: "Group A",
    value: 2400,
  },
  {
    name: "Group B",
    value: 4567,
  },
  {
    name: "Group C",
    value: 1398,
  },
  {
    name: "Group D",
    value: 9800,
  },
  {
    name: "Group E",
    value: 3908,
  },
  {
    name: "Group F",
    value: 4800,
  },
];
const data03 = [
  {
    name: "Group A",
    value: 1400,
  },
  {
    name: "Group B",
    value: 3567,
  },
  {
    name: "Group C",
    value: 3398,
  },
  {
    name: "Group D",
    value: 7800,
  },
  {
    name: "Group E",
    value: 9908,
  },
  {
    name: "Group F",
    value: 5800,
  },
];

const PieGraph: FC<PieGraphProps> = ({}) => {
  return (
    <PieChart width={430} height={350} className="w-full h-full">
      <Pie
        data={data01}
        dataKey="value"
        nameKey="name"
        cx="50%"
        cy="50%"
        outerRadius={50}
        className="fill-yellow-500"
        // fill="#8884d8"
      />
      <Pie
        data={data02}
        dataKey="value"
        nameKey="name"
        cx="50%"
        cy="50%"
        innerRadius={60}
        outerRadius={80}
        fill="#0B8739"
        // fill="#82ca9d"
        label
      />
    </PieChart>
  );
};

export default PieGraph;

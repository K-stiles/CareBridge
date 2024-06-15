import { FC } from "react";
import {
  AreaChart,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Area,
} from "recharts";

interface AreaGraphProps {}
const data = [
  {
    name: "Jan",
    doctors: 4000,
    patients: 2400,
    amt: 2400,
  },
  {
    name: "Feb",
    doctors: 3000,
    patients: 1398,
    amt: 2210,
  },
  {
    name: "Mar",
    doctors: 2000,
    patients: 9800,
    amt: 2290,
  },
  {
    name: "April",
    doctors: 2780,
    patients: 3908,
    amt: 2000,
  },
  {
    name: "May",
    doctors: 1890,
    patients: 4800,
    amt: 2181,
  },
  {
    name: "June",
    doctors: 2390,
    patients: 3800,
    amt: 2500,
  },
  {
    name: "Jul",
    doctors: 3490,
    patients: 4300,
    amt: 2100,
  },
  {
    name: "Aug",
    doctors: 3490,
    patients: 4300,
    amt: 2100,
  },
  {
    name: "Sep",
    doctors: 3490,
    patients: 4300,
    amt: 2100,
  },
  {
    name: "Oct",
    doctors: 8300,
    patients: 3490,
    amt: 2100,
  },
  {
    name: "Nov",
    doctors: 3490,
    patients: 4300,
    amt: 2100,
  },
  {
    name: "Dec",
    doctors: 3490,
    patients: 4300,
    amt: 2100,
  },
];

const AreaGraph: FC<AreaGraphProps> = ({}) => {
  return (
    <AreaChart
      width={1500}
      height={350}
      data={data}
      margin={{ top: 10, right: 30, left: 0, bottom: 0 }}
      className=""
    >
      <defs>
        <linearGradient id="colorUv" x1="0" y1="0" x2="0" y2="1">
          <stop offset="5%" stopColor="#0B8739" stopOpacity={0.8} />
          <stop offset="95%" stopColor="#0B8739" stopOpacity={0} />
        </linearGradient>
        <linearGradient id="colorPv" x1="0" y1="0" x2="0" y2="1">
          <stop offset="5%" stopColor="#F9BF53" stopOpacity={0.8} />
          <stop offset="95%" stopColor="#F9BF53" stopOpacity={0} />
        </linearGradient>
      </defs>
      <XAxis dataKey="name" />
      <YAxis />
      <CartesianGrid strokeDasharray="3 3" />
      <Tooltip />
      <Area
        type="monotone"
        dataKey="patients"
        stroke="#0B8739"
        // stroke="#8884d8"
        // className="stroke-[#0B8739] "
        fillOpacity={1}
        fill="url(#colorUv)"
        // className="fill-[#0B8739] "
      />
      <Area
        type="monotone"
        dataKey="doctors"
        stroke="#F9BF53"
        // stroke="#82ca9d"
        fillOpacity={1}
        fill="url(#colorPv)"
      />
    </AreaChart>
  );
};

export default AreaGraph;

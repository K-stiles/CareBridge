import { FC } from "react";
import {
  BarChart,
  CartesianGrid,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
  Bar,
} from "recharts";
const data = [
  {
    name: "Jan",
    male: 4000,
    female: 2400,
  },
  {
    name: "Feb",
    male: 3000,
    female: 1398,
  },
  {
    name: "Mar",
    male: 2000,
    female: 9800,
  },
  {
    name: "Apr",
    male: 2780,
    female: 3908,
  },
  {
    name: "May",
    male: 1890,
    female: 4800,
  },
  {
    name: "Jun",
    male: 2390,
    female: 3800,
  },
  {
    name: "Jul",
    male: 3490,
    female: 4300,
  },
  {
    name: "Aug",
    male: 3490,
    female: 4300,
    amt: 2100,
  },
  {
    name: "Sep",
    male: 3490,
    female: 4300,
    amt: 2100,
  },
  {
    name: "Oct",
    male: 8300,
    female: 3490,
    amt: 2100,
  },
  {
    name: "Nov",
    male: 3490,
    female: 4300,
    amt: 2100,
  },
  {
    name: "Dec",
    male: 3490,
    female: 4300,
    amt: 2100,
  },
];
interface barGraphProps {}

const BarGraph: FC<barGraphProps> = ({}) => {
  return (
    <BarChart width={830} height={350} data={data} className="">
      <CartesianGrid strokeDasharray="3 3" />
      <XAxis dataKey="name" />
      <YAxis />
      <Tooltip />
      <Legend />
      <Bar
        dataKey="female"
        className="fill-yellow-500"
        //fill="#8884d8"
      />
      <Bar
        dataKey="male"
        className="fill-yellow-500"
        //fill="#F9BF53"
      />
    </BarChart>
  );
};

export default BarGraph;

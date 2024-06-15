// import { FC } from "react";

// import {
//   CartesianGrid,
//   XAxis,
//   YAxis,
//   Tooltip,
//   BarChart,
//   Legend,
//   Bar,
// } from "recharts";

// interface BarChartProps {}

// const bardata = [
//   {
//     name: "Page A",
//     uv: 4000,
//     pv: 2400,
//   },
//   {
//     name: "Page B",
//     uv: 3000,
//     pv: 1398,
//   },
//   {
//     name: "Page C",
//     uv: 2000,
//     pv: 9800,
//   },
//   {
//     name: "Page D",
//     uv: 2780,
//     pv: 3908,
//   },
//   {
//     name: "Page E",
//     uv: 1890,
//     pv: 4800,
//   },
//   {
//     name: "Page F",
//     uv: 2390,
//     pv: 3800,
//   },
//   {
//     name: "Page G",
//     uv: 3490,
//     pv: 4300,
//   },
// ];

// const BarGraph: FC<BarChartProps> = ({}) => {
//   return (
//     <BarChart width={730} height={250} data={bardata}>
//       <CartesianGrid strokeDasharray="3 3" />
//       <XAxis dataKey="name" />
//       <YAxis />
//       <Tooltip />
//       <Legend />
//       <Bar dataKey="pv" fill="#8884d8" className="fill-green-700" />
//       <Bar dataKey="uv" fill="#82ca9d" className="fill-yellow-500" />
//     </BarChart>
//   );
// };

// export default BarGraph;

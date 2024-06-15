import {
  // Icons,
  // Navbar,
  // Paragraph,
  // PhysicianList,
  // PhysicianListCard,
  PtCard,
  UsersDataTable,
} from "@/components";
import Heading from "@/components/ui/Heading";
import { Activity, Users, CreditCard } from "lucide-react";
// import Image from "next/image";
import React, { FC } from "react";

const size = 18;
const PtData: PTData[] = [
  {
    title: "Total Revenue",
    icon: <Users size={size} />,
    number: "GHC 2893",
    desc: "+50.5% from last month",
  },
  {
    title: "Subscriptions",
    icon: <CreditCard size={size} />,
    number: "+539",
    desc: "+32.8% from last month",
  },
  {
    title: "Active Now",
    icon: <Activity size={size} />,
    number: "+85",
    desc: "+49.5% since last hour",
  },
];

interface patientsProps {}

const Patients: FC<patientsProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Patients</Heading>

      <div  className="grid-c my-4">
        <PtCard data={PtData[0]} />
        <PtCard data={PtData[1]} />
        <PtCard data={PtData[2]} />
      </div>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
};

export default Patients;

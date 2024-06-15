"use client";
// import { useSession } from "next-auth/react";
import {
  Button,
  ChartCard,
  Icons,
  Paragraph,
  UsersDataTable,
} from "@/components";
import AreaGraph from "@/components/graphs/AreaGraph";
import BarGraph from "@/components/graphs/BarGraph";
import PieGraph from "@/components/graphs/PieGraph";
import Heading from "@/components/ui/Heading";
import { FC, useState } from "react";

import { Calendar } from "@/components/ui/calendar";

export type CardData = {
  title: string;
  desc: string;
  showProgressBar: boolean;
  showMiniBarGraph: boolean;
};
const cardData1: CardData = {
  title: "overall site visitors",
  desc: "Data obtained from the last seven days from 5.567 Visitors to 7,525 Visitors.",
  showProgressBar: true,
  showMiniBarGraph: false,
};
const cardData2: CardData = {
  title: "Total Patients",
  desc: "Data obtained from the last seven days from 5.567 Visitors to 7,525 Visitors.",
  showProgressBar: false,
  showMiniBarGraph: true,
};
const cardData3: CardData = {
  title: "Subscriptions",
  desc: "Data obtained from the last seven days from 5.567 Visitors to 7,525 Visitors.",
  showProgressBar: true,
  showMiniBarGraph: false,
};
const cardData4: CardData = {
  title: "Doctors onboard",
  desc: "Data obtained from the last seven days from 5.567 Visitors to 7,525 Visitors.",
  showProgressBar: false,
  showMiniBarGraph: false,
};
interface dashboardProps {}

const Dashboard: FC<dashboardProps> = ({}) => {
  // const { data: session } = useSession();
  const [date, setDate] = useState<Date | undefined>(new Date());

  return (
    <div className="bg-slate-200">
      {/* <Navbar /> */}
      <main className="p-8 min-h-screen h-full w-full">
        <div className="mb-8 lg:flex items-center justify-between">
          {/* left */}
          <div className="w-full mb-10 lg:mb-0 flex flex-col items-center justify-center lg:justify-start lg:items-start">
            <Heading size={"md"}>Welcome Beda</Heading>
            <Paragraph size={"sm"} className="my-1 text-slate-500">
              This is your daily update and how things look like!
            </Paragraph>
          </div>

          {/* right section */}
          <div className="flex flex-col lg:flex-row items-center justify-end gap-2 bg-red-00">
            <div className="flex items-center justify-center gap-2  w-full mb-2 lg:mb-0">
              <Icons.CalendarDays size={18} className="text-slate-700" />
              <div className="flex items-center gap-2">
                <Paragraph size={"default"} className="font-bold lg:text-base">
                  Monday
                </Paragraph>
                <Paragraph
                  size={"default"}
                  className="whitespace-nowrap lg:text-base"
                >
                  4th July, 2023
                </Paragraph>
              </div>
            </div>

            {/* export btn */}
            <Button className="min-w-1/3 flex items-center gap-2">
              <Icons.Download className="text-slate-100 " size={18} />
              <Paragraph size={"sm"} className="text-slate-100">
                Export
              </Paragraph>
            </Button>
          </div>
        </div>

        <div className="grid grid-cols-4 gap-4 mb-12">
          {/* cards */}
          <div className="col-span-4 lg:col-span-3 grid-c ">
            <ChartCard data={cardData1} />
            <ChartCard data={cardData2} />
            <ChartCard data={cardData3} />
            <ChartCard data={cardData4} />
          </div>

          {/* calendar */}
          <div className="hidden lg:flex col-span-1 rounded-md items-start justify-center ">
            <div className="bg-slate-100 flex justify-center rounded p-4">
              <Calendar
                mode="single"
                selected={date}
                onSelect={setDate}
                className="rounded-md"
              />
            </div>
          </div>
        </div>

        {/* graphs */}
        <div className="rounded-md mb-14 flex flex-col lg:flex-row h-full w-full gap-4">
          <div>
            <div className="flex items-center gap-2 mb-4">
              <Icons.BarChartBig className="text-slate-700" />
              <Paragraph size={"sm"} className="font-bold">
                Patient Statistics
              </Paragraph>
            </div>
            <div className="bg-slate-100 rounded-md px-4 py-8 w-full">
              <BarGraph />
            </div>
          </div>
          <div className="w-full lg:w-[50%]">
            <div className="flex items-center gap-2 mb-4">
              <Icons.User2 className="text-slate-700" />
              <Paragraph size={"sm"} className="font-bold">
                Overall Patient Satisfaction
              </Paragraph>
            </div>
            <div className="bg-slate-100 rounded-md px-4 py-8 w-full">
              <PieGraph />
            </div>
          </div>
        </div>

        <div>
          <div className="flex items-center gap-2 mb-4">
            <Icons.AreaChart className="text-slate-700" />
            <Paragraph size={"sm"} className="font-bold">
              Doctor Patient Statistics
            </Paragraph>
          </div>
          <div className="bg-slate-100 rounded-md px-4 py-8 w-full mb-20">
            <AreaGraph />
          </div>
        </div>

        {/* Table */}
        <div className="w-full">
          <Heading size={"sm"} className="mb-6">
            Pending Verifications
          </Heading>
          <UsersDataTable />
        </div>
      </main>
    </div>
  );
};

export default Dashboard;

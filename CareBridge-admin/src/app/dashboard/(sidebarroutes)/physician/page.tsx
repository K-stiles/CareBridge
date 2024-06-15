import {
  Button,
  Icons,
  Navbar,
  Paragraph,
  PhysicianCard,
  PhysicianList,
  PhysicianListCard,
  UsersDataTable,
} from "@/components";
import Heading from "@/components/ui/Heading";
import Image from "next/image";
import { FC } from "react";

interface physicianProps {}

const Physician: FC<physicianProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Physician</Heading>

      <div className="my-4">
        <Paragraph className="mb-3 font-bold text-primary">
          Top Doctors
        </Paragraph>
        <div className="grid grid-cols-4 gap-4 ">
          <div className="col-span-3">
            {/* top doctors */}
            <div className="grid-c">
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
              <PhysicianCard />
            </div>
            {/* top doctors */}
          </div>

          {/* Suggestions Region */}
          <div className="col-span-1 bg-slate-100 rounded-md p-4 w-full">
            <div className="flex items-center justify-between mb-4">
              <Paragraph size="sm" className="font-bold">
                Suggestions
              </Paragraph>
              <Button variant={"ghost"} className="hover:bg-transparent">
                <Icons.MoreHorizontal className="text-slate-700" size={18} />
              </Button>
            </div>
            <div className="h-[0.2px] bg-slate-200 w-full mb-6" />

            {/* suggestions */}
            <>
              <div className="my-3">
                <Paragraph size="xs" className="font-bold">
                  Section for Patient Doctor chats
                </Paragraph>
                <p className="text-xs text-slate-700">
                  we could have a secure platform where we can confidentially
                  chat with our patients
                </p>
                <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
              </div>
              <div className="my-3">
                <Paragraph size="xs" className="font-bold">
                  Section for Patient Doctor chats
                </Paragraph>
                <p className="text-xs text-slate-700">
                  we could have a secure platform where we can confidentially
                  chat with our patients
                </p>
                <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
              </div>
              <div className="my-3">
                <Paragraph size="xs" className="font-bold">
                  Section for Patient Doctor chats
                </Paragraph>
                <p className="text-xs text-slate-700">
                  we could have a secure platform where we can confidentially
                  chat with our patients
                </p>
                <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
              </div>
              <div className="my-3">
                <Paragraph size="xs" className="font-bold">
                  Section for Patient Doctor chats
                </Paragraph>
                <p className="text-xs text-slate-700">
                  we could have a secure platform where we can confidentially
                  chat with our patients
                </p>
                <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
              </div>
              <div className="my-3">
                <Paragraph size="xs" className="font-bold">
                  Section for Patient Doctor chats
                </Paragraph>
                <p className="text-xs text-slate-700">
                  we could have a secure platform where we can confidentially
                  chat with our patients
                </p>
                <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
              </div>
            </>
            {/* suggestions */}
          </div>
        </div>
      </div>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
};

export default Physician;

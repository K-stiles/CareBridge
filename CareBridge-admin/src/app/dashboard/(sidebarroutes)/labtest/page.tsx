import { Heading, UsersDataTable } from "@/components";
import { FC } from "react";

interface labTestsProps {}

const LabTests: FC<labTestsProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Lab Tests</Heading>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
};

export default LabTests;

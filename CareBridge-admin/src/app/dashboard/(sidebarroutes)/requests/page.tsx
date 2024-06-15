import { UsersDataTable } from "@/components";
import Heading from "@/components/ui/Heading";
import { FC } from "react";

interface requestsProps {}

const Requests: FC<requestsProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Requests</Heading>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
};

export default Requests;

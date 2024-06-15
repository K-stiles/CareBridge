import { Heading, UsersDataTable } from "@/components";
import { FC } from "react";

interface ordersProps {}

const Orders: FC<ordersProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Orders</Heading>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
};

export default Orders;

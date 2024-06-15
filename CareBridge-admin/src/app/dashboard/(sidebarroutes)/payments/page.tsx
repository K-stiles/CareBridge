import { Heading, Navbar, UsersDataTable } from "@/components";
import { Payment, columns } from "./columns";
import DataTableDemo from "@/components/UsersTable";
import { DataTable } from "./data-table";

async function getData(): Promise<Payment[]> {
  // Fetch data from your API here.
  return [
    {
      id: "728ed52f",
      amount: 100,
      status: "pending",
      email: "m@example.com",
    },
    {
      id: "7wr28ed52f",
      amount: 600,
      status: "processing",
      email: "m@example.com",
    },
    {
      id: "wrwrw",
      amount: 800,
      status: "success",
      email: "m@example.com",
    },
    // ...
  ];
}

export default async function DemoPage() {
  const data = await getData();

  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Payments</Heading>

      <div className="w-full my-10">
        <UsersDataTable />
      </div>
    </div>
  );
}

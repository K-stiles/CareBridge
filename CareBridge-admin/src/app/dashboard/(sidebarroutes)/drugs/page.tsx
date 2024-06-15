import { DrugCard, Heading } from "@/components";
import { drugs } from "@/data/drugs";
import { FC } from "react";

interface drugsProps {}

const Drugs: FC<drugsProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Drugs</Heading>

      <div className="grid-c my-4">
        {drugs && drugs?.map((drug, id) => <DrugCard key={id} drug={drug} />)}
      </div>
    </div>
  );
};

export default Drugs;

import { FC } from "react";
import Image from "next/image";
import Paragraph from "@/simple/paragraph";
import Heading from "@/simple/heading";

interface grid_docProps {
  //   exec: any;
}

const GridDoc: FC<grid_docProps> = ({}) => {
  return (
    <div
      className={`cursor-pointer rounded-md bg-white group transition-all duration-200 ease-in-out flex flex-col `}
    >
      <div className="w-full h-full rounded-md">
        <Image
          src="https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGRvY3RvcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60"
          alt="carebridge care executives"
          width={240}
          height={240}
          className="rounded-md w-full object-cover"
        />
      </div>

      <div className="p-4">
        <Paragraph className="font-semibold">Kwaku Stiles</Paragraph>
        <Paragraph>Founder & CEO</Paragraph>
      </div>
    </div>
  );
};

export default GridDoc;

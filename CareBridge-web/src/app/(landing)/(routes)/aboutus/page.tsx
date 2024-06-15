import { FC } from "react";
import type { Metadata } from "next";
import { GridDocs, Heading, Paragraph } from "@/components";

export const metadata: Metadata = {
  title: "Purple Care | About Us",
  description: "Purple care ",
};

interface pageProps {}

const AboutUs: FC<pageProps> = ({}) => {
  return (
    <main className="bg-primary section-min-height">
      <div className="max-w-7xl mx-auto py-28">
        <div className="flex flex-col items-center lg:items-start">
          <Heading className="w-2/3 tracking-tight text-slate-200">
            Meet The Executive Teams and Professional Doctors of Purple Care
          </Heading>
          <Paragraph className="text-slate-200 mt-8 mb-8">
            Purple Care is an innovative and holistic health maintenance
            organization, involved in the delivery of medical, preventive and
            occupational health services to corporate clients in Ghana and the
            west Africa sub-region.
          </Paragraph>
        </div>

        <>
          {/* GRID DOCS */}
          <GridDocs />
        </>
      </div>
    </main>
  );
};

export default AboutUs;

import { Heading, Paragraph, LandCta, Land_RPane } from "@/components";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Purple Care | Home",
  description: "Purple care ",
};

export default function Landing() {
  return (
    <main className="bg-primary h-screen ">
      <div className="max-w-7xl mx-auto  w-full h-full lg:flex gap-4 ">
        {/* LEFT */}
        <div className="w-full pt-14 lg:pt-40">
          <Paragraph className="uppercase mb-2 font-semibold text-slate-300 text-center lg:text-start">
            Skip the travel
          </Paragraph>
          <Heading className="tracking-tight text-slate-50">
            Take Online Doctor Consultation
          </Heading>
          <Paragraph className="capitalize mt-6 lg:w-2/3 text-slate-200">
            Purple Care is a leading digital health organization which connect
            patients with top healthcare professionals.
          </Paragraph>

          <div className="mt-4 flex items-center justify-center lg:justify-start">
            <LandCta />
          </div>
        </div>

        {/* RIGHT */}
        <div className="w-full pt-10 lg:pt-24 flex items-center justify-center lg:block">
          <Land_RPane />
        </div>
      </div>
    </main>
  );
}

import AuthForm from "@/components/AuthForm";
import Heading from "@/components/ui/Heading";
import Image from "next/image";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "carebridge | Auth",
};

export default function Home() {
  return (
    <section className="min-h-screen h-screen section-min-height widescreen:section-min-height tallscreen:section-min-height">
      <div className="max-w-7xl mx-auto min-h-full px-6 pb-6  widescreen:section-min-height tallscreen:section-min-height flex flex-col items-center justify-center">
        <div className="mb-8">
          <Image
            src={"/carebridge_logo.png"}
            alt="ark logo"
            width={128}
            height={128}
            className="w-36 h-36"
          />
        </div>
        <div className="bg-slate-100 px-20 py-16 rounded-2xl w-full md:w-3/4 lg:w-2/4 shadow-black-500">
          <Heading className="-mt-4 mb-8">Admin</Heading>
          <AuthForm />
        </div>
      </div>
    </section>
  );
}

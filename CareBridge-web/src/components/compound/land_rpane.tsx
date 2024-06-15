"use client";

import { FC } from "react";
import Lottie from "lottie-react";
import Image from "next/image";

import LottieDoc from "@/templates/docanim.json";
import AspectRatio from "@/simple/aspect-ratio";

interface land_rpaneProps {}

const Land_RPane: FC<land_rpaneProps> = ({}) => {
  const style = { width: 550 };

  return (
    // <AspectRatio ratio={18 / 11} className="bg-muted">
    //   <Image
    //     src="https://images.unsplash.com/photo-1588345921523-c2dcdb7f1dcd?w=800&dpr=2&q=80"
    //     alt="Photo by Drew Beamer"
    //     fill
    //     className="rounded-md object-cover"
    //   />
    // </AspectRatio>
    <div className="bg-slate-00 w-[85%] h-full flex items-center justify-center lg:w-full lg:block">
      <Lottie animationData={LottieDoc} style={style} />
    </div>
  );
};

export default Land_RPane;

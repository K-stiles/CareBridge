import React from "react";
import { cva, VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";

const headingVariants = cva(
  "text-slate-800 text-center lg:text-left font-extrabold leading-tight tracking-tighter",
  {
    variants: {
      size: {
        lg: "text-5xl md:text-6xl lg:text-7xl",
        default: "text-4xl md:text-5xl lg:text-6xl",
        md: "text-2xl md:text-3xl lg:text-4xl",
        sm: "text-xl md:text-2xl lg:text-3xl",
        xs: "text-base md:text-xl lg:text-xl",
      },
    },
    defaultVariants: {
      size: "default",
    },
  }
);

interface HeadingProps
  extends React.HTMLAttributes<HTMLHeadingElement>,
    VariantProps<typeof headingVariants> {}

const Heading = React.forwardRef<HTMLHeadingElement, HeadingProps>(
  ({ className, size, children, ...props }, ref) => {
    return (
      <h1
        ref={ref}
        {...props}
        className={cn(headingVariants({ size, className }))}
      >
        {children}
      </h1>
    );
  }
);

Heading.displayName = "Heading";

export default Heading;

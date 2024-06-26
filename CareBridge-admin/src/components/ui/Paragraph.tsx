import * as React from "react";
import { VariantProps, cva } from "class-variance-authority";
import { cn } from "@/lib/utils";

export const paragraphVariants = cva(
  "max-w-prose text-slate-700 text-center lg:text-left",
  {
    variants: {
      size: {
        default: "text-base sm:text-lg",
        lg: "text-2xl sm:text-3xl md:text-4xl",
        sm: "text-sm sm:text-base",
        xs: "text-xs sm:text-sm",
        s: "text-[10px] sm:text-sm",
      },
    },
    defaultVariants: {
      size: "default",
    },
  }
);

interface ParagraphProps
  extends React.HTMLAttributes<HTMLParagraphElement>,
    VariantProps<typeof paragraphVariants> {}

const Paragraph = React.forwardRef<HTMLParagraphElement, ParagraphProps>(
  ({ className, size, children, ...props }, ref) => {
    return (
      <p
        ref={ref}
        {...props}
        className={cn(paragraphVariants({ size, className }))}
      >
        {children}
      </p>
    );
  }
);

Paragraph.displayName = "Paragraph";

export default Paragraph;

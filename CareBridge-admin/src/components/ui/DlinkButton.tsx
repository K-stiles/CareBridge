import { FC } from "react";
import Button from "./Button";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { cn } from "@/lib/utils";

interface dlinkButtonProps {
  children: React.ReactNode;
  href: string;
  className?: string;
}

const DlinkButton: FC<dlinkButtonProps> = ({
  children,
  href = "/dashboard",
  className,
}) => {
  const router = useRouter();
  function goto() {
    router.push(href);
  }
  return (
    <Button
      onClick={goto}
      className={cn(
        `flex items-center justify-between w-full text-inherit bg-transparent hover:text-inherit hover:bg-transparent p-0 m-0 h-auto ${className}`
      )}
    >
      {children}
    </Button>
  );
};

export default DlinkButton;

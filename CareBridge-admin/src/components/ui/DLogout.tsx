import { FC, ReactNode } from "react";
import Button from "./Button";
import { signOut } from "next-auth/react";

interface DLogoutProps {
  children: ReactNode;
}

const DLogout: FC<DLogoutProps> = ({ children }) => {
  const logout = () => signOut();

  return (
    <Button variant={"ghost"} className="w-full p-0" onClick={logout}>
      {children}
    </Button>
  );
};

export default DLogout;

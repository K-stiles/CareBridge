import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Purple Care",
  description: "Purple care | Auth",
};

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <div>{children}</div>;
}

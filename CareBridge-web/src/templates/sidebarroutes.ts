import { Layout, ThermometerSnowflake } from "lucide-react";
import { SIDEROUTES } from "./routes";

export const side_routes: SideRoute[] = [
  {
    label: "Dashboard",
    icon: Layout,
    href: SIDEROUTES.DASHBOARD,
  },
  {
    label: "Consultation",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.CONSULTATION,
  },
  {
    label: "Laboratory",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.LABORATORY,
  },
  {
    label: "Appointments",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.APPOINTMENT_HISTORY,
  },
  {
    label: "Home Care",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.HOMECARE,
  },
  {
    label: "Pharmacy",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.PHARMACY,
  },
  {
    label: "Subscribe",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.SUBSCRIBE,
  },
  {
    label: "Referral",
    icon: ThermometerSnowflake,
    href: SIDEROUTES.REFERRAL,
  },
];

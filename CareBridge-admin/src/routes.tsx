import {
  LayoutDashboard,
  User,
  Stethoscope,
  Tablets,
  Microscope,
  ListOrdered,
  WalletCards,
} from "lucide-react";
// import Icons from "./components/ui/Icons";

const size = 18;

const dashboardRoutes: Route[] = [
  {
    id: "sdwfegrDashboard",
    name: "Dashboard",
    path: "/dashboard",
    icon: <LayoutDashboard size={size} />,
  },
  {
    id: "refewrgtpatients",
    name: "Patients",
    path: "/dashboard/patients",
    icon: <User size={size} />,
  },
  {
    id: "ewrgtPyhsician",
    name: "Pyhsician",
    path: "/dashboard/physician",
    icon: <Stethoscope size={size} />,
  },
  {
    id: "tyrgDrugs",
    name: "Drugs",
    path: "/dashboard/drugs",
    icon: <Tablets size={size} />,
  },
  {
    id: "u6y5hLabTest",
    name: "Lab Test",
    path: "/dashboard/labtest",
    icon: <Microscope size={size} />,
  },
  {
    id: "5hjOrders",
    name: "Orders",
    path: "/dashboard/orders",
    icon: <ListOrdered size={size} />,
  },
  {
    id: "4gth5Payments",
    name: "Payments",
    path: "/dashboard/payments",
    icon: <WalletCards size={size} />,
  },
  {
    id: "u6jy5Requey5htsts",
    name: "Requests",
    path: "/dashboard/requests",
    icon: <ListOrdered size={size} />,
  },
  {
    id: "tg5hArticles",
    name: "Articles",
    path: "/dashboard/articles",
    icon: <ListOrdered size={size} />,
  },
  // {
  //   id: "Nr3gotifications",
  //   name: "Notifications",
  //   icon: <BellRing size={size} />,
  //   path: "/dashboard/notifications",
  // },
];

export default dashboardRoutes;

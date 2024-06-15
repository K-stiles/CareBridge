import { NotifyCard, Heading, NotifyDisplay } from "@/components";
import { FC } from "react";

interface notificationsProps {}

const Notifications: FC<notificationsProps> = ({}) => {
  return (
    <div className="py-4 px-16 grid grid-cols-5 gap-6 relative">
      <div className="w-full col-span-4 md:col-span-2">
        <Heading size={"md"} className="mb-4">
          Notifications
        </Heading>
        <div>
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
          <NotifyCard />
        </div>
      </div>

      <div className="hidden md:block col-span-3 notifdisplay-height pb-6">
        <NotifyDisplay />
      </div>
    </div>
  );
};

export default Notifications;

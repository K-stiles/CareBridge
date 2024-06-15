import { ArticleCard, Button, Heading, Icons, Paragraph } from "@/components";
import { FC } from "react";

interface articlesProps {}

const Articles: FC<articlesProps> = ({}) => {
  return (
    <div className="py-4 px-16">
      <Heading size={"md"}>Articles</Heading>

      <div className=" my-4">
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
        <div className="mb-4">
          <ArticleCard />
        </div>
      </div>

      {/* Suggestions Region */}
      {/* <div className="col-span-1 bg-slate-100 rounded-md p-4 w-full">
        <div className="flex items-center justify-between mb-4">
          <Paragraph size="sm" className="font-bold">
            Suggestions
          </Paragraph>
          <Button variant={"ghost"} className="hover:bg-transparent">
            <Icons.MoreHorizontal className="text-slate-700" size={18} />
          </Button>
        </div>
        <div className="h-[0.2px] bg-slate-200 w-full mb-6" />

        <>
          <div className="my-3">
            <Paragraph size="xs" className="font-bold">
              Section for Patient Doctor chats
            </Paragraph>
            <p className="text-xs text-slate-700">
              we could have a secure platform where we can confidentially chat
              with our patients
            </p>
            <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
          </div>
          <div className="my-3">
            <Paragraph size="xs" className="font-bold">
              Section for Patient Doctor chats
            </Paragraph>
            <p className="text-xs text-slate-700">
              we could have a secure platform where we can confidentially chat
              with our patients
            </p>
            <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
          </div>
          <div className="my-3">
            <Paragraph size="xs" className="font-bold">
              Section for Patient Doctor chats
            </Paragraph>
            <p className="text-xs text-slate-700">
              we could have a secure platform where we can confidentially chat
              with our patients
            </p>
            <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
          </div>
          <div className="my-3">
            <Paragraph size="xs" className="font-bold">
              Section for Patient Doctor chats
            </Paragraph>
            <p className="text-xs text-slate-700">
              we could have a secure platform where we can confidentially chat
              with our patients
            </p>
            <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
          </div>
          <div className="my-3">
            <Paragraph size="xs" className="font-bold">
              Section for Patient Doctor chats
            </Paragraph>
            <p className="text-xs text-slate-700">
              we could have a secure platform where we can confidentially chat
              with our patients
            </p>
            <div className="h-[0.2px] bg-slate-200 w-full mt-1" />
          </div>
        </>
      </div> */}
    </div>
  );
};

export default Articles;

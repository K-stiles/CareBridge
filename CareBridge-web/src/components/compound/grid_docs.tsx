import { FC } from "react";
import GridDoc from "./grid_doc";

interface grid_docsProps {}

const GridDocs: FC<grid_docsProps> = ({}) => {
  return (
    <div className="res-grid px-6 xl:px-0">
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
      <GridDoc />
    </div>
  );
};

export default GridDocs;

/*
  Warnings:

  - You are about to drop the column `description` on the `Drug` table. All the data in the column will be lost.
  - You are about to drop the column `prescriptionId` on the `Drug` table. All the data in the column will be lost.
  - Added the required column `dosage` to the `Drug` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Drug" DROP CONSTRAINT "Drug_prescriptionId_fkey";

-- AlterTable
ALTER TABLE "Drug" DROP COLUMN "description",
DROP COLUMN "prescriptionId",
ADD COLUMN     "dosage" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "_DrugToPrescription" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_DrugToPrescription_AB_unique" ON "_DrugToPrescription"("A", "B");

-- CreateIndex
CREATE INDEX "_DrugToPrescription_B_index" ON "_DrugToPrescription"("B");

-- AddForeignKey
ALTER TABLE "_DrugToPrescription" ADD CONSTRAINT "_DrugToPrescription_A_fkey" FOREIGN KEY ("A") REFERENCES "Drug"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DrugToPrescription" ADD CONSTRAINT "_DrugToPrescription_B_fkey" FOREIGN KEY ("B") REFERENCES "Prescription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

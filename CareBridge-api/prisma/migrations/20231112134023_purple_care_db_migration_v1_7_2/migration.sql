/*
  Warnings:

  - You are about to drop the column `medicalInfoId` on the `Patient` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[patientId]` on the table `MedicalInfo` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Patient" DROP CONSTRAINT "Patient_medicalInfoId_fkey";

-- DropIndex
DROP INDEX "Patient_medicalInfoId_key";

-- AlterTable
ALTER TABLE "MedicalInfo" ADD COLUMN     "patientId" TEXT;

-- AlterTable
ALTER TABLE "Patient" DROP COLUMN "medicalInfoId";

-- CreateIndex
CREATE UNIQUE INDEX "MedicalInfo_patientId_key" ON "MedicalInfo"("patientId");

-- AddForeignKey
ALTER TABLE "MedicalInfo" ADD CONSTRAINT "MedicalInfo_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `patientId` on the `MedicalInfo` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[medicalInfoId]` on the table `Patient` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "MedicalInfo" DROP CONSTRAINT "MedicalInfo_patientId_fkey";

-- DropIndex
DROP INDEX "MedicalInfo_patientId_key";

-- AlterTable
ALTER TABLE "MedicalInfo" DROP COLUMN "patientId";

-- AlterTable
ALTER TABLE "Patient" ADD COLUMN     "medicalInfoId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Patient_medicalInfoId_key" ON "Patient"("medicalInfoId");

-- AddForeignKey
ALTER TABLE "Patient" ADD CONSTRAINT "Patient_medicalInfoId_fkey" FOREIGN KEY ("medicalInfoId") REFERENCES "MedicalInfo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

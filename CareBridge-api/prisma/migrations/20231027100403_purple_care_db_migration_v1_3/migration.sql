/*
  Warnings:

  - You are about to drop the column `pharmacyId` on the `Drug` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Drug" DROP CONSTRAINT "Drug_pharmacyId_fkey";

-- AlterTable
ALTER TABLE "Drug" DROP COLUMN "pharmacyId",
ADD COLUMN     "prescriptionId" TEXT;

-- CreateTable
CREATE TABLE "Prescription" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "doctorId" TEXT,
    "patientId" TEXT,
    "removed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Prescription_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Prescription_doctorId_key" ON "Prescription"("doctorId");

-- CreateIndex
CREATE UNIQUE INDEX "Prescription_patientId_key" ON "Prescription"("patientId");

-- AddForeignKey
ALTER TABLE "Drug" ADD CONSTRAINT "Drug_prescriptionId_fkey" FOREIGN KEY ("prescriptionId") REFERENCES "Prescription"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES "Doctor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prescription" ADD CONSTRAINT "Prescription_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

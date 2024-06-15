/*
  Warnings:

  - You are about to drop the column `specialization` on the `Doctor` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Administrator" ALTER COLUMN "gender" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Doctor" DROP COLUMN "specialization",
ADD COLUMN     "specializationId" TEXT,
ALTER COLUMN "gender" DROP NOT NULL;

-- AlterTable
ALTER TABLE "MedicalInfo" ADD COLUMN     "removed" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Patient" ALTER COLUMN "gender" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Specialization" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "removed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Specialization_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Doctor" ADD CONSTRAINT "Doctor_specializationId_fkey" FOREIGN KEY ("specializationId") REFERENCES "Specialization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

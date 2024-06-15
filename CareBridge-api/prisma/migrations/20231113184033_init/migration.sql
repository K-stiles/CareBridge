-- CreateTable
CREATE TABLE "AuthRole" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "AuthRole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuthPermission" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "AuthPermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuthRolePermission" (
    "id" INTEGER NOT NULL,
    "roleId" INTEGER NOT NULL,
    "permissionId" INTEGER NOT NULL,

    CONSTRAINT "AuthRolePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserAuthPermission" (
    "id" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "permissionId" INTEGER NOT NULL,

    CONSTRAINT "UserAuthPermission_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AuthRole_id_key" ON "AuthRole"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AuthRole_name_key" ON "AuthRole"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AuthPermission_id_key" ON "AuthPermission"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AuthPermission_name_key" ON "AuthPermission"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AuthRolePermission_id_key" ON "AuthRolePermission"("id");

-- CreateIndex
CREATE UNIQUE INDEX "UserAuthPermission_id_key" ON "UserAuthPermission"("id");

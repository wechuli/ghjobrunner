/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "WorkflowJob" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "runId" INTEGER NOT NULL,
    "runUrl" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "conclusion" TEXT,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "completedAt" TIMESTAMP(3),
    "headBranch" TEXT NOT NULL,
    "headSha" TEXT NOT NULL,
    "repositoryId" INTEGER NOT NULL,
    "senderId" INTEGER NOT NULL,
    "runnerId" INTEGER,

    CONSTRAINT "WorkflowJob_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sender" (
    "id" INTEGER NOT NULL,
    "login" TEXT NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Sender_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Repository" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "Repository_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Organization" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Runner" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "runnerGroupId" INTEGER NOT NULL,

    CONSTRAINT "Runner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RunnerGroup" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "RunnerGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Label" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Label_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_JobLabels" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_JobLabels_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "Label_name_key" ON "Label"("name");

-- CreateIndex
CREATE INDEX "_JobLabels_B_index" ON "_JobLabels"("B");

-- AddForeignKey
ALTER TABLE "WorkflowJob" ADD CONSTRAINT "WorkflowJob_repositoryId_fkey" FOREIGN KEY ("repositoryId") REFERENCES "Repository"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkflowJob" ADD CONSTRAINT "WorkflowJob_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "Sender"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkflowJob" ADD CONSTRAINT "WorkflowJob_runnerId_fkey" FOREIGN KEY ("runnerId") REFERENCES "Runner"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Repository" ADD CONSTRAINT "Repository_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Runner" ADD CONSTRAINT "Runner_runnerGroupId_fkey" FOREIGN KEY ("runnerGroupId") REFERENCES "RunnerGroup"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobLabels" ADD CONSTRAINT "_JobLabels_A_fkey" FOREIGN KEY ("A") REFERENCES "Label"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobLabels" ADD CONSTRAINT "_JobLabels_B_fkey" FOREIGN KEY ("B") REFERENCES "WorkflowJob"("id") ON DELETE CASCADE ON UPDATE CASCADE;

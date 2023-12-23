/*
  Warnings:

  - Added the required column `constent` to the `Action` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Action" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL,
    "constent" TEXT NOT NULL,
    "actionId" TEXT NOT NULL,
    "sceneId" TEXT,
    CONSTRAINT "Action_actionId_fkey" FOREIGN KEY ("actionId") REFERENCES "Action" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Action" ("actionId", "id", "sceneId", "type") SELECT "actionId", "id", "sceneId", "type" FROM "Action";
DROP TABLE "Action";
ALTER TABLE "new_Action" RENAME TO "Action";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

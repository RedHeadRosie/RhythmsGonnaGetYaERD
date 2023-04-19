-- question 1 Add a new band
INSERT INTO "Band" ("Name", "CountryOfOrigin", "NumberOfMembers", "Website", "Style", "IsSigned", "ContactName", "ContactPhoneNumber")
VALUES ('Busted', 'England', 3, 'http://busted.com', 'Pop', TRUE, 'James Bourne', 07851593293);

-- question 2 View all the bands
SELECT * FROM "Band";

-- question 3 Add an album for a band
INSERT INTO "Album" ("Title", "IsExplicit", "ReleaseDate")
VALUES ('A Present For Everyone', FALSE, "2003-11-17");

ALTER TABLE "Album" ADD COLUMN "BandId" INTEGER NULL REFERENCES "Band" ("Id");

UPDATE "Album" SET "BandId" = 1 WHERE "Id" IN (1);

SELECT *
FROM "Album"
JOIN "Band" ON "Album"."BandId" = "Band"."Id";

-- question 4 Add a song to an album
INSERT INTO "Song" ("TrackNumber", "Title", "Duration")
VALUES (1, 'AirHostess', "3:57");

INSERT INTO "Song" ("TrackNumber", "Title", "Duration")
VALUES (2, 'Crashed the Wedding', "2:39");

ALTER TABLE "Song" ADD COLUMN "AlbumId" INTEGER NULL REFERENCES "Album" ("Id");

UPDATE "Song" SET "AlbumId" = 1 WHERE "Id" IN (1, 2);

SELECT *
FROM "Song"
JOIN "Album" ON "Song"."AlbumId" = "Song"."Id";

-- question 5 Let a band go (update isSigned to false)
UPDATE "Band" SET "IsSigned" = FALSE WHERE "Id" IN (1);

-- question 6 Resign a band (update isSigned to true)
UPDATE "Band" SET "IsSigned" = TRUE WHERE "Id" IN (1);

-- question 7 Given a band name, view all their albums
SELECT "Band"."Name", "Album"."Title"
FROM "Band" 
JOIN "Band" ON "Album"."BandId" = "Band"."Id" 
WHERE "Band"."Name" = 'Busted';

-- question 8 View all albums (and their associated songs) ordered by ReleaseDate
SELECT "Album"."ReleaseDate", "Album"."Title", "Song"."Title"
FROM "Album" 
JOIN "Album" ON "Song"."AlbumId" = "Song"."Id";

-- question 9 View all bands that are signed
SELECT *
FROM "Band" 
WHERE "IsSigned" = TRUE;

-- question 10 View all bands that are not signed
SELECT *
FROM "Band" 
WHERE "IsSigned" = FALSE;
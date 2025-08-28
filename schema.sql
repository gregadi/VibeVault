-- Represent the artists
CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the albums
CREATE TABLE "albums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the artists that created the albums
CREATE TABLE "album_artists" (
    "album_id" INTEGER,
    "artist_id" INTEGER,
    PRIMARY KEY("album_id", "artist_id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Represent the songs
CREATE TABLE "songs" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "genre" TEXT NOT NULL CHECK("genre" IN ('Pop', 'Rock', 'R&B', 'Hip-hop', 'electronic', 'Country', 'Classical', 'Jazz', 'Blues')),
    "album_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id")
);

-- Represent the artists that created the songs
CREATE TABLE "song_artists" (
    "song_id" INTEGER,
    "artist_id" INTEGER,
    PRIMARY KEY("song_id", "artist_id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Represent the users
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the playlists
CREATE TABLE "playlists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

-- Represent the songs in the playlists
CREATE TABLE "playlist_songs" (
    "playlist_id" INTEGER,
    "song_id" INTEGER,
    PRIMARY KEY("playlist_id", "song_id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

-- Create indexes to speed up common searches
CREATE INDEX "album_artists_search" ON "album_artists" ("artist_id");
CREATE INDEX "artist_name_search" ON "artists" ("name");
CREATE INDEX "song_artists_search" ON "song_artists" ("artist_id");
CREATE INDEX "songs_album_search" ON "songs" ("album_id");
CREATE INDEX "albums_search" ON "albums" ("name");
CREATE INDEX "playlists_user_search" ON "playlists" ("user_id");
CREATE INDEX "users_search" ON "users" ("username");
CREATE INDEX "songs_title_search" ON "songs" ("title");
CREATE INDEX "playlists_name_search" ON "playlists" ("name");

-- Create views to simplify queries
CREATE VIEW "artist_album" AS
SELECT "albums"."name" AS "album", "artists"."name" AS "artist" FROM "albums"
JOIN "album_artists" ON "album_artists"."album_id" = "albums"."id"
JOIN "artists" ON "artists"."id" = "album_artists"."artist_id";

CREATE VIEW "artist_song" AS
SELECT "songs"."title" AS "song", "artists"."name" AS "artist" FROM "songs"
JOIN "song_artists" ON "song_artists"."song_id" = "songs"."id"
JOIN "artists" ON "artists"."id" = "song_artists"."artist_id";

CREATE VIEW "album_song" AS
SELECT "songs"."title" AS "song", "albums"."name" AS "album" FROM "songs"
JOIN "albums" ON "albums"."id" = "songs"."album_id";

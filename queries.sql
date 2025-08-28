-- Finding Albums of a specific Artist.
SELECT "name" FROM "albums"
WHERE "id" IN (
    SELECT "album_id" FROM "album_artists"
    WHERE "artist_id" = (
        SELECT "id" FROM "artists"
        WHERE "name" = 'Kendrick Lamar'
    )
);

-- Finding Albums of a specific Artist using "artist_album" view
SELECT "album" FROM "artist_album"
WHERE "artist" = 'Kendrick Lamar';

-- Finding Songs of a specific Artist
SELECT "title" FROM "songs"
WHERE "id" IN (
    SELECT "song_id" FROM "song_artists"
    WHERE "artist_id" =(
        SELECT "id" FROM "artists"
        WHERE "name" = 'Drake'
    )
);

-- Finding Songs of a specific Artist using "artist_song" view
SELECT "song" FROM "artist_song"
WHERE "artist" = 'Drake';

-- Finding Songs of a specific Album
SELECT "title" FROM "songs"
WHERE "album_id" = (
    SELECT "id" FROM "albums"
    WHERE "name" = 'Hollywood''s Bleeding'
);

-- Finding Songs of a specific Album using "album_song" view
SELECT "song" FROM "album_song"
WHERE "album" = 'Hollywood''s Bleeding';

-- Finding Playlist of user AlmondMilk
SELECT "name" FROM "playlists"
WHERE "user_id" = (
    SELECT "id" FROM "users"
    WHERE "username" = 'AlmondMilk'
);

-- Finding songs in the playlist that Gregoryadi made
SELECT "title" FROM "songs"
WHERE "id" IN (
    SELECT "song_id" FROM "playlist_songs"
    WHERE "playlist_id" IN (
        SELECT "id" FROM "playlists"
        WHERE "user_id" = (
            SELECT "id" FROM "users"
            WHERE "username" = 'Gregoryadi'
        )
    )
);

-- Finding the artist/s who created a specific song
SELECT "name" FROM "artists"
WHERE "id" IN (
    SELECT "artist_id" FROM "song_artists"
    WHERE "song_id" = (
        SELECT "id" FROM "songs"
        WHERE "title" = 'Luther'
    )
);

-- Finding songs in a specific playlist
SELECT "title" FROM "songs"
WHERE "id" IN (
    SELECT "song_id" FROM "playlist_songs"
    WHERE "playlist_id" = (
        SELECT "id" FROM "playlists"
        WHERE "name" = 'Slow Rap'
    )
);

-- Add a new User
INSERT INTO "users" ("username")
VALUES ('MagicFlowers');

-- Add a new Playlist
INSERT INTO "playlists" ("name", "user_id", "date")
VALUES ('rap caviar', 1, '2025--08-15');

-- Add songs to the new playlist
INSERT INTO "playlist_songs" ("playlist_id", "song_id")
VALUES
(11, 23),
(11, 45),
(11, 1),
(11,29),
(11, 96),
(11, 52),
(11, 48),
(11, 101),
(11, 123),
(11, 49);

-- Add a new Artist
INSERT INTO "artists" ("name")
VALUES ('Fred again..');

-- Add a new Album
INSERT INTO "albums" ("name", "date")
VALUES ('ten days', '2024-09-06');

-- Add the artist of the new album
INSERT INTO "album_artists" ("album_id", "artist_id")
VALUES (11, 12);

-- Add the songs of the new album
INSERT INTO "songs" ("title", "genre", "album_id")
VALUES
('.one', 'electronic', 11),
('adore u', 'electronic', 11),
('.two', 'electronic', 11),
('ten', 'electronic', 11),
('.three', 'electronic', 11),
('fear less', 'electronic', 11),
('.four', 'electronic', 11),
('just stand there', 'electronic', 11),
('.five', 'electronic', 11),
('places to be', 'electronic', 11),
('.six', 'electronic', 11),
('glow', 'electronic', 11),
('.seven', 'electronic', 11),
('i saw you', 'electronic', 11),
('.eight', 'electronic', 11),
('where will i be', 'electronic', 11),
('.nine', 'electronic', 11),
('.peace u need', 'electronic', 11),
('.ten', 'electronic', 11),
('backseat', 'electronic', 11);

-- Add the song artists of the songs in the new album
INSERT INTO "song_artists" ("song_id", "artist_id")
VALUES
(177, 12),
(178, 12),
(179, 12),
(180, 12),
(181, 12),
(182, 12),
(183, 12),
(184, 12),
(185, 12),
(186, 12),
(187, 12),
(188, 12),
(189, 12),
(190, 12),
(191, 12),
(192, 12),
(193, 12),
(194, 12),
(195, 12),
(196, 12);

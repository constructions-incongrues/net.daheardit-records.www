ALTER TABLE `artist_translation` DROP FOREIGN KEY `artist_translation_id_artist_id`;
ALTER TABLE `content_translation` DROP FOREIGN KEY `content_translation_id_content_id`;
ALTER TABLE `post_translation` DROP FOREIGN KEY `post_translation_id_post_id`;
ALTER TABLE `release` DROP FOREIGN KEY `release_artist_id_artist_id`;
ALTER TABLE `release_translation` DROP FOREIGN KEY `release_translation_id_release_id`;
ALTER TABLE `track` DROP FOREIGN KEY `track_release_id_release_id`;

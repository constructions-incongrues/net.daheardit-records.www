ALTER TABLE `artist_translation` ADD `id` bigint(20) NOT NULL AUTO_INCREMENT UNIQUE FIRST, CHANGE `id` `artist_id` bigint(20) NOT NULL AFTER `id`;
ALTER TABLE `artist_translation` ADD PRIMARY KEY `id` (`id`), ADD UNIQUE `artist_id_lang` (`artist_id`, `lang`), DROP INDEX `PRIMARY`, DROP INDEX `id`;

ALTER TABLE `artwork_artist_translation` ADD `id` bigint(20) NOT NULL AUTO_INCREMENT UNIQUE FIRST, CHANGE `id` `artwork_artist_id` bigint(20) NOT NULL AFTER `id`;
ALTER TABLE `artwork_artist_translation` ADD PRIMARY KEY `id` (`id`), ADD UNIQUE `artwork_artist_id_lang` (`artwork_artist_id`, `lang`), DROP INDEX `PRIMARY`, DROP INDEX `id`;

ALTER TABLE `release_translation` ADD `id` bigint(20) NOT NULL AUTO_INCREMENT UNIQUE FIRST, CHANGE `id` `release_id` bigint(20) NOT NULL AFTER `id`;
ALTER TABLE `release_translation` ADD PRIMARY KEY `id` (`id`), ADD UNIQUE `release_id_lang` (`release_id`, `lang`), DROP INDEX `PRIMARY`, DROP INDEX `id`;

ALTER TABLE `content_translation` ADD `id` bigint(20) NOT NULL AUTO_INCREMENT UNIQUE FIRST, CHANGE `id` `content_id` bigint(20) NOT NULL AFTER `id`;
ALTER TABLE `content_translation` ADD PRIMARY KEY `id` (`id`), ADD UNIQUE `content_id_lang` (`content_id`, `lang`), DROP INDEX `PRIMARY`, DROP INDEX `id`;

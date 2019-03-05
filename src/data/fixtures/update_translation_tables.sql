ALTER TABLE `artist_translation` ADD `id` bigint(20) NOT NULL AUTO_INCREMENT UNIQUE FIRST, CHANGE `id` `artist_id` bigint(20) NOT NULL AFTER `id`;
ALTER TABLE `artist_translation` ADD PRIMARY KEY `id` (`id`), ADD UNIQUE `artist_id_lang` (`artist_id`, `lang`), DROP INDEX `PRIMARY`, DROP INDEX `id`;

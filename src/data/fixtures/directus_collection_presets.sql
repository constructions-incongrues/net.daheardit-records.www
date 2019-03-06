INSERT INTO `directus_collection_presets` (`id`, `title`, `user`, `role`, `collection`, `search_query`, `filters`, `view_type`, `view_query`, `view_options`, `translation`) VALUES
(NULL,	NULL,	NULL,	NULL,	'artist',	NULL,	NULL,	'tabular',	'{\"tabular\":{\"fields\":\"name,is_public,created_at,updated_at\",\"sort\":\"name\"}}',	NULL,	NULL);

INSERT INTO `directus_collection_presets` (`id`, `title`, `user`, `role`, `collection`, `search_query`, `filters`, `view_type`, `view_query`, `view_options`, `translation`) VALUES
(NULL,	NULL,	NULL,	NULL,	'artwork_artist',	NULL,	NULL,	'tabular',	'{\"tabular\":{\"fields\":\"name,is_public,created_at,updated_at\",\"sort\":\"name\"}}',	NULL,	NULL);

INSERT INTO `directus_collection_presets` (`id`, `title`, `user`, `role`, `collection`, `search_query`, `filters`, `view_type`, `view_query`, `view_options`, `translation`) VALUES
(NULL,	NULL,	NULL,	NULL,	'release',	NULL,	NULL,	'tabular',	'{\"tabular\":{\"fields\":\"sku,title,is_public,artist_id,artwork_artist_id,is_available,created_at,updated_at,released_at\",\"sort\":\"-released_at\"}}',	'{\"tabular\":{\"widths\":{\"sku\":108,\"title\":200,\"is_public\":102,\"artist_id\":162,\"artwork_artist_id\":200,\"is_available\":109,\"created_at\":200,\"updated_at\":200}}}',	NULL);

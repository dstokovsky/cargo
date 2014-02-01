CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `age` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gender` varchar(10) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`firstname`,`surname`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE `user_friends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `friend_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_friend_unq_idx` ( `user_id`, `friend_id` ),
  FOREIGN KEY `user_id_fk_idx` (`user_id`) REFERENCES `user`(`id`),
  FOREIGN KEY `friend_id_fk_idx` (`friend_id`) REFERENCES `user`(`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;


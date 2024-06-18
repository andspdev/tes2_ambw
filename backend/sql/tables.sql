CREATE TABLE IF NOT EXISTS `users` (
    `id` char(36) NOT NULL DEFAULT UUID(),
    `nama` varchar(50) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(255) NOT NULL,
    `jurusan` varchar(80) NOT NULL,
    `profile_pic` varchar(50) NULL,
    `login_terakhir` datetime NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NULL,
    `deleted_at` datetime NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `kategori` (
    `id` char(36) NOT NULL DEFAULT UUID(),
    `nama` varchar(50) NOT NULL,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NULL,
    `deleted_at` datetime NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `berita` (
    `id` char(36) NOT NULL DEFAULT UUID(),
    `judul` varchar(150) NOT NULL,
    `deskripsi` text NULL,
    `kategori_id` char(36) NOT NULL,
    `views` int unsigned NOT NULL DEFAULT 0,
    `thumbnail` varchar(255) NULL,
    `is_highlight` boolean NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime NULL,
    `deleted_at` datetime NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`kategori_id`)
        REFERENCES `kategori` (`id`)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `bookmark` (
    `id` char(36) NOT NULL DEFAULT UUID(),
    `users_id` char(36) NOT NULL,
    `berita_id` char(36) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`users_id`)
        REFERENCES `users` (`id`)
            ON UPDATE CASCADE
            ON DELETE CASCADE,
    FOREIGN KEY (`berita_id`)
        REFERENCES `berita` (`id`)
            ON UPDATE CASCADE
            ON DELETE CASCADE
) ENGINE=InnoDB CHARSET=utf8mb4;
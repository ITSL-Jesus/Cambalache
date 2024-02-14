/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comentarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_user_id_foreign` (`user_id`),
  KEY `comentarios_post_id_foreign` (`post_id`),
  CONSTRAINT `comentarios_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_user_id_foreign` (`user_id`),
  KEY `followers_follower_id_foreign` (`follower_id`),
  CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comentarios` (`id`, `user_id`, `post_id`, `comentario`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'MI papa tiene un tsuru!, cuando es lo menos por ese? :)', '2023-06-22 08:59:17', '2023-06-22 08:59:17');
INSERT INTO `comentarios` (`id`, `user_id`, `post_id`, `comentario`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 'Se ve placoson!', '2023-06-22 08:59:54', '2023-06-22 08:59:54');




INSERT INTO `followers` (`id`, `user_id`, `follower_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL);
INSERT INTO `followers` (`id`, `user_id`, `follower_id`, `created_at`, `updated_at`) VALUES
(2, 2, 1, NULL, NULL);


INSERT INTO `likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(3, 2, 1, '2023-06-22 14:41:58', '2023-06-22 14:41:58');


INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(18, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2022_04_04_225308_add_username_to_users_table', 1),
(24, '2022_04_07_174923_create_posts_table', 1),
(25, '2022_04_08_231630_create_comentarios_table', 1),
(26, '2022_04_09_180132_create_likes_table', 1),
(27, '2022_04_12_234857_add_imagen_field_to_users_table', 1),
(28, '2022_04_13_002408_create_followers_table', 1),
(29, '2023_06_15_173535_add_username_to_users_table', 1);







INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '🥇Honda civic coupe 2012', '🇺🇸a americano se legaliza sin problemas \r\n4 cilindros \r\nClima \r\nRines deportivos 17s frenos de disco \r\nLlantas nuevas \r\n♻️sistema ahorrador de⛽️ ( econ )\r\nLlanta de refacción \r\nExcelentes condiciones mecánicas \r\nRecién llegado !\r\nContoles de audio al volante \r\nEstero de agencia original', 'f7419a5f-cf85-476e-8bf9-e011e2b5a3e1.jpg', 1, '2023-06-22 07:16:35', '2023-06-22 07:16:35');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(2, '🎮 Xbox one S', 'Consola con 1TB de almacenamiento, 2 controles y 10 Games.', '1297ee47-0d86-48be-b0ca-28c33c2525d5.jpg', 2, '2023-06-22 09:04:38', '2023-06-22 09:04:38');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 'Crema Hidratante LOREAL', 'Crema de 400ml Extra hidratante con rejuvenecimiento facial D2 a un precio especial $99.99', 'c3321d2f-87fd-4b50-84b9-971610fcb700.jpg', 2, '2023-06-22 09:19:12', '2023-06-22 09:19:12');
INSERT INTO `posts` (`id`, `titulo`, `descripcion`, `imagen`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Funko-Pop de Jasmin.', 'Figura coleccionable traída desde arabia (tierra santa). Sale por $50.00 dlls', '52cb3d07-ec1d-4852-9402-628f9e2ddb1f.jpg', 2, '2023-06-22 09:21:28', '2023-06-22 09:21:28'),
(5, 'Castillo armable de Inglaterra', 'Juguete de mesa coleccionable listo para armar cuanta con mas de 1000 piezas, caja completamente cerrada. $299.99 a tratar.', 'a1d11436-4e83-4025-8844-c9f4dd07df81.jpg', 2, '2023-06-22 09:23:36', '2023-06-22 09:23:36'),
(6, 'Paquete de San Valentín. <3', 'Vendo este pack de tazas y portaretrato para tu pareja, lo vendo por que ya no tengo pareja :,( esta totalmente nuevo, nada mas tiene un detalle el cual es que viene a nombre de jovas y emily Ya pa que salga $50.00', '5ab23858-46ce-425a-8231-e4fddef2fab0.jpg', 2, '2023-06-22 09:26:35', '2023-06-22 09:26:35'),
(7, 'Iphone\'s y Samsung\'s', 'Iphone 10 -> $8 000.00 pesos \r\n  -89 de pila, estetica 8/10, con cargador y funda\r\nIphone 8 -> $6 000.00 pesos\r\n  -99 de pila, estetica 9/10, con cargador y funda\r\nSamsung s10 -> 7 000.00 pesos\r\n -andorid 12, 6 Gb Ram, cargador y funda.\r\nSamsung S20 Fe -> 12 000.00 pesos\r\n -andorid ONE, 8 Gb Ram, cargador y funda.', '5110be04-6ed2-4289-b6c6-e555e5778d7d.jpg', 2, '2023-06-22 09:30:45', '2023-06-22 09:30:45'),
(8, 'Planta Money', 'Lujosa planta que te da monedas de oro, era la comida de la gallina de los huevos de oro, animate a ser millonario ten mente de tiburon! $1000.00 dlls', '0264e08f-b373-4836-a812-4c4c336f5c99.jpg', 2, '2023-06-22 09:33:47', '2023-06-22 09:33:47'),
(9, 'Vestido de diseñador', 'vendo vestido del diseñador JoseAnyel solo lo use una vez. $20 000.00 pesos', 'f0ff020c-57af-410a-a10e-049f9f73473d.jpg', 2, '2023-06-22 09:35:14', '2023-06-22 09:35:14'),
(10, 'Retro excavadora', 'Me la encontré por mi cuadra, ni la usan tienen 4 años haciendo un pozo. ofrezcan! acepto de todo!', 'f652ce06-8610-4765-bdcf-695b8752f332.jpg', 2, '2023-06-22 09:37:44', '2023-06-22 09:37:44'),
(11, 'bascula', 'bascula usada $449.99 pesos', 'aeb8bd90-889f-4384-8f75-ee5a848bb451.jpg', 2, '2023-06-22 09:42:08', '2023-06-22 09:42:08'),
(12, 'lata de fourloko', 'ya me tome el liquido, esta limpiecita para usarse. ofrezcan!', 'af69484a-9da2-4cba-83af-8bb36090c77e.jpg', 2, '2023-06-22 09:43:40', '2023-06-22 09:43:40'),
(13, 'Empaque del aigre', 'Es un empaque para que se acomode el motor, la neta se la robe a mi jefe cuanto dan ando bien eriza!', '17ca6205-dcf8-47cb-9372-510f7b68efd2.jpg', 2, '2023-06-22 09:45:45', '2023-06-22 09:45:45'),
(14, 'Jabón desengrasante', 'contiene 2lts con el mejor detergente de Mexico, sirve para todo! $99.99 pesos', '6841a91e-81de-4df9-9d6f-50cd864e4c77.jpg', 2, '2023-06-22 09:47:58', '2023-06-22 09:47:58');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `imagen`) VALUES
(1, 'Jesus', 'devLuna@email.com', NULL, '$2y$10$APK8L.Nh9VqdGV5oikirheeS.M9blteruoS7SfmH2dOBdoCWsa4vq', 'jo5q80MLU5ssMxg29wQFBsxngDAuD7BvD398dSeolYuBBvlHleekfqw6VF65', '2023-06-22 06:26:08', '2023-06-22 12:55:51', 'devluna', '1b406759-526d-402f-91e2-348a12cf612e.jpg');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `imagen`) VALUES
(2, 'emily', 'samira@email.com', NULL, '$2y$10$Uh.h2FJpaVnE50Krf2GJRO6QzzdatVYugOHkwqdmJuReaNKtzYoaG', NULL, '2023-06-22 08:44:41', '2023-06-22 14:37:22', 'tylorswiftmipatrona', '7db206d1-aeb2-4fb5-8035-efe64ac733ca.jpg');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
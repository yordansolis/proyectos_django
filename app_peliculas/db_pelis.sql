-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2023 a las 05:03:36
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_pelis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add mis movie', 7, 'add_mismovie'),
(26, 'Can change mis movie', 7, 'change_mismovie'),
(27, 'Can delete mis movie', 7, 'delete_mismovie'),
(28, 'Can view mis movie', 7, 'view_mismovie'),
(29, 'Can add flat page admin', 8, 'add_flatpageadmin'),
(30, 'Can change flat page admin', 8, 'change_flatpageadmin'),
(31, 'Can delete flat page admin', 8, 'delete_flatpageadmin'),
(32, 'Can view flat page admin', 8, 'view_flatpageadmin'),
(33, 'Can add article', 9, 'add_article'),
(34, 'Can change article', 9, 'change_article'),
(35, 'Can delete article', 9, 'delete_article'),
(36, 'Can view article', 9, 'view_article');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(24, 'pbkdf2_sha256$600000$oCEYZvnZp3h40Tgqtr3ZQ9$g+YJW/FZfIu+tmf6wBtiz30JtmemyOOCLxjwPmeMmC8=', '2023-07-27 02:44:29.965067', 1, 'jordan', '', '', 'jordan@example.com', 1, 1, '2023-07-27 02:44:10.021437'),
(25, 'pbkdf2_sha256$600000$cCcJbeUMywioTFRILbvJzj$wKjToSFlrGVV9gd2FW7Wp3VcCCL05faRD4rc2e97nZg=', '2023-07-27 02:47:40.250779', 0, 'manuel', '', '', '', 0, 1, '2023-07-27 02:45:26.949170'),
(26, 'pbkdf2_sha256$600000$VoKNBpz15VBI2evtm48sBu$cMz5bwufGL4UoBJYmnjMA+7uJX6goeDK1WKkbRWPNfY=', '2023-07-27 02:48:06.264503', 0, 'jose', '', '', '', 0, 1, '2023-07-27 02:48:05.644456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crud_article`
--

CREATE TABLE `crud_article` (
  `id` bigint(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crud_flatpageadmin`
--

CREATE TABLE `crud_flatpageadmin` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crud_mismovie`
--

CREATE TABLE `crud_mismovie` (
  `id` bigint(20) NOT NULL,
  `moviename` varchar(100) NOT NULL,
  `datetime` date NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `comentario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `crud_mismovie`
--

INSERT INTO `crud_mismovie` (`id`, `moviename`, `datetime`, `filename`, `user_id`, `autor`, `comentario`) VALUES
(195, 'Matrix', '2023-07-26', 'poster06.jpg', 25, 'Manuel Mena', 'Es una buena película, mucha acción  '),
(196, 'Dinosaurios', '2023-07-26', 'poster03.jpg', 25, 'Manuel', 'Es una película muy antigua '),
(197, 'La momia', '2023-07-26', 'poster01.jpg', 26, 'Jose Antonio', 'Es una excelente película de acción ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'crud', 'article'),
(8, 'crud', 'flatpageadmin'),
(7, 'crud', 'mismovie'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-20 18:25:56.148293'),
(2, 'auth', '0001_initial', '2023-07-20 18:25:56.544222'),
(3, 'admin', '0001_initial', '2023-07-20 18:25:56.638752'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-20 18:25:56.647767'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-20 18:25:56.657014'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-20 18:25:56.708254'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-20 18:25:56.754214'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-20 18:25:56.773223'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-20 18:25:56.781681'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-20 18:25:56.819067'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-20 18:25:56.824068'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-20 18:25:56.836070'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-20 18:25:56.856440'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-20 18:25:56.877116'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-20 18:25:56.900051'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-20 18:25:56.916049'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-20 18:25:56.940758'),
(18, 'crud', '0001_initial', '2023-07-20 18:25:56.960560'),
(19, 'sessions', '0001_initial', '2023-07-20 18:25:56.996466'),
(20, 'crud', '0002_flatpageadmin', '2023-07-21 20:11:01.614896'),
(21, 'crud', '0003_article', '2023-07-21 21:30:35.480424'),
(22, 'crud', '0004_alter_mismovie_filename', '2023-07-22 02:56:17.946132'),
(23, 'crud', '0005_mismovie_user_alter_mismovie_filename', '2023-07-25 21:12:46.166224'),
(24, 'crud', '0006_mismovie_autor_mismovie_comentario', '2023-07-27 01:44:17.719683');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0ltz6qhu6lcdjrh1dak9ym6h0wrtql5k', '.eJxVjDsOwjAQBe_iGln-rJeEkj5niHbtDQ4gW4qTCnF3iJQC2jcz76VG2tY8bk2WcU7qohyo0-_IFB9SdpLuVG5Vx1rWZWa9K_qgTQ81yfN6uH8HmVr-1iFGS0gwuSimI2-xI8GAZASsYYHI5M-AaALaHrx33DMwTMF7CMap9wcJ-DdW:1qOqzN:GsoLWVVRrsqiZ35STEMbI9tm2ngEd1sz1XIx-xo8gEI', '2023-08-10 02:44:29.973070'),
('edk88bs1u6e23xx07ivppuyjo75kd1mx', '.eJxVjMsOgjAURP-la9OkpS1cl-79hua-KqiBhMKK-O9CwkJXk8w5M5vJuC59XqvOeRBzNS6Zy29JyC8dDyJPHB-T5Wlc5oHsodiTVnufRN-30_076LH2-5qxw-hSi4Gkha4BpwUgOgoBvBP2VFQKBy4E3Z5NAmLPDn2MsVExny8eFDjX:1qOWVJ:4bpRSWC1c7Zgc2519GVlfzY3jaE5NK7aLkI2qItk43Q', '2023-08-09 04:52:05.187967'),
('n3j1w1yp3sbf1xppw78k4talhlyssot7', '.eJxVjDEOwjAMRe-SGUU1jkPDyM4ZKttxaQE1UtNOiLtDpQ6w_vfef7mO12Xo1mpzN2Z3dtC6w-8orA-bNpLvPN2K1zIt8yh-U_xOq7-WbM_L7v4dDFyHb21GEJJSbhmAEZqsEugEDSEJirEehUQDEvaiKBRTAsNo0vcRJbn3BxKFOIU:1qOk5K:t0h_KhULoLsh9K1c915KfO-qqqYUNwM9rTjoB-6ikPI', '2023-08-09 19:22:10.636603'),
('o0dsliyg1hcdvtlhgi2nyq8z7hv25qzv', '.eJxVjEEOwiAQRe_C2hCYFgZcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWTpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqtsymoEycknwEGxYotlugYEmajSVnvMBULgH7wRA4sGa-5EPKIYxTvD_eUOBo:1qOS83:r7Lu0sp5m0MbkYujIPFDkHrAZl7fr9KZJ-bx4SPGNXA', '2023-08-09 00:11:47.113625'),
('rk5d5txryv1d11cso59773g7tcrmical', '.eJxVjMsOwiAQRf-FtSFAebp07zcQmBmkaiAp7cr479qkC93ec859sZi2tcZt0BJnZGcmHTv9jjnBg9pO8J7arXPobV3mzHeFH3Twa0d6Xg7376CmUb81lEImJGuzUiIpUtqaIIIX6LVUEnzwEi1OiM4gFD9pox2h0YhAU_Hs_QEDITgh:1qOnE8:U2_f_qYjmqKmIVkxWY6J2P09Aci0GduwmhrkAVGQEP4', '2023-08-09 22:43:28.274991'),
('zk4zx46c0ykoef64v57gsvagbysarruc', '.eJxVjEEOwiAQRe_C2hAonYG6dN8zNAMMUjWQlHZlvLsh6UK3_73332KhY8_L0Xhb1iiuQo_i8jt6Ck8uncQHlXuVoZZ9W73sijxpk3ON_Lqd7t9BppZ7nUYCxAE9AqchYLDW0QRoOXhNwZDxzAZBRYfaWLKgYPJOgUocrRGfLxREOBE:1qOVNt:FraEgEBjmTSxk99OHi34pNpHXdOS3_lliaUdqBCUCmU', '2023-08-09 03:40:21.174089');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `crud_article`
--
ALTER TABLE `crud_article`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crud_flatpageadmin`
--
ALTER TABLE `crud_flatpageadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crud_mismovie`
--
ALTER TABLE `crud_mismovie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crud_mismovie_user_id_e46eebf8_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crud_article`
--
ALTER TABLE `crud_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crud_flatpageadmin`
--
ALTER TABLE `crud_flatpageadmin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crud_mismovie`
--
ALTER TABLE `crud_mismovie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `crud_mismovie`
--
ALTER TABLE `crud_mismovie`
  ADD CONSTRAINT `crud_mismovie_user_id_e46eebf8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

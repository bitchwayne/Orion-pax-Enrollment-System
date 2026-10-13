-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2026 at 11:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesis_archive`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_requests`
--

CREATE TABLE `access_requests` (
  `id` int(11) NOT NULL,
  `thesis_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `created_at`) VALUES
(1, 1, 'login', 'User logged in', '::1', '2026-09-23 03:00:26'),
(2, 1, 'add_department', 'Added department: College of Engineering Technology', '::1', '2026-09-23 03:01:55'),
(3, 1, 'delete_department', 'Deleted department #2', '::1', '2026-09-23 03:07:01'),
(4, 1, 'delete_department', 'Deleted department #1', '::1', '2026-09-23 03:07:13'),
(5, 1, 'delete_department', 'Deleted department #5', '::1', '2026-09-23 03:07:26'),
(6, 1, 'edit_department', 'Updated department #7: College Of  Engineering And Technology', '::1', '2026-09-23 03:21:50'),
(7, 1, 'logout', 'User logged out', '::1', '2026-09-23 03:24:07'),
(8, 2, 'register', 'Student account created', '::1', '2026-09-23 03:25:01'),
(9, 2, 'login', 'User logged in', '::1', '2026-09-23 03:25:48'),
(10, 2, 'logout', 'User logged out', '::1', '2026-09-23 03:50:27'),
(11, 1, 'login', 'User logged in', '::1', '2026-09-23 03:50:51'),
(12, 1, 'add_department', 'Added department: College of Criminal Justice', '::1', '2026-09-23 03:52:48'),
(13, 1, 'edit_department', 'Updated department #4: College of Business Education', '::1', '2026-09-23 03:53:11'),
(14, 1, 'add_department', 'Added department: College of Teacher and Education', '::1', '2026-09-23 03:53:52'),
(15, 1, 'add_department', 'Added department: College of Health and Sciences', '::1', '2026-09-23 03:57:20'),
(16, 1, 'logout', 'User logged out', '::1', '2026-09-23 04:01:17'),
(17, 2, 'login', 'User logged in', '::1', '2026-09-23 04:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(150) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_code`, `department_id`, `is_active`, `created_at`) VALUES
(1, 'BS Information Technology', 'BSIT', NULL, 1, '2026-09-23 02:58:46'),
(2, 'BS Computer Science', 'BSCS', NULL, 1, '2026-09-23 02:58:46'),
(3, 'Associate in Computer Technology', 'ACT', NULL, 1, '2026-09-23 02:58:46'),
(4, 'BS Business Administration', 'BSBA', 3, 1, '2026-09-23 02:58:46'),
(5, 'BS Accountancy', 'BSA', 3, 1, '2026-09-23 02:58:46'),
(6, 'Bachelor of Elementary Education', 'BEED', 4, 1, '2026-09-23 02:58:46'),
(7, 'Bachelor of Secondary Education', 'BSED', 4, 1, '2026-09-23 02:58:46'),
(8, 'BS Civil Engineering', 'BSCE', NULL, 1, '2026-09-23 02:58:46'),
(9, 'BS Psychology', 'BSPSY', 6, 1, '2026-09-23 02:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_name` varchar(150) NOT NULL,
  `department_code` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `department_code`, `description`, `is_active`, `created_at`) VALUES
(3, 'College of Business Administration', 'CBA', NULL, 1, '2026-09-23 02:58:46'),
(4, 'College of Business Education', 'CED', NULL, 1, '2026-09-23 02:58:46'),
(6, 'College of Arts and Sciences', 'CAS', NULL, 1, '2026-09-23 02:58:46'),
(7, 'College Of  Engineering And Technology', 'CET', 'etc', 1, '2026-09-23 03:01:55'),
(8, 'College of Criminal Justice', 'CCJ', 'dsa', 1, '2026-09-23 03:52:48'),
(9, 'College of Teacher and Education', NULL, NULL, 1, '2026-09-23 03:53:52'),
(10, 'College of Health and Sciences', 'CHS', NULL, 1, '2026-09-23 03:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thesis_authors`
--

CREATE TABLE `thesis_authors` (
  `thesis_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thesis_keywords`
--

CREATE TABLE `thesis_keywords` (
  `thesis_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thesis_research`
--

CREATE TABLE `thesis_research` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `abstract` text DEFAULT NULL,
  `publication_year` year(4) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `adviser_name` varchar(150) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `access_type` enum('public','restricted') NOT NULL DEFAULT 'public',
  `status` enum('pending','approved','rejected','archived') NOT NULL DEFAULT 'pending',
  `uploaded_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','dean','faculty','student') NOT NULL DEFAULT 'student',
  `student_id` varchar(50) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `student_id`, `employee_id`, `department_id`, `course_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'System Administrator', 'admin@thesisarchive.com', '$2y$10$1r7HvBsEJKehJcf3J/bAYeDEF3puQvFzJ03RIuvimrCd9g/y810.i', 'admin', NULL, NULL, NULL, NULL, 1, '2026-09-23 02:59:07', '2026-09-23 02:59:07'),
(2, 'Peter Parker', 'parker@gmail.com', '$2y$10$18JQsmXRqYq0nEMP0oBCBeYp6OQv3FXVWtbIiMjDsCHU7t54E0tli', 'student', '2411350060', NULL, 3, 4, 1, '2026-09-23 03:25:01', '2026-09-23 03:25:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_access_thesis` (`thesis_id`),
  ADD KEY `fk_access_requester` (`requester_id`),
  ADD KEY `fk_access_reviewer` (`reviewed_by`),
  ADD KEY `idx_access_status` (`status`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_user` (`user_id`),
  ADD KEY `idx_logs_created_at` (`created_at`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_courses_department` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword` (`keyword`);

--
-- Indexes for table `thesis_authors`
--
ALTER TABLE `thesis_authors`
  ADD PRIMARY KEY (`thesis_id`,`author_id`),
  ADD KEY `fk_thesis_authors_author` (`author_id`);

--
-- Indexes for table `thesis_keywords`
--
ALTER TABLE `thesis_keywords`
  ADD PRIMARY KEY (`thesis_id`,`keyword_id`),
  ADD KEY `fk_thesis_keywords_keyword` (`keyword_id`);

--
-- Indexes for table `thesis_research`
--
ALTER TABLE `thesis_research`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_thesis_course` (`course_id`),
  ADD KEY `fk_thesis_uploader` (`uploaded_by`),
  ADD KEY `fk_thesis_approver` (`approved_by`),
  ADD KEY `idx_thesis_title` (`title`),
  ADD KEY `idx_thesis_year` (`publication_year`),
  ADD KEY `idx_thesis_status` (`status`),
  ADD KEY `idx_thesis_dept` (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_department` (`department_id`),
  ADD KEY `fk_users_course` (`course_id`),
  ADD KEY `idx_users_role` (`role`),
  ADD KEY `idx_users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_requests`
--
ALTER TABLE `access_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thesis_research`
--
ALTER TABLE `thesis_research`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD CONSTRAINT `fk_access_requester` FOREIGN KEY (`requester_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_access_reviewer` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_access_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `thesis_research` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_courses_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `thesis_authors`
--
ALTER TABLE `thesis_authors`
  ADD CONSTRAINT `fk_thesis_authors_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thesis_authors_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `thesis_research` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thesis_keywords`
--
ALTER TABLE `thesis_keywords`
  ADD CONSTRAINT `fk_thesis_keywords_keyword` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thesis_keywords_thesis` FOREIGN KEY (`thesis_id`) REFERENCES `thesis_research` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thesis_research`
--
ALTER TABLE `thesis_research`
  ADD CONSTRAINT `fk_thesis_approver` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thesis_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thesis_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thesis_uploader` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

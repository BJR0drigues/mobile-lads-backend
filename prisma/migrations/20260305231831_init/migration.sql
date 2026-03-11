-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `first_name` VARCHAR(191) NOT NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `password_hash` VARCHAR(191) NOT NULL,
    `password_reset_token` VARCHAR(191) NULL,
    `password_reset_expires` DATETIME(3) NULL,
    `email_verified` BOOLEAN NOT NULL DEFAULT false,
    `email_verified_at` DATETIME(3) NULL,
    `avatar_url` VARCHAR(191) NULL,
    `bio` TEXT NULL,
    `location` VARCHAR(191) NULL,
    `date_of_birth` DATETIME(3) NULL,
    `gender` VARCHAR(191) NULL,
    `institution` VARCHAR(191) NULL,
    `course` VARCHAR(191) NULL,
    `enrollment_number` VARCHAR(191) NULL,
    `graduation_year` INTEGER NULL,
    `is_professional` BOOLEAN NOT NULL DEFAULT false,
    `is_lads_member` BOOLEAN NOT NULL DEFAULT false,
    `is_admin` BOOLEAN NOT NULL DEFAULT false,
    `account_status` VARCHAR(191) NOT NULL DEFAULT 'active',
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `last_login` DATETIME(3) NULL,
    `deleted_at` DATETIME(3) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `professionals` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NULL,
    `company` VARCHAR(191) NULL,
    `position` VARCHAR(191) NULL,
    `bio_professional` TEXT NULL,
    `linkedin_url` VARCHAR(191) NULL,
    `github_url` VARCHAR(191) NULL,
    `portfolio_url` VARCHAR(191) NULL,
    `website_url` VARCHAR(191) NULL,
    `twitter_url` VARCHAR(191) NULL,
    `lads_join_date` DATETIME(3) NULL,
    `lads_role` VARCHAR(191) NULL,
    `lads_bio` TEXT NULL,
    `certifications` JSON NOT NULL,
    `achievements` JSON NOT NULL,
    `available_for_consulting` BOOLEAN NOT NULL DEFAULT false,
    `available_for_mentoring` BOOLEAN NOT NULL DEFAULT false,
    `available_for_speaking` BOOLEAN NOT NULL DEFAULT false,
    `total_projects` INTEGER NOT NULL DEFAULT 0,
    `total_mentees` INTEGER NOT NULL DEFAULT 0,
    `average_rating` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `total_ratings` INTEGER NOT NULL DEFAULT 0,
    `total_followers` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `professionals_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `expertise` (
    `id` VARCHAR(191) NOT NULL,
    `professional_id` VARCHAR(191) NOT NULL,
    `skill_name` VARCHAR(191) NOT NULL,
    `category` VARCHAR(191) NULL,
    `proficiency_level` VARCHAR(191) NULL,
    `years_of_experience` INTEGER NULL,
    `description` TEXT NULL,
    `certification_id` VARCHAR(191) NULL,
    `certification_url` VARCHAR(191) NULL,
    `endorsements` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `events` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `short_description` VARCHAR(191) NULL,
    `cover_image_url` VARCHAR(191) NULL,
    `thumbnail_url` VARCHAR(191) NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `registration_start` DATETIME(3) NULL,
    `registration_deadline` DATETIME(3) NULL,
    `location` VARCHAR(191) NULL,
    `location_lat` DECIMAL(65, 30) NULL,
    `location_lng` DECIMAL(65, 30) NULL,
    `is_online` BOOLEAN NOT NULL DEFAULT false,
    `online_link` VARCHAR(191) NULL,
    `event_type` VARCHAR(191) NULL,
    `category` VARCHAR(191) NULL,
    `max_participants` INTEGER NULL,
    `current_participants` INTEGER NOT NULL DEFAULT 0,
    `organizer_id` VARCHAR(191) NOT NULL,
    `co_organizers` JSON NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'draft',
    `visibility` VARCHAR(191) NOT NULL DEFAULT 'public',
    `total_views` INTEGER NOT NULL DEFAULT 0,
    `total_registrations` INTEGER NOT NULL DEFAULT 0,
    `total_attendees` INTEGER NOT NULL DEFAULT 0,
    `tags` JSON NOT NULL,
    `agenda` JSON NULL,
    `requirements` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event_participants` (
    `id` VARCHAR(191) NOT NULL,
    `event_id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `registration_status` VARCHAR(191) NOT NULL DEFAULT 'pending',
    `registered_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `confirmed_at` DATETIME(3) NULL,
    `checked_in_at` DATETIME(3) NULL,
    `cancelled_at` DATETIME(3) NULL,
    `registration_notes` TEXT NULL,
    `team_name` VARCHAR(191) NULL,
    `team_id` VARCHAR(191) NULL,
    `certificate_issued` BOOLEAN NOT NULL DEFAULT false,
    `certificate_url` VARCHAR(191) NULL,
    `certificate_issued_at` DATETIME(3) NULL,
    `feedback_given` BOOLEAN NOT NULL DEFAULT false,
    `rating` INTEGER NULL,
    `review` TEXT NULL,
    `feedback_given_at` DATETIME(3) NULL,

    UNIQUE INDEX `event_participants_event_id_user_id_key`(`event_id`, `user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `forums` (
    `id` VARCHAR(191) NOT NULL,
    `event_id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `is_moderated` BOOLEAN NOT NULL DEFAULT false,
    `moderator_ids` JSON NOT NULL,
    `total_topics` INTEGER NOT NULL DEFAULT 0,
    `total_comments` INTEGER NOT NULL DEFAULT 0,
    `total_members` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `forums_event_id_key`(`event_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `topics` (
    `id` VARCHAR(191) NOT NULL,
    `forum_id` VARCHAR(191) NOT NULL,
    `author_id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `content` TEXT NOT NULL,
    `category` VARCHAR(191) NULL,
    `is_pinned` BOOLEAN NOT NULL DEFAULT false,
    `is_locked` BOOLEAN NOT NULL DEFAULT false,
    `is_archived` BOOLEAN NOT NULL DEFAULT false,
    `is_spam` BOOLEAN NOT NULL DEFAULT false,
    `total_views` INTEGER NOT NULL DEFAULT 0,
    `total_comments` INTEGER NOT NULL DEFAULT 0,
    `total_likes` INTEGER NOT NULL DEFAULT 0,
    `last_activity_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `deleted_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comments` (
    `id` VARCHAR(191) NOT NULL,
    `topic_id` VARCHAR(191) NOT NULL,
    `author_id` VARCHAR(191) NOT NULL,
    `parent_comment_id` VARCHAR(191) NULL,
    `content` TEXT NOT NULL,
    `is_edited` BOOLEAN NOT NULL DEFAULT false,
    `edited_at` DATETIME(3) NULL,
    `is_spam` BOOLEAN NOT NULL DEFAULT false,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `total_likes` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `likes` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `likeable_type` VARCHAR(191) NOT NULL,
    `likeable_id` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `likes_user_id_likeable_type_likeable_id_key`(`user_id`, `likeable_type`, `likeable_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `services` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `icon` VARCHAR(191) NULL,
    `category` VARCHAR(191) NULL,
    `subcategory` VARCHAR(191) NULL,
    `estimated_duration` VARCHAR(191) NULL,
    `base_price` DECIMAL(65, 30) NULL,
    `is_custom_price` BOOLEAN NOT NULL DEFAULT false,
    `technologies` JSON NOT NULL,
    `deliverables` JSON NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `total_requests` INTEGER NOT NULL DEFAULT 0,
    `average_rating` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `services_slug_key`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_requests` (
    `id` VARCHAR(191) NOT NULL,
    `request_number` VARCHAR(191) NOT NULL,
    `service_id` VARCHAR(191) NOT NULL,
    `requester_id` VARCHAR(191) NOT NULL,
    `assigned_to_id` VARCHAR(191) NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` TEXT NULL,
    `requirements` TEXT NULL,
    `budget_estimation` DECIMAL(65, 30) NULL,
    `final_price` DECIMAL(65, 30) NULL,
    `price_status` VARCHAR(191) NULL,
    `request_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `deadline` DATETIME(3) NULL,
    `estimated_start_date` DATETIME(3) NULL,
    `estimated_end_date` DATETIME(3) NULL,
    `actual_start_date` DATETIME(3) NULL,
    `actual_end_date` DATETIME(3) NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'open',
    `priority` VARCHAR(191) NOT NULL DEFAULT 'medium',
    `attachments` JSON NULL,
    `last_message_date` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `service_requests_request_number_key`(`request_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_request_updates` (
    `id` VARCHAR(191) NOT NULL,
    `service_request_id` VARCHAR(191) NOT NULL,
    `updated_by_id` VARCHAR(191) NOT NULL,
    `update_type` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NULL,
    `description` TEXT NULL,
    `field_changed` VARCHAR(191) NULL,
    `old_value` TEXT NULL,
    `new_value` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ratings` (
    `id` VARCHAR(191) NOT NULL,
    `professional_id` VARCHAR(191) NOT NULL,
    `rater_id` VARCHAR(191) NOT NULL,
    `score` INTEGER NOT NULL,
    `title` VARCHAR(191) NULL,
    `review` TEXT NULL,
    `context_type` VARCHAR(191) NULL,
    `context_id` VARCHAR(191) NULL,
    `is_verified` BOOLEAN NOT NULL DEFAULT false,
    `is_helpful` BOOLEAN NOT NULL DEFAULT false,
    `helpful_count` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `follows` (
    `id` VARCHAR(191) NOT NULL,
    `follower_id` VARCHAR(191) NOT NULL,
    `professional_id` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `mute_notifications` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `unfollowed_at` DATETIME(3) NULL,

    UNIQUE INDEX `follows_follower_id_professional_id_key`(`follower_id`, `professional_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `connections` (
    `id` VARCHAR(191) NOT NULL,
    `user_id_1` VARCHAR(191) NOT NULL,
    `user_id_2` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'pending',
    `initiated_by_id` VARCHAR(191) NOT NULL,
    `last_message_date` DATETIME(3) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `accepted_at` DATETIME(3) NULL,
    `blocked_at` DATETIME(3) NULL,

    UNIQUE INDEX `connections_user_id_1_user_id_2_key`(`user_id_1`, `user_id_2`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `messages` (
    `id` VARCHAR(191) NOT NULL,
    `sender_id` VARCHAR(191) NOT NULL,
    `recipient_id` VARCHAR(191) NOT NULL,
    `connection_id` VARCHAR(191) NOT NULL,
    `content` TEXT NOT NULL,
    `message_type` VARCHAR(191) NOT NULL DEFAULT 'text',
    `attachment_url` VARCHAR(191) NULL,
    `attachment_type` VARCHAR(191) NULL,
    `is_read` BOOLEAN NOT NULL DEFAULT false,
    `read_at` DATETIME(3) NULL,
    `is_edited` BOOLEAN NOT NULL DEFAULT false,
    `edited_at` DATETIME(3) NULL,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `deleted_at` DATETIME(3) NULL,
    `reactions` JSON NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `actor_id` VARCHAR(191) NULL,
    `type` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `message` TEXT NULL,
    `object_type` VARCHAR(191) NULL,
    `object_id` VARCHAR(191) NULL,
    `related_url` VARCHAR(191) NULL,
    `is_read` BOOLEAN NOT NULL DEFAULT false,
    `read_at` DATETIME(3) NULL,
    `is_archived` BOOLEAN NOT NULL DEFAULT false,
    `notification_channel` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `sent_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `audit_log` (
    `id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `action` VARCHAR(191) NOT NULL,
    `entity_type` VARCHAR(191) NOT NULL,
    `entity_id` VARCHAR(191) NULL,
    `description` TEXT NULL,
    `changes` JSON NULL,
    `ip_address` VARCHAR(191) NULL,
    `user_agent` TEXT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `professionals` ADD CONSTRAINT `professionals_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `expertise` ADD CONSTRAINT `expertise_professional_id_fkey` FOREIGN KEY (`professional_id`) REFERENCES `professionals`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `events` ADD CONSTRAINT `events_organizer_id_fkey` FOREIGN KEY (`organizer_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `event_participants` ADD CONSTRAINT `event_participants_event_id_fkey` FOREIGN KEY (`event_id`) REFERENCES `events`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `event_participants` ADD CONSTRAINT `event_participants_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `forums` ADD CONSTRAINT `forums_event_id_fkey` FOREIGN KEY (`event_id`) REFERENCES `events`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `topics` ADD CONSTRAINT `topics_forum_id_fkey` FOREIGN KEY (`forum_id`) REFERENCES `forums`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `topics` ADD CONSTRAINT `topics_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comments` ADD CONSTRAINT `comments_topic_id_fkey` FOREIGN KEY (`topic_id`) REFERENCES `topics`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comments` ADD CONSTRAINT `comments_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `comments` ADD CONSTRAINT `comments_parent_comment_id_fkey` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `likes` ADD CONSTRAINT `likes_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_requests` ADD CONSTRAINT `service_requests_service_id_fkey` FOREIGN KEY (`service_id`) REFERENCES `services`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_requests` ADD CONSTRAINT `service_requests_requester_id_fkey` FOREIGN KEY (`requester_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_requests` ADD CONSTRAINT `service_requests_assigned_to_id_fkey` FOREIGN KEY (`assigned_to_id`) REFERENCES `professionals`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_request_updates` ADD CONSTRAINT `service_request_updates_service_request_id_fkey` FOREIGN KEY (`service_request_id`) REFERENCES `service_requests`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `service_request_updates` ADD CONSTRAINT `service_request_updates_updated_by_id_fkey` FOREIGN KEY (`updated_by_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ratings` ADD CONSTRAINT `ratings_professional_id_fkey` FOREIGN KEY (`professional_id`) REFERENCES `professionals`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ratings` ADD CONSTRAINT `ratings_rater_id_fkey` FOREIGN KEY (`rater_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `follows` ADD CONSTRAINT `follows_follower_id_fkey` FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `follows` ADD CONSTRAINT `follows_professional_id_fkey` FOREIGN KEY (`professional_id`) REFERENCES `professionals`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `connections` ADD CONSTRAINT `connections_user_id_1_fkey` FOREIGN KEY (`user_id_1`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `connections` ADD CONSTRAINT `connections_user_id_2_fkey` FOREIGN KEY (`user_id_2`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `messages` ADD CONSTRAINT `messages_sender_id_fkey` FOREIGN KEY (`sender_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `messages` ADD CONSTRAINT `messages_recipient_id_fkey` FOREIGN KEY (`recipient_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `messages` ADD CONSTRAINT `messages_connection_id_fkey` FOREIGN KEY (`connection_id`) REFERENCES `connections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_actor_id_fkey` FOREIGN KEY (`actor_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `audit_log` ADD CONSTRAINT `audit_log_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

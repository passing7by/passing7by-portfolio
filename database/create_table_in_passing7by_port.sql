CREATE TABLE `admin` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `password` CHAR(64) NOT NULL,
    `fail_count` INT NULL DEFAULT 0,
    `max_fail_count` INT NULL DEFAULT 5,
    `is_active` TINYINT NOT NULL DEFAULT 0
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `about` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `admin_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `title` VARCHAR(255) NULL,
    `github_url` VARCHAR(255) NULL,
    `blog_url` VARCHAR(255) NULL,
    `email_url` VARCHAR(255) NULL,
    `reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `mod_date` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `is_published` TINYINT NOT NULL DEFAULT 0,
    `is_deleted` TINYINT NOT NULL DEFAULT 0
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `project` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `admin_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `summary` TEXT NULL,
    `team_size` INT NULL,
    `key_features` TEXT NULL,
    `tech_stack` TEXT NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `github_url` VARCHAR(255) NULL,
    `demo_url` VARCHAR(255) NULL,
    `ppt_url` VARCHAR(255) NULL,
    `reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `mod_date` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    `is_published` TINYINT NOT NULL DEFAULT 0,
    `is_deleted` TINYINT NOT NULL DEFAULT 0
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `image` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `project_id` INT NULL,
    `about_id` INT NULL,
    `ori_name` VARCHAR(255) NULL,
    `saved_name` CHAR(32) NOT NULL,
    `extension` VARCHAR(255) NOT NULL,
    CONSTRAINT `chk_image_relation` CHECK ((`project_id` IS NOT NULL AND `about_id` IS NULL) OR
(`project_id` IS NULL AND `about_id` IS NOT NULL))
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `skill` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `about_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `project_note` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `project_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `section` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `project_id` INT NULL,
    `about_id` INT NULL,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT NULL,
    CONSTRAINT `chk_section_relation` CHECK ((`project_id` IS NOT NULL AND `about_id` IS NULL)
OR (`project_id` IS NULL AND `about_id` IS NOT NULL))
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `image` ADD CONSTRAINT `FK_project_TO_image_1` FOREIGN KEY (`project_id`) REFERENCES
`project` (`id`);
ALTER TABLE `image` ADD CONSTRAINT `FK_about_TO_image_1` FOREIGN KEY (`about_id`) REFERENCES
`about` (`id`);
ALTER TABLE `skill` ADD CONSTRAINT `FK_about_TO_skill_1` FOREIGN KEY (`about_id`) REFERENCES
`about` (`id`);
ALTER TABLE `about` ADD CONSTRAINT `FK_admin_TO_about_1` FOREIGN KEY (`admin_id`) REFERENCES `admin`
(`id`);
ALTER TABLE `project_note` ADD CONSTRAINT `FK_project_TO_project_note_1` FOREIGN KEY
(`project_id`) REFERENCES `project` (`id`);
ALTER TABLE `project` ADD CONSTRAINT `FK_admin_TO_project_1` FOREIGN KEY (`admin_id`) REFERENCES
`admin` (`id`);
ALTER TABLE `section` ADD CONSTRAINT `FK_project_TO_section_1` FOREIGN KEY (`project_id`)
REFERENCES `project` (`id`);
ALTER TABLE `section` ADD CONSTRAINT `FK_about_TO_section_1` FOREIGN KEY (`about_id`) REFERENCES
`about` (`id`);
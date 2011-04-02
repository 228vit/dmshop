CREATE TABLE category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL UNIQUE, description LONGTEXT, photo BIGINT, is_active TINYINT(1) DEFAULT '1' NOT NULL, position BIGINT, INDEX photo_idx (photo), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_area (id BIGINT AUTO_INCREMENT, dm_layout_id BIGINT, dm_page_view_id BIGINT, type VARCHAR(255) NOT NULL, INDEX dm_layout_id_idx (dm_layout_id), INDEX dm_page_view_id_idx (dm_page_view_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_auto_seo_translation (id BIGINT, slug VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, h1 VARCHAR(255), description VARCHAR(255), keywords VARCHAR(255), strip_words TEXT, lang CHAR(7), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_auto_seo (id BIGINT AUTO_INCREMENT, module VARCHAR(127) NOT NULL, action VARCHAR(127) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, UNIQUE INDEX dmAutoSeoModuleAction_idx (module, action), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_catalogue (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, source_lang VARCHAR(15) NOT NULL, target_lang VARCHAR(15) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_error (id BIGINT AUTO_INCREMENT, php_class VARCHAR(127) NOT NULL, name VARCHAR(255) NOT NULL, description TEXT, module VARCHAR(127), action VARCHAR(127), uri VARCHAR(255) NOT NULL, env VARCHAR(63) NOT NULL, created_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_group_permission (dm_group_id BIGINT, dm_permission_id BIGINT, PRIMARY KEY(dm_group_id, dm_permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_layout (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL UNIQUE, template VARCHAR(255) DEFAULT 'page' NOT NULL, css_class VARCHAR(255), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_lock (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, user_name VARCHAR(255) NOT NULL, module VARCHAR(127) NOT NULL, action VARCHAR(127) NOT NULL, record_id BIGINT UNSIGNED DEFAULT 0 NOT NULL, time BIGINT NOT NULL, app VARCHAR(127) NOT NULL, url VARCHAR(255) NOT NULL, culture VARCHAR(15) NOT NULL, UNIQUE INDEX dmLockIndex_idx (user_id, module, action, record_id), INDEX user_id_idx (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_mail_template_translation (id BIGINT, description TEXT, subject TEXT NOT NULL, body LONGTEXT NOT NULL, from_email TEXT NOT NULL, to_email TEXT, cc_email TEXT, bcc_email TEXT, reply_to_email TEXT, sender_email TEXT, list_unsuscribe TEXT, is_html TINYINT(1) DEFAULT '0' NOT NULL, is_active TINYINT(1) DEFAULT '1' NOT NULL, lang CHAR(7), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_mail_template (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL UNIQUE, vars TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_media_translation (id BIGINT, legend VARCHAR(255), author VARCHAR(255), license VARCHAR(255), lang CHAR(2), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_media (id BIGINT AUTO_INCREMENT, dm_media_folder_id BIGINT NOT NULL, file VARCHAR(255) NOT NULL, mime VARCHAR(63) NOT NULL, size INT UNSIGNED, dimensions VARCHAR(15), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, UNIQUE INDEX folderFile_idx (dm_media_folder_id, file), INDEX dm_media_folder_id_idx (dm_media_folder_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_media_folder (id BIGINT AUTO_INCREMENT, rel_path VARCHAR(255) NOT NULL UNIQUE, lft INT, rgt INT, level SMALLINT, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_page_translation (id BIGINT, slug VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, title VARCHAR(255), h1 VARCHAR(255), description VARCHAR(255), keywords VARCHAR(255), auto_mod VARCHAR(6) DEFAULT 'snthdk' NOT NULL, is_active TINYINT(1) DEFAULT '1' NOT NULL, is_secure TINYINT(1) DEFAULT '0' NOT NULL, is_indexable TINYINT(1) DEFAULT '1' NOT NULL, lang CHAR(7), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_page (id BIGINT AUTO_INCREMENT, module VARCHAR(127) NOT NULL, action VARCHAR(127) NOT NULL, record_id BIGINT UNSIGNED DEFAULT 0 NOT NULL, credentials VARCHAR(255), lft INT, rgt INT, level SMALLINT, UNIQUE INDEX recordModuleAction_idx (module, action, record_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_page_view (id BIGINT AUTO_INCREMENT, module VARCHAR(127) NOT NULL, action VARCHAR(127) NOT NULL, dm_layout_id BIGINT, UNIQUE INDEX dmPageViewModuleAction_idx (module, action), INDEX dm_layout_id_idx (dm_layout_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission (id BIGINT AUTO_INCREMENT, secure_module VARCHAR(255) NOT NULL, secure_action VARCHAR(255) NOT NULL, secure_model VARCHAR(255) NOT NULL, secure_record BIGINT NOT NULL, description TEXT, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission_association (id BIGINT AUTO_INCREMENT, dm_secure_action VARCHAR(255), dm_secure_module VARCHAR(255), dm_secure_model VARCHAR(255), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission_association_group (id BIGINT AUTO_INCREMENT, dm_group_id BIGINT NOT NULL, dm_record_permission_association_id BIGINT NOT NULL, INDEX dm_record_permission_association_id_idx (dm_record_permission_association_id), INDEX dm_group_id_idx (dm_group_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission_association_user (id BIGINT AUTO_INCREMENT, dm_user_id BIGINT NOT NULL, dm_record_permission_association_id BIGINT NOT NULL, INDEX dm_record_permission_association_id_idx (dm_record_permission_association_id), INDEX dm_user_id_idx (dm_user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission_group (dm_group_id BIGINT, dm_record_permission_id BIGINT, PRIMARY KEY(dm_group_id, dm_record_permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_record_permission_user (dm_user_id BIGINT, dm_record_permission_id BIGINT, PRIMARY KEY(dm_user_id, dm_record_permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_redirect (id BIGINT AUTO_INCREMENT, source VARCHAR(255) NOT NULL UNIQUE, dest VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_remember_key (dm_user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, INDEX dm_user_id_idx (dm_user_id), PRIMARY KEY(ip_address)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_sent_mail (id BIGINT AUTO_INCREMENT, dm_mail_template_id BIGINT, subject TEXT NOT NULL, body LONGTEXT NOT NULL, from_email TEXT NOT NULL, to_email TEXT, cc_email TEXT, bcc_email TEXT, reply_to_email TEXT, sender_email TEXT, strategy VARCHAR(255), transport VARCHAR(255), culture VARCHAR(16), debug_string LONGTEXT, created_at DATETIME NOT NULL, INDEX dm_mail_template_id_idx (dm_mail_template_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_setting_translation (id BIGINT, description VARCHAR(255), value TEXT, default_value TEXT, lang CHAR(7), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_setting (id BIGINT AUTO_INCREMENT, name VARCHAR(127) NOT NULL UNIQUE, type VARCHAR(255) DEFAULT 'text' NOT NULL, params TEXT, group_name VARCHAR(255) DEFAULT '' NOT NULL, credentials VARCHAR(255), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_trans_unit (id BIGINT AUTO_INCREMENT, dm_catalogue_id BIGINT NOT NULL, source TEXT NOT NULL, target TEXT NOT NULL, meta VARCHAR(255), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX dm_catalogue_id_idx (dm_catalogue_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_user (id BIGINT AUTO_INCREMENT, username VARCHAR(255) NOT NULL UNIQUE, email VARCHAR(255) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, forgot_password_code VARCHAR(12) UNIQUE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_user_group (dm_user_id BIGINT, dm_group_id BIGINT, PRIMARY KEY(dm_user_id, dm_group_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_user_permission (dm_user_id BIGINT, dm_permission_id BIGINT, PRIMARY KEY(dm_user_id, dm_permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_widget_translation (id BIGINT, value TEXT, lang CHAR(7), PRIMARY KEY(id, lang)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_widget (id BIGINT AUTO_INCREMENT, dm_zone_id BIGINT NOT NULL, module VARCHAR(127) NOT NULL, action VARCHAR(127) NOT NULL, css_class VARCHAR(255), position BIGINT, updated_at DATETIME NOT NULL, INDEX dm_zone_id_idx (dm_zone_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE dm_zone (id BIGINT AUTO_INCREMENT, dm_area_id BIGINT NOT NULL, css_class VARCHAR(255), width VARCHAR(15), position BIGINT, INDEX dm_area_id_idx (dm_area_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE orders (id BIGINT AUTO_INCREMENT, company VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, contact VARCHAR(255) NOT NULL, phone VARCHAR(255) NOT NULL, ship_address VARCHAR(255), ship_date DATE, ship_time VARCHAR(100), note LONGTEXT, uid VARCHAR(255), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE order_detail (id BIGINT AUTO_INCREMENT, product_id BIGINT, order_id BIGINT, quantity BIGINT DEFAULT 1, price FLOAT(18, 2) DEFAULT 0 NOT NULL, INDEX product_id_idx (product_id), INDEX order_id_idx (order_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
CREATE TABLE product (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL UNIQUE, description LONGTEXT, photo BIGINT, category BIGINT, price FLOAT(18, 2) DEFAULT 0 NOT NULL, price_action FLOAT(18, 2) DEFAULT 0 NOT NULL, is_in_action TINYINT(1) DEFAULT '0' NOT NULL, is_active TINYINT(1) DEFAULT '1' NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, position BIGINT, INDEX photo_idx (photo), INDEX category_idx (category), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = INNODB;
ALTER TABLE category ADD CONSTRAINT category_photo_dm_media_id FOREIGN KEY (photo) REFERENCES dm_media(id) ON DELETE RESTRICT;
ALTER TABLE dm_area ADD CONSTRAINT dm_area_dm_page_view_id_dm_page_view_id FOREIGN KEY (dm_page_view_id) REFERENCES dm_page_view(id) ON DELETE CASCADE;
ALTER TABLE dm_area ADD CONSTRAINT dm_area_dm_layout_id_dm_layout_id FOREIGN KEY (dm_layout_id) REFERENCES dm_layout(id) ON DELETE CASCADE;
ALTER TABLE dm_auto_seo_translation ADD CONSTRAINT dm_auto_seo_translation_id_dm_auto_seo_id FOREIGN KEY (id) REFERENCES dm_auto_seo(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_group_permission ADD CONSTRAINT dm_group_permission_dm_permission_id_dm_permission_id FOREIGN KEY (dm_permission_id) REFERENCES dm_permission(id) ON DELETE CASCADE;
ALTER TABLE dm_group_permission ADD CONSTRAINT dm_group_permission_dm_group_id_dm_group_id FOREIGN KEY (dm_group_id) REFERENCES dm_group(id) ON DELETE CASCADE;
ALTER TABLE dm_lock ADD CONSTRAINT dm_lock_user_id_dm_user_id FOREIGN KEY (user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_mail_template_translation ADD CONSTRAINT dm_mail_template_translation_id_dm_mail_template_id FOREIGN KEY (id) REFERENCES dm_mail_template(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_media_translation ADD CONSTRAINT dm_media_translation_id_dm_media_id FOREIGN KEY (id) REFERENCES dm_media(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_media ADD CONSTRAINT dm_media_dm_media_folder_id_dm_media_folder_id FOREIGN KEY (dm_media_folder_id) REFERENCES dm_media_folder(id) ON DELETE CASCADE;
ALTER TABLE dm_page_translation ADD CONSTRAINT dm_page_translation_id_dm_page_id FOREIGN KEY (id) REFERENCES dm_page(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_page_view ADD CONSTRAINT dm_page_view_dm_layout_id_dm_layout_id FOREIGN KEY (dm_layout_id) REFERENCES dm_layout(id) ON DELETE SET NULL;
ALTER TABLE dm_record_permission_association_group ADD CONSTRAINT dm_record_permission_association_group_dm_group_id_dm_group_id FOREIGN KEY (dm_group_id) REFERENCES dm_group(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_association_group ADD CONSTRAINT dddi FOREIGN KEY (dm_record_permission_association_id) REFERENCES dm_record_permission_association(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_association_user ADD CONSTRAINT dm_record_permission_association_user_dm_user_id_dm_user_id FOREIGN KEY (dm_user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_association_user ADD CONSTRAINT dddi_2 FOREIGN KEY (dm_record_permission_association_id) REFERENCES dm_record_permission_association(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_group ADD CONSTRAINT dm_record_permission_group_dm_group_id_dm_group_id FOREIGN KEY (dm_group_id) REFERENCES dm_group(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_group ADD CONSTRAINT dddi_4 FOREIGN KEY (dm_record_permission_id) REFERENCES dm_record_permission(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_user ADD CONSTRAINT dm_record_permission_user_dm_user_id_dm_user_id FOREIGN KEY (dm_user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_record_permission_user ADD CONSTRAINT dddi_6 FOREIGN KEY (dm_record_permission_id) REFERENCES dm_record_permission(id) ON DELETE CASCADE;
ALTER TABLE dm_remember_key ADD CONSTRAINT dm_remember_key_dm_user_id_dm_user_id FOREIGN KEY (dm_user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_sent_mail ADD CONSTRAINT dm_sent_mail_dm_mail_template_id_dm_mail_template_id FOREIGN KEY (dm_mail_template_id) REFERENCES dm_mail_template(id) ON DELETE SET NULL;
ALTER TABLE dm_setting_translation ADD CONSTRAINT dm_setting_translation_id_dm_setting_id FOREIGN KEY (id) REFERENCES dm_setting(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_trans_unit ADD CONSTRAINT dm_trans_unit_dm_catalogue_id_dm_catalogue_id FOREIGN KEY (dm_catalogue_id) REFERENCES dm_catalogue(id) ON DELETE CASCADE;
ALTER TABLE dm_user_group ADD CONSTRAINT dm_user_group_dm_user_id_dm_user_id FOREIGN KEY (dm_user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_user_group ADD CONSTRAINT dm_user_group_dm_group_id_dm_group_id FOREIGN KEY (dm_group_id) REFERENCES dm_group(id) ON DELETE CASCADE;
ALTER TABLE dm_user_permission ADD CONSTRAINT dm_user_permission_dm_user_id_dm_user_id FOREIGN KEY (dm_user_id) REFERENCES dm_user(id) ON DELETE CASCADE;
ALTER TABLE dm_user_permission ADD CONSTRAINT dm_user_permission_dm_permission_id_dm_permission_id FOREIGN KEY (dm_permission_id) REFERENCES dm_permission(id) ON DELETE CASCADE;
ALTER TABLE dm_widget_translation ADD CONSTRAINT dm_widget_translation_id_dm_widget_id FOREIGN KEY (id) REFERENCES dm_widget(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE dm_widget ADD CONSTRAINT dm_widget_dm_zone_id_dm_zone_id FOREIGN KEY (dm_zone_id) REFERENCES dm_zone(id) ON DELETE CASCADE;
ALTER TABLE dm_zone ADD CONSTRAINT dm_zone_dm_area_id_dm_area_id FOREIGN KEY (dm_area_id) REFERENCES dm_area(id) ON DELETE CASCADE;
ALTER TABLE order_detail ADD CONSTRAINT order_detail_product_id_product_id FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE order_detail ADD CONSTRAINT order_detail_order_id_orders_id FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE product ADD CONSTRAINT product_photo_dm_media_id FOREIGN KEY (photo) REFERENCES dm_media(id) ON DELETE RESTRICT;
ALTER TABLE product ADD CONSTRAINT product_category_category_id FOREIGN KEY (category) REFERENCES category(id) ON DELETE CASCADE;

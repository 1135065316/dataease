-- 企业版表修改（如果表存在才执行）
SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'xpack_threshold_info') > 0,
    'ALTER TABLE `xpack_threshold_info` ADD COLUMN `show_field_value` tinyint(1) NOT NULL DEFAULT 0 COMMENT ''显示字段值'' AFTER `repeat_send`',
    'SELECT ''Table xpack_threshold_info does not exist, skipping...'' as message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'xpack_threshold_info_snapshot') > 0,
    'ALTER TABLE `xpack_threshold_info_snapshot` ADD COLUMN `show_field_value` tinyint(1) NOT NULL DEFAULT 0 COMMENT ''显示字段值'' AFTER `repeat_send`',
    'SELECT ''Table xpack_threshold_info_snapshot does not exist, skipping...'' as message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'snapshot_visualization_outer_params_target_view_info') > 0,
    'ALTER TABLE `snapshot_visualization_outer_params_target_view_info` ADD COLUMN `match_mode` varchar(255) NULL DEFAULT ''self'' COMMENT ''匹配方式'' AFTER `target_ds_id`',
    'SELECT ''Table snapshot_visualization_outer_params_target_view_info does not exist, skipping...'' as message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'visualization_outer_params_target_view_info') > 0,
    'ALTER TABLE `visualization_outer_params_target_view_info` ADD COLUMN `match_mode` varchar(255) NULL DEFAULT ''self'' COMMENT ''匹配方式'' AFTER `target_ds_id`',
    'SELECT ''Table visualization_outer_params_target_view_info does not exist, skipping...'' as message'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

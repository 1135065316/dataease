-- 重置DataEase数据库脚本
-- 注意：这会删除所有数据！

DROP DATABASE IF EXISTS dataease10;
CREATE DATABASE dataease10 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 使用数据库
USE dataease10;

-- 显示创建成功信息
SELECT 'Database dataease10 has been reset successfully!' as message;
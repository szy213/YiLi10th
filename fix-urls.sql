-- 修复：更新所有图片 URL 扩展名为 .webp（无事务，每条自动提交）
-- 在 Supabase SQL Editor 中全选执行

-- posts 头像
UPDATE posts
SET avatar_url = regexp_replace(avatar_url, '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp')
WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- posts 图片 JSON 数组（不用 $，因为 URL 后面还有引号）
UPDATE posts
SET images = regexp_replace(images, '\.(jpe?g|png|gif|bmp|tiff?)"', '.webp"', 'g')
WHERE images ~ '\.(jpe?g|png|gif|bmp|tiff?)';

-- comments 头像
UPDATE comments
SET avatar_url = regexp_replace(avatar_url, '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp')
WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- materials 图片
UPDATE materials
SET image_url = regexp_replace(image_url, '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp')
WHERE image_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- materials 头像
UPDATE materials
SET avatar_url = regexp_replace(avatar_url, '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp')
WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- material_comments 头像
UPDATE material_comments
SET avatar_url = regexp_replace(avatar_url, '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp')
WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- auth.users 头像
UPDATE auth.users
SET raw_user_meta_data = jsonb_set(
    raw_user_meta_data,
    '{avatar_url}',
    to_jsonb(regexp_replace(raw_user_meta_data->>'avatar_url', '\.(jpe?g|png|gif|bmp|tiff?)$', '.webp'))
)
WHERE raw_user_meta_data->>'avatar_url' ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

-- 验证（应全部返回 0）
SELECT 'posts.avatar_url' AS tbl, count(*) FROM posts WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';
SELECT 'posts.images' AS tbl, count(*) FROM posts WHERE images ~ '\.(jpe?g|png|gif|bmp|tiff?)';
SELECT 'comments.avatar_url' AS tbl, count(*) FROM comments WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';
SELECT 'materials.image_url' AS tbl, count(*) FROM materials WHERE image_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';
SELECT 'materials.avatar_url' AS tbl, count(*) FROM materials WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';
SELECT 'material_comments.avatar_url' AS tbl, count(*) FROM material_comments WHERE avatar_url ~ '\.(jpe?g|png|gif|bmp|tiff?)$';

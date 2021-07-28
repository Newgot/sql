SELECT 
    u.name,
    c.name,
    p.name
FROM users u
LEFT JOIN community_members cm ON cm.user_id = u.id
LEFT JOIN communities c ON c.id = cm.community_id
LEFT JOIN community_member_permissions cmp ON cmp.member_id = cm.id
LEFT JOIN permissions p ON p.id = cmp.permission_id
WHERE (u.name LIKE '%Т%' OR p.name LIKE "articles") AND CHAR_LENGTH(c.name) > 15
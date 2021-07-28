SELECT 
    c.id,
    c.name,
    p.name,
    COUNT(*) as countUsers
FROM communities c
LEFT JOIN community_members cm ON c.id = cm.community_id
LEFT JOIN community_member_permissions cmp ON cm.id = cmp.member_id
LEFT JOIN permissions p ON  cmp.permission_id = p.id
GROUP BY c.name, p.id
HAVING countUsers > 5
ORDER BY c.id DESC, countUsers ASC
LIMIT 100
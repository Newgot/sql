SELECT u.name,
    c.name,
    cm.joined_at
    FROM users u
LEFT JOIN community_members cm ON u.id = cm.user_id
LEFT JOIN communities c ON c.id = cm.community_id
WHERE cm.joined_at > "2013-01-01 00:00:00"
ORDER BY cm.joined_at DESC
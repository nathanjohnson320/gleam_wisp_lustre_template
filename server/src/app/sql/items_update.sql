UPDATE items
SET title = $1,
    status = $2,
    updated_at = NOW()
WHERE id = $3
RETURNING *;
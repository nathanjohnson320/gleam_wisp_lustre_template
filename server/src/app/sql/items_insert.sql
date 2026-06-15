INSERT INTO items (id, title, status, inserted_at, updated_at)
VALUES ($1, $2, $3, NOW(), NOW())
RETURNING *;
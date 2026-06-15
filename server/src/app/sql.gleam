//// This module contains the code to run the sql queries defined in
//// `./src/app/sql`.
//// > 🐿️ This module was generated automatically using v4.6.0 of
//// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
////

import gleam/dynamic/decode
import gleam/time/timestamp.{type Timestamp}
import pog

/// A row you get from running the `items_delete` query
/// defined in `./src/app/sql/items_delete.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.6.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type ItemsDeleteRow {
  ItemsDeleteRow(
    id: String,
    title: String,
    status: String,
    inserted_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// Runs the `items_delete` query
/// defined in `./src/app/sql/items_delete.sql`.
///
/// > 🐿️ This function was generated automatically using v4.6.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn items_delete(
  db: pog.Connection,
  arg_1: String,
) -> Result(pog.Returned(ItemsDeleteRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use title <- decode.field(1, decode.string)
    use status <- decode.field(2, decode.string)
    use inserted_at <- decode.field(3, pog.timestamp_decoder())
    use updated_at <- decode.field(4, pog.timestamp_decoder())
    decode.success(ItemsDeleteRow(
      id:,
      title:,
      status:,
      inserted_at:,
      updated_at:,
    ))
  }

  "DELETE FROM items
WHERE id = $1
RETURNING *;"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `items_insert` query
/// defined in `./src/app/sql/items_insert.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.6.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type ItemsInsertRow {
  ItemsInsertRow(
    id: String,
    title: String,
    status: String,
    inserted_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// Runs the `items_insert` query
/// defined in `./src/app/sql/items_insert.sql`.
///
/// > 🐿️ This function was generated automatically using v4.6.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn items_insert(
  db: pog.Connection,
  arg_1: String,
  arg_2: String,
  arg_3: String,
) -> Result(pog.Returned(ItemsInsertRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use title <- decode.field(1, decode.string)
    use status <- decode.field(2, decode.string)
    use inserted_at <- decode.field(3, pog.timestamp_decoder())
    use updated_at <- decode.field(4, pog.timestamp_decoder())
    decode.success(ItemsInsertRow(
      id:,
      title:,
      status:,
      inserted_at:,
      updated_at:,
    ))
  }

  "INSERT INTO items (id, title, status, inserted_at, updated_at)
VALUES ($1, $2, $3, NOW(), NOW())
RETURNING *;"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.text(arg_2))
  |> pog.parameter(pog.text(arg_3))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `items_list` query
/// defined in `./src/app/sql/items_list.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.6.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type ItemsListRow {
  ItemsListRow(
    id: String,
    title: String,
    status: String,
    inserted_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// Runs the `items_list` query
/// defined in `./src/app/sql/items_list.sql`.
///
/// > 🐿️ This function was generated automatically using v4.6.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn items_list(
  db: pog.Connection,
) -> Result(pog.Returned(ItemsListRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use title <- decode.field(1, decode.string)
    use status <- decode.field(2, decode.string)
    use inserted_at <- decode.field(3, pog.timestamp_decoder())
    use updated_at <- decode.field(4, pog.timestamp_decoder())
    decode.success(ItemsListRow(id:, title:, status:, inserted_at:, updated_at:))
  }

  "SELECT *
FROM items;"
  |> pog.query
  |> pog.returning(decoder)
  |> pog.execute(db)
}

/// A row you get from running the `items_update` query
/// defined in `./src/app/sql/items_update.sql`.
///
/// > 🐿️ This type definition was generated automatically using v4.6.0 of the
/// > [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub type ItemsUpdateRow {
  ItemsUpdateRow(
    id: String,
    title: String,
    status: String,
    inserted_at: Timestamp,
    updated_at: Timestamp,
  )
}

/// Runs the `items_update` query
/// defined in `./src/app/sql/items_update.sql`.
///
/// > 🐿️ This function was generated automatically using v4.6.0 of
/// > the [squirrel package](https://github.com/giacomocavalieri/squirrel).
///
pub fn items_update(
  db: pog.Connection,
  arg_1: String,
  arg_2: String,
  arg_3: String,
) -> Result(pog.Returned(ItemsUpdateRow), pog.QueryError) {
  let decoder = {
    use id <- decode.field(0, decode.string)
    use title <- decode.field(1, decode.string)
    use status <- decode.field(2, decode.string)
    use inserted_at <- decode.field(3, pog.timestamp_decoder())
    use updated_at <- decode.field(4, pog.timestamp_decoder())
    decode.success(ItemsUpdateRow(
      id:,
      title:,
      status:,
      inserted_at:,
      updated_at:,
    ))
  }

  "UPDATE items
SET title = $1,
    status = $2,
    updated_at = NOW()
WHERE id = $3
RETURNING *;"
  |> pog.query
  |> pog.parameter(pog.text(arg_1))
  |> pog.parameter(pog.text(arg_2))
  |> pog.parameter(pog.text(arg_3))
  |> pog.returning(decoder)
  |> pog.execute(db)
}

import app/sql.{
  type ItemsDeleteRow, type ItemsInsertRow, type ItemsListRow,
  type ItemsUpdateRow,
}
import gleam/dynamic/decode
import gleam/result
import gleam/time/timestamp
import models/item.{type Item, Item, Uncompleted, string_to_item_status}

fn from_row_fields(
  id: String,
  title: String,
  status_string: String,
  inserted_at: timestamp.Timestamp,
  updated_at: timestamp.Timestamp,
) -> Item {
  let status = result.unwrap(string_to_item_status(status_string), Uncompleted)
  Item(
    id: id,
    title: title,
    status: status,
    inserted_at: inserted_at,
    updated_at: updated_at,
  )
}

pub fn from_row(row: ItemsListRow) -> Item {
  from_row_fields(
    row.id,
    row.title,
    row.status,
    row.inserted_at,
    row.updated_at,
  )
}

pub fn from_row_insert(row: ItemsInsertRow) -> Item {
  from_row_fields(
    row.id,
    row.title,
    row.status,
    row.inserted_at,
    row.updated_at,
  )
}

pub fn from_row_delete(row: ItemsDeleteRow) -> Item {
  from_row_fields(
    row.id,
    row.title,
    row.status,
    row.inserted_at,
    row.updated_at,
  )
}

pub fn from_row_update(row: ItemsUpdateRow) -> Item {
  from_row_fields(
    row.id,
    row.title,
    row.status,
    row.inserted_at,
    row.updated_at,
  )
}

pub fn from() -> decode.Decoder(#(String, String, String, String, String)) {
  use id <- decode.field(0, decode.string)
  use title <- decode.field(1, decode.string)
  use status <- decode.field(2, decode.string)
  use inserted_at <- decode.field(3, decode.string)
  use updated_at <- decode.field(4, decode.string)
  decode.success(#(id, title, status, inserted_at, updated_at))
}

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel)]
#[sea_orm(table_name = "log_entries")]
pub struct Model {
    #[sea_orm(primary_key)]
    pub id: i32,
    pub remote_addr: String,
    pub remote_user: String,
    pub time_local: DateTimeUtc, // 12/Jun/2026:13:12:06 +0000
    pub http_method: String,
    pub request_path: String,
    pub http_version: String,
    pub status_code: String,
    pub http_referer: String,
    pub http_user_agent: String,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {}

impl ActiveModelBehavior for ActiveModel {}

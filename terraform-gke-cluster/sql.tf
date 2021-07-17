#cat main.tf

resource "google_sql_database_instance" "master" {
  name = "wordpress-db-instance"
  database_version = "MYSQL_5_7"
  region = "${var.region}"
  settings {
    tier = "db-n1-standard-2"
  }
}

resource "google_sql_database" "database" {
  name = "wordpress-db"
  instance = "${google_sql_database_instance.master.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "${google_sql_database_instance.master.name}"
  host = "%"
  password = "W0rdPr355"
}

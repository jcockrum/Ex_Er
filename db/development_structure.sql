CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "start_at" datetime, "end_at" datetime, "all_day" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "exercises" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "exer_type" varchar(255), "set" integer, "repetition" integer, "target_time" time, "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "email" varchar(255), "password_hash" varchar(255), "password_salt" varchar(255), "created_at" datetime, "updated_at" datetime, "height" integer, "weight" integer, "dob" integer, "is_admin" boolean, "waist" integer);
CREATE TABLE "workouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "days" integer, "frame" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime, "start_date" varchar(255));
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20111203021701');

INSERT INTO schema_migrations (version) VALUES ('20111127064341');

INSERT INTO schema_migrations (version) VALUES ('20111201090818');

INSERT INTO schema_migrations (version) VALUES ('20111129081736');

INSERT INTO schema_migrations (version) VALUES ('20111202083011');

INSERT INTO schema_migrations (version) VALUES ('20111129075954');

INSERT INTO schema_migrations (version) VALUES ('20111202082900');

INSERT INTO schema_migrations (version) VALUES ('20111129080009');

INSERT INTO schema_migrations (version) VALUES ('20111129080027');

INSERT INTO schema_migrations (version) VALUES ('20111205045617');

INSERT INTO schema_migrations (version) VALUES ('20111207093421');

INSERT INTO schema_migrations (version) VALUES ('20111207103125');
USE jsp_poll_project;

DROP TABLE IF EXISTS poll_item;
DROP TABLE IF EXISTS poll;

CREATE TABLE poll(
  poll_id int PRIMARY KEY AUTO_INCREMENT,
  question varchar(200) NOT null,
  start_date date NOT null,
  end_date date NOT NULL,
  write_date date NOT NULL DEFAULT (current_date),
  is_checkbox boolean NOT NULL DEFAULT false,
  is_active boolean DEFAULT true
);

CREATE TABLE poll_item (
  poll_id int NOT NULL,
  item_id int NOT NULL,
  item_name varchar(50) NOT NULL,
  count int NOT NULL DEFAULT 0,
  PRIMARY KEY (poll_id, item_id),
  FOREIGN KEY (poll_id) REFERENCES poll(poll_id) ON DELETE CASCADE
)

CREATE TABLE faces (
    face_id     SERIAL PRIMARY KEY,
    photo       BYTEA NOT NULL
);

CREATE TABLE heartbeats (
    heartbeat_id    SERIAL PRIMARY KEY,
    beat_sequence   FLOAT[] NOT NULL
);

CREATE TABLE users (
    user_id     SERIAL PRIMARY KEY,
    first_name  VARCHAR NOT NULL,
    last_name   VARCHAR NOT NULL,
    gender      VARCHAR NOT NULL,
    age         INT NOT NULL,
    ethnicity   VARCHAR NOT NULL
);

CREATE TABLE records (
    record_id       SERIAL PRIMARY KEY,
    user_id         INT,
    face_id         INT,
    heartbeat_id    INT,
    emotion         VARCHAR,

    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(face_id) REFERENCES faces(face_id),
    FOREIGN KEY(heartbeat_id) REFERENCES heartbeats(heartbeat_id)
);
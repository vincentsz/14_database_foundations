-- Examine the data below:
-- Album Name 	Released 	Genre 	Label 	Singer Name
-- Born to Run 	August 25, 1975 	Rock and roll 	Columbia 	Bruce Springsteen
-- Purple Rain 	June 25, 1984 	Pop, R&B, Rock 	Warner Bros 	Prince
-- Born in the USA 	June 4, 1984 	Rock and roll, pop 	Columbia 	Bruce Springsteen
-- Madonna 	July 27, 1983 	Dance-pop, post-disco 	Warner Bros 	Madonna
-- True Blue 	June 30, 1986 	Dance-pop, Pop 	Warner Bros 	Madonna
-- Elvis 	October 19, 1956 	Rock and roll, Rhythm and Blues 	RCA Victor 	Elvis Presley
-- Sign o' the Times 	March 30, 1987 	Pop, R&B, Rock, Funk 	Paisley Park, Warner Bros 	Prince
-- G.I. Blues 	October 1, 1960 	Rock and roll, Pop 	RCA Victor 	Elvis Presley

-- We want to create an albums table to hold all the above data except the singer name, 
-- and create a reference from the albums table to the singers table to link each album to the correct singer. 
-- Write the necessary SQL statements to do this and to populate the table with data. Assume Album Name, Genre, 
-- and Label can hold strings up to 100 characters. 
-- Include an auto-incrementing id column in the albums table.

-- ALTER TABLE singers ADD PRIMARY KEY (id);

ALTER TABLE singers
  ADD CONSTRAINT unique_id UNIQUE (id);

\d singers;

CREATE TABLE albums (
  id serial, 
  album_name varchar(100), 
  -- released timestamp,
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int, 
  PRIMARY KEY (id),
  FOREIGN KEY (singer_id)
    REFERENCES singers(id)
    -- ON DELETE CASCADE
  );

  INSERT INTO albums (album_name, released, genre, label, singer_id)
  VALUES ('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 1),
  ('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 9),
  ('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1),
  ('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 8),
  ('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 8),
  ('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 10),
  ('Sign o'' the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 9),
  ('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 10);
 

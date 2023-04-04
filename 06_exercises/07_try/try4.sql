pg_dump -d extrasolar_2 -t stars --inserts > stars.sql
pg_dump -d extrasolar_2 -t planets --inserts > planets.sql
pg_dump -d extrasolar_2 -t moons --inserts > moons.sql
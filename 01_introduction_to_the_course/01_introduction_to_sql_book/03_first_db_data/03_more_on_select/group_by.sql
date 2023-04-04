SELECT count(id) FROM users WHERE enabled = true;
SELECT count(id) FROM users WHERE enabled = false;

/* group by */ 
SELECT enabled, count(id) FROM users GROUP BY enabled;


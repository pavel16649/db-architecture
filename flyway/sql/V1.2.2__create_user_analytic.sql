CREATE USER analytic WITH PASSWORD 'analytic';
GRANT CONNECT ON DATABASE postgres TO analytic;
GRANT USAGE ON SCHEMA public TO analytic;
GRANT SELECT ON quest_progress TO analytic;
create database kaizen;
CREATE USER kaizen_admin WITH PASSWORD 'xMK7znCj3E5BHRN9';
GRANT CONNECT ON DATABASE kaizen TO kaizen_admin;
GRANT CREATE ON DATABASE kaizen TO kaizen_admin;
GRANT USAGE, CREATE ON SCHEMA kaizen.public TO kaizen_admin 
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO kaizen_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO kaizen_admin;

create database kaizen_test;
CREATE USER kaizen_test_user WITH PASSWORD 'Yn8RNJk6uFpVXdM5E7sWjw';
GRANT CONNECT ON DATABASE kaizen_test TO kaizen_test_user;
GRANT CREATE ON DATABASE kaizen_test TO kaizen_test_user;
GRANT USAGE, CREATE ON SCHEMA "kaizen_test"."public" TO kaizen_test_user 
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO kaizen_test_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO kaizen_test_user;
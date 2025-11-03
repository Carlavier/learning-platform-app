-- =====================================================
-- DEMO QUERIES - How to use the password functions
-- =====================================================

-- Example 1: Register a new user
-- SELECT * FROM register_user('newuser@example.com', 'myPassword123', 'New User', 'user');

-- Example 2: Verify login (returns user if credentials are correct)
-- SELECT * FROM verify_login('user@example.com', 'user123');

-- Example 3: Test wrong password (returns no rows)
-- SELECT * FROM verify_login('user@example.com', 'wrongpassword');

-- Example 4: Change password
-- SELECT change_password('00000000-0000-0000-0000-000000000002', 'user123', 'newPassword456');

-- Example 5: Direct SQL verification (alternative method)
-- SELECT id, email, name, role, created_at
-- FROM users
-- WHERE email = 'user@example.com'
--   AND password_hash = crypt('user123', password_hash);

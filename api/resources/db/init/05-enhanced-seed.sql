-- Seed data with enhanced lessons (applications and questions)

-- This will add sample lessons with real-world applications and quiz questions
-- Run this after 04-lesson-enhancements.sql

DO $$
DECLARE
    v_admin_id UUID;
    v_lesson1_id BIGINT;
    v_lesson2_id BIGINT;
    v_question1_id BIGINT;
    v_question2_id BIGINT;
BEGIN
    -- Get admin user
    SELECT id INTO v_admin_id FROM users WHERE role = 'admin' LIMIT 1;

    IF v_admin_id IS NULL THEN
        RAISE EXCEPTION 'No admin user found. Please ensure seed data is loaded first.';
    END IF;

    -- Create lesson 1 with applications and questions
    INSERT INTO lessons (title, description, content, category, status, created_by, summary, image_url)
    VALUES (
        'Introduction to JavaScript',
        'Learn the fundamentals of JavaScript programming language',
        '# JavaScript Basics\n\nJavaScript is a versatile programming language that powers the modern web...',
        'Programming',
        'published',
        v_admin_id,
        'Master JavaScript fundamentals including variables, functions, and control flow',
        'https://images.unsplash.com/photo-1579468118864-1b9ea3c0db4a?w=800'
    )
    RETURNING id INTO v_lesson1_id;

    -- Add applications for lesson 1
    INSERT INTO lesson_applications (lesson_id, title, description, display_order) VALUES
    (v_lesson1_id, 'Web Development', 'JavaScript is essential for creating interactive and dynamic websites. Used by 98% of all websites.', 0),
    (v_lesson1_id, 'Server-Side Programming', 'Node.js allows JavaScript to run on servers, enabling full-stack development with a single language.', 1),
    (v_lesson1_id, 'Mobile App Development', 'React Native and other frameworks use JavaScript to build cross-platform mobile applications.', 2);

    -- Add questions for lesson 1
    INSERT INTO lesson_questions (lesson_id, question_text, display_order)
    VALUES (v_lesson1_id, 'What is JavaScript primarily used for?', 0)
    RETURNING id INTO v_question1_id;

    INSERT INTO question_choices (question_id, choice_text, is_correct, display_order) VALUES
    (v_question1_id, 'Making web pages interactive', TRUE, 0),
    (v_question1_id, 'Designing databases', FALSE, 1),
    (v_question1_id, 'Creating operating systems', FALSE, 2),
    (v_question1_id, 'Hardware programming', FALSE, 3);

    INSERT INTO lesson_questions (lesson_id, question_text, display_order)
    VALUES (v_lesson1_id, 'Which of these is NOT a JavaScript data type?', 1)
    RETURNING id INTO v_question2_id;

    INSERT INTO question_choices (question_id, choice_text, is_correct, display_order) VALUES
    (v_question2_id, 'Integer', TRUE, 0),
    (v_question2_id, 'String', FALSE, 1),
    (v_question2_id, 'Boolean', FALSE, 2),
    (v_question2_id, 'Object', FALSE, 3);

    -- Create lesson 2 with applications and questions
    INSERT INTO lessons (title, description, content, category, status, created_by, summary, image_url)
    VALUES (
        'Python for Data Science',
        'Introduction to Python programming for data analysis and machine learning',
        '# Python Data Science\n\nPython has become the go-to language for data science...',
        'Data Science',
        'published',
        v_admin_id,
        'Learn Python libraries like NumPy, Pandas, and Matplotlib for data analysis',
        'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800'
    )
    RETURNING id INTO v_lesson2_id;

    -- Add applications for lesson 2
    INSERT INTO lesson_applications (lesson_id, title, description, display_order) VALUES
    (v_lesson2_id, 'Data Analysis', 'Python is widely used in finance, healthcare, and research for analyzing large datasets.', 0),
    (v_lesson2_id, 'Machine Learning', 'Libraries like TensorFlow and scikit-learn make Python the top choice for AI development.', 1),
    (v_lesson2_id, 'Automation', 'Python scripts automate repetitive tasks, saving time in various industries.', 2);

    -- Add questions for lesson 2
    INSERT INTO lesson_questions (lesson_id, question_text, display_order)
    VALUES (v_lesson2_id, 'Which library is commonly used for data manipulation in Python?', 0)
    RETURNING id INTO v_question1_id;

    INSERT INTO question_choices (question_id, choice_text, is_correct, display_order) VALUES
    (v_question1_id, 'Pandas', TRUE, 0),
    (v_question1_id, 'Django', FALSE, 1),
    (v_question1_id, 'Flask', FALSE, 2),
    (v_question1_id, 'Requests', FALSE, 3);

    INSERT INTO lesson_questions (lesson_id, question_text, display_order)
    VALUES (v_lesson2_id, 'What is NumPy primarily used for?', 1)
    RETURNING id INTO v_question2_id;

    INSERT INTO question_choices (question_id, choice_text, is_correct, display_order) VALUES
    (v_question2_id, 'Numerical computing and arrays', TRUE, 0),
    (v_question2_id, 'Web development', FALSE, 1),
    (v_question2_id, 'Game development', FALSE, 2),
    (v_question2_id, 'Mobile app development', FALSE, 3);

    RAISE NOTICE 'Enhanced lesson seed data created successfully!';
    RAISE NOTICE 'Lesson 1 ID: %', v_lesson1_id;
    RAISE NOTICE 'Lesson 2 ID: %', v_lesson2_id;
END $$;

/* ========
   Task 2  
   ======== */

-- show rows do not have title inside context
SELECT 
  title,
  context,
  INSTR(context, title) -- no match if there is no match 
FROM staging.squad
WHERE NOT regexp_matches(context, title); -- two arguments are string and substring

/* =======
   Task 3 
   ======= */

-- show rows if context starting with title

-- use LIKE operator with wildcard %
SELECT
  *
FROM staging.squad
WHERE context LIKE CONCAT(title, '%'); 
-- check the results for Southern_California
-- the results are not ok due to the wildcard _

-- if you use regular expression functions, underscore will be a literal character
SELECT *
FROM staging.squad
WHERE regexp_matches(context, CONCAT('^', title)); 

/* =======
   Task 4
   ======= */

-- show a new column which is the first answer from the AI model
-- without pattern matching
SELECT 
 answers[18:], -- slicing
 answers[18], -- indexing
 CASE 
  WHEN answers[18] = ',' THEN NULL
  ELSE answers[18:]
 END AS striped_answers,
 INSTR(striped_answers, '''') AS first_quotation_index, -- a single quoation needs to be typed as '',
 striped_answers[:first_quotation_index-1] AS first_answers,
 answers
FROM staging.squad;

/* =========
   Task 5
   ========= */

-- generate the same results from task 4, but with pattern matching
SELECT
    answers,
    -- capture the outer pattern first, and stop when detecting a character not specified in the pattern
    -- extract the first group in (), not everything in ''
    -- the pattern: ' multiple characters not ' up to ' or ', 
    regexp_extract(answers, '''([^'']+)''') AS first_answer,
    regexp_extract(answers, '''([^'']+)'',') AS first_answer,
    regexp_extract(answers, '''([A-Za-z0-9 ,]+)'',') AS first_answer, -- uppercase, lowercase, digits, space, comma
    regexp_extract(answers, '''([^'']+)''', 1) AS first_answer,
    regexp_extract(answers, '''([^'']+)'',', 1) AS first_answer,
FROM staging.squad;
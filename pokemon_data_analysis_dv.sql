# In this SQL, I'm querying a dataset of the first 6 generations of pokemon to discover interesting statistics I had always wondered about as a child.

# 1. The first step is to manually create a data table by modifying the data source's SQL to match MySQL syntax.

# 2. Check to see how many nulls are in each column to see if we need to filter any pokemon out.

SELECT
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Number IS NULL) AS col1_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Name IS NULL) AS col2_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Type_1 IS NULL) AS col3_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Type_2 IS NULL) AS col4_nulls,
	(SELECT COUNT(*) FROM sql_projects.pokemon WHERE Total IS NULL) AS col5_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE HP IS NULL) AS col6_nulls,
	(SELECT COUNT(*) FROM sql_projects.pokemon WHERE Attack IS NULL) AS col7_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Defense IS NULL) AS col8_nulls,
	(SELECT COUNT(*) FROM sql_projects.pokemon WHERE Sp_Atk IS NULL) AS col9_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Sp_Def IS NULL) AS col10_nulls,
	(SELECT COUNT(*) FROM sql_projects.pokemon WHERE Speed IS NULL) AS col11_nulls,
    (SELECT COUNT(*) FROM sql_projects.pokemon WHERE Generation IS NULL) AS col12_nulls,
	(SELECT COUNT(*) FROM sql_projects.pokemon WHERE Legendary IS NULL) AS col13_nulls
FROM
	sql_projects.pokemon
GROUP BY
	col1_nulls,
    col2_nulls,
    col3_nulls,
    col4_nulls,
    col5_nulls,
    col6_nulls,
    col7_nulls,
    col8_nulls,
    col9_nulls,
    col10_nulls,
    col11_nulls,
    col12_nulls,
    col13_nulls;

# Only col4 (Type_2) has nulls (386 of them), which is fine because this means that 386 pokemon have only 1 type. 

# Let's find the top 10 pokemon per stat category.

# 4. Who are the top 10 pokemon with the most HP?

SELECT
	Name,
    HP
FROM
	sql_projects.pokemon
ORDER BY
	HP DESC
LIMIT 10;

# 5. Who are the top 10 strongest pokemon in terms of physical attacks?

SELECT 
	Name,
    Attack
FROM
	sql_projects.pokemon
ORDER BY 
	Attack DESC
LIMIT 10;

# 6. Who are the top 10 physically defensive pokemon?

SELECT 
	Name,
    Defense
FROM
	sql_projects.pokemon
ORDER BY 
	Defense DESC
LIMIT 10;

# 7. Who are the top 10 strongest pokemon in terms of special (projectile) attacks?

SELECT 
	Name,
    Sp_Atk
FROM
	sql_projects.pokemon
ORDER BY 
	Sp_Atk DESC
LIMIT 10;


# 8. Who are the top 10 specially defensive pokemon?

SELECT 
	Name,
    Sp_Def
FROM
	sql_projects.pokemon
ORDER BY 
	Sp_Def DESC
LIMIT 10;

# 9. Who are the top 10 fastest pokemon?

SELECT 
	Name,
    Speed
FROM
	sql_projects.pokemon
ORDER BY 
	Speed DESC
LIMIT 10;


# 10. Who are the top 10 pokemon with the highest stat totals?

SELECT
	Name,
    Total
FROM
	sql_projects.pokemon
ORDER BY 
	Total DESC
LIMIT 10;

# 11. Who are the top 10 pokemon with the highest stat totals that are not legendary or mega pokemon?

SELECT
	Name,
    Total
FROM
	sql_projects.pokemon
WHERE
	Legendary = 'False' AND
    Name NOT LIKE '%Mega%'
ORDER BY 
	Total DESC
LIMIT 10;

# 12. Which pokemon types have the highest average stat total?

SELECT
	Type_1,
	ROUND(AVG(Total)) AS avg_total_stats
FROM
	sql_projects.pokemon
GROUP BY
	Type_1
ORDER BY
	avg_total_stats DESC;
    
# 13. What is the average stat total in this dataset?

SELECT
	AVG(Total) AS avg_total_stats
FROM
	sql_projects.pokemon;

# 14. Let's determine how many pokemon are above average, around average, or below average.

SELECT
    CASE
		WHEN Total > 436 THEN 'above_avg'
        WHEN Total BETWEEN 430 AND 436 THEN 'around_avg'
        WHEN Total < 430 THEN 'below_avg'
	END AS total_stats_category,
    COUNT(*) AS num_pokemon
FROM
	sql_projects.pokemon
GROUP BY
	total_stats_category;
    
# 15. How many generations of pokemon are there in this dataset and how many pokemon are in each generation?

SELECT
	Generation,
    COUNT(Generation) AS num_pokemon
FROM
	sql_projects.pokemon
GROUP BY 
	Generation;
	
# 16. Which pokemon have the highest stat total for their generation?

SELECT
	(SELECT Name FROM sql_projects.pokemon WHERE Generation = 1 ORDER BY Total DESC LIMIT 1) AS gen1_pokemon,
    (SELECT Name FROM sql_projects.pokemon WHERE Generation = 2 ORDER BY Total DESC LIMIT 1) AS gen2_pokemon,
    (SELECT Name FROM sql_projects.pokemon WHERE Generation = 3 ORDER BY Total DESC LIMIT 1) AS gen3_pokemon,
    (SELECT Name FROM sql_projects.pokemon WHERE Generation = 4 ORDER BY Total DESC LIMIT 1) AS gen4_pokemon,
    (SELECT Name FROM sql_projects.pokemon WHERE Generation = 5 ORDER BY Total DESC LIMIT 1) AS gen5_pokemon,
    (SELECT Name FROM sql_projects.pokemon WHERE Generation = 6 ORDER BY Total DESC LIMIT 1) AS gen6_pokemon
FROM
	sql_projects.pokemon
LIMIT 1;

# 17. Which pokemon type has the highest stat total for their generation?

SELECT
	(SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 1 ORDER BY Total DESC LIMIT 1) AS gen1_pokemon,
    (SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 2 ORDER BY Total DESC LIMIT 1) AS gen2_pokemon,
    (SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 3 ORDER BY Total DESC LIMIT 1) AS gen3_pokemon,
    (SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 4 ORDER BY Total DESC LIMIT 1) AS gen4_pokemon,
    (SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 5 ORDER BY Total DESC LIMIT 1) AS gen5_pokemon,
    (SELECT Type_1 FROM sql_projects.pokemon WHERE Generation = 6 ORDER BY Total DESC LIMIT 1) AS gen6_pokemon
FROM
	sql_projects.pokemon
LIMIT 1;


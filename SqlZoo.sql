0.0) SELECT population FROM world WHERE name = 'Germany'
0.1) SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
0.2) SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000

1.0) SELECT name FROM world WHERE name LIKE 'Y%'
1.1) SELECT name FROM world WHERE name LIKE '%y'
1.2) SELECT name FROM world WHERE name LIKE '%x%'
1.3) SELECT name FROM world WHERE name LIKE '%land'
1.4) SELECT name FROM world WHERE name LIKE 'c%ia'
1.5) SELECT name FROM world WHERE name LIKE '%oo%'
1.6) SELECT name FROM world WHERE name LIKE '%a%a%a%'
1.7) SELECT name FROM world WHERE name LIKE '_t%'ORDER BY name
1.8) SELECT name FROM world WHERE name LIKE '%o__o%'
1.9) SELECT name FROM world WHERE name LIKE '____'
1.10) SELECT name FROM world WHERE name = capital
1.11) SELECT name FROM world WHERE capital LIKE concat(name, ' City')
1.12) SELECT capital, name FROM world WHERE capital LIKE concat('%',name,'%')
1.13) SELECT capital, name FROM world WHERE capital LIKE concat(name, '_%')
1.14) SELECT name, REPLACE(capital, name,'') FROM world WHERE capital LIKE concat(name, '_%')

2.0) SELECT name, continent, population FROM world
2.1) SELECT name FROM world WHERE population >= 200000000
2.2) SELECT name, gdp/population AS per_capita_GDP FROM world WHERE population >= 200000000
2.3) SELECT name, population/1000000 FROM world WHERE continent = 'South America'
2.4) SELECT name, population FROM world WHERE name IN ('France', 'Germany','Italy')
2.5) SELECT name FROM world WHERE name LIKE '%United%'
2.6) SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000
2.7) SELECT name, population, areaFROM worldWHERE area > 3000000 XOR population > 250000000
2.8) SELECT name, ROUND(population/1000000,2) , ROUND(gdp/1000000000,2) FROM world WHERE continent = 'South America'
2.9) SELECT name, ROUND(gdp/population,-3) FROM world WHERE gdp >= 1000000000000
2.10) SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital)
2.11) SELECT name, capital FROM world WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital
2.12) SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'

3.0) SELECT yr, subject, winner FROM nobel WHERE yr = 1950
3.1) SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
3.2) SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'
3.3) SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000
3.4) SELECT * FROM nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 and 1989
3.5) SELECT * FROM nobel WHERE winner in ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
3.6) SELECT winner FROM nobel WHERE winner LIKE 'John %'
3.7) SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984
3.8) SELECT * FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')
3.9) SELECT * FROM nobel WHERE yr < 1910 AND subject = 'Medicine' OR subject = 'Literature' AND yr >= 2004
3.10) SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'
3.11) SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL'
3.12) SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Chemistry','Physics'), subject, winner

4.0) SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')
4.1) SELECT name FROM world WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')
4.2) SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN('Argentina', 'Australia')) ORDER BY name
4.3) SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')
4.4) SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100,0),'%') AS 'Of Germany' FROM world WHERE continent = 'Europe'
4.5) SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND continent='Europe')
4.6) SELECT continent, name, area FROM world x WHERE area >= ALL(SELECT area FROM world y WHERE y.continent = x.continent AND area > 0)
4.7) SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)
5.0) SELECT SUM(population) FROM world
5.1) SELECT DISTINCT continent FROM world
5.2) SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
5.3) SELECT COUNT(name) FROM world WHERE area >= 1000000
5.4) SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
5.5) SELECT continent, COUNT(name) FROM world GROUP BY continent
5.6) SELECT continent, COUNT(name) FROM world WHERE population >=10000000 GROUP BY continent
5.7) SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000

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
3.10) SELECT * FROM nobel WHERE winner = 'PETER GR??NBERG'
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

6.0) SELECT matchid, player FROM goal WHERE teamid = 'GER'
6.1) SELECT id,stadium,team1,team2 FROM game WHERE id = 1012
6.2) SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (game.id=goal.matchid) WHERE teamid= 'ger'
6.3) SELECT team1, team2, player FROM game JOIN goal ON (game.id=goal.matchid) WHERE player LIKE 'Mario%'
6.4) SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON id = teamid WHERE gtime<=10
6.5) SELECT mdate, teamname FROM game JOIN eteam ON eteam.id = game.team1 WHERE coach = 'Fernando Santos'
6.6) SELECT player FROM goal JOIN game ON matchid = game.id WHERE stadium = 'National Stadium, Warsaw'
6.7) SELECT DISTINCT player FROM goal JOIN game ON id = matchid WHERE (team1 = 'GER' OR team2 ='GER') AND (teamid <> 'GER')
6.8) SELECT teamname, COUNT(teamid) AS Goals FROM goal JOIN eteam ON teamid = id GROUP BY teamname
6.9) SELECT stadium, COUNT(stadium) FROM game JOIN goal ON id = matchid GROUP BY stadium
6.10) SELECT id, mdate, COUNT(gtime) FROM game JOIN goal ON id = matchid WHERE (team1 = 'POL' OR team2='POL') GROUP BY id, mdate
6.11) SELECT id, mdate, COUNT(*) FROM game JOIN goal ON id = matchid WHERE teamid = 'GER' GROUP BY id, mdate
6.12) SELECT mdate,team1,SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate,id,team1,team2

7.0) SELECT id, title FROM movie WHERE yr=1962
7.1) SELECT yr FROM movie WHERE title='Citizen Kane'
7.2) SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr
7.3) SELECT id FROM actor where name = 'Glenn Close'
7.4) select id from movie where title like 'casablanca'
7.5) select name from actor join casting on id = actorid where movieid= 11768
7.6) select name from actor join casting on id = actorid where movieid= (select id from movie where title='Alien')
7.7) select title from actor join casting on id = actorid join movie on movieid = movie.id where name = 'Harrison Ford'
7.8) select title from actor join casting on id = actorid join movie on movieid = movie.id where name = 'Harrison Ford' and ord <> 1
7.9) select title, name from actor join casting on id = actorid join movie on movieid = movie.id where ord = 1 and yr = 1962
7.10) SELECT yr, count(title) FROM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.idWHERE name =  'Rock Hudson'GROUP BY yr HAVING count(title) >2
7.11) SELECT title, name FROM movie JOIN casting ON (movie.id = movieid) JOIN actor ON (actorid = actor.id) WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN ( SELECT id FROM actor WHERE name='Julie Andrews')) AND ord = 1
7.12) SELECT name FROM actor JOIN casting ON actor.id = actorid AND ord = 1 GROUP BY id,name,actorid HAVING count(actorid)>=15 ORDER BY name
7.13) SELECT title, COUNT(actorid) FROM movie JOIN casting ON movieid = movie.id WHERE yr = 1978 GROUP BY title ORDER BY COUNT(actorid) DESC, title
7.14) SELECT name from casting join actor on actorid = actor.id where movieid in (SELECT movieid FROM casting WHERE actorid IN (select id from actor where name = 'Art Garfunkel')) and name <> 'Art Garfunkel'

8.0) SELECT name FROM teacher WHERE dept IS NULL
8.1) SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)
8.2) SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON dept.id = dept
8.3) SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON dept.id = dept
8.4) SELECT name, COALESCE(mobile,'07986 444 2266')FROM teacher
8.5) SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON dept.id = dept
8.6) SELECT COUNT(name), COUNT(mobile) FROM teacher
8.7) SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = dept GROUP BY dept.name
8.8) SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END newname FROM teacher
8.9) SELECT name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END newname FROM teacher

+8.0) SELECT A_STRONGLY_AGREE FROM nss WHERE question='Q01' AND institution='Edinburgh Napier University' AND subject='(8) Computer Science'
+8.1) SELECT institution,subject FROM nss WHERE question='Q15' and score >=100
+8.2) SELECT institution,score FROM nss WHERE question='Q15' AND score < 50 AND subject='(8) Computer Science'
+8.3) SELECT subject, SUM(response) FROM nss WHERE question='Q22' AND subject IN ('(8) Computer Science','(H) Creative Arts and Design') GROUP BY subject
+8.4) SELECT subject , SUM(A_STRONGLY_AGREE*response/100) FROM nss WHERE question='Q22' AND subject IN ('(8) Computer Science','(H) Creative Arts and Design') GROUP BY subject 
+8.5) SELECT  subject,ROUND(SUM((A_STRONGLY_AGREE * response)) / SUM(response),0) FROM nss WHERE question='Q22' AND subject IN ('(8) Computer Science','(H) Creative Arts and Design') GROUP BY subject
+8.6) SELECT institution, ROUND(SUM(score*response) / SUM(response),0) FROM nss WHERE question='Q22' AND (institution LIKE '%Manchester%') GROUP BY institution ORDER BY institution
+8.7) SELECT institution, sum(sample), sum(case when subject ='(8) Computer Science' then sample else 0 end) comp from nss where institution like '%Manchester%' AND question = 'Q01' Group by institution;

-9.0) SELECT lastName, party, votes FROM ge WHERE constituency = 'S14000024' AND yr = 2017 order by votes desc
-9.1) SELECT party, votes, RANK() OVER (ORDER BY votes DESC) as posn FROM ge WHERE constituency = 'S14000024' AND yr = 2017 ORDER BY party
-9.2) SELECT yr,party, votes, RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn FROM ge WHERE constituency = 'S14000021' ORDER BY party,yr
-9.3) SELECT constituency, party, votes, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn FROM ge WHERE constituency BETWEEN 'S14000021' AND 'S14000026' AND yr  = 2017 ORDER BY posn, constituency 
-9.4) SELECT constituency,party FROM (SELECT constituency, party, RANK() over (partition by constituency order by votes desc) as r FROM ge WHERE constituency BETWEEN 'S14000021' AND 'S14000026' yr  = 2017 ORDER BY r , constituency) x WHERE x.r = 1
-9.5) select party,count(1) from (select constituency,party from (SELECT constituency,party, votes, RANK() over (partition by constituency order by votes desc) as r FROM ge WHERE constituency like 'S%' AND yr  = 2017 ORDER BY r , constituency) x where x.r=1) y group by party

+9.0) SELECT name, DAY(whn), confirmed, deaths, recovered FROM covid WHERE name = 'Spain' AND MONTH(whn) = 3 ORDER BY whn
+9.1) SELECT name, DAY(whn), confirmed, LAG(confirmed,1) OVER (PARTITION BY name ORDER BY whn) FROM covid WHERE name = 'Italy' AND MONTH(whn) = 3 ORDER BY whn
+9.2) SELECT name, DAY(whn), confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) FROM covid WHERE name = 'Italy' AND MONTH(whn) = 3 ORDER BY whn
+9.3) SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed - LAG(confirmed,1) over (PARTITION BY name ORDER BY whn) FROM covid WHERE name = 'Italy' AND WEEKDAY(whn) = 0 ORDER BY whn
+9.4) SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), tw.confirmed - lw.confirmed FROM covid tw LEFT JOIN covid lw ON DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn AND tw.name=lw.name WHERE tw.name = 'Italy' AND WEEKDAY(tw.whn) = 0 ORDER BY tw.whn
+9.5) SELECT name, confirmed, RANK() OVER (ORDER BY confirmed DESC) rc, deaths, RANK() OVER (ORDER BY deaths DESC) rd FROM covid WHERE whn = '2020-04-20' ORDER BY confirmed DESC
+9.6) SELECT  world.name, ROUND(100000*confirmed/population,0), RANK() OVER(ORDER BY confirmed/population) FROM covid JOIN world ON covid.name=world.name WHERE whn = '2020-04-20' AND population > 10000000 ORDER BY population DESC

9.0) SELECT COUNT(*) FROM stops
9.1) SELECT id FROM stops WHERE name = 'Craiglockhart'
9.2) SELECT id, name FROM stops JOIN route ON route.stop = stops.id WHERE num = '4' AND company = 'LRT'
9.3) SELECT company, num, COUNT(*) FROM route WHERE stop=149 OR stop=53 GROUP BY company, num HAVING COUNT(*) = 2
9.4) SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) WHERE a.stop=53 and b.stop= (SELECT id from stops where name ='London Road')
9.5) SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'
9.6) SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num=b.num) WHERE a.stop = 115 AND b.stop = 137
9.7) SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num=b.num) WHERE a.stop = (SELECT id from stops where name ='Craiglockhart') AND b.stop = (SELECT id from stops where name ='Tollcross')
9.8) SELECT stops.name, a.company, a.num FROM route a JOIN route b ON (a.company = b.company AND a.num=b.num) JOIN stops ON stops.id = b.stop WHERE a.stop = (SELECT id from stops where name ='Craiglockhart')
9.9) SELECT r1.num, r2.company, s1.name, r4.num, r4.company from route r1 JOIN route r2 ON r1.num=r2.num AND r1.company = r2.company JOIN stops s1 ON r2.stop=s1.id JOIN route r3 ON s1.id=r3.stop JOIN route r4 ON r3.num=r4.num AND r3.company = r4.company WHERE r1.stop= (select id from stops where name='Craiglockhart') AND r4.stop = (select id from stops where name='Lochend') ORDER BY r1.num, s1.name, r4.num

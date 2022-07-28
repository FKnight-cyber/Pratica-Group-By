--### Questão 1:
--Utilizando uma *query*, obtenha a quantidade de experiências (`experiences`) atuais, 
--ou seja, com `“endDate”` diferente de `NULL`.

SELECT COUNT("endDate") as "currenteExperiences"
FROM experiences

--### Questão 2:
--Utilizando uma *query*, obtenha a quantidade de graduações (`educations`) por usuário, 
--incluindo o seu id.

SELECT e."userId" as id ,COUNT(id) as educations
FROM educations e
GROUP BY e."userId";

--### Questão 3:
--Utilizando uma *query*, obtenha a quantidade de depoimentos(`testimonials`) 
--que o usuário com id **435** efetuou, incluindo o seu nome.

SELECT u.name as "writer", COUNT(t.id) as "testimonialCount"
FROM testimonials t
JOIN users u
ON "writerId" = u.id
WHERE u.id = 435
GROUP BY u.name;

--### Questão 4:
--Utilizando uma *query*, obtenha o maior salário das vagas (`jobs`) ativas 
--(**`active** = true`) e o nome das posições (`roles`) dessas vagas 
--ordenadas de forma ascendente  

SELECT MAX(salary) as "maximumSalary",r.name as role
FROM jobs j
JOIN roles r
ON j."roleId" = r.id
WHERE j.active = true
GROUP BY role
ORDER BY "maximumSalary" ASC;

--### Desafio Bônus
--Utilizando uma *query*, obtenha os **3** cursos (`courses`) e escolas (`schools`) 
--com a **maior** quantidade de alunos (`educations`) que estão cursando (`status='ongoing'` ) 
--ou finalizaram (`status='finished'`)

SELECT s.name as school, c.name as course, COUNT("userId") as "studentsCount", status as role from educations e
JOIN schools s
ON "schoolId" = s.id
JOIN courses c
ON "courseId" = c.id
WHERE e.status = 'ongoing'
OR e.status = 'finished'
GROUP BY school,course,role
ORDER BY "studentsCount" DESC
LIMIT 3;
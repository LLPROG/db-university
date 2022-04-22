-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
1. SELECT * FROM `students` WHERE YEAR(date_of_birth) = '1990'


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
2. SELECT * FROM `courses` WHERE `cfu` > '10'


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
3. SELECT * FROM `students` WHERE floor(datediff (now(), date_of_birth)/365) > '30'


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
4. SELECT * FROM `courses` WHERE `year` = '1' AND period = 'I semestre'


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
5. SELECT * FROM `exams` WHERE date = '2020-06-20' AND HOUR(hour) >= '14:00:00'


-- 6. Selezionare tutti i corsi di laurea magistrale (38)
6. SELECT * FROM `degrees` WHERE level = 'magistrale'


-- 7. Da quanti dipartimenti è composta l'università? (12)
7. SELECT COUNT(id) FROM `departments`


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
8. SELECT COUNT(id) FROM `teachers` where `phone` IS NULL


-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
1. SELECT * FROM `students` INNER join `degrees` on degree_id = `degrees`.id WHERE degrees.name = 'corso di laurea in economia'


-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
2. SELECT * FROM `departments` INNER JOIN `degrees` on departments.id = department_id WHERE departments.name = 'Dipartimento di Neuroscienze'


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
3. SELECT * FROM course_teacher INNER JOIN courses ON course_id = courses.id INNER JOIN teachers ON teacher_id = teachers.id WHERE teachers.id = '44'

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
4. SELECT * FROM `students` inner join `degrees` ON students.degree_id = degrees.id inner join `departments` on degrees.department_id = departments.id ORDER by students.surname, students.name ASC


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
5. SELECT * FROM courses INNER JOIN course_teacher ON courses.id = course_id INNER JOIN teachers ON teacher_id = teachers.id INNER JOIN degrees ON courses.degree_id = degrees.id


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (70)
6. SELECT * FROM `teachers` LEFT JOIN course_teacher ON teachers.id = course_teacher.teacher_id LEFT join courses on courses.id = course_teacher.course_id LEFT JOIN degrees ON degrees.id = courses.degree_id WHERE degrees.department_id = '5'


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami





-- 1. Contare quanti iscritti ci sono stati ogni anno
1. SELECT count(year) as iscritti_per_anno, year FROM `courses` GROUP by year
 
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
2. SELECT COUNT(office_address) as insegnanti_per_edificio, office_address FROM `teachers` GROUP by office_address

-- 3. Calcolare la media dei voti di ogni appello d'esame
3. SELECT floor(AVG(vote)) as media_voti, exam_id FROM `exam_student` GROUP by exam_id

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
4. SELECT COUNT(degrees.id) as n_corsi_di_laurea, departments.name FROM `degrees` INNER JOIN departments ON degrees.department_id = departments.id GROUP by degrees.department_id




SELECT COUNT(*)
FROM movie_companies AS mc
join company_type AS ct on (ct.id = mc.company_type_id ) 
join company_name AS cn on (cn.country_code = '[us]' AND cn.id = mc.company_id ) 
join title AS t on (t.production_year > 1990 AND t.id = mc.movie_id ) 
JOIN (SELECT ci.movie_id AS ci_movie_id,ci.person_role_id AS ci_person_role_id FROM cast_info as ci join role_type as rt on (ci.note LIKE '%(producer)%' AND rt.id = ci.role_id)) S1 on (t.id = S1.ci_movie_id AND S1.ci_movie_id = mc.movie_id ) 
join char_name AS chn on (chn.id = S1.ci_person_role_id );
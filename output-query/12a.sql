SELECT COUNT(*)
FROM movie_info_idx AS mi_idx
join info_type AS it2 on (mi_idx.info > '8.0' AND it2.info = 'rating' AND mi_idx.info_type_id = it2.id ) 
join title AS t on (t.production_year BETWEEN 2005 AND 2008 AND t.id = mi_idx.movie_id ) 
JOIN (SELECT mc.movie_id AS mc_movie_id,mc.company_id AS mc_company_id FROM movie_companies as mc join company_type as ct on (ct.kind = 'production companies' AND ct.id = mc.company_type_id)) S1 on (t.id = S1.mc_movie_id AND S1.mc_movie_id = mi_idx.movie_id ) 
join company_name AS cn on (cn.country_code = '[us]' AND cn.id = S1.mc_company_id ) 
JOIN (SELECT mi.movie_id AS mi_movie_id FROM movie_info as mi join info_type as it1 on (mi.info IN ('Drama',  'Horror') AND it1.info = 'genres' AND mi.info_type_id = it1.id)) S2 on (t.id = S2.mi_movie_id AND S2.mi_movie_id = mi_idx.movie_id AND S1.mc_movie_id = S2.mi_movie_id );
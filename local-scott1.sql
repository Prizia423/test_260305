SELECT name
     , email
     , substr(email, instr(email,'@')+1, instr(email,'.',1)- instr(email, '@')-1) as DOMAIN
  FROM professor;
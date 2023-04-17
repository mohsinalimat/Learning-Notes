select 
  hr_staff_tb.st_employee_no, 
  hr_staff_tb.st_name as Staff_Name, 
  a.Promotion_1, 
  a.designation_1, 
  a2.Promotion_2, 
  a2.designation_2, 
  b.Promotion_3, 
  b.designation_3, 
  c.Promotion_4, 
  c.designation_4, 
  d.Promotion_5, 
  d.designation_5, 
  e.Promotion_6, 
  e.designation_6, 
  hr_designation_tb.designation as Current_Designation, 
  hr_staff_tb.st_type as Staff_Type, 
  hr_department_tb.dept_name as Department, 
  hr_school_tb.school_name as School, 
  hr_campus_tb.campus_name as Campus 
from 
  `hr_staff_tb` 
  left join (
    select 
      a.sid as sid, 
      pro1.promotion_date as Promotion_1, 
      des1.designation as designation_1 
    from 
      (
        SELECT 
          `hr_fms_staff_promotion_tb`.`staff_id` as sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min1` 
        FROM 
          `hr_fms_staff_promotion_tb` 
        GROUP BY 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min1` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) a on hr_staff_tb.staff_id = a.sid 
  left join (
    select 
      a.sid as sid, 
      pro1.promotion_date as Promotion_2, 
      des1.designation as Designation_2 
    from 
      (
        select 
          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min2` 
        from 
          `hr_fms_staff_promotion_tb` 
        where 
          promotion_id not in (
            select 
              `min1` 
            from 
              (
                SELECT 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min1` 
                FROM 
                  `hr_fms_staff_promotion_tb` 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a
          ) 
        group by 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min2` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) a2 on hr_staff_tb.staff_id = a2.sid 
  left join(
    select 
      a.sid as sid, 
      pro1.promotion_date as Promotion_3, 
      des1.designation as designation_3 
    from 
      (
        select 
          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min3` 
        from 
          `hr_fms_staff_promotion_tb` 
        where 
          promotion_id not in (
            select 
              `min2` 
            from 
              (
                select 
                  b.`min2` as `min2` 
                from 
                  (
                    select 
                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                      MIN(
                        `hr_fms_staff_promotion_tb`.`promotion_id`
                      ) AS `min2` 
                    from 
                      `hr_fms_staff_promotion_tb` 
                    where 
                      promotion_id not in (
                        select 
                          `min1` 
                        from 
                          (
                            SELECT 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min1` 
                            FROM 
                              `hr_fms_staff_promotion_tb` 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) a
                      ) 
                    group by 
                      `hr_fms_staff_promotion_tb`.`staff_id`
                  ) b
              ) a 
            union all 
            select 
              `min1` 
            from 
              (
                SELECT 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min1` 
                FROM 
                  `hr_fms_staff_promotion_tb` 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a
          ) 
        group by 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min3` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) as b on hr_staff_tb.staff_id = b.sid 
  left join(
    select 
      a.sid as sid, 
      pro1.promotion_date as promotion_4, 
      des1.designation as designation_4 
    from 
      (
        select 
          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min4` 
        from 
          `hr_fms_staff_promotion_tb` 
        where 
          promotion_id not in (
            select 
              `min2` 
            from 
              (
                select 
                  b.`min2` as `min2` 
                from 
                  (
                    select 
                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                      MIN(
                        `hr_fms_staff_promotion_tb`.`promotion_id`
                      ) AS `min2` 
                    from 
                      `hr_fms_staff_promotion_tb` 
                    where 
                      promotion_id not in (
                        select 
                          `min1` 
                        from 
                          (
                            SELECT 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min1` 
                            FROM 
                              `hr_fms_staff_promotion_tb` 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) a
                      ) 
                    group by 
                      `hr_fms_staff_promotion_tb`.`staff_id`
                  ) b
              ) a 
            union all 
            select 
              `min1` 
            from 
              (
                SELECT 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min1` 
                FROM 
                  `hr_fms_staff_promotion_tb` 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min3` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min3` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a
          ) 
        group by 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min4` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) c on hr_staff_tb.staff_id = c.sid 
  left join(
    select 
      a.sid as sid, 
      pro1.promotion_date as Promotion_5, 
      des1.designation as designation_5 
    from 
      (
        select 
          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min4` 
        from 
          `hr_fms_staff_promotion_tb` 
        where 
          promotion_id not in (
            select 
              `min2` 
            from 
              (
                select 
                  b.`min2` as `min2` 
                from 
                  (
                    select 
                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                      MIN(
                        `hr_fms_staff_promotion_tb`.`promotion_id`
                      ) AS `min2` 
                    from 
                      `hr_fms_staff_promotion_tb` 
                    where 
                      promotion_id not in (
                        select 
                          `min1` 
                        from 
                          (
                            SELECT 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min1` 
                            FROM 
                              `hr_fms_staff_promotion_tb` 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) a
                      ) 
                    group by 
                      `hr_fms_staff_promotion_tb`.`staff_id`
                  ) b
              ) a 
            union all 
            select 
              `min1` 
            from 
              (
                SELECT 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min1` 
                FROM 
                  `hr_fms_staff_promotion_tb` 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min3` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min3` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min4` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min4` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a 
                    union all 
                    select 
                      `min3` 
                    from 
                      (
                        select 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min3` 
                        from 
                          `hr_fms_staff_promotion_tb` 
                        where 
                          promotion_id not in (
                            select 
                              `min2` 
                            from 
                              (
                                select 
                                  b.`min2` as `min2` 
                                from 
                                  (
                                    select 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min2` 
                                    from 
                                      `hr_fms_staff_promotion_tb` 
                                    where 
                                      promotion_id not in (
                                        select 
                                          `min1` 
                                        from 
                                          (
                                            SELECT 
                                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                              MIN(
                                                `hr_fms_staff_promotion_tb`.`promotion_id`
                                              ) AS `min1` 
                                            FROM 
                                              `hr_fms_staff_promotion_tb` 
                                            group by 
                                              `hr_fms_staff_promotion_tb`.`staff_id`
                                          ) a
                                      ) 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) b
                              ) a 
                            union all 
                            select 
                              `min1` 
                            from 
                              (
                                SELECT 
                                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                  MIN(
                                    `hr_fms_staff_promotion_tb`.`promotion_id`
                                  ) AS `min1` 
                                FROM 
                                  `hr_fms_staff_promotion_tb` 
                                group by 
                                  `hr_fms_staff_promotion_tb`.`staff_id`
                              ) a
                          ) 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a
          ) 
        group by 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min4` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) as d on hr_staff_tb.staff_id = d.sid 
  left join(
    select 
      a.sid as sid, 
      pro1.promotion_date as Promotion_6, 
      des1.designation as designation_6 
    from 
      (
        select 
          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
          MIN(
            `hr_fms_staff_promotion_tb`.`promotion_id`
          ) AS `min5` 
        from 
          `hr_fms_staff_promotion_tb` 
        where 
          promotion_id not in (
            select 
              `min2` 
            from 
              (
                select 
                  b.`min2` as `min2` 
                from 
                  (
                    select 
                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                      MIN(
                        `hr_fms_staff_promotion_tb`.`promotion_id`
                      ) AS `min2` 
                    from 
                      `hr_fms_staff_promotion_tb` 
                    where 
                      promotion_id not in (
                        select 
                          `min1` 
                        from 
                          (
                            SELECT 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min1` 
                            FROM 
                              `hr_fms_staff_promotion_tb` 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) a
                      ) 
                    group by 
                      `hr_fms_staff_promotion_tb`.`staff_id`
                  ) b
              ) a 
            union all 
            select 
              `min1` 
            from 
              (
                SELECT 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min1` 
                FROM 
                  `hr_fms_staff_promotion_tb` 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min3` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min3` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min4` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min4` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a 
                    union all 
                    select 
                      `min3` 
                    from 
                      (
                        select 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min3` 
                        from 
                          `hr_fms_staff_promotion_tb` 
                        where 
                          promotion_id not in (
                            select 
                              `min2` 
                            from 
                              (
                                select 
                                  b.`min2` as `min2` 
                                from 
                                  (
                                    select 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min2` 
                                    from 
                                      `hr_fms_staff_promotion_tb` 
                                    where 
                                      promotion_id not in (
                                        select 
                                          `min1` 
                                        from 
                                          (
                                            SELECT 
                                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                              MIN(
                                                `hr_fms_staff_promotion_tb`.`promotion_id`
                                              ) AS `min1` 
                                            FROM 
                                              `hr_fms_staff_promotion_tb` 
                                            group by 
                                              `hr_fms_staff_promotion_tb`.`staff_id`
                                          ) a
                                      ) 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) b
                              ) a 
                            union all 
                            select 
                              `min1` 
                            from 
                              (
                                SELECT 
                                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                  MIN(
                                    `hr_fms_staff_promotion_tb`.`promotion_id`
                                  ) AS `min1` 
                                FROM 
                                  `hr_fms_staff_promotion_tb` 
                                group by 
                                  `hr_fms_staff_promotion_tb`.`staff_id`
                              ) a
                          ) 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a 
            union all 
            select 
              `min4` 
            from 
              (
                select 
                  `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
                  MIN(
                    `hr_fms_staff_promotion_tb`.`promotion_id`
                  ) AS `min4` 
                from 
                  `hr_fms_staff_promotion_tb` 
                where 
                  promotion_id not in (
                    select 
                      `min2` 
                    from 
                      (
                        select 
                          b.`min2` as `min2` 
                        from 
                          (
                            select 
                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                              MIN(
                                `hr_fms_staff_promotion_tb`.`promotion_id`
                              ) AS `min2` 
                            from 
                              `hr_fms_staff_promotion_tb` 
                            where 
                              promotion_id not in (
                                select 
                                  `min1` 
                                from 
                                  (
                                    SELECT 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min1` 
                                    FROM 
                                      `hr_fms_staff_promotion_tb` 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) a
                              ) 
                            group by 
                              `hr_fms_staff_promotion_tb`.`staff_id`
                          ) b
                      ) a 
                    union all 
                    select 
                      `min1` 
                    from 
                      (
                        SELECT 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min1` 
                        FROM 
                          `hr_fms_staff_promotion_tb` 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a 
                    union all 
                    select 
                      `min3` 
                    from 
                      (
                        select 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min3` 
                        from 
                          `hr_fms_staff_promotion_tb` 
                        where 
                          promotion_id not in (
                            select 
                              `min2` 
                            from 
                              (
                                select 
                                  b.`min2` as `min2` 
                                from 
                                  (
                                    select 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min2` 
                                    from 
                                      `hr_fms_staff_promotion_tb` 
                                    where 
                                      promotion_id not in (
                                        select 
                                          `min1` 
                                        from 
                                          (
                                            SELECT 
                                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                              MIN(
                                                `hr_fms_staff_promotion_tb`.`promotion_id`
                                              ) AS `min1` 
                                            FROM 
                                              `hr_fms_staff_promotion_tb` 
                                            group by 
                                              `hr_fms_staff_promotion_tb`.`staff_id`
                                          ) a
                                      ) 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) b
                              ) a 
                            union all 
                            select 
                              `min1` 
                            from 
                              (
                                SELECT 
                                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                  MIN(
                                    `hr_fms_staff_promotion_tb`.`promotion_id`
                                  ) AS `min1` 
                                FROM 
                                  `hr_fms_staff_promotion_tb` 
                                group by 
                                  `hr_fms_staff_promotion_tb`.`staff_id`
                              ) a
                          ) 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a 
                    union all 
                    select 
                      `min4` 
                    from 
                      (
                        select 
                          `hr_fms_staff_promotion_tb`.`staff_id` AS sid, 
                          MIN(
                            `hr_fms_staff_promotion_tb`.`promotion_id`
                          ) AS `min4` 
                        from 
                          `hr_fms_staff_promotion_tb` 
                        where 
                          promotion_id not in (
                            select 
                              `min2` 
                            from 
                              (
                                select 
                                  b.`min2` as `min2` 
                                from 
                                  (
                                    select 
                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                      MIN(
                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                      ) AS `min2` 
                                    from 
                                      `hr_fms_staff_promotion_tb` 
                                    where 
                                      promotion_id not in (
                                        select 
                                          `min1` 
                                        from 
                                          (
                                            SELECT 
                                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                              MIN(
                                                `hr_fms_staff_promotion_tb`.`promotion_id`
                                              ) AS `min1` 
                                            FROM 
                                              `hr_fms_staff_promotion_tb` 
                                            group by 
                                              `hr_fms_staff_promotion_tb`.`staff_id`
                                          ) a
                                      ) 
                                    group by 
                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                  ) b
                              ) a 
                            union all 
                            select 
                              `min1` 
                            from 
                              (
                                SELECT 
                                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                  MIN(
                                    `hr_fms_staff_promotion_tb`.`promotion_id`
                                  ) AS `min1` 
                                FROM 
                                  `hr_fms_staff_promotion_tb` 
                                group by 
                                  `hr_fms_staff_promotion_tb`.`staff_id`
                              ) a 
                            union all 
                            select 
                              `min3` 
                            from 
                              (
                                select 
                                  `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                  MIN(
                                    `hr_fms_staff_promotion_tb`.`promotion_id`
                                  ) AS `min3` 
                                from 
                                  `hr_fms_staff_promotion_tb` 
                                where 
                                  promotion_id not in (
                                    select 
                                      `min2` 
                                    from 
                                      (
                                        select 
                                          b.`min2` as `min2` 
                                        from 
                                          (
                                            select 
                                              `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                              MIN(
                                                `hr_fms_staff_promotion_tb`.`promotion_id`
                                              ) AS `min2` 
                                            from 
                                              `hr_fms_staff_promotion_tb` 
                                            where 
                                              promotion_id not in (
                                                select 
                                                  `min1` 
                                                from 
                                                  (
                                                    SELECT 
                                                      `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                                      MIN(
                                                        `hr_fms_staff_promotion_tb`.`promotion_id`
                                                      ) AS `min1` 
                                                    FROM 
                                                      `hr_fms_staff_promotion_tb` 
                                                    group by 
                                                      `hr_fms_staff_promotion_tb`.`staff_id`
                                                  ) a
                                              ) 
                                            group by 
                                              `hr_fms_staff_promotion_tb`.`staff_id`
                                          ) b
                                      ) a 
                                    union all 
                                    select 
                                      `min1` 
                                    from 
                                      (
                                        SELECT 
                                          `hr_fms_staff_promotion_tb`.`staff_id` AS `staff_id`, 
                                          MIN(
                                            `hr_fms_staff_promotion_tb`.`promotion_id`
                                          ) AS `min1` 
                                        FROM 
                                          `hr_fms_staff_promotion_tb` 
                                        group by 
                                          `hr_fms_staff_promotion_tb`.`staff_id`
                                      ) a
                                  ) 
                                group by 
                                  `hr_fms_staff_promotion_tb`.`staff_id`
                              ) a
                          ) 
                        group by 
                          `hr_fms_staff_promotion_tb`.`staff_id`
                      ) a
                  ) 
                group by 
                  `hr_fms_staff_promotion_tb`.`staff_id`
              ) a
          ) 
        group by 
          `hr_fms_staff_promotion_tb`.`staff_id`
      ) as a 
      left join `hr_fms_staff_promotion_tb` as pro1 on pro1.`promotion_id` = a.`min5` 
      left join `hr_designation_tb` as des1 on pro1.designation_id = des1.designation_id
  ) as e on hr_staff_tb.staff_id = e.sid 
  left join hr_designation_tb on hr_staff_tb.designation_id = hr_designation_tb.designation_id 
  left join hr_department_tb on hr_staff_tb.dept_id = hr_department_tb.dept_id 
  left join hr_school_tb on hr_department_tb.school_id = hr_school_tb.school_id 
  left join hr_campus_tb on hr_school_tb.campus_id = hr_campus_tb.campus_id 
where 
  hr_staff_tb.st_current_stat = "Active" [[and {{Employee_No}}]]

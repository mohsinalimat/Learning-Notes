select 
  s.staff_id, 
  aa.promotion_date, 
  aa.designation, 
  ab.promotion_date, 
  ab.designation, 
  ac.promotion_date, 
  ac.designation, 
  am.promotion_date, 
  am.designation 
from 
  hr_staff_tb as s 
  left join (
    select 
      p1.sid as sid1, 
      pro11.promotion_date, 
      des1.designation 
    from 
      (
        select 
          pro1.staff_id as sid, 
          Min(pro1.promotion_id) as promo1 
        from 
          hr_fms_staff_promotion_tb as pro1 
        group by 
          pro1.staff_id
      ) as p1 
      left join hr_fms_staff_promotion_tb as pro11 on p1.promo1 = pro11.promotion_id 
      left join hr_designation_tb as des1 on pro11.designation_id = des1.designation_id
  ) as aa on s.staff_id = aa.sid1 
  left join (
    select 
      p2.sid as sid2, 
      pro12.promotion_date, 
      des2.designation 
    from 
      (
        select 
          pro2.staff_id as sid, 
          min(pro2.promotion_id) as promo2 
        from 
          hr_fms_staff_promotion_tb as pro2 
        where 
          promotion_id not in (
            select 
              c.promo1 
            from 
              (
                select 
                  pro1.staff_id as sid, 
                  Min(pro1.promotion_id) as promo1 
                from 
                  hr_fms_staff_promotion_tb as pro1 
                group by 
                  pro1.staff_id
              ) as c
          ) 
        group by 
          pro2.staff_id
      ) as p2 
      left join hr_fms_staff_promotion_tb as pro12 on p2.promo2 = pro12.promotion_id 
      left join hr_designation_tb as des2 on pro12.designation_id = des2.designation_id
  ) as ab on s.staff_id = ab.sid2 
  left join (
    select 
      p3.sid as sid3, 
      pro13.promotion_date, 
      des3.designation 
    from 
      (
        select 
          pro3.staff_id as sid, 
          min(pro3.promotion_id) as promo3 
        from 
          hr_fms_staff_promotion_tb as pro3 
        where 
          promotion_id not in (
            select 
              c.promo1 
            from 
              (
                select 
                  pro1.staff_id as sid, 
                  Min(pro1.promotion_id) as promo1 
                from 
                  hr_fms_staff_promotion_tb as pro1 
                group by 
                  pro1.staff_id
              ) as c 
            union all 
            select 
              e.promo2 
            from 
              (
                select 
                  pro2.staff_id as sid, 
                  min(pro2.promotion_id) as promo2 
                from 
                  hr_fms_staff_promotion_tb as pro2 
                where 
                  promotion_id not in (
                    select 
                      c.promo1 
                    from 
                      (
                        select 
                          pro1.staff_id as sid, 
                          Min(pro1.promotion_id) as promo1 
                        from 
                          hr_fms_staff_promotion_tb as pro1 
                        group by 
                          pro1.staff_id
                      ) as c
                  ) 
                group by 
                  pro2.staff_id
              ) as e
          ) 
        group by 
          pro3.staff_id
      ) as p3 
      left join hr_fms_staff_promotion_tb as pro13 on p3.promo3 = pro13.promotion_id 
      left join hr_designation_tb as des3 on pro13.designation_id = des3.designation_id
  ) as ac on s.staff_id = ac.sid3 
  left join (
    select 
      p4.sid as sid4, 
      pro14.promotion_date, 
      des4.designation 
    from 
      (
        select 
          pro4.staff_id as sid, 
          min(pro4.promotion_id) as promo4 
        from 
          hr_fms_staff_promotion_tb as pro4 
        where 
          promotion_id not in (
            select 
              m.promo3 
            from 
              (
                select 
                  pro3.staff_id as sid, 
                  min(pro3.promotion_id) as promo3 
                from 
                  hr_fms_staff_promotion_tb as pro3 
                where 
                  promotion_id not in (
                    select 
                      c.promo1 
                    from 
                      (
                        select 
                          pro1.staff_id as sid, 
                          Min(pro1.promotion_id) as promo1 
                        from 
                          hr_fms_staff_promotion_tb as pro1 
                        group by 
                          pro1.staff_id
                      ) as c 
                    union all 
                    select 
                      e.promo2 
                    from 
                      (
                        select 
                          pro2.staff_id as sid, 
                          min(pro2.promotion_id) as promo2 
                        from 
                          hr_fms_staff_promotion_tb as pro2 
                        where 
                          promotion_id not in (
                            select 
                              c.promo1 
                            from 
                              (
                                select 
                                  pro1.staff_id as sid, 
                                  Min(pro1.promotion_id) as promo1 
                                from 
                                  hr_fms_staff_promotion_tb as pro1 
                                group by 
                                  pro1.staff_id
                              ) as c
                          ) 
                        group by 
                          pro2.staff_id
                      ) as e
                  ) 
                group by 
                  pro3.staff_id
              ) as m 
            union all 
            select 
              c.promo1 
            from 
              (
                select 
                  pro1.staff_id as sid, 
                  Min(pro1.promotion_id) as promo1 
                from 
                  hr_fms_staff_promotion_tb as pro1 
                group by 
                  pro1.staff_id
              ) as c 
            union all 
            select 
              e.promo2 
            from 
              (
                select 
                  pro2.staff_id as sid, 
                  min(pro2.promotion_id) as promo2 
                from 
                  hr_fms_staff_promotion_tb as pro2 
                where 
                  promotion_id not in (
                    select 
                      c.promo1 
                    from 
                      (
                        select 
                          pro1.staff_id as sid, 
                          Min(pro1.promotion_id) as promo1 
                        from 
                          hr_fms_staff_promotion_tb as pro1 
                        group by 
                          pro1.staff_id
                      ) as c
                  ) 
                group by 
                  pro2.staff_id
              ) as e 
            union all 
            select 
              e.promo2 
            from 
              (
                select 
                  pro2.staff_id as sid, 
                  min(pro2.promotion_id) as promo2 
                from 
                  hr_fms_staff_promotion_tb as pro2 
                where 
                  promotion_id not in (
                    select 
                      c.promo1 
                    from 
                      (
                        select 
                          pro1.staff_id as sid, 
                          Min(pro1.promotion_id) as promo1 
                        from 
                          hr_fms_staff_promotion_tb as pro1 
                        group by 
                          pro1.staff_id
                      ) as c
                  ) 
                group by 
                  pro2.staff_id
              ) as e
          ) 
        group by 
          pro4.staff_id
      ) as p4 
      left join hr_fms_staff_promotion_tb as pro14 on p4.promo4 = pro14.promotion_id 
      left join hr_designation_tb as des4 on pro14.designation_id = des4.designation_id
  ) as am on s.staff_id = am.sid4

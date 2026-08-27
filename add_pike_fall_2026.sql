-- Add Texas Pike Fall 2026 calendar
-- Source: Texas Pike Fall 2026 Social Calendar image provided by user.
-- Safe to paste into Supabase SQL Editor and run once.

begin;

insert into public.events (date, end_date, frat, name, time, category)
select * from (
    values
    ('2026-08-22'::date, NULL::date, 'Pike', 'Bid Day Party', '12:00 AM', NULL),
    ('2026-08-26'::date, NULL::date, 'Pike', 'Wine Wednesday', NULL, NULL),
    ('2026-08-29'::date, NULL::date, 'Pike', 'Back 2 School Darty', NULL, NULL),
    ('2026-09-05'::date, NULL::date, 'Pike', 'Texas vs Texas State Tailgate', NULL, NULL),
    ('2026-09-09'::date, NULL::date, 'Pike', 'Wine Wednesday', NULL, NULL),
    ('2026-09-12'::date, NULL::date, 'Pike', 'Texas vs Ohio State Tailgate', NULL, NULL),
    ('2026-09-25'::date, NULL::date, 'Pike', 'Pledgeline', NULL, NULL),
    ('2026-09-26'::date, NULL::date, 'Pike', 'Texas @ Tennessee Watch Party', NULL, NULL),
    ('2026-10-03'::date, NULL::date, 'Pike', 'Pikeapalooza', NULL, NULL),
    ('2026-10-09'::date, '2026-10-10'::date, 'Pike', 'OU Weekend', NULL, NULL),
    ('2026-10-14'::date, NULL::date, 'Pike', 'Wine Wednesday', NULL, NULL),
    ('2026-10-17'::date, NULL::date, 'Pike', 'Texas vs Florida Tailgate', NULL, NULL),
    ('2026-10-24'::date, NULL::date, 'Pike', 'Texas vs Ole Miss Tailgate', NULL, NULL),
    ('2026-10-30'::date, NULL::date, 'Pike', 'Halloween Party', NULL, NULL),
    ('2026-11-12'::date, NULL::date, 'Pike', 'Bayou Bash', NULL, NULL),
    ('2026-11-13'::date, NULL::date, 'Pike', 'Swamp', NULL, NULL),
    ('2026-11-14'::date, NULL::date, 'Pike', 'Texas vs LSU Watch Party', NULL, NULL),
    ('2026-11-21'::date, NULL::date, 'Pike', 'Texas vs Arkansas Alumni Tailgate', NULL, NULL),
    ('2026-11-27'::date, NULL::date, 'Pike', 'Texas @ Texas A&M Watch Party', NULL, NULL),
    ('2026-12-05'::date, NULL::date, 'Pike', 'Winter Formal', NULL, NULL)
) as v(date, end_date, frat, name, time, category)
where not exists (
    select 1
    from public.events e
    where e.date = v.date
      and e.frat = v.frat
      and e.name = v.name
);

commit;

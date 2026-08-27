-- Frat Forecast Fall 2026 corrections
-- Safe to commit under: supabase/migrations/
-- This updates only the changes approved in chat.

begin;

-- 1) FIJI: correct Hugs -> Haus
update public.events
set name = 'FIJI Haus'
where date = '2026-10-01'
  and frat = 'FIJI'
  and name = 'FIJI Hugs';

-- 2) Kappa Alpha: correct TX/OU weekend end date to Sunday 10/11
update public.events
set end_date = '2026-10-11'
where date = '2026-10-09'
  and frat = 'Kappa Alpha'
  and name = 'Red River Rivalry Weekend';

-- 3) Texas Delts: declutter TX/OU weekend.
-- Remove the old separate entries first.
delete from public.events
where frat = 'Texas Delts'
  and (
    (date = '2026-10-09' and name = 'Rodeo Cold')
    or
    (date = '2026-10-09' and name = 'TX/OU Weekend in Dallas')
    or
    (date = '2026-10-10' and name = 'Cactus Social')
  );

-- Add one combined entry, but avoid creating a duplicate if this migration is re-run.
insert into public.events (date, end_date, frat, name, time, category)
select
  '2026-10-09',
  '2026-10-10',
  'Texas Delts',
  'Rodeo Cold (Fri) / Cactus Social (Sat) - TX/OU Weekend in Dallas',
  NULL,
  NULL
where not exists (
  select 1
  from public.events
  where date = '2026-10-09'
    and end_date = '2026-10-10'
    and frat = 'Texas Delts'
    and name = 'Rodeo Cold (Fri) / Cactus Social (Sat) - TX/OU Weekend in Dallas'
);

-- 4) Remove ZBT Winter Formal placeholder.
delete from public.events
where frat = 'ZBT'
  and (
    (date = '2026-12-01' and name = 'Winter Formal (December TBD)')
    or name = 'ZBT Winter Formal'
    or name = 'Winter Formal (December TBD)'
  );

-- Delt Christmas Formal intentionally left unchanged.

commit;

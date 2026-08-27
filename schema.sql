create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  date date not null,
  end_date date,
  frat text not null,
  name text not null,
  time text,
  category text,
  created_at timestamptz not null default now()
);

alter table public.events enable row level security;

drop policy if exists "Public can read events" on public.events;
create policy "Public can read events" on public.events for select to anon, authenticated using (true);

drop policy if exists "Admin insert" on public.events;
create policy "Admin insert" on public.events for insert to authenticated
with check ((auth.jwt() ->> 'email') = 'gracieisbell@gmail.com');

drop policy if exists "Admin update" on public.events;
create policy "Admin update" on public.events for update to authenticated
using ((auth.jwt() ->> 'email') = 'gracieisbell@gmail.com')
with check ((auth.jwt() ->> 'email') = 'gracieisbell@gmail.com');

drop policy if exists "Admin delete" on public.events;
create policy "Admin delete" on public.events for delete to authenticated
using ((auth.jwt() ->> 'email') = 'gracieisbell@gmail.com');

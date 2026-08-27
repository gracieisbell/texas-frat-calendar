-- Run this once in Supabase SQL Editor for V15.
alter table public.events
add column if not exists sort_order integer;

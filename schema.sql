-- Run this in your Supabase SQL Editor (supabase.com → project → SQL Editor)

create table if not exists public.registrations (
  id           text primary key,
  type         text not null,
  name         text,
  phone        text,
  created_at   bigint,
  timestamp    timestamptz default now(),
  data         jsonb not null
);

-- Allow the public (anon key) to insert new registrations
create policy "Allow public inserts"
  on public.registrations for insert
  to anon with check (true);

-- Allow the public (anon key) to read all registrations
-- (admin panel uses the same key; access is controlled by the password screen)
create policy "Allow public reads"
  on public.registrations for select
  to anon using (true);

-- Enable RLS
alter table public.registrations enable row level security;

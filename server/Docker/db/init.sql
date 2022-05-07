-- Table: public.strains

-- DROP TABLE IF EXISTS public.strains;

CREATE TABLE IF NOT EXISTS public.strains
(
    id integer NOT NULL,
    Strain character varying(50) COLLATE pg_catalog."default" NOT NULL,
    Type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    Rating integer NOT NULL,
    Effects character varying[] COLLATE pg_catalog."default",
    Flavor character varying[] COLLATE pg_catalog."default",
    Description character varying(400) COLLATE pg_catalog."default",
    CONSTRAINT strains_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.strains
--     OWNER to postgres;  

-- CREATE TABLE public.tmp (id int,info JSON);
-- CREATE INDEX ON public.tmp((info ->>'strain_name'));
-- \copy public.tmp FROM 'C:\Users\Omri\Desktop\strains.json';

-- INSERT INTO public.strains 
-- SELECT q.* FROM public.tmp, json_to_record(c::json) AS q(strain_name text,rating int, flavour text, effects text, strain_description text);

-- DROP TABLE public.tmp;

-- with strains_json (doc) as (
--    values 
--     ('[
--     {
--         "Strain": "100-Og",
--         "Type": "hybrid",
--         "Rating": "4",
--         "Effects": "Creative,Energetic,Tingly,Euphoric,Relaxed",
--         "Flavor": "Earthy,Sweet,Citrus",
--         "Description": "$100 OG is a 50/50 hybrid strain that packs a strong punch. The name supposedly refers to both its strength and high price when it first started showing up in Hollywood. As a plant, $100 OG tends to produce large dark green buds with few stems. Users report a strong body effect of an indica for pain relief with the more alert, cerebral feeling thanks to its sativa side."
--     },
--     {
--         "Strain": "98-White-Widow",
--         "Type": "hybrid",
--         "Rating": "4.7",
--         "Effects": "Relaxed,Aroused,Creative,Happy,Energetic",
--         "Flavor": "Flowery,Violet,Diesel",
--         "Description": "The ‘98 Aloha White Widow is an especially potent cut of White Widow that has grown in renown alongside Hawaiian legends like Maui Wowie and Kona Gold. This White Widow phenotype reeks of diesel and skunk and has a rich earthy taste with intermittent notes of hash. Its buds are coated in trichomes, giving its dark foliage a lustrous glint to go along with its room-filling odor. This one-hitter-quitter uplifts the mind with mind-bending euphoria that materializes in the body as airy relaxation. ‘98 Aloha White Widow is available from Pua Mana 1st Hawaiian Pakalōlō Seed Bank.  "
--     }
--     ]'::json)
-- )
-- insert into public.strains (id, Strain, Rating, Flavor, Type, Effects, Description )
-- select p.*
-- from strains_json l
--   cross join lateral json_populate_recordset(null::public.strains, doc) as p
-- on conflict (id) do update 
--   set Strain = excluded.Strain,
--       Description = excluded.Description;
-- Table: public.strains

DROP TABLE IF EXISTS public.strains;

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

ALTER TABLE IF EXISTS public.strains
    OWNER to postgres;  

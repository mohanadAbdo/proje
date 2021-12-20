--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: delete_old_rows(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_old_rows() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  DELETE FROM siparisler WHERE siparis_tarihi < CURRENT_TIMESTAMP - INTERVAL '1 minutes';
  RETURN NULL;
END;
$$;


ALTER FUNCTION public.delete_old_rows() OWNER TO postgres;

--
-- Name: indirim(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.indirim(fiyat double precision, indirim_miktari double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
fiyat:=fiyat-fiyat*(indirim_miktari);
return fiyat;
end;
$$;


ALTER FUNCTION public.indirim(fiyat double precision, indirim_miktari double precision) OWNER TO postgres;

--
-- Name: istenmeyen_urunleri(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.istenmeyen_urunleri(min_stok integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
stokta int;
BEGIN
SELECT COUNT(*) into stokta FROM urunleri WHERE stok > min_stok;
RETURN stokta;
end;
$$;


ALTER FUNCTION public.istenmeyen_urunleri(min_stok integer) OWNER TO postgres;

--
-- Name: kdvsiz(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kdvsiz(fiyat double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
fiyat:=fiyat-fiyat*0.15;
return fiyat;
end;
$$;


ALTER FUNCTION public.kdvsiz(fiyat double precision) OWNER TO postgres;

--
-- Name: musteriler_sayisi1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.musteriler_sayisi1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE magaza set musteriler_sayisi = musteriler_sayisi+1;
RETURN new;
end;
$$;


ALTER FUNCTION public.musteriler_sayisi1() OWNER TO postgres;

--
-- Name: musteriler_sayisi_eksi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.musteriler_sayisi_eksi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE magaza set musteriler_sayisi = musteriler_sayisi-1;
RETURN new;
end;
$$;


ALTER FUNCTION public.musteriler_sayisi_eksi() OWNER TO postgres;

--
-- Name: silindi_musterilerfn1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.silindi_musterilerfn1() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO silindi_musteriler(Smusteri_id,Smusteri_adi)
VALUES(OLD.musteri_id,OLD.musteri_adi);
RETURN OLD;
end;
$$;


ALTER FUNCTION public.silindi_musterilerfn1() OWNER TO postgres;

--
-- Name: toplam_hisaplama(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam_hisaplama() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
total float;
BEGIN
total = new.fiyat * new.stok;
new.total_price =total;
RETURN new;
end;
$$;


ALTER FUNCTION public.toplam_hisaplama() OWNER TO postgres;

--
-- Name: urun_arama(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urun_arama(product_name character varying) RETURNS TABLE(idsutun integer, adisutun character varying, fiyatsutun double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
SELECT 
urun_id,
urun_adi,
fiyat
FROM urunleri
WHERE
urun_adi like product_name;
END;
$$;


ALTER FUNCTION public.urun_arama(product_name character varying) OWNER TO postgres;

--
-- Name: urunler_sayisi_artir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urunler_sayisi_artir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE magaza set urunler_sayisi = urunler_sayisi+1;
RETURN new;
end;
$$;


ALTER FUNCTION public.urunler_sayisi_artir() OWNER TO postgres;

--
-- Name: urunler_sayisi_eksi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urunler_sayisi_eksi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE magaza set urunler_sayisi = urunler_sayisi-1;
RETURN new;
end;
$$;


ALTER FUNCTION public.urunler_sayisi_eksi() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adres (
    adres_id integer NOT NULL,
    adres character varying(3000),
    sehir_id integer,
    posta_kodu character varying(6),
    telefon_numara character varying(12)
);


ALTER TABLE public.adres OWNER TO postgres;

--
-- Name: adres_adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adres_adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adres_adres_id_seq OWNER TO postgres;

--
-- Name: adres_adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adres_adres_id_seq OWNED BY public.adres.adres_id;


--
-- Name: calisanlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calisanlar (
    calisan_id integer NOT NULL,
    adi character varying(100) NOT NULL,
    soy_adi character varying(100) NOT NULL,
    adres_id integer
);


ALTER TABLE public.calisanlar OWNER TO postgres;

--
-- Name: calisanlar_calisan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calisanlar_calisan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calisanlar_calisan_id_seq OWNER TO postgres;

--
-- Name: calisanlar_calisan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calisanlar_calisan_id_seq OWNED BY public.calisanlar.calisan_id;


--
-- Name: dil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dil (
    dil_id integer NOT NULL,
    dil character varying(150)
);


ALTER TABLE public.dil OWNER TO postgres;

--
-- Name: dil_dil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dil_dil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dil_dil_id_seq OWNER TO postgres;

--
-- Name: dil_dil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dil_dil_id_seq OWNED BY public.dil.dil_id;


--
-- Name: kiralik_urunleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kiralik_urunleri (
    urun_id integer,
    kiralik_suresi character varying(300)
);


ALTER TABLE public.kiralik_urunleri OWNER TO postgres;

--
-- Name: magaza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magaza (
    magaza_id integer NOT NULL,
    magaza_adi character varying(500) NOT NULL,
    clisanlar_sayisi integer NOT NULL,
    adres_id integer,
    musteriler_sayisi integer,
    urunler_sayisi integer
);


ALTER TABLE public.magaza OWNER TO postgres;

--
-- Name: magaza_calisalari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magaza_calisalari (
    magaza_id integer NOT NULL,
    calisan_id integer NOT NULL,
    calisma_saatlari character varying(500) NOT NULL,
    calisanlar_sayisi smallint
);


ALTER TABLE public.magaza_calisalari OWNER TO postgres;

--
-- Name: magaza_magaza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.magaza_magaza_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.magaza_magaza_id_seq OWNER TO postgres;

--
-- Name: magaza_magaza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.magaza_magaza_id_seq OWNED BY public.magaza.magaza_id;


--
-- Name: musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri (
    musteri_id integer NOT NULL,
    musteri_adi character varying(100),
    musteri_soy_adi character varying(100),
    musteri_numara character varying(13),
    adres_id integer
);


ALTER TABLE public.musteri OWNER TO postgres;

--
-- Name: musteri_musteri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musteri_musteri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musteri_musteri_id_seq OWNER TO postgres;

--
-- Name: musteri_musteri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musteri_musteri_id_seq OWNED BY public.musteri.musteri_id;


--
-- Name: musteri_odeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri_odeme (
    odeme_id integer NOT NULL,
    musteri_id integer,
    urun_id integer,
    odeme_turu character varying(300),
    miktar integer NOT NULL
);


ALTER TABLE public.musteri_odeme OWNER TO postgres;

--
-- Name: musteri_odeme_odeme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musteri_odeme_odeme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musteri_odeme_odeme_id_seq OWNER TO postgres;

--
-- Name: musteri_odeme_odeme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musteri_odeme_odeme_id_seq OWNED BY public.musteri_odeme.odeme_id;


--
-- Name: sehir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sehir (
    sehir_id integer NOT NULL,
    sehir character varying(100) NOT NULL,
    ulke_id integer
);


ALTER TABLE public.sehir OWNER TO postgres;

--
-- Name: sehir_sehir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sehir_sehir_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sehir_sehir_id_seq OWNER TO postgres;

--
-- Name: sehir_sehir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sehir_sehir_id_seq OWNED BY public.sehir.sehir_id;


--
-- Name: silindi_musteriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.silindi_musteriler (
    smusteri_id integer,
    smusteri_adi character varying(50)
);


ALTER TABLE public.silindi_musteriler OWNER TO postgres;

--
-- Name: silindi_siparisler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.silindi_siparisler (
    siparis_id integer,
    tarih character varying(500)
);


ALTER TABLE public.silindi_siparisler OWNER TO postgres;

--
-- Name: silindi_urunleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.silindi_urunleri (
    "Surun_adi" character varying(500),
    "Sfiyat" integer,
    surun_id integer
);


ALTER TABLE public.silindi_urunleri OWNER TO postgres;

--
-- Name: siparisler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siparisler (
    siparis_id integer NOT NULL,
    musteri_id integer,
    urun_id integer,
    siparis_tarihi timestamp without time zone NOT NULL,
    miktar integer NOT NULL
);


ALTER TABLE public.siparisler OWNER TO postgres;

--
-- Name: siparisler_siparis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siparisler_siparis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siparisler_siparis_id_seq OWNER TO postgres;

--
-- Name: siparisler_siparis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siparisler_siparis_id_seq OWNED BY public.siparisler.siparis_id;


--
-- Name: ulke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulke (
    ulke_id integer NOT NULL,
    ulke character varying(150) NOT NULL
);


ALTER TABLE public.ulke OWNER TO postgres;

--
-- Name: ulke_ulke_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ulke_ulke_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ulke_ulke_id_seq OWNER TO postgres;

--
-- Name: ulke_ulke_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ulke_ulke_id_seq OWNED BY public.ulke.ulke_id;


--
-- Name: urunleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urunleri (
    urun_id integer NOT NULL,
    magaza_id integer,
    urun_adi character varying(1000) NOT NULL,
    fiyat double precision NOT NULL,
    stok integer,
    total_price double precision,
    dil_id integer
);


ALTER TABLE public.urunleri OWNER TO postgres;

--
-- Name: urunler_urun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urunler_urun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urunler_urun_id_seq OWNER TO postgres;

--
-- Name: urunler_urun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urunler_urun_id_seq OWNED BY public.urunleri.urun_id;


--
-- Name: adres adres_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres ALTER COLUMN adres_id SET DEFAULT nextval('public.adres_adres_id_seq'::regclass);


--
-- Name: calisanlar calisan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar ALTER COLUMN calisan_id SET DEFAULT nextval('public.calisanlar_calisan_id_seq'::regclass);


--
-- Name: dil dil_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil ALTER COLUMN dil_id SET DEFAULT nextval('public.dil_dil_id_seq'::regclass);


--
-- Name: magaza magaza_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza ALTER COLUMN magaza_id SET DEFAULT nextval('public.magaza_magaza_id_seq'::regclass);


--
-- Name: musteri musteri_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri ALTER COLUMN musteri_id SET DEFAULT nextval('public.musteri_musteri_id_seq'::regclass);


--
-- Name: musteri_odeme odeme_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_odeme ALTER COLUMN odeme_id SET DEFAULT nextval('public.musteri_odeme_odeme_id_seq'::regclass);


--
-- Name: sehir sehir_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir ALTER COLUMN sehir_id SET DEFAULT nextval('public.sehir_sehir_id_seq'::regclass);


--
-- Name: siparisler siparis_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparisler ALTER COLUMN siparis_id SET DEFAULT nextval('public.siparisler_siparis_id_seq'::regclass);


--
-- Name: ulke ulke_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke ALTER COLUMN ulke_id SET DEFAULT nextval('public.ulke_ulke_id_seq'::regclass);


--
-- Name: urunleri urun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunleri ALTER COLUMN urun_id SET DEFAULT nextval('public.urunler_urun_id_seq'::regclass);


--
-- Name: adres adres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_pkey PRIMARY KEY (adres_id);


--
-- Name: calisanlar calisanlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT calisanlar_pkey PRIMARY KEY (calisan_id);


--
-- Name: dil dil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil
    ADD CONSTRAINT dil_pkey PRIMARY KEY (dil_id);


--
-- Name: magaza_calisalari magaza_calisalari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza_calisalari
    ADD CONSTRAINT magaza_calisalari_pkey PRIMARY KEY (magaza_id, calisan_id);


--
-- Name: magaza magaza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT magaza_pkey PRIMARY KEY (magaza_id);


--
-- Name: musteri_odeme musteri_odeme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_odeme
    ADD CONSTRAINT musteri_odeme_pkey PRIMARY KEY (odeme_id);


--
-- Name: musteri musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_pkey PRIMARY KEY (musteri_id);


--
-- Name: sehir sehir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT sehir_pkey PRIMARY KEY (sehir_id);


--
-- Name: siparisler siparisler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisler_pkey PRIMARY KEY (siparis_id);


--
-- Name: ulke ulke_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT ulke_pkey PRIMARY KEY (ulke_id);


--
-- Name: urunleri urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunleri
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urun_id);


--
-- Name: musteri musteriler_sayisitrg1; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteriler_sayisitrg1 AFTER INSERT ON public.musteri FOR EACH ROW EXECUTE FUNCTION public.musteriler_sayisi1();


--
-- Name: musteri musteriler_sayisitrg_eksi; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteriler_sayisitrg_eksi AFTER DELETE ON public.musteri FOR EACH STATEMENT EXECUTE FUNCTION public.musteriler_sayisi_eksi();


--
-- Name: musteri silindi_musterilertrg1; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER silindi_musterilertrg1 BEFORE DELETE ON public.musteri FOR EACH ROW EXECUTE FUNCTION public.silindi_musterilerfn1();


--
-- Name: urunleri toplam_hisaplama_trg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplam_hisaplama_trg BEFORE INSERT ON public.urunleri FOR EACH ROW EXECUTE FUNCTION public.toplam_hisaplama();


--
-- Name: urunleri toplam_hisaplama_trg2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplam_hisaplama_trg2 BEFORE INSERT ON public.urunleri FOR EACH ROW EXECUTE FUNCTION public.toplam_hisaplama();


--
-- Name: siparisler trigger_delete_old_rows; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_delete_old_rows AFTER INSERT ON public.siparisler FOR EACH STATEMENT EXECUTE FUNCTION public.delete_old_rows();


--
-- Name: urunleri urunler_sayisi_artirtrg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER urunler_sayisi_artirtrg AFTER INSERT ON public.urunleri FOR EACH STATEMENT EXECUTE FUNCTION public.urunler_sayisi_artir();


--
-- Name: urunleri urunler_sayisi_eksitrg; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER urunler_sayisi_eksitrg AFTER DELETE ON public.urunleri FOR EACH STATEMENT EXECUTE FUNCTION public.urunler_sayisi_eksi();


--
-- Name: adres adres_sehir_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres
    ADD CONSTRAINT adres_sehir_id_fkey FOREIGN KEY (sehir_id) REFERENCES public.sehir(sehir_id);


--
-- Name: calisanlar calisanlar_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT calisanlar_adres_id_fkey FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);


--
-- Name: magaza_calisalari cons_calisanin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza_calisalari
    ADD CONSTRAINT cons_calisanin_id FOREIGN KEY (calisan_id) REFERENCES public.calisanlar(calisan_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: magaza_calisalari cons_magazanin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza_calisalari
    ADD CONSTRAINT cons_magazanin_id FOREIGN KEY (magaza_id) REFERENCES public.magaza(magaza_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kiralik_urunleri kiralik_urunleri_urun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kiralik_urunleri
    ADD CONSTRAINT kiralik_urunleri_urun_id_fkey FOREIGN KEY (urun_id) REFERENCES public.urunleri(urun_id);


--
-- Name: magaza magaza_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT magaza_adres_id_fkey FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);


--
-- Name: musteri musteri_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_adres_id_fkey FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id);


--
-- Name: musteri_odeme musteri_odeme_musteri_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_odeme
    ADD CONSTRAINT musteri_odeme_musteri_id_fkey FOREIGN KEY (musteri_id) REFERENCES public.musteri(musteri_id);


--
-- Name: musteri_odeme musteri_odeme_urun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_odeme
    ADD CONSTRAINT musteri_odeme_urun_id_fkey FOREIGN KEY (urun_id) REFERENCES public.urunleri(urun_id);


--
-- Name: sehir sehir_ulke_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT sehir_ulke_id_fkey FOREIGN KEY (ulke_id) REFERENCES public.ulke(ulke_id);


--
-- Name: silindi_siparisler silindi_siparisler_siparis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.silindi_siparisler
    ADD CONSTRAINT silindi_siparisler_siparis_id_fkey FOREIGN KEY (siparis_id) REFERENCES public.siparisler(siparis_id);


--
-- Name: silindi_urunleri silindi_urunleri_surun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.silindi_urunleri
    ADD CONSTRAINT silindi_urunleri_surun_id_fkey FOREIGN KEY (surun_id) REFERENCES public.urunleri(urun_id);


--
-- Name: siparisler siparisler_urun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisler_urun_id_fkey FOREIGN KEY (urun_id) REFERENCES public.urunleri(urun_id);


--
-- Name: urunleri urunler_magaza_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunleri
    ADD CONSTRAINT urunler_magaza_id_fkey FOREIGN KEY (magaza_id) REFERENCES public.magaza(magaza_id);


--
-- Name: urunleri urunleri_dil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunleri
    ADD CONSTRAINT urunleri_dil_id_fkey FOREIGN KEY (dil_id) REFERENCES public.dil(dil_id);


--
-- PostgreSQL database dump complete
--


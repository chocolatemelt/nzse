PGDMP     /    &                 y            nzse    11.10    11.10     %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            (           1262    16393    nzse    DATABASE     �   CREATE DATABASE nzse WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE nzse;
             postgres    false            )           0    0    DATABASE nzse    COMMENT     :   COMMENT ON DATABASE nzse IS 'new zhiland stock exchange';
                  postgres    false    2856            *           0    0    DATABASE nzse    ACL     #   GRANT ALL ON DATABASE nzse TO zhi;
                  postgres    false    2856            �            1259    16400 	   exchanges    TABLE     g   CREATE TABLE public.exchanges (
    mic character(4) NOT NULL,
    name text,
    abbreviation text
);
    DROP TABLE public.exchanges;
       public         postgres    false            �            1259    16408    listings    TABLE     �   CREATE TABLE public.listings (
    mic character(4),
    symbol character(5),
    name text,
    logo_url text,
    shares_float bigint,
    market_cap bigint,
    previous_close numeric(19,4),
    permno character(32) NOT NULL
);
    DROP TABLE public.listings;
       public         postgres    false            �            1259    16427    stocks    TABLE     <  CREATE TABLE public.stocks (
    open numeric(19,4) NOT NULL,
    close numeric(19,4) NOT NULL,
    high numeric(19,4) NOT NULL,
    low numeric(19,4) NOT NULL,
    bid numeric(19,4) NOT NULL,
    ask numeric(19,4) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    permno character(32) NOT NULL
);
    DROP TABLE public.stocks;
       public         postgres    false            �            1259    16563    stocks_owned    TABLE     �   CREATE TABLE public.stocks_owned (
    user_id character(32) NOT NULL,
    permno character(32) NOT NULL,
    purchase_price numeric(19,4) NOT NULL,
    amount integer NOT NULL
);
     DROP TABLE public.stocks_owned;
       public         postgres    false            �            1259    16435    transactions    TABLE       CREATE TABLE public.transactions (
    transaction_id text NOT NULL,
    buyer_id character(32) NOT NULL,
    seller_id character(32) NOT NULL,
    shares integer NOT NULL,
    per_value numeric(19,4) NOT NULL,
    total numeric(19,4),
    permno character(32) NOT NULL
);
     DROP TABLE public.transactions;
       public         postgres    false            �            1259    16395    users    TABLE     ]   CREATE TABLE public.users (
    capital numeric(19,4),
    user_id character(32) NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false                      0    16400 	   exchanges 
   TABLE DATA               <   COPY public.exchanges (mic, name, abbreviation) FROM stdin;
    public       postgres    false    197   c"                 0    16408    listings 
   TABLE DATA               q   COPY public.listings (mic, symbol, name, logo_url, shares_float, market_cap, previous_close, permno) FROM stdin;
    public       postgres    false    198   �"                  0    16427    stocks 
   TABLE DATA               W   COPY public.stocks (open, close, high, low, bid, ask, "timestamp", permno) FROM stdin;
    public       postgres    false    199   �"       "          0    16563    stocks_owned 
   TABLE DATA               O   COPY public.stocks_owned (user_id, permno, purchase_price, amount) FROM stdin;
    public       postgres    false    201   �"       !          0    16435    transactions 
   TABLE DATA               m   COPY public.transactions (transaction_id, buyer_id, seller_id, shares, per_value, total, permno) FROM stdin;
    public       postgres    false    200   �"                 0    16395    users 
   TABLE DATA               1   COPY public.users (capital, user_id) FROM stdin;
    public       postgres    false    196   �"       �
           2606    16407    exchanges exchanges_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_pkey PRIMARY KEY (mic);
 B   ALTER TABLE ONLY public.exchanges DROP CONSTRAINT exchanges_pkey;
       public         postgres    false    197            �
           2606    16501    listings permno 
   CONSTRAINT     Q   ALTER TABLE ONLY public.listings
    ADD CONSTRAINT permno PRIMARY KEY (permno);
 9   ALTER TABLE ONLY public.listings DROP CONSTRAINT permno;
       public         postgres    false    198            �
           2606    16442    transactions transactions_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public         postgres    false    200            �
           2606    16567    stocks_owned user_stock 
   CONSTRAINT     b   ALTER TABLE ONLY public.stocks_owned
    ADD CONSTRAINT user_stock PRIMARY KEY (user_id, permno);
 A   ALTER TABLE ONLY public.stocks_owned DROP CONSTRAINT user_stock;
       public         postgres    false    201    201            �
           2606    16399    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    196            �
           1259    16507 
   fki_permno    INDEX     ?   CREATE INDEX fki_permno ON public.stocks USING btree (permno);
    DROP INDEX public.fki_permno;
       public         postgres    false    199            �
           2606    16443    transactions buyer_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT buyer_id FOREIGN KEY (buyer_id) REFERENCES public.users(user_id);
 ?   ALTER TABLE ONLY public.transactions DROP CONSTRAINT buyer_id;
       public       postgres    false    200    196    2707            �
           2606    16416    listings mic    FK CONSTRAINT     l   ALTER TABLE ONLY public.listings
    ADD CONSTRAINT mic FOREIGN KEY (mic) REFERENCES public.exchanges(mic);
 6   ALTER TABLE ONLY public.listings DROP CONSTRAINT mic;
       public       postgres    false    2709    197    198            �
           2606    16508    stocks permno    FK CONSTRAINT     r   ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT permno FOREIGN KEY (permno) REFERENCES public.listings(permno);
 7   ALTER TABLE ONLY public.stocks DROP CONSTRAINT permno;
       public       postgres    false    198    2711    199            �
           2606    16513    transactions permno    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT permno FOREIGN KEY (permno) REFERENCES public.listings(permno) NOT VALID;
 =   ALTER TABLE ONLY public.transactions DROP CONSTRAINT permno;
       public       postgres    false    2711    198    200            �
           2606    16573    stocks_owned permno    FK CONSTRAINT     x   ALTER TABLE ONLY public.stocks_owned
    ADD CONSTRAINT permno FOREIGN KEY (permno) REFERENCES public.listings(permno);
 =   ALTER TABLE ONLY public.stocks_owned DROP CONSTRAINT permno;
       public       postgres    false    201    2711    198            �
           2606    16448    transactions seller_id    FK CONSTRAINT     |   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT seller_id FOREIGN KEY (seller_id) REFERENCES public.users(user_id);
 @   ALTER TABLE ONLY public.transactions DROP CONSTRAINT seller_id;
       public       postgres    false    196    200    2707            �
           2606    16568    stocks_owned user_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.stocks_owned
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 >   ALTER TABLE ONLY public.stocks_owned DROP CONSTRAINT user_id;
       public       postgres    false    196    201    2707                  x������ � �            x������ � �             x������ � �      "      x������ � �      !      x������ � �            x������ � �     
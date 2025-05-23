PGDMP                      }            GSTAT    16.3    16.3 0    S           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            T           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            U           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            V           1262    16394    GSTAT    DATABASE     s   CREATE DATABASE "GSTAT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE "GSTAT";
                postgres    false            �            1259    24718    achievements    TABLE     �   CREATE TABLE public.achievements (
    id integer NOT NULL,
    name character varying,
    description character varying,
    "games.id" bigint,
    icon text
);
     DROP TABLE public.achievements;
       public         heap    postgres    false            �            1259    24742    achievements_platforms    TABLE     z   CREATE TABLE public.achievements_platforms (
    "achievements.id" bigint NOT NULL,
    "platforms.id" bigint NOT NULL
);
 *   DROP TABLE public.achievements_platforms;
       public         heap    postgres    false            �            1259    24767    comments    TABLE     �   CREATE TABLE public.comments (
    id bigint NOT NULL,
    "users.id" bigint,
    "games.id" bigint,
    description character varying,
    date date,
    "time" time with time zone
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    24814    friends    TABLE     d   CREATE TABLE public.friends (
    "users_a.id" bigint NOT NULL,
    "users_b.id" bigint NOT NULL
);
    DROP TABLE public.friends;
       public         heap    postgres    false            �            1259    16450    games    TABLE     �   CREATE TABLE public.games (
    id bigint NOT NULL,
    name character varying,
    rating numeric,
    "platform.id" bigint,
    icon text,
    players_count bigint
);
    DROP TABLE public.games;
       public         heap    postgres    false            �            1259    24699 	   platforms    TABLE     e   CREATE TABLE public.platforms (
    id bigint NOT NULL,
    name character varying,
    icon text
);
    DROP TABLE public.platforms;
       public         heap    postgres    false            �            1259    16457    users    TABLE     1  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    password character varying,
    nickname character varying,
    email_psn character varying,
    password_psn character varying,
    email_xbox character varying,
    password_xbox character varying,
    avatar text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24725    users_achievements    TABLE     r   CREATE TABLE public.users_achievements (
    "users.id" bigint NOT NULL,
    "achievements.id" bigint NOT NULL
);
 &   DROP TABLE public.users_achievements;
       public         heap    postgres    false            �            1259    24880    users_games    TABLE     �   CREATE TABLE public.users_games (
    "users.id" bigint NOT NULL,
    "games.id" bigint NOT NULL,
    users_rating bigint,
    user_playtime_hours bigint
);
    DROP TABLE public.users_games;
       public         heap    postgres    false            �            1259    24799 	   wishlists    TABLE     b   CREATE TABLE public.wishlists (
    "users.id" bigint NOT NULL,
    "games.id" bigint NOT NULL
);
    DROP TABLE public.wishlists;
       public         heap    postgres    false            J          0    24718    achievements 
   TABLE DATA           O   COPY public.achievements (id, name, description, "games.id", icon) FROM stdin;
    public          postgres    false    218   c:       L          0    24742    achievements_platforms 
   TABLE DATA           S   COPY public.achievements_platforms ("achievements.id", "platforms.id") FROM stdin;
    public          postgres    false    220   @;       M          0    24767    comments 
   TABLE DATA           Y   COPY public.comments (id, "users.id", "games.id", description, date, "time") FROM stdin;
    public          postgres    false    221   l;       O          0    24814    friends 
   TABLE DATA           =   COPY public.friends ("users_a.id", "users_b.id") FROM stdin;
    public          postgres    false    223   �A       G          0    16450    games 
   TABLE DATA           U   COPY public.games (id, name, rating, "platform.id", icon, players_count) FROM stdin;
    public          postgres    false    215   �A       I          0    24699 	   platforms 
   TABLE DATA           3   COPY public.platforms (id, name, icon) FROM stdin;
    public          postgres    false    217   iB       H          0    16457    users 
   TABLE DATA           z   COPY public.users (id, email, password, nickname, email_psn, password_psn, email_xbox, password_xbox, avatar) FROM stdin;
    public          postgres    false    216   �B       K          0    24725    users_achievements 
   TABLE DATA           K   COPY public.users_achievements ("users.id", "achievements.id") FROM stdin;
    public          postgres    false    219   �C       P          0    24880    users_games 
   TABLE DATA           `   COPY public.users_games ("users.id", "games.id", users_rating, user_playtime_hours) FROM stdin;
    public          postgres    false    224   �C       N          0    24799 	   wishlists 
   TABLE DATA           ;   COPY public.wishlists ("users.id", "games.id") FROM stdin;
    public          postgres    false    222   �C       �           2606    24724    achievements achievements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.achievements DROP CONSTRAINT achievements_pkey;
       public            postgres    false    218            �           2606    24746 2   achievements_platforms achievements_platforms_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.achievements_platforms
    ADD CONSTRAINT achievements_platforms_pkey PRIMARY KEY ("achievements.id", "platforms.id");
 \   ALTER TABLE ONLY public.achievements_platforms DROP CONSTRAINT achievements_platforms_pkey;
       public            postgres    false    220    220            �           2606    24773    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    221            �           2606    24828    friends friends_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY ("users_a.id", "users_b.id");
 >   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_pkey;
       public            postgres    false    223    223            �           2606    24896    games game_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.games
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.games DROP CONSTRAINT game_pkey;
       public            postgres    false    215            �           2606    24705    platforms platforms_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.platforms DROP CONSTRAINT platforms_pkey;
       public            postgres    false    217            �           2606    24741 *   users_achievements users_achievements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT users_achievements_pkey PRIMARY KEY ("achievements.id", "users.id");
 T   ALTER TABLE ONLY public.users_achievements DROP CONSTRAINT users_achievements_pkey;
       public            postgres    false    219    219            �           2606    24894    users_games users_games_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.users_games
    ADD CONSTRAINT users_games_pkey PRIMARY KEY ("users.id", "games.id");
 F   ALTER TABLE ONLY public.users_games DROP CONSTRAINT users_games_pkey;
       public            postgres    false    224    224            �           2606    16463    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    24813    wishlists wishlists_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY ("users.id", "games.id");
 B   ALTER TABLE ONLY public.wishlists DROP CONSTRAINT wishlists_pkey;
       public            postgres    false    222    222            �           2606    24735 $   users_achievements achievements_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT achievements_fkey FOREIGN KEY ("achievements.id") REFERENCES public.achievements(id) NOT VALID;
 N   ALTER TABLE ONLY public.users_achievements DROP CONSTRAINT achievements_fkey;
       public          postgres    false    219    3485    218            �           2606    24747 (   achievements_platforms achievements_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.achievements_platforms
    ADD CONSTRAINT achievements_fkey FOREIGN KEY ("achievements.id") REFERENCES public.achievements(id) NOT VALID;
 R   ALTER TABLE ONLY public.achievements_platforms DROP CONSTRAINT achievements_fkey;
       public          postgres    false    220    218    3485            �           2606    24897    achievements games_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT games_fkey FOREIGN KEY ("games.id") REFERENCES public.games(id) NOT VALID;
 A   ALTER TABLE ONLY public.achievements DROP CONSTRAINT games_fkey;
       public          postgres    false    3479    218    215            �           2606    24902    comments games_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.comments
    ADD CONSTRAINT games_fkey FOREIGN KEY ("games.id") REFERENCES public.games(id) NOT VALID;
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT games_fkey;
       public          postgres    false    221    215    3479            �           2606    24907    wishlists games_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT games_fkey FOREIGN KEY ("games.id") REFERENCES public.games(id) NOT VALID;
 >   ALTER TABLE ONLY public.wishlists DROP CONSTRAINT games_fkey;
       public          postgres    false    3479    222    215            �           2606    24912    users_games games_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_games
    ADD CONSTRAINT games_fkey FOREIGN KEY ("games.id") REFERENCES public.games(id) NOT VALID;
 @   ALTER TABLE ONLY public.users_games DROP CONSTRAINT games_fkey;
       public          postgres    false    215    3479    224            �           2606    24752 %   achievements_platforms platforms_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.achievements_platforms
    ADD CONSTRAINT platforms_fkey FOREIGN KEY ("platforms.id") REFERENCES public.platforms(id) NOT VALID;
 O   ALTER TABLE ONLY public.achievements_platforms DROP CONSTRAINT platforms_fkey;
       public          postgres    false    3483    220    217            �           2606    24762    games platforms_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.games
    ADD CONSTRAINT platforms_fkey FOREIGN KEY ("platform.id") REFERENCES public.platforms(id) NOT VALID;
 >   ALTER TABLE ONLY public.games DROP CONSTRAINT platforms_fkey;
       public          postgres    false    3483    217    215            �           2606    24817    friends users_a_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT users_a_fkey FOREIGN KEY ("users_a.id") REFERENCES public.users(id) NOT VALID;
 >   ALTER TABLE ONLY public.friends DROP CONSTRAINT users_a_fkey;
       public          postgres    false    223    216    3481            �           2606    24822    friends users_b_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT users_b_fkey FOREIGN KEY ("users_b.id") REFERENCES public.users(id) NOT VALID;
 >   ALTER TABLE ONLY public.friends DROP CONSTRAINT users_b_fkey;
       public          postgres    false    223    3481    216            �           2606    24730    users_achievements users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT users_fkey FOREIGN KEY ("users.id") REFERENCES public.users(id) NOT VALID;
 G   ALTER TABLE ONLY public.users_achievements DROP CONSTRAINT users_fkey;
       public          postgres    false    3481    219    216            �           2606    24779    comments users_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.comments
    ADD CONSTRAINT users_fkey FOREIGN KEY ("users.id") REFERENCES public.users(id) NOT VALID;
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT users_fkey;
       public          postgres    false    221    3481    216            �           2606    24802    wishlists users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT users_fkey FOREIGN KEY ("users.id") REFERENCES public.users(id) NOT VALID;
 >   ALTER TABLE ONLY public.wishlists DROP CONSTRAINT users_fkey;
       public          postgres    false    216    3481    222            �           2606    24883    users_games users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_games
    ADD CONSTRAINT users_fkey FOREIGN KEY ("users.id") REFERENCES public.users(id) NOT VALID;
 @   ALTER TABLE ONLY public.users_games DROP CONSTRAINT users_fkey;
       public          postgres    false    3481    216    224            J   �   x�]�AN1EמS��(E�%,
!��X���ĕ�u8=������o��hf�K�tf��)u|�z��|����p��)�%-MF-хaOW)�Ÿ�d���S��Jl���cǧ�/�W��-<ژd�<�F��1�8��!�$
قޚp�bؙ����n\��[{b�O�1�K,��ɍ�E�LZ��<sp�;�a�r�\�      L      x�3�4�2�4�2bC ��c���� '�       M     x�]VMs�6=˿7�SY�GI.�I����t�N. �"a�@1̯���8��	,v߾���z�]�RV�M�Q�#�jG�j�����J�U�eV���S����B$E�j� D�S�t�T�5���tTcG�%�y$`���#��R���NO�"U���Nx5�/}��Ʒ�`��)�M�9"��I���)�9O�aB7%������́�r�AE�I��t����s�ݬ�m֒����_6e�d��V_�g$��A��;u�)& ��4����.��xe�0w:���xͤ(e]ق�՟8+���͑��`��K�G�I_��`|:8w�l>�HS	M�#�@������G��=�"�����A�mhp�Y6܆#0F�h��[��`�Xʓ��p�o��V�4nESk/뜱���A�ޢE�J;�T#��tזr��
ʤR�㲴aDH���Q����p�I���q(���oc�r���v`�
�ф!!�N#��P�u�� �����.%���H���kD;�~��g09��Yc2��@�x�|lN5�X�&M��:�40
�#���df�+ӂ˨ Gc�#��0.�c�S�r�������Y
��H���z�B�Or)�zuM��la�r��Ʊ��m�!<r@&=h�6H��Z#9����
~����#
�#9m�S�iL��C,x�&��1���V�1��<W�� �ĺ����Tƛ8B�( U1A� 8w�i�Zl��_o֛��n�~�r�}�^���]lᏻŞ��9׃�h�~���ř�F�&�e�_�w�h� ֱ�/�?C�&u��M.�'~	)Iq�m�Eiem,�m��"	��GB�F�k�8�ׁl�<��L��Ί;*V��9�JP�ɮ�(�X�v��,@y��:��PӨ� ~�U�BLm������en�!�F�:��CEu.�RF�<Čgf��7o�7G݃�XζZ�`�L�c�po�]��ʫ�9���YcX�ӓx�3�ܳ���Z���|cK˼8�%�	[��5\!�y�Ru��YeRq'�o��N���l6��f(�3�4W�Ɖ��I�g ��r��}��ϛ�����|���1�2����`vZN�d�SЪ4�LnU�r�a���ew��T ���u�6Ş��Y�S�-�X˞���+�I>}�elYPrP3��F�2�^��=c�H�"/!Ё�LA��z��7�wa򎡲0��d�/_`�#��R�Gq�ya�p�Ui�d� ɑ��s�1��:����\+ي:[̧�A&D��a`4>�#|��8Б�`�˓���m�E�ћ�� ���M�;U�s?v��<jݣ�G*|y*r�;E�A �1o1E�/*8
>z���s�İ�';��.�G���ݐ�ӝ >��ã�1�G��3Q�ԇ(�GDѭ��q��0�E���=�,�{#���wp�S[�M�_�
.YG6��1��@�t��|�k_>%�W�\��ޅ�p`��|L�h�Wr�ld�3�38�,�#d8]1@̀ԅ|-�T���^��BD�W�C�7������v�y�r���͗�����s�      O      x�3�4�2�4b# 6����� C      G   �   x�}�A
�0���s�`Z���"HAD�⦛��*�DҜ�x1Sh��b�?�L;+��x%�����������0���U$1,���Ok0��&��C�?�]<���4-"Z��+��a�I*(y���Zy�ΌA�"q=��:a�ɔ��*�榎3����SK      I   :   x�3��I�,.I,������2�Hʯ ��9�KRsALN�̼�Լ�|/F��� �y�      H   �   x�}�A�0��ۏ!����ɛ��#	!dF"c�	��.`�ls�齷~ms6�U��S�]�X�r!Y�6��6��t�L�s���<%������C�B���u��0�B�6��cf�^ߚ~ �N���K��T�Ȼӛ���2��Ǣ?��gl��fG�{B�
`G��>��$u��j�����
!����:Aʌs����c      K      x�3�4�2�4bc 6bC�=... 'n�      P   >   x�3�4�����2�4�1�9-!C�"e14��̡,c�*c�>#NS�Ȁ(����� �:�      N      x�3�4����� p!     
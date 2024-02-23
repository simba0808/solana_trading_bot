PGDMP                      |            bot    16.2    16.2 -    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16399    bot    DATABASE     ~   CREATE DATABASE bot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE bot;
                master    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    5            �            1259    16491 
   copy_trade    TABLE     ,  CREATE TABLE public.copy_trade (
    id integer NOT NULL,
    copy_wallet_address character varying(255) NOT NULL,
    amount double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.copy_trade;
       public         heap    postgres    false    5            �            1259    16498    copy_trade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.copy_trade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 (   DROP SEQUENCE public.copy_trade_id_seq;
       public          postgres    false    225    5            �           0    0    copy_trade_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.copy_trade_id_seq OWNED BY public.copy_trade.id;
          public          postgres    false    226            �            1259    16400    incomes    TABLE     4  CREATE TABLE public.incomes (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    sender_id character varying(255) NOT NULL,
    referral double precision,
    lucky double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.incomes;
       public         heap    postgres    false    5            �            1259    16405    incomes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.incomes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.incomes_id_seq;
       public          postgres    false    215    5            �           0    0    incomes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.incomes_id_seq OWNED BY public.incomes.id;
          public          postgres    false    216            �            1259    16406    settings    TABLE     �  CREATE TABLE public.settings (
    id character varying(255) NOT NULL,
    announcements boolean DEFAULT true NOT NULL,
    min_pos_value double precision DEFAULT '0.001'::double precision NOT NULL,
    auto_buy boolean DEFAULT false NOT NULL,
    auto_buy_amount double precision DEFAULT '0.1'::double precision NOT NULL,
    left_buy_amount double precision DEFAULT '1'::double precision NOT NULL,
    right_buy_amount double precision DEFAULT '5'::double precision NOT NULL,
    left_sell_amount double precision DEFAULT '25'::double precision NOT NULL,
    right_sell_amount double precision DEFAULT '100'::double precision NOT NULL,
    buy_slippage double precision DEFAULT '20'::double precision NOT NULL,
    sell_slippage double precision DEFAULT '20'::double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    auto_sell boolean DEFAULT false NOT NULL,
    auto_sell_amount integer DEFAULT 50 NOT NULL,
    gas_fee double precision DEFAULT 0.0005 NOT NULL,
    auto_buy_slippage double precision DEFAULT 20 NOT NULL,
    auto_sell_slippage double precision DEFAULT 20 NOT NULL
);
    DROP TABLE public.settings;
       public         heap    postgres    false    5            �            1259    16424    trades    TABLE     }  CREATE TABLE public.trades (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    input_mint character varying(255) NOT NULL,
    in_amount double precision NOT NULL,
    output_mint character varying(255) NOT NULL,
    out_amount double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.trades;
       public         heap    postgres    false    5            �            1259    16429    trades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.trades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.trades_id_seq;
       public          postgres    false    5    219                        0    0    trades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;
          public          postgres    false    220            �            1259    16459 
   strategies    TABLE     :  CREATE TABLE public.strategies (
    id integer DEFAULT nextval('public.trades_id_seq'::regclass) NOT NULL,
    user_id character varying(255) NOT NULL,
    percent integer NOT NULL,
    amount integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.strategies;
       public         heap    postgres    false    220    5            �            1259    16489    strategies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 (   DROP SEQUENCE public.strategies_id_seq;
       public          postgres    false    223    5                       0    0    strategies_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.strategies_id_seq OWNED BY public.strategies.id;
          public          postgres    false    224            �            1259    16419    tokens    TABLE     :  CREATE TABLE public.tokens (
    address character varying(255) NOT NULL,
    decimals integer,
    liquidity integer,
    mc double precision,
    name character varying(255),
    symbol character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.tokens;
       public         heap    postgres    false    5            �            1259    16430    users    TABLE     �   CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    referrer_id character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    5            �            1259    16435    wallets    TABLE       CREATE TABLE public.wallets (
    id character varying(255) NOT NULL,
    public_key character varying(255) NOT NULL,
    secret_key character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.wallets;
       public         heap    postgres    false    5            K           2604    16499    copy_trade id    DEFAULT     n   ALTER TABLE ONLY public.copy_trade ALTER COLUMN id SET DEFAULT nextval('public.copy_trade_id_seq'::regclass);
 <   ALTER TABLE public.copy_trade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            9           2604    16440 
   incomes id    DEFAULT     h   ALTER TABLE ONLY public.incomes ALTER COLUMN id SET DEFAULT nextval('public.incomes_id_seq'::regclass);
 9   ALTER TABLE public.incomes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            I           2604    16441 	   trades id    DEFAULT     f   ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);
 8   ALTER TABLE public.trades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �          0    16491 
   copy_trade 
   TABLE DATA           f   COPY public.copy_trade (id, copy_wallet_address, amount, created_at, updated_at, user_id) FROM stdin;
    public          postgres    false    225   �7       �          0    16400    incomes 
   TABLE DATA           b   COPY public.incomes (id, user_id, sender_id, referral, lucky, created_at, updated_at) FROM stdin;
    public          postgres    false    215   �8       �          0    16406    settings 
   TABLE DATA           )  COPY public.settings (id, announcements, min_pos_value, auto_buy, auto_buy_amount, left_buy_amount, right_buy_amount, left_sell_amount, right_sell_amount, buy_slippage, sell_slippage, created_at, updated_at, auto_sell, auto_sell_amount, gas_fee, auto_buy_slippage, auto_sell_slippage) FROM stdin;
    public          postgres    false    217   �:       �          0    16459 
   strategies 
   TABLE DATA           Z   COPY public.strategies (id, user_id, percent, amount, created_at, updated_at) FROM stdin;
    public          postgres    false    223   y=       �          0    16419    tokens 
   TABLE DATA           h   COPY public.tokens (address, decimals, liquidity, mc, name, symbol, created_at, updated_at) FROM stdin;
    public          postgres    false    218   >       �          0    16424    trades 
   TABLE DATA           u   COPY public.trades (id, user_id, input_mint, in_amount, output_mint, out_amount, created_at, updated_at) FROM stdin;
    public          postgres    false    219    >       �          0    16430    users 
   TABLE DATA           H   COPY public.users (id, referrer_id, created_at, updated_at) FROM stdin;
    public          postgres    false    221   �J       �          0    16435    wallets 
   TABLE DATA           U   COPY public.wallets (id, public_key, secret_key, created_at, updated_at) FROM stdin;
    public          postgres    false    222   �L                  0    0    copy_trade_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.copy_trade_id_seq', 105, true);
          public          postgres    false    226                       0    0    incomes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.incomes_id_seq', 32, true);
          public          postgres    false    216                       0    0    strategies_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.strategies_id_seq', 1, false);
          public          postgres    false    224                       0    0    trades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.trades_id_seq', 95, true);
          public          postgres    false    220            [           2606    16495    copy_trade copy_trade_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.copy_trade
    ADD CONSTRAINT copy_trade_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.copy_trade DROP CONSTRAINT copy_trade_pkey;
       public            postgres    false    225            M           2606    16443    incomes incomes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.incomes DROP CONSTRAINT incomes_pkey;
       public            postgres    false    215            O           2606    16445    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    217            Y           2606    16463    strategies strategies_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategies_pkey;
       public            postgres    false    223            Q           2606    16447    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (address);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    218            S           2606    16449    trades trades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_pkey;
       public            postgres    false    219            U           2606    16451    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            W           2606    16453    wallets wallets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public            postgres    false    222            �   �   x�}ͽ
�P ����|׫n�A��)�AK!eFE�]��k,��3v�[�Vؕ�츛�kG���.�M3���Β�*9'����! ��]�%�4�����f� )�L��_<�4�܋�p<�}�ټ�E��m�m�������G+.H�������� B�Q[O)�կ<      �   k  x���Kn�0D��Sx���:DN���#�I0�O��j
�@5�E��NȵE�����[_�1D<Y?�>�?�O�S[���I>�L��V�VO���� �Ku��>�mxRO�UWf/�n�\c�zm�7N�[iJ3v��S��k�z�K�ž%���RD��|2�e�F	����\�1qy���,��&[�[�:d+�$�|�kqJ�j!i+���=�aV9�
��^�T�؎+�*�B>O��hi4�l��hX��(��劓�o���?�I���p�+@��u�
���̾�"E}�(剓��UN`ny8xv��5��w���80wtv[��m������Σ�L�2N/w��K@���Ei�m�o	���	���|�Vp/��Sʸ��|sn���(��q/�ؒ]@�F�%�XĖ�0=��,Tb3�N�����K6�[�A�Iq/�P����V�Z�x3�^�!l38l>w�E�ًK��4�����
7o݌����i��q�.�ɲ�Q��o����{{~K���)��#On��q�m����"�����-?J x����뎰�!�7�XA����g%;�v{mQ~��L%���e%R�z�?��n	)n�ce�� ��      �   m  x���Kn�0���)�*�MJg�uO��ch7�Ɩ�:Ȃ ��|����G��5A��3�q�I'�	&z<����	6�"lw<}N
k^��$73��5�$RC*�~@|��$|L��=�Ҍ��K���Fxꖼ��G<�FZ k܄��Ȝ*iG��̔����I�@Mh�8�"�1��\�)πyI�!��ЁFv	��i!�:3��FX�����RQ���Z�PH��Y��
���HPQ��.��3jNFc�Vm�� �U�*��]�E�9+��/X6%�G4afw����P	������4�!��R"���<?��E�a�X]�Tj�z�ġJn¹�x�|��&rdo�LT�,R�^冣���>t�H��ȳq�'D�!���y/$}��K��P��95Z����miid��[�k(�X��TsS�L�KZ�4�t�����b�rԭ����c.��W �@��o�>��$x�q�B8��j$��,��}E>B��.���Wr���s7�����ο���{�Y@-yz(E^�����
&�*��j��u5��Hb&��*=W��?.����ʞ�f�6��y��ӑ�䥬X�.[+�70�=���E�Sn��_���=      �   z   x�}λ�0���H���Yn�9�i"G��C��# ��$��88��X#iB���]�?�/�ȝZ�+e�K핺��,J�}9���UW��HXIQ��ph�9?����2�x׊��H���Re7�      �      x������ � �      �   �  x�͚�R*˲�����;VG�N��i**�FQA<���lƘ����ڎix�����Y�V5Tlp��������`���J���v��-xj�����u�Ǧ�FОW�OWw��Y�rr9�
xVtd�? �Kÿ ��"T9D��@�I�����|^�k}N�����n��t�>
�C7��a=���#7�Y�.��sHT5!
���MH��҂.��ؠ=g��WG�q7))N�~���
[�CHQ�*@UK�d�Ӓ28��<�(h�	�))�.�j�t!��5��>��U���]�MHʕN_�W��f�]?xl��O�����mtχ�W#?|��C$��ك�cQ���M�))_��HkĒ�q���������xXk����}����'���|�xd������S4@��^��fɯ� W�R�
{��aF�	'e<g���`"$�GNJJ�D��
Y�'����|������ȑw�ݗ��!=�w|��ً���i�a���^��[_����f�9��z5��Vhc���΂Q\���愤d��e��i���C90����v0'$�ʎҫ+9�aO)0iT%����)E�bv^���s}d��@NH
�`&�L�5�`F�"cv�9!))�{g��Y���6j�vb�Nf�^�����tM/�g���_ۣ��{�x�C���4[0���洤�}?��`�&�y0��]�f���a����k3\(�"�ڑIIA��Γv���E�N�OI�tAr�F=����33�G��?��/�Nkut�N���hػn����qs�}�t��\�*<&��JL<�xoRRX��}�7�޶�ê��=�<X�4�Oo[���x|^[<�OLx���avR��� �l�4��������&�\4^b1d*�dM7��g�;p�B�f\d��01����a���ݨ^�K٢���u��#}��B�͸^������v�mRRh����fxp�7��xZ�gz֖���G��~�57���c�ۈx�f��:���*M�ػ,rZR��:��0�%��\�%��N�Ou*��,!A&7�j ����&���0�!j��A6ւfl�]�q�%Ez��a�����9�>�`t��a�=��,��{G�����j�jTH��˰(��&��#���F�t��I� 9`�z������?[���u�O�3�{K�:~>X�,��v�x~��؂��H<d�Y�؀&�O��톓< ��NK�RG��|CqSp�p�M̚��{��e�;HLO���$Eg'9��V�<���×���㚃�c�h�F�����=�h����������\�p`�V��m�l�d#�I伤��?�-�@��d��M��ƂX	��N��]�"i��<�S��5G���e/�:t�ΖWG�����N�.�i�^�.߼�z�<K^Xo���BK2��g�&�I��2����b���R�^�[�~<z9�=5�<�=^���=�|���Gf�>�^�M��H���9d��j�GNJ�\� �CZ��ކ`RX.�c�dy�8-)��K,� H�5�]
+T�T�#�,pJQ����f^�${(X�<��$T|��q���A�.II9-�㫙my,�9	����"A�g#�V�L���bO�=�sV�l���&�(牓�b,���b,U���}rٸkgv '$���Q������R�=���\&�%żG������5g�|U���U���d�D)��Z�[���!�S�r��M1q<3I'O"�%ť��gb�ۗ�r�7����w��7���=oN��e���y8s��E�qA�B`�A;���������������s��X!��L2�܀��/�� CiaW��b��G����Z3�q��9�^NB8�=��zg���n�ϳ�U[K2n��Y.��r�9!){׌�]-'��+��׎�'�ĽYs՞�������o��ɍ1�0�q5�����).�i�!����Iu����`2��U�1rQNKʔ�P*1�ñ�iY�t�M���#������I����k��q�>,J$�r��I��E9-)S��}F��zd{�Gsr�j�~��ys�Q�|\�����I���1�8��_Yy� �(��O-�s8))��~Eזg��|ę��y(�"w�~Jʘ�����f�.G��t�|�^�����lլ_|�������_]5G�j_�e���J!���5>��//)�j}�V�>�B �٭�Ú@�as������+M<ȶ#֮��2y��f�\t�C6�3�2��W�J IIeM�u��*5 g�|\�<�"NHʄ��@(}���@1b�c�P�!4��H��������(78�M�_P����������NJ*���%�1�ߖKW5'cZ��?�%d/1K%6�"��R8!)k�Y���x+)[��� {�u�I���,~�e������g��v*�V`���T3��qUbà)](r������偝�����x�@�Or���.>AA�"g$�����I�%���w!�1V����y椤��,�I���yL��N��#'V"d�a�H���qn������`������j�|����m&�C���'�K�ޮ z+�B��f�K��J�Dҍ:')��
-oX-��t�bٌ�8�ſ��<qRR��@���hLGy�Y^|q��)E9S:�1���(��*3���~�V|��`|�8))gK#�qb�2����猯N3X�0 D` O���s��J|���^l��	SX�zĈe�Ӓr�|ZX�ei�G���E����!�%����䤤\����-��@�>�X.�7�7wG��psԿmjKl���[�n�fy� ����	E���^�J��18A�,W���ϕ���<�N����>�4�_s\�
6�]�_��I��ۍ?t
��G��e�"�!b�a�6�����4���X�6o�G?�\^�ǵ����ޟ��&��}��xD�O���_���D��m��_��̌���O��R�$�t JQ����M6-)_���ҡek ����@��MJ�K���[L�u`ͷf��뱽i7/l��4y���������=s�4��~�B������c:�! ������������r^R>$���*�J����+����;�ެǍ�S��8�kl��ӻ����~�Q�dVq>��̔b��}?H��Y촤�Nb�P��0�[�%P���NK*@�hC�h�W� ��A͢�x6r�wP'$�t�3��l�Lj�uH����W��-H6t�"����	R�~��H?�����K��%���R�� �6&      �   �  x�}��m$1E�VuX�(����cX���R�Fߞꉢ��"��N����A@�	��x!�A�#� �'�PY�#�� �ɟߨ�!P�g<8h upL�Y�F�������XQ�  '��A� �=��qx���=�@�vf�Lݪ��8��g��Q����;| ��cE����A�����kjNǌ�	VGR�_��뱖���b�*,���N��xW�螮���9c����el�$J�b��:H�Xsr����nK/��	vv�'��9���LZ��1�fY��qP����.�z��xBͨ�恊�C��8k�; /�5e�z9�C�;����dH�����;�ޜ4s�|-�d�$IE�Nj���BC��0�R�Ł*m�̳�઻��o5�˭��y�8'����B�j���.�8Q��u3�9*��@d���P{���?��3�      �   �  x�}Wَ�Z�|v}�~��k�zc��3�_�'��<|��ZG���ݖe!�dE���$BB�&�*�-;����>�Dy�*�0I�9d�ZHN���:�C~]P�����ύ-�S��
e��=��X"�e�hӧ�K�7C�8��u
oq�L�~N'yO
��A m�q%п��_ ��~G4�?p��HHc򂳙\IM��P��TS���#�F�u�C����d��}ʋ�n7Jq`�^���$Q��� E���&�	k%i��V#���!	�R=��7��0�'���ڪ��?�"��e��Q���|��!������[��Q��T�uU��������U�=�P����v�z[�H�P�m3��Qb��`o>�u���ٽ�bd5+N�'u�c��}�r�~y�;W���O��y���J���8<{��4&�Y.\��'ѩ�`f���n;���@`.P��(-^�D�3�XT�/I���2O�b۾ܢi5�.�]m�$
eP��F�%Jr����Jǻ�1)�J��P%~��J@�~��/*~@o�ԕ�E^d����JB�����2�UI<��Z�q�I{���Eݞ3����=�P�e~V+�#�|��t�O�	j����v�:o�YZ�x�m !���떷���o\� �;�O�CoISg50�/�L;���iۛ�΃�{T�V��Lj���|>ܗ$c�\�8.����P�^�-�]ܼ[�	�J�%�&��B��ӑ���t�hl2� �c����$b��آ�ƕ��~���ߡ�4�#�z��W�hqhöۖZ^�H�x��N@�" .x�<�����|B�I�����g�I�<]�a[U�9�
��ebQ �\�h�;Wb���B<���tc
z'�/\���� � �e|��( �� .x]_\F��	�.�u�qh;⌆��~��D�����wYT��p"?�Q��9�U!��G��5�^��F������Q��M[$N�����Lays�u3-�g��+<'�~��?��z�8��!�ԅe��4������D�������2Zz�|�q@����x���2�
��{\���O�%-D,Ḡw��]NH�}��� ��}��s�p��.ev��Ň�ƿ�:_7`>�^�E�� 
AD_��˺}Q����yz+sH��9�#�PG��g��ል�^ �8wE��g˻�X�2ld{�t� d�C[ۆ��-��i�:K��*'/����BUS��&U[y�������s�i��.�+��sA1�E�&��b���h}[��?�SͲY	K������ڥor6{��[��om�T�s�b�Bf�*;=|����YU��S�|47�n�USy����y�,d�^�j�A(%�N��~@pN�;E}/�7荸2 �L\xv
�����`�X&��ŝŵ�f�㕊GS*�9��^Hhq{��K���ۺ/PdB�o�M�e��
'~�(�d��wZ�ܺ���BR��e�(Կ��/@�N��;�է~Bo$��#MQJ��.�!u�g�f"�w3��N��&�dA�'���|�YL�����k�I2m����R��[s:l!�X��9�%:�N��=��'��g5~U�*���b
�����?�w驟йO]���I_�K0��YD���Ԯǒô���][���a\���~d�4?��$���h;��jx�t�r\�1�-ɷj���ѬUqC��h��_7S#)��0z7�2"AY���7�����w��2~�ި+>7C�\o/f�bVn���c�(9��4�����
Q��/i��]Lu�ة���㍈��,�N�m�}��Њ`�ܨ
��(���t}N��gGţy�#����g&}��ŕ8���¿<������	z�������$Q`�z��t�d�|Uv�%����l��}$)��3�/H�5J��|s�6�|/���`X=9v��BfT{plE��{���:�%����v*Ʈ=��a_�*�D@;����e�����N蛌3ÉO�z�$����Ac@���R?Rk�V�����K8��OB����zt�YH5h/��,�Jʢ�J��^W�JDX��Q`X�5ni��ƭ�G#����Ӝ�a��r7%5�E��G�`D�=d��>;2���N �E�荄&�ym0��˨�[Oh���ܲ��N��&��d%�����n��5��|��z���"*4U�ٮ��>�.З�eܳz�99��W-����}	�/��!�v��U2Q��
��\!�_e�z癁�]�\�)�ڧ��Tg<,�������ш����b0R(/�����Y�p��PK���s޶�T�bR�'Xu�*Q����.�<�,I@�#�Ցέ6ؑ���ms�n抉�*��4A2�ym�n�����&I,�(�"�DNeZ4F�Q �s#+��!-ÅT�0~.i���TՁ
�'��L��%����S׫�ա�*�1��'�'�;�^GJM�������r� ��J����3����l���g(�"�] 6�鍱{���\�}V�e�j��&��q�X�_$�,�F�G����Y�E�k�e�����"���3}�kI��2ך�L�k��6�8�U���ۼ��Y����b>�|�������й�b^!���X��M�D��k���1O�R��Q�^[���-Ve,��P�%��msVNO�����{�No��Tm��ӝ�Qʮ����!r�T�Ye><���f�Ò�p�� ��!忹�_g0|�*����?Ao��L��0���1�<���5�#���vN�V���/������g�g% v�$׍���|$��Z�5���mǻ�����wұ3�Zi�A�\{�d�i�cƊ3�����_��>��p�*�t�L�9͊�V3)��͠�Gr�u���.ɻ�sk���v�6&���q,���i~,nu.��@S�Ct�,s�%WMv��4����GA�􎵮��S�sr�'�䐮3�O�����%�z���zF }��z�������>4`�     
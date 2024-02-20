PGDMP  5                    |            bot    16.2    16.2 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                   postgres    false    5            �            1259    16400    incomes    TABLE     4  CREATE TABLE public.incomes (
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
       public          postgres    false    5    219            �           0    0    trades_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;
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
       public          postgres    false    223    5            �           0    0    strategies_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.strategies_id_seq OWNED BY public.strategies.id;
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
       public         heap    postgres    false    5            4           2604    16440 
   incomes id    DEFAULT     h   ALTER TABLE ONLY public.incomes ALTER COLUMN id SET DEFAULT nextval('public.incomes_id_seq'::regclass);
 9   ALTER TABLE public.incomes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            D           2604    16441 	   trades id    DEFAULT     f   ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);
 8   ALTER TABLE public.trades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �          0    16400    incomes 
   TABLE DATA           b   COPY public.incomes (id, user_id, sender_id, referral, lucky, created_at, updated_at) FROM stdin;
    public          postgres    false    215   /       �          0    16406    settings 
   TABLE DATA           )  COPY public.settings (id, announcements, min_pos_value, auto_buy, auto_buy_amount, left_buy_amount, right_buy_amount, left_sell_amount, right_sell_amount, buy_slippage, sell_slippage, created_at, updated_at, auto_sell, auto_sell_amount, gas_fee, auto_buy_slippage, auto_sell_slippage) FROM stdin;
    public          postgres    false    217   �1       �          0    16459 
   strategies 
   TABLE DATA           Z   COPY public.strategies (id, user_id, percent, amount, created_at, updated_at) FROM stdin;
    public          postgres    false    223   D4       �          0    16419    tokens 
   TABLE DATA           h   COPY public.tokens (address, decimals, liquidity, mc, name, symbol, created_at, updated_at) FROM stdin;
    public          postgres    false    218   �4       �          0    16424    trades 
   TABLE DATA           u   COPY public.trades (id, user_id, input_mint, in_amount, output_mint, out_amount, created_at, updated_at) FROM stdin;
    public          postgres    false    219   �4       �          0    16430    users 
   TABLE DATA           H   COPY public.users (id, referrer_id, created_at, updated_at) FROM stdin;
    public          postgres    false    221   zA       �          0    16435    wallets 
   TABLE DATA           U   COPY public.wallets (id, public_key, secret_key, created_at, updated_at) FROM stdin;
    public          postgres    false    222   -C       �           0    0    incomes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.incomes_id_seq', 32, true);
          public          postgres    false    216            �           0    0    strategies_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.strategies_id_seq', 1, false);
          public          postgres    false    224            �           0    0    trades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.trades_id_seq', 92, true);
          public          postgres    false    220            G           2606    16443    incomes incomes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.incomes DROP CONSTRAINT incomes_pkey;
       public            postgres    false    215            I           2606    16445    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    217            S           2606    16463    strategies strategies_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategies_pkey;
       public            postgres    false    223            K           2606    16447    tokens tokens_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (address);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    218            M           2606    16449    trades trades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.trades DROP CONSTRAINT trades_pkey;
       public            postgres    false    219            O           2606    16451    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            Q           2606    16453    wallets wallets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.wallets DROP CONSTRAINT wallets_pkey;
       public            postgres    false    222            �   k  x���Kn�0D��Sx���:DN���#�I0�O��j
�@5�E��NȵE�����[_�1D<Y?�>�?�O�S[���I>�L��V�VO���� �Ku��>�mxRO�UWf/�n�\c�zm�7N�[iJ3v��S��k�z�K�ž%���RD��|2�e�F	����\�1qy���,��&[�[�:d+�$�|�kqJ�j!i+���=�aV9�
��^�T�؎+�*�B>O��hi4�l��hX��(��劓�o���?�I���p�+@��u�
���̾�"E}�(剓��UN`ny8xv��5��w���80wtv[��m������Σ�L�2N/w��K@���Ei�m�o	���	���|�Vp/��Sʸ��|sn���(��q/�ؒ]@�F�%�XĖ�0=��,Tb3�N�����K6�[�A�Iq/�P����V�Z�x3�^�!l38l>w�E�ًK��4�����
7o݌����i��q�.�ɲ�Q��o����{{~K���)��#On��q�m����"�����-?J x����뎰�!�7�XA����g%;�v{mQ~��L%���e%R�z�?��n	)n�ce�� ��      �   :  x���I��@E��)�7��ϩXu���}�R�J�!�|�>�01���&*D�>�&��&M�xX?�\T�����d��%�����h�����%PO���bqe�:&b}�iy�w�]�P�/#'<����
�x����	�+ �*yG�b�̔�ի� 1-��a�E�LE߯�̄Y����u�D�T��6:y!�uf:�:�����ݸ��t�yk?P���,^�
��#��A��.�l3,'��d�6ss:M�������9+��(��g4�Z�V�O���h`�u�e�Ix�C
�q"��Ǚy&yl�E�i�تE#j����e�*������6�ȑ�q2k��H]z�-�[���I#��"���j\=�DX*�^h�x�/�JC�:l���XkWGcG�����in�l5��<S�EƆӼ�Q��Ķ�E����l'�:!*$�]���ĩ��;`��e=rVъo��>��Q�¶Em�����nx�B����]\<$��2�	I��[T�9q˦{	�W�#�GE�l�v����Ȭ)�p��I���� �1+yw�P�<W���Un��o"�{      �   O   x�}̱�0D�ڞ�%:��8�,�?T�"��җ�������&B0
X�}їY�������ROm��:=�Ի���z�W�      �      x������ � �      �   �  x�͚�R*˲�����;VG�N��i**�FQA<���lƘ����ڎix���IV�U��A��*�%��XA��Ҿ;|���z�{��>~�Ʊ����������`pV��\N�ނ�Y��i���U�*�<��#)��^��Kx�ϩw�0[>�^���G�}��<�GW�v��?�݅ "p��&D���	IQYZХp������9��&%�I��?l�_���!��\��%�h��iI�?�A��m4����M�i�t!��5��>��U���]�MHʕN_�W��f�]?xl��O�����mtχ�W#?|��C$��ك�cQ���M�))_��HkĒ�q���������xXk����}����'���|�xd������S4@��^��fɿ� W�R�
{��aF�	'e<g���`"$�GNJJ�D��
Y�'����|������ȑw�ݗ��!=�w|��ً���i�a���^��[_����f�9��z5��Vhc���΂Q\���愤d��e��i��_�r`\/[-�`NH
(��W/Vr,jÞR`�,�J1e�S����lG�#�*�Ȳ߁���?�L��kf���E��
sBRR���f��~7m���������7�׽��^���Mݿ�Gx�T��y�,E#i2�`�,��iI��~f��M�`Ɖ����))H5��4,��f�PE̵#5������'��s��,ڝȟ�B�䤍z��gf4�O�_f����2�^-��Ѱw�����=���X���=T xLv�-��x��ޤ��|��2to��mهU�{xy�<i^�޶6������xX���'<2��&����5C�"�w$FRR���r�x�Őy�XR�a49� fB�1��MH
�qm�Y8������w�z	.e�����MJ
�7�z�B�o�FXF$ڑ�II�ݿ:4&����߸��i�;�m�}X[����+�1[�����Zl#�I��
��ª4�b��iI��nd�C|�<�LHr���:�>թ�w����������DҒ�����j�X���v9Ǚ�����=o�[�h�Ԃ�i�������p^�a7 N^��Ӫ}P!yV/â4v�,�F6E��e#')��������6#�lMg��E�?��`��-}���`u��>_�Y����cN�#�gUc� >�f�N�L;-)Ju��M���61k������v� 1=銗�Q��D�[��tֿ_��3k�k������g���6>�N�?�;���s�]�ZE�_\?�������&��"����3p mH��I�7�|b%0r:��wI����L�Sp�-�N��0�Љ;[^���gk8��<��z��|����,ya�1 #T��
q,���]�8')�^�@������J�bx1n���������x��n|���m��_����{q7�>�O�l?�s�,f#�.�����A.�,�$�����\��"��,qZR俗XzA�k<�V���GY���($y-���I�P��y@)�I��ě�&�Ƀ�]��rZP�W3��X�szk9�E�f#�F8�(��-Şr{�P�#5LQ�'%�X>����X�ç-��q;���@NH�黣�=�'��S�h{�"˹LNK�y�('V/e��7j�r�����nI�j�R����Y���!�S�r��M1q<3I'O"�%ť��gb�ۗ�r�7����w��7���=oN��e���y8s��E�qA�B`�A;���������������s��X!��L2�܀��/�� CiaW��b��G����Z3�q��9�^NB8�=��zg���n�ϳ�U[K2n��Y.��r�9!){׌�]-'��+��׎�'�ĽYs՞�������o��ɍ1�0�q5�����).�i�!����Iu����`2��U�1rQNKʔ�P*1�ñ�iY�t�M���#������I����k��q�>,J$�r��I��E9-)S��}F��zd{�Gsr�j�~��ys�Q�|\�����I���1�8�˧�<ac�����9���Iu��kK��Tp��LX�<�q���;y?%eL��F]3t���t:l�t/N�Z�z}�j�/>V��qm��[�������/۲]	�~��B����������I��B�i�!���V�aM ��9���[Pƕ�d�kW�p�����f�\t�C6�3�2��W�J IIeM�u��*5 g�|\�<�"NHʄ��@(}���@1b�c�P�!4��H��������(78�M�_P����������NJ*���%�1�ߖKW5'cZ��
������I��])���5�,`����-���?��κˌ�l�F��?�CGFRv�3�B;��e�
0[�u�_ϸ�	�aД.9I�P�����N{È�NW<I��'�@�z�� f�3�r�{�̤ɒw��󽐿���G��<sRRJ�Y����7�bS,��S`�ȉU��g�3�r�w��5�'/��9�vz4�y�6��`{~pۂ���m�F���ҽ�+���úĤ~����4�R2�t��IʥƻB�Vˬ&]�X6#�7N6�E�${#O����?e�3�Q޾�_ܹ,rJQΔ�q�,�(J�|���(��������(�'NJ����q�X��!/��9���4�'%�\�D�_-ߣ}��m�5a
�1bCYⴤ�/��{YZ�(~_��C�=d��1��؁���{����xߧx ����Sw��F���h<n����Am��W�w+ҭ���,��p7�(��+Z)�8'Ȝ��ё��R�����I�^��K�F�k��T�F���KQ>5��u��B(��:z���d���}ر��&%��?��95ֳ����O:�g�q�>k�����	}s_?9���|h{�)ӗH߰���m1���r��VWj�b�D�@)"���q��¦%�K��R:�ld���_;�i���R|%i��VSl�A����zlo��۸m=M^'ss�6?s��G�\>͟�_��d�c*���q��'��:�!g-~,����I�2�J�z����
�:���Π7�qc�>>N�������x��>��}T�;�U��=&3��~��Rim;-����{|f2>��	�|�Ӓ
P6�P.��)o`�E�h!�����	I,�����!�ZFb�=//����R�u-�      �   �  x�}��q1E�b}w��}a�`��h�K�ң�>�k���0�;�����'�'�4y����4Ce%��G�P'V|�f�@���ࠁ�M��1�f�	��;x�.F�cE���$V]h|0�\h�a�a���Qj���0�f�V5����$=�Nǌ�ǐ����`v$�+j���:\��^[s:f�L�:�
�8��/a�k;i(ƨ��knu��ƻbE�vݭ���A0��]u/cC� Q�K7H/�Az/����4�Dv[z�x߸VH��ˬ8Qe@�Q�t`eҺ`��5���RM��Au�������Q�����}� �8Ԕ-4����y���֓!Z�����ys��9�u�.�Q�$m\;��JsSYy�ø_JZ���2p0���fww�j������zk���#      �   �
  x�}WI��J�\S���?u�I&�Ԏ�b`�I�a�6���?���ޭ���E�RH��s"")� �C^:�m'����>�Dy���8ɛ5d�Z��,��uR'��"PR���$̍#)S���=��\"�e	h3��KDַB�8��u
�y�-�~�$yO*�ZA m+����_�/ ~���#�����H�1E�l�VJW�2�ӣ�Ԯ����~�]�P�f��!����O�5�F-��
�u�$*�p��� _E#��$��!��n��u$á^�'ݒ�缱����WGs��'WD�#������7���	z�\[�N�%��ZzR�J���[ݠ��;�?�*��y�[`�a���E�,��6S~e!�In�����Ѐ��[�k�+V�"��e<�yR�8��>�W/�ꗇ�s%? ���4��7_.$C"�����,������x�>�NsD+��{����64�,�����uLdٱÕC���%p�7� �"P�Զ/�hZ]�j�p�,Kb��Rc����<����	nbN*���?T�_���0�_ꋊ�1}a0MS����UI���Yt7�[�<��"�G��Yk��w�EA����fQ��M����O!TgE��J�):�-n�E���uu\���~�V9hAHH�v�ֺ�-*{�W�> �N�S���M1�9�`�S�;�r~���� �զW��P��x/_E�%��X&ǥ�;��k�&����c�=�SBY�E#Х�Z�C(�yR3 ;C�n2�-�a@�ۺB�D��["WT߸R����/��;tN�a�^�yō�l�m����4[��y���*҂')�Sa'`�'�^>�@8-V�d,Z�z�h2�i.P@6-K"�h�Rf���lEұ6�G`��P0;�~��|\.$x��.�+�F3 @x�I�u}�	�&�|��!��-`��7�����7�X2n��BS�%a��*7s���Je��57k6<�
#/�z��� ��n���ȼ�ɭ7�����z/��$��_��7��d�a� �w�F�������e�Бا��T��Ucl�g��z� 
�*�ӛo�T�m���0n�?�����d1� �rn9= ��Mxh�d�2���ȡ�����5��G��6�����I���/*~@o �P"�`�.��E������#=b�D�0C�֞���]j4��d����a�+�.c�)�Q�13�Pmulo"�&��Vr���l5g��R�|ȷ�6�UM���ttm����_�� �xg�����gh|�Ͳ�<lMR-�,{����bq0�Ye���{�Cmu�or.{���[�ͯmr���u�Ymwh���M*������Zԣ�
u���&X��Nϫl#��W�:@���w������i��0�Ao���`��)�:K8C�ub�D�w6��O���W*M���FHP���:]�8
�>R�u_����ߔ��(�.���>�8��q�5�3�8������������po����(�G��͕�~�t��ٯ>�z�Ѕ<�24MвsPuY�h��5[ɽ�c�7r�74�@a�	Hu�3��b����\#?L�ik��Ǖ�Dݚ3a�����qoh�����0�M�pR�BV�W�k������\!���3�x���	�}�rA$(��O~,���V�T7�S�K�~�
wmm�Ol�q�	*����a�I��ߣ�DW��Q3���i�޶$ߪ�	V+D�^�Y*�ɰ�x]-��U��@��8��ee��߸������?e���|6C򬷄�Y���+�ʘ�j��G �m�>�hb�GBe�(�:A�b���.�:-��y���a>"�S���#s/W[	,�U5�Š<R���fʹQ�hݜHB17FR�YI��q%O��.�/O���U�?Ao4˜s�\X�@2V���`(6p�W�]rw���-���T!�#x&;��X�u9ʷ��f�����VO���PX��*��[���:�%	�^oN*�?��νLM�Ȁ�ˈ�Ɨ�?<�&�7g���^��)�䩃���S?�j�ֆ��Z�K�Ø��>P�1��m0�g!נ%�E�Y6&��EI�ǽ���H��ԣ���k�2�Ï[i�f�-l9�OsR�}��ݼ�����\#�3�o!�W��9�=��;	�?�7
Ҙ��k�%D^(�6n=�MP��s�	b:����VԜ?�����Vj�9�(Y����ER���]��}<]�/}ۼe��sr�}���!���2�_Z�=B��(�iT&�4+3ꟹB�����g:�:\�)�ڧ��tg>l��������������ʡ�L��g1��z��4��-be�mq���$�@HH�6�5����S\�yY��rGV�#3����F*җ��Y���+&��L��o�b��q�R�s⢫,sX�m�%U�m(E�xލ�ޮ���2a�\���i,Oao٢1<[Jc�ݓ{]��^���:� <h�L���H�_F�5��f�4ܣOds�]���+��>ΰFg8����:C����`D� ldӛc�����J�0��n�%��{�7a����^_��ݲ�5%���g�-d��9��)nf�#�d;G����%mQ�\��2��n�yۜ��V�K�h��fC��v���
��gR�/*~@g���@!���X��C	d��k�w�1O����Q�^[��lNcm��O(���Զ�W�H�����y��l����ӝ�Qʭ����)��T��zxl1����W�Ab���R��J^~�����;�=6���������E��     
/*
 Navicat Premium Data Transfer

 Source Server         : Delivery Backend
 Source Server Type    : PostgreSQL
 Source Server Version : 90501
 Source Host           : deliverybackend.postgres.uhserver.com:5432
 Source Catalog        : deliverybackend
 Source Schema         : deliverybackend

 Target Server Type    : PostgreSQL
 Target Server Version : 90501
 File Encoding         : 65001

 Date: 20/11/2022 10:19:53
*/


-- ----------------------------
-- Type structure for UserRole
-- ----------------------------
DROP TYPE IF EXISTS "deliverybackend"."UserRole";
CREATE TYPE "deliverybackend"."UserRole" AS ENUM (
  'admin',
  'user',
  'manager'
);
ALTER TYPE "deliverybackend"."UserRole" OWNER TO "deliverybackend";

-- ----------------------------
-- Sequence structure for api_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."api_users_id_seq";
CREATE SEQUENCE "deliverybackend"."api_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cart_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."cart_id_seq";
CREATE SEQUENCE "deliverybackend"."cart_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for customers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."customers_id_seq";
CREATE SEQUENCE "deliverybackend"."customers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for erp_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."erp_users_id_seq";
CREATE SEQUENCE "deliverybackend"."erp_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for product_sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."product_sales_id_seq";
CREATE SEQUENCE "deliverybackend"."product_sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."products_id_seq";
CREATE SEQUENCE "deliverybackend"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "deliverybackend"."sales_id_seq";
CREATE SEQUENCE "deliverybackend"."sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for api_users
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."api_users";
CREATE TABLE "deliverybackend"."api_users" (
  "id" int4 NOT NULL DEFAULT nextval('api_users_id_seq'::regclass),
  "username" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "role" "deliverybackend"."UserRole" NOT NULL DEFAULT 'user'::"UserRole",
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0) DEFAULT now()
)
;

-- ----------------------------
-- Records of api_users
-- ----------------------------
INSERT INTO "deliverybackend"."api_users" VALUES (2, 'aplicativo', '$2a$10$g3xrzhAtXhlBFhTGyEYdSuOE.22Y1UvodM83tUcBYnClMhhNRY7W6', 'user', '2022-08-05 14:33:36', '2022-08-05 14:33:36');
INSERT INTO "deliverybackend"."api_users" VALUES (3, 'erp', '$2a$10$Xx4ncdRJkERM0g/9xTXj4eTbgpp3eiI5H6Xjtpa//MFrd08tnSB2S', 'admin', '2022-08-05 14:33:36', '2022-08-05 14:33:36');
INSERT INTO "deliverybackend"."api_users" VALUES (5, 'diquinha', '$2a$10$3qzEuxMWwYK3BDjFVWpxyufBpS6eFKQ4M54k/b0Xhw5Bz4cWfg08e', 'user', '2022-11-06 23:29:48', '2022-11-06 23:29:48');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."cart";
CREATE TABLE "deliverybackend"."cart" (
  "id" int4 NOT NULL DEFAULT nextval('cart_id_seq'::regclass),
  "quantity" int4 NOT NULL,
  "item" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "description" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "price" numeric(15,2) NOT NULL,
  "unit" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "picture" text COLLATE "pg_catalog"."default",
  "customer_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."customers";
CREATE TABLE "deliverybackend"."customers" (
  "id" int4 NOT NULL DEFAULT nextval('customers_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "telephone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cpf" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "zip_code" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "public_place" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "number" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "complement" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "city" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "district" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text
)
;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO "deliverybackend"."customers" VALUES (5, 'Nildiane Campos Ferreira', 'dica@gmail.com', '31973039557', '$2a$10$Ahn8HQ6fkJuU4E7eT3cMQOU5iIpFUXhR7hZI1OIsCaNxmbfBbK7vC', '08399116610', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for erp_users
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."erp_users";
CREATE TABLE "deliverybackend"."erp_users" (
  "id" int4 NOT NULL DEFAULT nextval('erp_users_id_seq'::regclass),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "telephone" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(3) NOT NULL DEFAULT now(),
  "updated_at" timestamp(3) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Records of erp_users
-- ----------------------------
INSERT INTO "deliverybackend"."erp_users" VALUES (5, 'Dica', 'dica@gmail.com', '31973039557', '$2a$10$W3TJ56dYIzLmlAgSU.OEAepx33qgnxxyjTrmbaE9/0eLQrJz.wVwu', '2022-11-12 20:04:17.701', '2022-11-12 20:04:17.701');
INSERT INTO "deliverybackend"."erp_users" VALUES (3, 'Gabriel Phillipe', 'dev@outlook.com', '31991267858', '$2a$10$LiMtGyWte4RI4D5Ge8Zr0eu43Dwa6xva9PGMB9.RM5v2EXwWul81m', '2022-11-07 17:54:52.881', '2022-11-07 17:54:52.881');
INSERT INTO "deliverybackend"."erp_users" VALUES (7, 'Laura Aryana', 'laura@gmail.com', '31999999999', '$2a$10$.rW63xqEslE1aYrBN4o9weO6/WETeyg35SvkoZd4fP5uqGJ0WxRy2', '2022-11-12 22:15:44.76', '2022-11-12 22:15:44.76');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."products";
CREATE TABLE "deliverybackend"."products" (
  "id" int4 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(15,2) NOT NULL,
  "unit" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "picture" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO "deliverybackend"."products" VALUES (6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products" VALUES (7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products" VALUES (5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products" VALUES (9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products" VALUES (11, 'Morango', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.50, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/morango.png');
INSERT INTO "deliverybackend"."products" VALUES (10, 'Blueberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 7.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/blueberry.png');

-- ----------------------------
-- Table structure for products_sales
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."products_sales";
CREATE TABLE "deliverybackend"."products_sales" (
  "id" int4 NOT NULL DEFAULT nextval('product_sales_id_seq'::regclass),
  "sales_id" int4 NOT NULL,
  "quantity" int4 NOT NULL,
  "item" int4 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "description" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "price" numeric(15,2) NOT NULL,
  "unit" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "picture" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of products_sales
-- ----------------------------
INSERT INTO "deliverybackend"."products_sales" VALUES (25, 13, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (26, 13, 1, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (31, 17, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (32, 17, 2, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (33, 18, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (34, 18, 1, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (35, 18, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (36, 18, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (37, 18, 1, 11, 'Morango', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.50, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/morango.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (38, 18, 1, 10, 'Blueberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 7.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/blueberry.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (39, 19, 2, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (40, 19, 3, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (41, 20, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (42, 20, 1, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (43, 21, 3, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (44, 22, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (45, 23, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (46, 23, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (47, 23, 1, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (48, 23, 10, 10, 'Blueberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 7.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/blueberry.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (49, 24, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (50, 25, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (51, 25, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (52, 26, 7, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (53, 26, 2, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (54, 26, 5, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (55, 26, 2, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (56, 27, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (57, 28, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (58, 28, 2, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (59, 29, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (60, 29, 2, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (61, 30, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (62, 30, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (63, 31, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (64, 32, 1, 10, 'Blueberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 7.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/blueberry.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (65, 33, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (66, 33, 2, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (67, 34, 1, 5, 'Laranja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 5.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/laranja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (68, 34, 1, 9, 'Limao', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 6.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/limao.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (69, 34, 1, 6, 'Uva', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/uva.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (70, 34, 1, 7, 'Maracuja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 3.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/maracuja.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (71, 34, 1, 11, 'Morango', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 4.50, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/morango.png');
INSERT INTO "deliverybackend"."products_sales" VALUES (72, 34, 1, 10, 'Blueberry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi metus eros, consectetur sit amet eros ac, faucibus interdum leo. Proin ut elit in ante pulvinar vehicula vel quis neque. Etiam pulvinar eget ante ac rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula massa ac ex pellentesque hendrerit. Nulla hendrerit, quam ut eleifend dignissim, mi nibh ultricies nisi, quis auctor velit quam quis diam. Curabitur placerat convallis dui ut faucibus. Integer consectetur elit vitae tortor porta, maximus eleifend purus venenatis. Vivamus a pulvinar arcu, convallis porta arcu. Integer quis odio nunc. Nunc id scelerisque eros, nec eleifend odio. Fusce ac commodo nunc. Donec ornare eros sed lorem consequat, in egestas lorem convallis. Donec accumsan scelerisque turpis, vel accumsan nibh pharetra sit amet', 7.00, 'UN', 'https://api.hydrasoftware.com.br/cupcakes/blueberry.png');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS "deliverybackend"."sales";
CREATE TABLE "deliverybackend"."sales" (
  "id" int4 NOT NULL DEFAULT nextval('sales_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "total" numeric(15,2) NOT NULL,
  "qr_code_image" text COLLATE "pg_catalog"."default" NOT NULL,
  "copia_e_cola" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT now(),
  "due" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending_payment'::character varying,
  "created_at" text COLLATE "pg_catalog"."default" DEFAULT now()
)
;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO "deliverybackend"."sales" VALUES (29, 16, 11.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 00:22:54.083741+00');
INSERT INTO "deliverybackend"."sales" VALUES (30, 16, 11.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 00:29:41.711744+00');
INSERT INTO "deliverybackend"."sales" VALUES (17, 5, 13.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 20:41:29.213698+00');
INSERT INTO "deliverybackend"."sales" VALUES (13, 5, 9.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-10-31 10:00:10.458', 'pending_payment', '2022-11-19 15:24:06.779743-02');
INSERT INTO "deliverybackend"."sales" VALUES (18, 5, 29.50, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 20:55:37.306844+00');
INSERT INTO "deliverybackend"."sales" VALUES (19, 5, 17.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:07:26.875229+00');
INSERT INTO "deliverybackend"."sales" VALUES (20, 5, 7.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:12:19.446378+00');
INSERT INTO "deliverybackend"."sales" VALUES (21, 5, 15.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:13:22.665346+00');
INSERT INTO "deliverybackend"."sales" VALUES (22, 5, 4.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:19:26.874903+00');
INSERT INTO "deliverybackend"."sales" VALUES (23, 5, 84.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:20:47.807443+00');
INSERT INTO "deliverybackend"."sales" VALUES (24, 5, 5.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:21:10.951394+00');
INSERT INTO "deliverybackend"."sales" VALUES (25, 5, 11.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:22:35.581623+00');
INSERT INTO "deliverybackend"."sales" VALUES (26, 5, 81.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:28:21.781773+00');
INSERT INTO "deliverybackend"."sales" VALUES (27, 5, 4.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 21:35:54.850123+00');
INSERT INTO "deliverybackend"."sales" VALUES (28, 16, 17.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-19 23:11:55.335912+00');
INSERT INTO "deliverybackend"."sales" VALUES (31, 16, 4.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 00:32:00.765048+00');
INSERT INTO "deliverybackend"."sales" VALUES (32, 16, 7.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 00:33:08.533554+00');
INSERT INTO "deliverybackend"."sales" VALUES (33, 16, 11.00, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 00:42:49.443093+00');
INSERT INTO "deliverybackend"."sales" VALUES (34, 16, 29.50, '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '00020126330014BR.GOV.BCB.PIX0111126005406365204000053039865802BR5925Gabriel Phillipe Azevedo 6009SAO PAULO61080540900062070503***630455C0', '2022-12-31 10:00:10.458', 'pending_payment', '2022-11-20 01:01:11.721444+00');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."api_users_id_seq"
OWNED BY "deliverybackend"."api_users"."id";
SELECT setval('"deliverybackend"."api_users_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."cart_id_seq"
OWNED BY "deliverybackend"."cart"."id";
SELECT setval('"deliverybackend"."cart_id_seq"', 96, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."customers_id_seq"
OWNED BY "deliverybackend"."customers"."id";
SELECT setval('"deliverybackend"."customers_id_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."erp_users_id_seq"
OWNED BY "deliverybackend"."erp_users"."id";
SELECT setval('"deliverybackend"."erp_users_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."product_sales_id_seq"
OWNED BY "deliverybackend"."products_sales"."id";
SELECT setval('"deliverybackend"."product_sales_id_seq"', 73, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."products_id_seq"
OWNED BY "deliverybackend"."products"."id";
SELECT setval('"deliverybackend"."products_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "deliverybackend"."sales_id_seq"
OWNED BY "deliverybackend"."sales"."id";
SELECT setval('"deliverybackend"."sales_id_seq"', 35, true);

-- ----------------------------
-- Indexes structure for table api_users
-- ----------------------------
CREATE UNIQUE INDEX "api_users_username_key" ON "deliverybackend"."api_users" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table api_users
-- ----------------------------
ALTER TABLE "deliverybackend"."api_users" ADD CONSTRAINT "api_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cart
-- ----------------------------
ALTER TABLE "deliverybackend"."cart" ADD CONSTRAINT "cart_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customers
-- ----------------------------
ALTER TABLE "deliverybackend"."customers" ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table erp_users
-- ----------------------------
ALTER TABLE "deliverybackend"."erp_users" ADD CONSTRAINT "erp_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "deliverybackend"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products_sales
-- ----------------------------
ALTER TABLE "deliverybackend"."products_sales" ADD CONSTRAINT "product_sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sales
-- ----------------------------
ALTER TABLE "deliverybackend"."sales" ADD CONSTRAINT "sales_pkey" PRIMARY KEY ("id");

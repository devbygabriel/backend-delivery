/*
 Navicat Premium Data Transfer

 Source Server         : Postgres Docker
 Source Server Type    : PostgreSQL
 Source Server Version : 90624
 Source Host           : 164.92.120.210:5432
 Source Catalog        : deliverybackend
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90624
 File Encoding         : 65001

 Date: 04/12/2022 19:24:26
*/


-- ----------------------------
-- Type structure for UserRole
-- ----------------------------
DROP TYPE IF EXISTS "public"."UserRole";
CREATE TYPE "public"."UserRole" AS ENUM (
  'admin',
  'user',
  'manager'
);
ALTER TYPE "public"."UserRole" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for api_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."api_users_id_seq";
CREATE SEQUENCE "public"."api_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cart_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cart_id_seq";
CREATE SEQUENCE "public"."cart_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for customers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."customers_id_seq";
CREATE SEQUENCE "public"."customers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for erp_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."erp_users_id_seq";
CREATE SEQUENCE "public"."erp_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for product_sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."product_sales_id_seq";
CREATE SEQUENCE "public"."product_sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."products_id_seq";
CREATE SEQUENCE "public"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sales_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sales_id_seq";
CREATE SEQUENCE "public"."sales_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for api_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_users";
CREATE TABLE "public"."api_users" (
  "id" int4 NOT NULL DEFAULT nextval('api_users_id_seq'::regclass),
  "username" text COLLATE "pg_catalog"."default" NOT NULL,
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "role" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'user'::character varying,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0) DEFAULT now()
)
;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart";
CREATE TABLE "public"."cart" (
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
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS "public"."customers";
CREATE TABLE "public"."customers" (
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
-- Table structure for erp_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."erp_users";
CREATE TABLE "public"."erp_users" (
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
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "public"."products";
CREATE TABLE "public"."products" (
  "id" int4 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(15,2) NOT NULL,
  "unit" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "picture" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for products_sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."products_sales";
CREATE TABLE "public"."products_sales" (
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
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS "public"."sales";
CREATE TABLE "public"."sales" (
  "id" int4 NOT NULL DEFAULT nextval('sales_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "total" numeric(15,2) NOT NULL,
  "qr_code_image" text COLLATE "pg_catalog"."default" NOT NULL,
  "copia_e_cola" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT now(),
  "due" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending_payment'::character varying,
  "created_at" text COLLATE "pg_catalog"."default" DEFAULT now(),
  "updated_at" text COLLATE "pg_catalog"."default" DEFAULT now()
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."api_users_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."cart_id_seq"', 74, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."customers_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."erp_users_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."product_sales_id_seq"', 56, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."products_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sales_id_seq"', 26, true);

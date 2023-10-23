-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lxCbIe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "TITLES" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "SALARIES" (
    "emp_no" INTIGER   NOT NULL,
    "salary" INTIGER   NOT NULL,
    CONSTRAINT "pk_SALARIES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "EMPLOYEES" (
    "emp_no" INTIGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_day" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPT_MANAGER" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTIGER   NOT NULL,
    CONSTRAINT "pk_DEPT_MANAGER" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "DEPT_EMP" (
    "emp_no" INTIGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPT_EMP" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "TITLES" ADD CONSTRAINT "fk_TITLES_title_id" FOREIGN KEY("title_id")
REFERENCES "EMPLOYEES" ("emp_title_id");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "DEPT_EMP" ("emp_no");

ALTER TABLE "DEPT_MANAGER" ADD CONSTRAINT "fk_DEPT_MANAGER_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPT_EMP" ADD CONSTRAINT "fk_DEPT_EMP_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "fk_DEPARTMENTS_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPT_MANAGER" ("dept_no");


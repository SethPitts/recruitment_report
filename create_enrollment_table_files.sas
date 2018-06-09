LIBNAME ndc "G:\NIDADSC\NDC\SAS\PROD_SAS_CUP\SAS";
LIBNAME ndb "G:\NIDADSC\NDB\SAS\PROD_SAS_CUP\SAS";

proc export data=ndc.ec0064a
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0064a.csv"
	dbms=csv
	replace;
run;

proc export data=ndc.ec0067b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0067b.csv"
	dbms=csv
	replace;
run;

proc export data=ndc.ec0068b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0068b.csv"
	dbms=csv
	replace;
run;

data ec0069b;
	set ndc.ec0069b;
run;

data ec0069c;
	set ndc.ec0069b;
run;

proc sort data=ec0069b;by PROJID;run;
proc sort data=ec0069c;by PROJID;run;

data ec0069_comb;
	set ec0069b;
	set ec0069c;
run;

proc export data=ec0069_comb
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0069bc.csv"
	dbms=csv
	replace;
run;

proc export data=ndc.ec0073b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0073b.csv"
	dbms=csv
	replace;
run;

proc export data=ndc.ec0075a
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0075a.csv"
	dbms=csv
	replace;
run;

proc export data=ndc.ec0079b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0079b.csv"
	dbms=csv
	replace;
run;

proc export data=ndb.ec0051b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0051b.csv"
	dbms=csv
	replace;
run;

proc export data=ndb.ec0053b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0053b.csv"
	dbms=csv
	replace;
run;

proc export data=ndb.ec0054b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0054b.csv"
	dbms=csv
	replace;
run;

proc export data=ndb.ec0055b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0055b.csv"
	dbms=csv
	replace;
run;

proc export data=ndb.ec0059b
	outfile="C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables\ec0059b.csv"
	dbms=csv
	replace;
run;

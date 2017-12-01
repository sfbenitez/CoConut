INSERT INTO ROLES values (1,'Profesor');
INSERT INTO ROLES values (2,'Alumno');

INSERT INTO DEFAULTNAMES values (1,'Mickey');
INSERT INTO DEFAULTNAMES values (2,'Minnie');
INSERT INTO DEFAULTNAMES values (3,'Donald');

INSERT INTO SOS values (1,'Debian');
INSERT INTO SOS values (2,'Ubuntu');
INSERT INTO SOS values (3,'CentOs');

INSERT INTO USERS values ('carlos.sanchez','Carlos Jesus Sanchez','carlosjsanchezortega@gmail.com',to_date('21/09/1992','DD/MM/YYYY'),2,'tmp');
INSERT INTO USERS values ('sergio.ferrete','Sergio Ferrete','sergioferrete@gmail.com',to_date('01/12/1991','DD/MM/YYYY'),2,'tmp');

INSERT INTO HOSTS values ('172.22.200.2',1,1);
INSERT INTO HOSTS values ('172.22.200.56',2,2);
INSERT INTO HOSTS values ('172.22.200.37',3,3);
INSERT INTO HOSTS values ('172.22.200.108',1,1);
INSERT INTO HOSTS values ('172.22.200.116',2,2);
INSERT INTO HOSTS values ('172.22.200.115',3,3);

INSERT INTO BACKUPS values ('carlos.sanchez','172.22.200.2','Fullcopy-Mickey-01-12-2017.tar.gz','Realizado via script','Automatico');

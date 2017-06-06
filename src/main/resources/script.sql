--A differenza dei soliti file SQL, qui ogni comando deve stare su una riga, e non deve terminare con ";"
--svuota le tabelle
DELETE FROM APP.CALENDARI_MILESTONE
DELETE FROM APP.DETTAGLI_EVENTO
DELETE FROM APP.EVENTI
DELETE FROM APP.CALENDARI
DELETE FROM APP.MILESTONE_MILESTONES
DELETE FROM APP.AZIONI
DELETE FROM APP.MILESTONES
DELETE FROM APP.TIPI_EVENTO
DELETE FROM APP.ENTITA
--resetta i numeratori AUTOINCREMENT delle tabelle
ALTER TABLE APP.CALENDARI_MILESTONE ALTER ID_CALENDARIO_MILESTONE RESTART WITH 1
ALTER TABLE APP.DETTAGLI_EVENTO ALTER ID_DETTAGLIO RESTART WITH 1
ALTER TABLE APP.EVENTI ALTER ID_EVENTO RESTART WITH 1
ALTER TABLE APP.CALENDARI ALTER ID_CALENDARIO RESTART WITH 1
ALTER TABLE APP.MILESTONE_MILESTONES ALTER ID_MILESTONE_MILESTONE RESTART WITH 1
ALTER TABLE APP.AZIONI ALTER ID_AZIONE RESTART WITH 1
ALTER TABLE APP.MILESTONES ALTER ID_MILESTONE RESTART WITH 1
ALTER TABLE APP.TIPI_EVENTO ALTER ID_TIPO_EVENTO RESTART WITH 1
ALTER TABLE APP.ENTITA ALTER ID_ENTITA RESTART WITH 1
--qui inizia il popolamento
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('U7RM0', 'U7RM0ESP', 'Esposizioni'),('U7RM0', 'U7RM0TIT', 'Titoli')
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('u7sc0', 'U7SC0_CRMS', 'CRMS'),('u7sc0', 'U7SC0_BO', 'BO-Finance')
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('u7sc0', 'U7SC0_ADG', 'ADG'),('u7sc0', 'U7SC0_SC/ADG', 'SC/ADG')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('LOAD', 'CARICAMENTO'),('CERT', 'CERTIFICAZIONI')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('VALIDAZIONE', 'check file'),('ELABORAZIONE', 'processamento file')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('SPEDIZIONE', 'inoltro file'),('ERRORE', 'errore file')
INSERT INTO APP.AZIONI (DESCRIZIONE, FILENAME, TIPO, URL) VALUES('apri il monitoring', 'index.jsp', 'web app', 'http://localhost:8080/orchestratoreRADAR/')
INSERT INTO APP.AZIONI (DESCRIZIONE, FILENAME, TIPO, URL) VALUES('apri il monitoring', 'testPage.jsp', 'web app', 'http://localhost:8080/orchestratoreRADAR/testPage.jsp')
INSERT INTO APP.MILESTONES (ID_ENTITA, ID_TIPO_EVENTO, DESCRIZIONE) VALUES(1, 2, 'CERTIFICAZIONE ESPOSIZIONI MACS1'),(2, 2, 'CERTIFICAZIONE TITOLI MACS1')
INSERT INTO APP.MILESTONES (ID_ENTITA, ID_TIPO_EVENTO, DESCRIZIONE) VALUES(3, 3, 'milestone 3'),(6, 1, 'milestone 4'), (4, 2, 'milestone 5'), (5, 3, 'milestone 6'),(6,2,'Milestone00')
INSERT INTO APP.MILESTONE_MILESTONES (ID_MILESTONE_CHILD, ID_MILESTONE, ORDINAMENTO) VALUES(1, 1, 1),(2, 3, 2),(2, 4, 1),(3, 5, 1),(3, 6, 2),(2, 5, 1205),(7,3,1)
INSERT INTO APP.CALENDARI (DESCRIZIONE) VALUES('CRMS MARZO 2017'),('CRMS APRILE 2017'),('desc cal 1'),('desc cal 2')
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, '201703', 1, 2),(current timestamp, '201703', 2, 2)
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, 'TEST', 3, 3),(current timestamp, 'TAGEVENTI1', 4, 2)
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, 'TEST', 5, 5),(current timestamp, 'TAGEVENTI1', 6, 2)
INSERT INTO APP.DETTAGLI_EVENTO(CHIAVE,VALORE,ID_EVENTO) VALUES('LOG','WARNING ...',3),('PROGRESS ','30%',3)
INSERT INTO APP.DETTAGLI_EVENTO(CHIAVE,VALORE,ID_EVENTO) VALUES('AVANZAMENTO','80%',2),('AVANZAMENTO','10%',1)
INSERT INTO APP.DETTAGLI_EVENTO (CHIAVE, VALORE, ID_EVENTO) VALUES('chiavedettagli1', 'valore dettagli1', 1)
INSERT INTO APP.DETTAGLI_EVENTO (CHIAVE, VALORE, ID_EVENTO) VALUES('chiavedettagli2', 'valore dettagli2', 2)
INSERT INTO APP.CALENDARI_MILESTONE (TAGS, ID_AZIONE, ID_MILESTONE, ID_CALENDARIO, DATA_ORA_PREVISTE) VALUES('201703', 1, 1, 1, '2017-05-20 12:00:00'),('P201703U01', 2, 2, 2, '2017-05-30 18:00:00')

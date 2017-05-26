--A differenza dei soliti file SQL, qui ogni comando deve stare su una riga, e non deve terminare con ";"
--svuota le tabelle
DELETE FROM APP.CALENDARI_SEMAFORI
DELETE FROM APP.DETTAGLI_EVENTO
DELETE FROM APP.EVENTI
DELETE FROM APP.CALENDARI
DELETE FROM APP.SEMAFORI_MILESTONES
DELETE FROM APP.SEMAFORI
DELETE FROM APP.MILESTONES
DELETE FROM APP.TIPI_EVENTO
DELETE FROM APP.ENTITA
--resetta i numeratori AUTOINCREMENT delle tabelle
ALTER TABLE APP.CALENDARI_SEMAFORI ALTER ID_CALENDARIO_SEMAFORO RESTART WITH 1
ALTER TABLE APP.DETTAGLI_EVENTO ALTER ID_DETTAGLIO RESTART WITH 1
ALTER TABLE APP.EVENTI ALTER ID_EVENTO RESTART WITH 1
ALTER TABLE APP.CALENDARI ALTER ID_CALENDARIO RESTART WITH 1
ALTER TABLE APP.SEMAFORI_MILESTONES ALTER ID_SEMAFORO_MILESTONE RESTART WITH 1
ALTER TABLE APP.SEMAFORI ALTER ID_SEMAFORO RESTART WITH 1
ALTER TABLE APP.MILESTONES ALTER ID_MILESTONE RESTART WITH 1
ALTER TABLE APP.TIPI_EVENTO ALTER ID_TIPO_EVENTO RESTART WITH 1
ALTER TABLE APP.ENTITA ALTER ID_ENTITA RESTART WITH 1
--qui inizia il popolamento
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('u7sc0', 'U7SC0_PCR_G', 'PCR G'),('u7sc0', 'U7SC0_PCR_M', 'PCR M')
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('u7sc0', 'U7SC0_CRMS', 'CRMS'),('u7sc0', 'U7SC0_BO', 'BO-Finance')
INSERT INTO APP.ENTITA (ACRONIMO, CODICE, DESCRIZIONE) VALUES('u7sc0', 'U7SC0_ADG', 'ADG'),('u7sc0', 'U7SC0_SC/ADG', 'SC/ADG')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('CARICAMENTO', 'upload file'),('ELABORAZIONE', 'processamento file')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('VALIDAZIONE', 'check file'),('CERTIFICAZIONE', 'conferm file')
INSERT INTO APP.TIPI_EVENTO (CODICE, DESCRIZIONE) VALUES('SPEDIZIONE', 'inoltro file'),('ERRORE', 'errore file')
INSERT INTO APP.MILESTONES (ID_ENTITA, ID_TIPO_EVENTO, DESCRIZIONE) VALUES(1, 1, 'milestone 1'),(2, 2, 'milestone 2'),(3, 3, 'milestone 3'),(6, 1, 'milestone 4'), (4, 2, 'milestone 5'), (5, 3, 'milestone 6')
INSERT INTO APP.SEMAFORI (CODICE, DESCRIZIONE) VALUES('FLUSSI_M','Arrivo flussi mensili'),('FLUSSI_G', 'Arrivo flussi giornalieri')
INSERT INTO APP.SEMAFORI (CODICE, DESCRIZIONE) VALUES('FLUSSI_S','Arrivo flussi settimanali')
INSERT INTO APP.SEMAFORI_MILESTONES (ID_SEMAFORO, ID_MILESTONE, ORDINAMENTO) VALUES(1, 1,1),(2, 3,2),(2, 4,1),(3, 5,1),(3, 6,2),(2,5,1205)
INSERT INTO APP.CALENDARI (DESCRIZIONE) VALUES('desc cal 1'),('desc cal 2')
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, 'TEST', 1, 1),(current timestamp, 'TAGEVENTI1', 1, 1),(current timestamp, 'TAGEVENTI2', 2, 2)
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, 'TEST', 3, 3),(current timestamp, 'TAGEVENTI1', 4, 2)
INSERT INTO APP.EVENTI (TSTAMP_EVENTO, TAG, ID_ENTITA, ID_TIPO_EVENTO) VALUES(current timestamp, 'TEST', 5, 5),(current timestamp, 'TAGEVENTI1', 6, 1)
INSERT INTO APP.DETTAGLI_EVENTO(CHIAVE,VALORE,ID_EVENTO) VALUES('AVANZAMENTO','10%',1)
INSERT INTO APP.DETTAGLI_EVENTO (CHIAVE, VALORE, ID_EVENTO) VALUES('chiavedettagli1', 'valore dettagli1', 1)
INSERT INTO APP.DETTAGLI_EVENTO (CHIAVE, VALORE, ID_EVENTO) VALUES('chiavedettagli2', 'valore dettagli2', 2)
INSERT INTO APP.CALENDARI_SEMAFORI (TAGS, ID_SEMAFORO, ID_CALENDARIO, ID_MILESTONE) VALUES('TAGALFANUM00, TEST, TAGEVENTI1', 1, 1, 1),('TAGALFANUM002, TEST, TAGEVENTI2', 2, 2, 2)
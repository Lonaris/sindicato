CREATE TABLE codigos_rechazo(
   codigo      VARCHAR(3) NOT NULL PRIMARY KEY
  ,descripcion VARCHAR(80)
);
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R02','Cuenta cerrada');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R03','Cuenta inexistente');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R04','Numero de cuenta invalido');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R08','Orden de no pagar');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R10','Falta de fondos');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R14','Identificacion del cliente en la empresa erronea');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R15','Baja del servicio');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R17','Error de formato');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R19','Importe erroneo');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R20','Moneda distinta a la de la cuenta de debito');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R23','Sucursal no habilitada');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R24','Transaccion duplicada');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R25','Error en registro adicional');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R26','Error por campo mandatario');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R28','Rechazo primer vencimiento');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R29','Reversion ya efectuada');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R79','Error en campo 7 Registro Individual (Referencia Univoca del Debito)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R80','Error en campo 3 Registro Adicional (1er motivo de rechazo)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R86','Identificacion de la empresa erronea');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R90','TRX no corresponde por no existir TRX original');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R91','Codigo banco incompatible con moneda de TRX');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R93','Dia no laborable');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R95','Reversion de entidad receptora presentada fuera de termino');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R13','Entidad destino inexistente');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R18','Fecha de compensacion erronea');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R27','Error en contador de registro');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R31','Vuelta atras de Camara (Unwinding)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R75','Fecha invalida');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R76','Error en campo 11 Cabecera de Lote (Codigo de Origen)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R77','Error en campo 4 Registro Individual (Digito Verificador 1er bloque de la CBU)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R78','Error en campo 5 Registro Individual (Cuenta a Debitar / Acreditar)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R87','Error en campo 9 Registro Individual 1er byte (Informacion Adicional a la TRX)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R88','Error en campo 2 Registro Individual (Codigo de la Transaccion)');
INSERT INTO codigos_rechazo(codigo,descripcion) VALUES ('R89','Errores transacciones no monetarias');

CREATE TABLE afiliados (
	legajo int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, # El legajo deberia ser un entero de 8 y no deberia permitir poner signos. Formato: 01002595    
    dni int(8) UNSIGNED UNIQUE KEY,
    tipo_afiliado varchar(20) ,
    cuil int(11) UNSIGNED UNIQUE KEY,
    apellido varchar(40), # Podemos poner 10 mas? por las dudas!! no recuerdo bien, pero creo que hay gente con doble apellido y largos encima. Por ejemplo: Lagos fuentealba Cristian Juan Jose
    nombre varchar(40), # Podemos poner 10 mas? por las dudas!! no recuerdo bien, pero creo que hay gente con doble apellido y largos encima. Por ejemplo: Lagos fuentealba Cristian Juan Jose
    fecha_nacimiento date,
    edad int(2),
    estado_civil varchar(20),
    nacionalidad varchar(20),
    
    calle varchar(80),
    altura int(8),
    piso varchar(10),
    depto varchar(4),
    cod_postal varchar(20), # Aca con un largo de 4 esta bien.
    barrio varchar(30),
    localidad varchar(50),
    
    telefono int(13),  # El telefono deberia ser un varchar porque suele tener este formato: (0220)482-8844
    celular int(16), # El celular deberia ser un varchar porque suele tener este formato: 11-6030-0122
    email varchar(80)
    
);

CREATE TABLE familiares(
	dni int(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    relacion varchar(40),
    nombre varchar(40),  # idem nombre afiliado
    apellido varchar(40), # idem apellido afiliado
    fecha_nacimiento date,
    edad int(2),
    nivel_estudios varchar(20),
    
    legajo_afiliado int(16) UNSIGNED NOT NULL  # El legajo deberia ser un entero de 8 y no deberia permitir poner signos. Formato: 01002595
);

CREATE TABLE servicios(
	id int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20)
    # Falta el detalle del Proveedor creo?? Es un detalle en el que va a ir:  Direccion y Numero de telefono. Todo en una solo linea.. es decir un texto plano a modo informativo
);

CREATE TABLE servicios_afiliado(
	id_servicio int(16) UNSIGNED NOT NULL,
    legajo_afiliado int(16) UNSIGNED NOT NULL,
    
    fecha date,
    cantidad int(20),
    detalle varchar(80),
    
    PRIMARY KEY (id_servicio, legajo_afiliado),
	CONSTRAINT `constr_servicio_fk`
		FOREIGN KEY `servicio_fk` (`id_servicio`) REFERENCES `servicios` (`id`)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `constr_afiliado_fk`
        FOREIGN KEY `afiliado_fk` (`afiliado`) REFERENCES `afiliados` (`legajo`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE debitos(  
    legajo_afiliado int(16) UNSIGNED NOT NULL,
    banco int(16) UNSIGNED NOT NULL,
    
    sucursal varchar(30),
    cbu varchar(30) #solo un largo de 22. El CBU contiene 22 numeros y deberia poderse guardar siempre y cuando tenga los 22 numeros, de otra forma no tiene que ser posible guardar. Esto achicaria mucho el margen de error.   
# Esto dame mas tiempo para que me pueda fijar bieeen
);

CREATE TABLE bancos(
	id int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20)
);

CREATE TABLE descuentos(
	id int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE proveedores(
	id int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    nombre varchar(40),
    servicios varchar(100),
    direccion varchar(80),
    altura int(8),
    telefono int(16), # El telefono deberia ser un varchar porque suele tener este formato: (0220)482-8844
    celular int(16), # El celular deberia ser un varchar porque suele tener este formato: 11-6030-0122
    email varchar(80),

    
    cuit int(11) UNSIGNED UNIQUE KEY,
    razon_social varchar(60),
    cbu varchar(30), #solo un largo de 22. El CBU contiene 22 numeros y deberia poderse guardar siempre y cuando tenga los 22 numeros, de otra forma no tiene que ser posible guardar. Esto achicaria mucho el margen de error.
    banco int(16) UNSIGNED NOT NULL,
    cuenta int(16),
    comision varchar(40),
    responsable varchar(40),
    forma_pago varchar(40)   
    
);

CREATE TABLE usuarios(
	id int(16) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    nombre varchar(40),
    apellido varchar(40),
    
    legajo int(16) UNSIGNED NOT NULL UNIQUE KEY
);
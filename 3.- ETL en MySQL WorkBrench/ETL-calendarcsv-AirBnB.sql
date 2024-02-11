-- LLamamos a la Base de Datos
USE `airbnb`; 

-- Mostramos las tablas existentes
SHOW TABLES; 

-- Vemos que hay dentro de la Tabla Calendar
SELECT * FROM `Calendar`; 

-- Aqui vamos a nalizar si el Precio y el PrecioAjustado son diferentes <-- **1**
SELECT * FROM `Calendar`
WHERE `Precio` != `PrecioAjustado`; 
-- Intentamos cambiar el atributo de precio y nos dice que existe vacios, espacios en los valores por lo cual no es numerico
ALTER TABLE `Calendar` MODIFY `Precio` DECIMAL(10,2);  
-- Error Code: 1366. Incorrect DECIMAL value: '0' for column '' at row -1

-- Por tanto vamos por otro camino y es convirtiendolo a numerico
-- Quitando el simbolo $
UPDATE `Calendar` SET `Precio` = REPLACE(`Precio`,'$','') WHERE `Precio` LIKE '%$%';
UPDATE `Calendar` SET `PrecioAjustado` = REPLACE(`PrecioAjustado`,'$','') WHERE `PrecioAjustado` LIKE '%$%'; 

-- Quitando la coma(,) numericamente no nos funciona
UPDATE `Calendar` SET `Precio` = REPLACE(`Precio`,',','') WHERE `Precio` LIKE '%,%'; 
UPDATE `Calendar` SET `PrecioAjustado` = REPLACE(`PrecioAjustado`,',','') WHERE `PrecioAjustado` LIKE '%,%'; 

-- Analizando la columna MiniNoches y MaxiNoches nos damos cuenta que hay vacios
SELECT * FROM `Calendar` WHERE `MinimoNoches` REGEXP '[^0-9.]' OR `MinimoNoches` = '';  
SELECT * FROM `Calendar` WHERE `MinimoNoches` REGEXP '[^0-9.]' OR `MinimoNoches` = '';  

-- LLenando los Vacios con ceros
UPDATE `Calendar` SET `MinimoNoches` = '0' WHERE `MinimoNoches` = '';  
UPDATE `Calendar` SET `MaximoNoches` = '0' WHERE `MaximoNoches` = '';  

-- Intentamos de nuevo cambiar el atributos de las columnas 
ALTER TABLE `Calendar` MODIFY `Precio` DECIMAL(10,2); 
ALTER TABLE `Calendar` MODIFY `PrecioAjustado` DECIMAL(10,2);  
ALTER TABLE `Calendar` MODIFY `MinimoNoches` INTEGER;  
ALTER TABLE `Calendar` MODIFY `MaximoNoches` INTEGER; 

-- analizamos de nuevo si hay vacios y vemos q ya no existen 
SELECT * FROM `Calendar` WHERE `MinimoNoches` REGEXP '[^0-9.]' OR `MinimoNoches` = '';  
SELECT * FROM `Calendar` WHERE `MaximoNoches` REGEXP '[^0-9.]' OR `MaximoNoches` = '';  

-- Vemos la Tabla Calendar
SELECT * FROM `Calendar`;

-- Al ver que --> **1** Precio y PrecioAjustado si son diferentes, Denotamos que es, por hay un descuento no considereado. 
-- creemos esta columna antes de la columna PrecioAjustado, 
ALTER TABLE `calendar` ADD `Descuento` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `PrecioAjustado`; 

-- Llenamos la columna creado con el resultado de la resta 
UPDATE `calendar` SET `Descuento` = `Precio` - `PrecioAjustado`; 

-- vemos que la tabla si tiene valores diferentes a cero en la columna Descuento
SELECT * FROM `calendar` WHERE `Descuento` > 1 ORDER BY `Descuento` DESC LIMIT 5; 

-- Columna Disponible
SELECT COUNT(*) FROM `calendar` WHERE `Disponible` = "" OR `Disponible` = NULL; -- nos dice q tiene 0 vacios o nulos
UPDATE `calendar` SET `Disponible` = "0" WHERE `Disponible` = 'f'; -- lo llenamos de ceros los f
UPDATE `calendar` SET `Disponible` = "1" WHERE `Disponible` = 't'; -- lo llenamos de ceros los t
ALTER TABLE `calendar` MODIFY `Disponible` CHAR(1); -- Cambiamos Tipo de Datos atributo

-- Vemos la Tabla Calendar
SELECT * FROM `Calendar`;

-- Vemos ahora la tabla completa que ya esta terminada su ETL

SELECT COUNT(`IdListado`) FROM `Calendar`; -- 8661286
SELECT COUNT(`Fecha`) FROM `Calendar`; -- 8661286
SELECT COUNT(`Disponible`) FROM `Calendar`; -- 8661286
SELECT COUNT(`Precio`) FROM `Calendar`; -- 8661286
SELECT COUNT(`PrecioAjustado`) FROM `Calendar`; -- 8661286
SELECT COUNT(`Descuento`) FROM `Calendar`; -- 8661286
SELECT COUNT(`MinimoNoches`) FROM `Calendar`; -- 8661286
SELECT COUNT(`MaximoNoches`) FROM `Calendar`; -- 8661286
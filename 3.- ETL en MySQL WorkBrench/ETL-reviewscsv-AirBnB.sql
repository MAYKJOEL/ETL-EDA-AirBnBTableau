-- LLamamos a la Base de Datos
USE `airbnb`; -- ok

-- Mostramos las tablas existentes
SHOW TABLES; -- ok

-- Vemos que hay dentro de la Tabla Calendar
SELECT * FROM `reviews`; 

-- Analizamos en que columna existen vacios o NULLs 
SELECT * FROM `reviews` WHERE `IdListado` = '' OR `IdListado` = NULL;
SELECT * FROM `reviews` WHERE `Id` = '' OR `Id` = NULL;
SELECT * FROM `reviews` WHERE `Fecha` = '' OR `Fecha` = NULL;
SELECT * FROM `reviews` WHERE `IdCriticos` = '' OR `IdCriticos` = NULL;
SELECT * FROM `reviews` WHERE `NombreCriticos` = '' OR `NombreCriticos` = NULL;
SELECT * FROM `reviews` WHERE `Comentarios` = '' OR `Comentarios` = NULL; -- Aquí

-- Vemos cuantos filas sin datos existen
SELECT COUNT(*) FROM `reviews` WHERE `Comentarios` = '' OR `Comentarios` = NULL; -- 164
SELECT COUNT(*) FROM `reviews`; -- 387098

-- LLenamos los espacios vacios de  comentarios
UPDATE `reviews` SET `Comentarios` = 'Sin Comentario' WHERE `Comentarios` = ''; 

-- Ahora  cambiamos los atributos de los datos de las columnas
ALTER TABLE `reviews` MODIFY `IdListado` CHAR(10);
ALTER TABLE `reviews` MODIFY `Id` CHAR(10);
ALTER TABLE `reviews` MODIFY `Fecha` DATE;
ALTER TABLE `reviews` MODIFY `IdCriticos` CHAR(10);

-- Vemos ahora la tabla completa que ya esta terminada su ETL
-- Usamos la Base de datos aribnb
USE airbnb;

-- Primero convertimos todo nuestros comentarios a minuscula
UPDATE `reviews` SET `Sentimental` = LOWER(`Sentimental`);

-- Ahora creamos una nueva columna donde pondremos un valor segun palabras negativas en comentarios
ALTER TABLE `reviews` ADD `SentimientoNegativo` INTEGER NOT NULL DEFAULT '0' AFTER `Comentarios`;
-- Ahora creamos una nueva columna donde pondremos un valor segun palabras positivas en comentarios
ALTER TABLE `reviews` ADD `SentimietoPositivo` INTEGER NOT NULL DEFAULT '0' AFTER `Comentarios`;
-- Ahora creamos una nueva columna donde pondremos un valor de la suma de Sentimental+Sentimental2
ALTER TABLE `reviews` ADD `Sentimiento` INTEGER NOT NULL DEFAULT '0' AFTER `Comentarios`;

-- Vemos la columna creada en la tabla
SELECT * FROM `reviews`;

-- Llenaremos la columna sentimental con -1 si hay palabras negativas
UPDATE `reviews` SET `SentimientoNegativo` = -2 WHERE `Comentarios` REGEXP 'aint|arent|can not|cant|couldn|daren|didn|doesn|ain|aren|
							couldn|daren|didn|doesn|dont|hadn|hasn|haven|isnt|mightn|mustn|neither|don|hadn|hasn|haven|
                            isn|mightn|mustn|needn|needn|never|none|nope|nor|not|nothing|nowhere|oughtn|shant|shouldn|uhuh|
                            wasnt|werent|oughtn|shan|shouldn|uh-uh|wasn|weren|without|won|wouldn|won|wouldn|rarely|seldom|
                            despite|unhapp|disappoin|poor|terrib|bad|awful|uncomfortab|dirt|nois|rud|dissatisf|disappoint';
                            
UPDATE `reviews` SET `SentimientoNegativo` = -2 WHERE `Comentarios` REGEXP 'regrettab|inconvenie|unpleasa|problemat|unacceptab|frustrat|
							disgust|unsatisfactor|dishearten|dismal|
                            gloom|subpar|woefu|distress|disconcert|problemati|objectionab|vexing|exasperat|aggravat|irritat|
                            infuriat|madden|vexatiou|annoy|bothersom|irksom|Awfully|Effing|Frackin|Fracking|Fricking|Frickin|
                            Frigging|Friggin|Fucking|Fuggin|Fugging|Almost|Barely|Hardly|Just enough|Kind of|Kinda|Kindof|
                            Kind-of|Less|Little|Marginal|Marginally|Occasional|Occasionally|Partly|Scarce|Scarcely|Slight|
                            Slightly|Somewhat|Sort of|Sorta|Sortof|Sort-of';
                            
-- Llenaremos la columna sentimental con +1 si hay palabras Positivos
UPDATE `reviews` SET `SentimientoPositivo` = 1 WHERE `Comentarios` REGEXP 'Absolutely|Amazingly|Considerable|Considerably|Deeply|
							Enormous|Entirely|Especially|Exceptional|Exceptionally|Extremely|Fabulously|Greatly|Highly|Hugely|
                            Incredible|Incredibly|Major|Majorly|Particularly|Purely|Really|Remarkably|So|Substantially|Thoroughly|
                            Total|Totally|Tremendous|Tremendously|Uber|Unbelievably|Unusually|Utter|Utterly|Very|Amazing|
                            Fantastic|Wonderful|Great|Excellent|Fabulous|Awesome|Perfect|Superb|Lovely|Incredible|Beautiful|
                            Spectacular|Outstanding|Terrific|Charming|Cozy|Delightful|Exceptional|Gorgeous|Marvelous|Comfortable|
                            Clean|Spacious|Stylish|Welcoming|Homely|Pleasant|Peaceful|Relaxing|Serene|Tranquil|Quiet|Idyllic|
                            Luxurious|Upscale|Classy|Elegant|Well-appointed|Well-maintained'; --                             

-- Arriba ponemos -2 por q dentro de los comentarios negativos hay palabras positivas pero no consirniente  al hospedaje
-- Ahora sumanos para q me de +1 o 0 o -1, si me da -2 lo corrigiremos mas adelante
UPDATE `reviews` SET `Sentimiento` = `SentimientoPositivo` + `SentimientoNegativo`; 

-- cambiando -2 a -1
UPDATE `reviews` set `Sentimiento` = -1 WHERE `Sentimiento` = -2;

-- Eliminamos las columnas Sentimental y Sentimental2
ALTER TABLE `reviews` DROP `SentimientoNegativo`;
ALTER TABLE `reviews` DROP `SentimientoPositivo`;
ALTER TABLE `reviews` DROP `Comentarios`;

SELECT * FROM `reviews`;
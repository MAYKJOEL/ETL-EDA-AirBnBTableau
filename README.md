## AirBnB

![N|Solid](https://piernine.co/wp-content/uploads/elementor/thumbs/Airbnb-red-lrg-1080x675-1-ph818omam1mv695ypg24xjogcbkjrurf7dgvyjglnk.jpeg)



El objetivo que se busca con el análisis de los datos seleccionados es realizar una análisis exploratorio de tipo descriptivo para entender el negocio de airbnb. 
En base al análisis descriptivo encontrar oportunidades de inversión que puedan ser capitalizadas utilizando dicho modelo de negocio.

### Preguntas 

* ¿Qué podemos describir con los datasets acerca del negocio de airbnb?
* ¿Cuál es la mejor forma de invertir en AirBnb?
* ¿Cómo se compara con otras alternativas de inversión?
* Si presentamos nuestras conclusiones a un grupo inversor: ¿Qué propuestas le haríamos?
* ¿En donde sugerimos invertir?
* ¿En qué tipo de propiedad?

### Recursos
| Archivo
| ------ 
| calendar.csv: (incluye datos de ocupación, precio, etc.)  
| listings.csv: Detalle de cada operación de Listing (incluye datos descriptivos de la vivienda (ambientes, host, noches mínimas y máximas, cantidad de reviews)
| reviews.csv Datos de review de los usuarios.


------

------

### SOLUCION:

NOTA IMPORTANTE ANTES DE EMPEZAR:

Antes de empezar si se desea ver la presentacion, aclaro que la DATA está comprimida: 
  * Hay que entrar a la carpeta "8.- Data Limpia con Encabezado"
  * Encontraremos una carpeta ZIP llamada "Data limpia con encabezado.zip", ahí dentro estan 3 archivos CSV
  * Esos archivos hay q descomprimirlo, y pasarlos dentro de la carpeta "8.- Data Limpia con Encabezado".
  * por lo tanto, quedarian dentro de la carpeta "8.- Data Limpia con Encabezado":
    
            *  "CalendarAirBnBCE.csv"
            *  "ListingAirBnBCE.csv"
            *  "ReviewsAirBnBCE.csv" y
            *  "Data limpia con encabezado.zip"

PROCEDIMIENTOS CON EL CUAL SE REALIZO EL ETL Y EDA DEL PROYECTO:

1.- Ahora ya podremos leer y abrir con normalidad el Dashboard Con Tableau 2019.3 profesional

1.-Ingreamos los TRES CSV AL MySQL WorkBrench y realizamos el ETL

2.- Creamos una columna con analisis de sentimiento y lo agregamos a la tabla reviews

3.- Exportamos la DATA limpia pero con encabezados y Data separados

4.- Usamos Python con la Libreria Pandas para unir Data con encabezados

5.- Ingresamos la DATA Limpia y con Encabezados a Tableau y realizamos los DashBoards

6.- Link del proyecto AirBnB
https://drive.google.com/drive/folders/1U8sNd-ArjCOW9tYqZUCoGnILjo9BfB2L?usp=sharing

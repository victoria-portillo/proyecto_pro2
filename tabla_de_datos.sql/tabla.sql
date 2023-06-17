USE `tablas_de_datos`;
CREATE TABLE usuarios (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20) NOT NULL,
email VARCHAR(30) NOT NULL UNIQUE,
contrasena VARCHAR(200) NOT NULL,
foto_de_perfil VARCHAR(200),
dni INT NOT NULL UNIQUE,
fecha_de_nacimiento DATE NOT NULL,
createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt TIMESTAMP NULL
);


USE `tablas_de_datos`;
CREATE TABLE Productos (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` INT UNSIGNED NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `image` text,
  `descripcion_producto` text NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` TIMESTAMP NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_productos_clientes` (`id_usuario`),
  CONSTRAINT `fk_productos_clientes` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id`)
);

USE `tablas_de_datos`;
CREATE TABLE Comentarios (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_producto` INT UNSIGNED NOT NULL,
  `id_usuario` INT UNSIGNED NOT NULL,
  `comentario` text NOT NULL,
  `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` TIMESTAMP NULL,
  
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_clientes` (`id_usuario`),
  KEY `fk_comentarios_producto` (`id_producto`),
  CONSTRAINT `fk_comentarios_clientes` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id`),
  CONSTRAINT `fk_comentarios_producto` FOREIGN KEY (`id_producto`) REFERENCES `Productos` (`id`)
);

INSERT INTO Usuarios (id,nombre,email,contrasena,dni,fecha_de_nacimiento) VALUES
(1,'Miguel Estrada','miguel.estrada@gmail.com','Miguelestrada2001',44126876,'2001-03-24'),
(2,'Jimena Pacheco','jimepacheco123@gmail.com','pachecogolf1273',39357902,'1978-06-01'),
(3,'Juan Perez','Jperez10@gmail.com','Messiteamo32',94823776,'2006-12-30'),
(4,'Micaela Selman','micaselman@gmail.com','micaELA3260',41456282,'1995-02-08'),
(5,'Maris Susana Gonzalez','susanitag27@gmail.com','Xeneize12',40988762,'1984-07-17');

USE `tablas_de_datos`;
INSERT INTO productos (id_usuario, nombre_producto, image, descripcion_producto) VALUES 
(1,'1984','','Esta novela distópica, escrita por George Orwell, imagina un futuro totalitario en el que el gobierno controla todos los aspectos de la vida de las personas, incluso sus pensamientos. "1984" es una crítica feroz al autoritarismo y una advertencia sobre los peligros del poder sin restricciones.'),
(1,'El gran Gatsby','','Esta novela escrita por F. Scott Fitzgerald, esta ambientada en la década de 1920 sigue la vida de Jay Gatsby, un hombre rico y misterioso que organiza fiestas extravagantes en su mansión en Long Island. A través de los ojos del narrador, Nick Carraway, "El gran Gatsby" explora la corrupción y el vacío de la alta sociedad americana.'),
(2,'El senior de los anillos','','Esta trilogía épica, escrita por J.R.R Tolkien, sigue las aventuras de un grupo de hobbits, enanos, elfos y humanos mientras buscan destruir el Anillo Único, un objeto poderoso que podría caer en manos equivocadas. "El señor de los anillos" es una obra maestra del género de la fantasía y ha sido adaptada al cine con gran éxito.'),
(2,'El aleph','','Esta colección de cuentos del escritor argentino Jorge Luis Borges explora temas como el tiempo, el espacio y la identidad. "El aleph" es una obra de gran complejidad y profundidad y es considerada una de las mejores colecciones de cuentos de la literatura en español.'),
(3,'La sombre del viento','','Esta novela cuenta la historia de Daniel Sempere, un joven que descubre un libro en la librería de su padre y comienza a investigar sobre el autor, Julián Carax. A medida que Daniel profundiza en la vida de Carax, se adentra en una trama de amor, venganza y misterio en la Barcelona de posguerra.'),
(3,'La insoportable levedad del ser','','Ambientada en Praga en la década de 1960, esta novela explora la vida de cuatro personajes: Tomás, Teresa, Sabina y Franz. "La insoportable levedad del ser" es una reflexión sobre la libertad, el amor y la identidad, y es considerada una de las obras más importantes de la literatura europea contemporánea.'),
(4,'corte de rosas y espinas','','es una novela de fantasía escrita por la autora estadounidense Sarah J. Maas. La historia sigue a la protagonista, Feyre, una cazadora que mata a un lobo en el bosque, pero que es llevada al mundo mágico de los fae como castigo por su crimen. Allí, debe luchar por su supervivencia y descubrir la verdad detrás de los misteriosos sucesos que ocurren en el mundo de los fae. A medida que la trama se desarrolla, se revelan intrigas políticas, amores prohibidos y peligrosas amenazas que pondrán en peligro la vida de Feyre y de aquellos a quienes ama. "Corte de Rosas y Espinas" es el primer libro de una serie de novelas de fantasía épica y ha sido elogiado por su mundo detallado y sus personajes bien desarrollados. Es una obra que invita a la reflexión sobre el valor de la empatía y la lucha contra la injusticia en un mundo mágico lleno de peligros y sorpresas.'),
(4,'La metamorfosis','','ste relato corto cuenta la historia de Gregor Samsa, un hombre que se despierta un día convertido en un insecto. "La metamorfosis" es una obra de la literatura moderna que explora la alienación, la soledad y la desesperación.'),
(5,'El principito','','Esta novela corta cuenta la historia de un niño que viaja de planeta en planeta y se encuentra con varios personajes que representan diferentes aspectos de la vida humana. "El principito" es una obra tierna y poética que ha sido traducida a más de 250 idiomas.'),
(5,'La casa de los espiritus','','Esta novela sigue la historia de la familia Trueba a lo largo de varias décadas en Chile. "La casa de los espíritus" es una obra que combina elementos del realismo mágico con la política y la historia de América Latina.');

USE `tablas_de_datos`;
INSERT INTO Comentarios (id,id_producto,id_usuario,comentario) VALUES
(1,1,1,'Este libro es excelente!'),
(2,1,2,'Me encanta la selección de libros que tienen en su página. Siempre encuentro algo interesante para leer.'),
(3,1,3,'La descripción de los libros es muy detallada y me ayuda a tomar una decisión informada antes de comprar.'),
(4,1,4,'Me gusta mucho la opción de dejar una reseña después de leer un libro que compré en esta página. Me ayuda a dar mi opinión y a otros a tomar una decisión.'),
(5,2,5,'Nunca había leído nada como este libro antes. Me sorprendió de principio a fin.'),
(6,2,1,'Muy interesante!'),
(7,2,2,'Este libro me ha dejado sin palabras. La historia es cautivadora y los personajes son increíblemente realistas.'),
(8,2,3,'La escritura en este libro es simplemente impresionante. Cada palabra está perfectamente elegida.'),
(9,3,4,'Este libro me hizo sentir todas las emociones posibles. Reí, lloré y me emocioné en partes iguales.'),
(10,3,5,'Este libro es un recordatorio de por qué amo leer. Me llevó a lugares que nunca había imaginado.'),
(11,3,1,'Me encantó la forma en que este libro aborda temas importantes de una manera accesible y emocionalmente atractiva.'),
(12,3,2,'Este libro es una obra maestra. Cada detalle está cuidadosamente pensado y construido.'),
(13,4,3,'No puedo creer que esperé tanto tiempo para leer este libro. Fue absolutamente maravilloso.'),
(14,4,4,'Este libro tiene una trama intrincada y sorprendente.'),
(15,4,5,'La descripción de los lugares en este libro es tan vívida que me sentí como si estuviera allí.'),
(16,4,1,'Este libro es una lección de vida en sí mismo. La historia es hermosa y el mensaje es poderoso.'),
(17,5,2,'La historia de este libro me mantuvo en vilo desde la primera página hasta la última.'),
(18,5,3,'No puedo creer lo profundamente que este libro me afectó. Me hizo reflexionar sobre muchas cosas en mi propia vida.'),
(19,5,4,'Este libro me hizo darme cuenta de lo poderosa que puede ser la escritura. La historia se quedará conmigo por mucho tiempo.'),
(20,5,5,'La trama de este libro es tan única que nunca había leído algo así antes. Fue refrescante y emocionante.'),
(21,6,1,'Este libro tiene personajes tan complejos y bien desarrollados que sentí que los conocía personalmente.'),
(22,6,2,'Me encantó cómo este libro trató temas difíciles de una manera sutil pero impactante. Me dejó reflexionando por días después de haberlo terminado.'),
(23,6,3,'Este libro es una joya literaria. La historia es conmovedora y los personajes son inolvidables.'),
(24,6,4,'Me encantó este libro. La narrativa es cautivadora y los personajes están bien desarrollados.'),
(25,7,5,'Este libro me mantuvo en vilo hasta el final. La trama es intrigante y bien escrita.'),
(26,7,1,'Este libro es una lectura obligada para cualquier amante de la literatura. La historia es única y el estilo de escritura es impresionante.'),
(27,7,2,'Este libro me hizo reflexionar sobre la vida. La historia es profunda y los personajes son complejos.'),
(28,7,3,'Este libro me mantuvo despierto toda la noche. La trama es intrigante y los personajes son fascinantes.'),
(29,8,4,'Este libro es un verdadero clásico que todos deberían leer al menos una vez en su vida. Me encantó.'),
(30,8,5,'Este libro es una obra de arte literaria. La prosa es hermosa y la historia es conmovedora.'),
(31,8,1,'Este libro es una joya literaria que no se puede dejar de leer. La historia es cautivadora y los personajes son memorables.'),
(32,8,2,'Este libro es una aventura épica. La trama está bien desarrollada y los personajes son valientes y audaces.'),
(33,9,3,'Este libro es una lectura emocionante. La trama está bien desarrollada y los personajes son realistas y convincentes.'),
(34,9,4,'Este libro es un clásico moderno. La historia es única y la narrativa es impresionante.'),
(35,9,5,'Este libro me mantuvo enganchado desde el principio hasta el final. La trama es intrigante y los personajes son fascinantes.'),
(36,9,1,'Este libro es una obra maestra del realismo mágico. La historia es única y la narrativa es impresionante.'),
(37,10,2,'Este libro es una historia de superación personal. La forma en que el personaje principal crece y cambia a lo largo de la historia es inspiradora.'),
(38,10,3,'Este libro me mantuvo pegado a sus páginas hasta el final. ¡Fue increíble!'),
(39,10,4,'Este libro cambió mi forma de pensar sobre ciertos temas. Me dejó pensando durante días.'),
(40,10,5,'Me encanta cómo este libro toca temas profundos pero al mismo tiempo es divertido y entretenido de leer.');
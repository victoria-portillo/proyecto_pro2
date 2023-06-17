CREATE DATABASE  IF NOT EXISTS `tablas_de_datos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tablas_de_datos`;
-- MySQL dump 10.13  Distrib 5.7.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tablas_de_datos
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_producto` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `comentario` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_clientes` (`id_usuario`),
  KEY `fk_comentarios_producto` (`id_producto`),
  CONSTRAINT `fk_comentarios_clientes` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_comentarios_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,1,'Este libro es excelente!','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(2,1,2,'Me encanta la selección de libros que tienen en su página. Siempre encuentro algo interesante para leer.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(3,1,3,'La descripción de los libros es muy detallada y me ayuda a tomar una decisión informada antes de comprar.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(4,1,4,'Me gusta mucho la opción de dejar una reseña después de leer un libro que compré en esta página. Me ayuda a dar mi opinión y a otros a tomar una decisión.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(5,2,5,'Nunca había leído nada como este libro antes. Me sorprendió de principio a fin.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(6,2,1,'Muy interesante!','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(7,2,2,'Este libro me ha dejado sin palabras. La historia es cautivadora y los personajes son increíblemente realistas.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(8,2,3,'La escritura en este libro es simplemente impresionante. Cada palabra está perfectamente elegida.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(9,3,4,'Este libro me hizo sentir todas las emociones posibles. Reí, lloré y me emocioné en partes iguales.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(10,3,5,'Este libro es un recordatorio de por qué amo leer. Me llevó a lugares que nunca había imaginado.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(11,3,1,'Me encantó la forma en que este libro aborda temas importantes de una manera accesible y emocionalmente atractiva.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(12,3,2,'Este libro es una obra maestra. Cada detalle está cuidadosamente pensado y construido.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(13,4,3,'No puedo creer que esperé tanto tiempo para leer este libro. Fue absolutamente maravilloso.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(14,4,4,'Este libro tiene una trama intrincada y sorprendente.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(15,4,5,'La descripción de los lugares en este libro es tan vívida que me sentí como si estuviera allí.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(16,4,1,'Este libro es una lección de vida en sí mismo. La historia es hermosa y el mensaje es poderoso.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(17,5,2,'La historia de este libro me mantuvo en vilo desde la primera página hasta la última.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(18,5,3,'No puedo creer lo profundamente que este libro me afectó. Me hizo reflexionar sobre muchas cosas en mi propia vida.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(19,5,4,'Este libro me hizo darme cuenta de lo poderosa que puede ser la escritura. La historia se quedará conmigo por mucho tiempo.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(20,5,5,'La trama de este libro es tan única que nunca había leído algo así antes. Fue refrescante y emocionante.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(21,6,1,'Este libro tiene personajes tan complejos y bien desarrollados que sentí que los conocía personalmente.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(22,6,2,'Me encantó cómo este libro trató temas difíciles de una manera sutil pero impactante. Me dejó reflexionando por días después de haberlo terminado.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(23,6,3,'Este libro es una joya literaria. La historia es conmovedora y los personajes son inolvidables.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(24,6,4,'Me encantó este libro. La narrativa es cautivadora y los personajes están bien desarrollados.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(25,7,5,'Este libro me mantuvo en vilo hasta el final. La trama es intrigante y bien escrita.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(26,7,1,'Este libro es una lectura obligada para cualquier amante de la literatura. La historia es única y el estilo de escritura es impresionante.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(27,7,2,'Este libro me hizo reflexionar sobre la vida. La historia es profunda y los personajes son complejos.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(28,7,3,'Este libro me mantuvo despierto toda la noche. La trama es intrigante y los personajes son fascinantes.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(29,8,4,'Este libro es un verdadero clásico que todos deberían leer al menos una vez en su vida. Me encantó.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(30,8,5,'Este libro es una obra de arte literaria. La prosa es hermosa y la historia es conmovedora.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(31,8,1,'Este libro es una joya literaria que no se puede dejar de leer. La historia es cautivadora y los personajes son memorables.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(32,8,2,'Este libro es una aventura épica. La trama está bien desarrollada y los personajes son valientes y audaces.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(33,9,3,'Este libro es una lectura emocionante. La trama está bien desarrollada y los personajes son realistas y convincentes.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(34,9,4,'Este libro es un clásico moderno. La historia es única y la narrativa es impresionante.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(35,9,5,'Este libro me mantuvo enganchado desde el principio hasta el final. La trama es intrigante y los personajes son fascinantes.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(36,9,1,'Este libro es una obra maestra del realismo mágico. La historia es única y la narrativa es impresionante.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(37,10,2,'Este libro es una historia de superación personal. La forma en que el personaje principal crece y cambia a lo largo de la historia es inspiradora.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(38,10,3,'Este libro me mantuvo pegado a sus páginas hasta el final. ¡Fue increíble!','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(39,10,4,'Este libro cambió mi forma de pensar sobre ciertos temas. Me dejó pensando durante días.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(40,10,5,'Me encanta cómo este libro toca temas profundos pero al mismo tiempo es divertido y entretenido de leer.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `image` text DEFAULT NULL,
  `descripcion_producto` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_clientes` (`id_usuario`),
  CONSTRAINT `fk_productos_clientes` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'1984','','Esta novela distópica, escrita por George Orwell, imagina un futuro totalitario en el que el gobierno controla todos los aspectos de la vida de las personas, incluso sus pensamientos. \"1984\" es una crítica feroz al autoritarismo y una advertencia sobre los peligros del poder sin restricciones.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(2,1,'El gran Gatsby','','Esta novela escrita por F. Scott Fitzgerald, esta ambientada en la década de 1920 sigue la vida de Jay Gatsby, un hombre rico y misterioso que organiza fiestas extravagantes en su mansión en Long Island. A través de los ojos del narrador, Nick Carraway, \"El gran Gatsby\" explora la corrupción y el vacío de la alta sociedad americana.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(3,2,'El senior de los anillos','','Esta trilogía épica, escrita por J.R.R Tolkien, sigue las aventuras de un grupo de hobbits, enanos, elfos y humanos mientras buscan destruir el Anillo Único, un objeto poderoso que podría caer en manos equivocadas. \"El señor de los anillos\" es una obra maestra del género de la fantasía y ha sido adaptada al cine con gran éxito.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(4,2,'El aleph','','Esta colección de cuentos del escritor argentino Jorge Luis Borges explora temas como el tiempo, el espacio y la identidad. \"El aleph\" es una obra de gran complejidad y profundidad y es considerada una de las mejores colecciones de cuentos de la literatura en español.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(5,3,'La sombre del viento','','Esta novela cuenta la historia de Daniel Sempere, un joven que descubre un libro en la librería de su padre y comienza a investigar sobre el autor, Julián Carax. A medida que Daniel profundiza en la vida de Carax, se adentra en una trama de amor, venganza y misterio en la Barcelona de posguerra.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(6,3,'La insoportable levedad del ser','','Ambientada en Praga en la década de 1960, esta novela explora la vida de cuatro personajes: Tomás, Teresa, Sabina y Franz. \"La insoportable levedad del ser\" es una reflexión sobre la libertad, el amor y la identidad, y es considerada una de las obras más importantes de la literatura europea contemporánea.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(7,4,'corte de rosas y espinas','','es una novela de fantasía escrita por la autora estadounidense Sarah J. Maas. La historia sigue a la protagonista, Feyre, una cazadora que mata a un lobo en el bosque, pero que es llevada al mundo mágico de los fae como castigo por su crimen. Allí, debe luchar por su supervivencia y descubrir la verdad detrás de los misteriosos sucesos que ocurren en el mundo de los fae. A medida que la trama se desarrolla, se revelan intrigas políticas, amores prohibidos y peligrosas amenazas que pondrán en peligro la vida de Feyre y de aquellos a quienes ama. \"Corte de Rosas y Espinas\" es el primer libro de una serie de novelas de fantasía épica y ha sido elogiado por su mundo detallado y sus personajes bien desarrollados. Es una obra que invita a la reflexión sobre el valor de la empatía y la lucha contra la injusticia en un mundo mágico lleno de peligros y sorpresas.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(8,4,'La metamorfosis','','ste relato corto cuenta la historia de Gregor Samsa, un hombre que se despierta un día convertido en un insecto. \"La metamorfosis\" es una obra de la literatura moderna que explora la alienación, la soledad y la desesperación.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(9,5,'El principito','','Esta novela corta cuenta la historia de un niño que viaja de planeta en planeta y se encuentra con varios personajes que representan diferentes aspectos de la vida humana. \"El principito\" es una obra tierna y poética que ha sido traducida a más de 250 idiomas.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(10,5,'La casa de los espiritus','','Esta novela sigue la historia de la familia Trueba a lo largo de varias décadas en Chile. \"La casa de los espíritus\" es una obra que combina elementos del realismo mágico con la política y la historia de América Latina.','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `foto_de_perfil` varchar(200) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Miguel Estrada','miguel.estrada@gmail.com','Miguelestrada2001',NULL,44126876,'2001-03-24','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(2,'Jimena Pacheco','jimepacheco123@gmail.com','pachecogolf1273',NULL,39357902,'1978-06-01','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(3,'Juan Perez','Jperez10@gmail.com','Messiteamo32',NULL,94823776,'2006-12-30','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(4,'Micaela Selman','micaselman@gmail.com','micaELA3260',NULL,41456282,'1995-02-08','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL),(5,'Maris Susana Gonzale','susanitag27@gmail.com','Xeneize12',NULL,40988762,'1984-07-17','2023-06-16 17:12:28','2023-06-16 17:12:28',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-16 21:01:22

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS AdopcionesMascotas;
USE AdopcionesMascotas;

-- Tabla Mascotas
CREATE TABLE Mascotas (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    especie VARCHAR(30),
    raza VARCHAR(50),
    edad INT,
    estado_salud VARCHAR(100),
    estado_adopcion ENUM('Disponible', 'Adoptada'),
    fecha_ingreso DATE
);

-- Tabla Adoptantes
CREATE TABLE Adoptantes (
    id_adoptante INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100),
    puesto VARCHAR(50),
    correo VARCHAR(100)
);

-- Tabla Adopciones
CREATE TABLE Adopciones (
    id_adopcion INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,
    id_adoptante INT,
    id_empleado INT,
    fecha_adopcion DATE,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_adoptante) REFERENCES Adoptantes(id_adoptante),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- Tabla Controles Post-Adopción
CREATE TABLE Controles_PostAdopcion (
    id_control INT PRIMARY KEY AUTO_INCREMENT,
    id_adopcion INT,
    id_empleado INT,
    fecha_control DATE,
    observaciones TEXT,
    estado_seguimiento ENUM('Exitoso', 'Pendiente', 'Fallido'),
    FOREIGN KEY (id_adopcion) REFERENCES Adopciones(id_adopcion),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

--Los 20 registros de mascotas 
INSERT INTO Mascotas (nombre, especie, raza, edad, estado_salud, estado_adopcion, fecha_ingreso) VALUES
('Luna', 'Perro', 'Labrador', 3, 'Buena', 'Disponible', '2025-03-01'),
('Max', 'Perro', 'Pastor Alemán', 5, 'Regular', 'Disponible', '2025-02-15'),
('Milo', 'Gato', 'Angora', 2, 'Buena', 'Disponible', '2025-01-10'),
('Nala', 'Gato', 'Siames', 4, 'Buena', 'Adoptada', '2025-03-20'),
('Rocky', 'Perro', 'Pug', 1, 'Excelente', 'Disponible', '2025-04-12'),
('Toby', 'Perro', 'Beagle', 6, 'Buena', 'Disponible', '2025-01-30'),
('Simba', 'Gato', 'Persa', 3, 'Buena', 'Adoptada', '2025-02-10'),
('Bobby', 'Perro', 'Golden Retriever', 2, 'Excelente', 'Disponible', '2025-04-01'),
('Kira', 'Gato', 'Criollo', 1, 'Regular', 'Disponible', '2025-03-25'),
('Teo', 'Perro', 'Chihuahua', 4, 'Buena', 'Disponible', '2025-03-18'),
('Mía', 'Gato', 'Maine Coon', 5, 'Buena', 'Disponible', '2025-02-28'),
('Bibi', 'Perro', 'Chihuahua', 3, 'Regular', 'Disponible', '2025-01-22'),
('Lola', 'Gato', 'Bengala', 2, 'Excelente', 'Disponible', '2025-04-05'),
('Thor', 'Perro', 'Doberman', 2, 'Buena', 'Disponible', '2025-02-17'),
('Kiara', 'Gato', 'Siames', 3, 'Buena', 'Disponible', '2025-03-30'),
('Bruno', 'Perro', 'Boxer', 6, 'Regular', 'Adoptada', '2025-03-01'),
('Daisy', 'Perro', 'Cocker Spaniel', 2, 'Buena', 'Disponible', '2025-01-05'),
('Chispa', 'Gato', 'Criollo', 1, 'Buena', 'Disponible', '2025-04-14'),
('Oreo', 'Perro', 'Pomerania', 3, 'Buena', 'Disponible', '2025-03-10'),
('Loki', 'Gato', 'Azul Ruso', 4, 'Excelente', 'Disponible', '2025-02-25');

--10 registros de los adoptantes 
INSERT INTO Adoptantes (nombre_completo, direccion, telefono, correo) VALUES
('Ana Martínez', 'Calle Real #12, San Salvador', '7012-3456', 'ana.martinez@email.com'),
('Carlos Gómez', 'Av. Central #3, Santa Tecla', '7890-1234', 'carlos.gomez@email.com'),
('Julia Ramos', 'Bo. El Calvario, Ilobasco', '7654-3210', 'julia.ramos@email.com'),
('Daniela López', 'Col. Miramonte, SS', '7080-1122', 'daniela.lopez@email.com'),
('Luis Peralta', 'Res. Altavista, Ilopango', '7456-0987', 'luis.peralta@email.com'),
('Karen Herrera', 'Soyapango, San Salvador', '7321-6789', 'karen.herrera@email.com'),
('Pablo Velásquez', 'Apopa, San Salvador', '7567-4321', 'pablo.velasquez@email.com'),
('Sofía Chávez', 'San Miguel, Centro', '7891-2345', 'sofia.chavez@email.com'),
('Raúl Hernández', 'Usulután', '7901-8765', 'raul.hernandez@email.com'),
('Estefany Melgar', 'Col. Escalón, SS', '7012-1111', 'estefany.melgar@email.com');

-- 5 registro de los empleados 
INSERT INTO Empleados (nombre_completo, puesto, correo) VALUES
('María Reyes', 'Veterinaria', 'maria.reyes@ong.org'),
('Jorge Castillo', 'Asistente de Adopciones', 'jorge.castillo@ong.org'),
('Sonia Menjívar', 'Coordinadora', 'sonia.menjivar@ong.org'),
('Iván Ayala', 'Inspector de Seguimiento', 'ivan.ayala@ong.org'),
('Teresa Campos', 'Encargada de Mascotas', 'teresa.campos@ong.org');

-- 5 adopciones 
INSERT INTO Adopciones (id_mascota, id_adoptante, id_empleado, fecha_adopcion) VALUES
(4, 1, 2, '2025-04-01'),  -- Nala
(7, 2, 1, '2025-04-05'),  -- Simba
(15, 3, 3, '2025-04-10'), -- Bruno
(5, 4, 2, '2025-04-12'),  -- Rocky
(6, 5, 1, '2025-04-14');  -- Toby

-- 5 controles de post-adopcion 
INSERT INTO Controles_PostAdopcion (id_adopcion, id_empleado, fecha_control, observaciones, estado_seguimiento) VALUES
(1, 4, '2025-04-15', 'Mascota en excelente estado. Buena adaptación.', 'Exitoso'),
(2, 1, '2025-04-20', 'Mascota bien cuidada, sin problemas.', 'Exitoso'),
(3, 4, '2025-04-22', 'Algunos problemas de adaptación inicial.', 'Pendiente'),
(4, 4, '2025-04-25', 'Adoptante reporta comportamiento agresivo.', 'Fallido'),
(5, 1, '2025-04-30', 'Todo en orden. Revisión satisfactoria.', 'Exitoso');

-- Listar mascotas disponibles filtradas 
SELECT *
FROM Mascotas
WHERE estado_adopcion = 'Disponible'
  AND especie = 'Perro'
  AND edad <= 3
  AND estado_salud = 'Buena';

-- Historial de adopciones por cada adoptante
SELECT 
    A.nombre_completo AS Adoptante,
    M.nombre AS Mascota,
    M.especie,
    M.raza,
    AD.fecha_adopcion
FROM Adopciones AD
JOIN Adoptantes A ON AD.id_adoptante = A.id_adoptante
JOIN Mascotas M ON AD.id_mascota = M.id_mascota
ORDER BY A.nombre_completo, AD.fecha_adopcion;

-- Seguimientos post-adopción por empleado
SELECT 
    E.nombre_completo AS Empleado,
    M.nombre AS Mascota,
    CP.fecha_control,
    CP.estado_seguimiento,
    CP.observaciones
FROM Controles_PostAdopcion CP
JOIN Adopciones AD ON CP.id_adopcion = AD.id_adopcion
JOIN Empleados E ON CP.id_empleado = E.id_empleado
JOIN Mascotas M ON AD.id_mascota = M.id_mascota
ORDER BY E.nombre_completo, CP.fecha_control;

--VISTAS 
--Vistas de adopciones 
CREATE VIEW vista_adopciones_completas AS
SELECT 
    A.nombre_completo AS Nombre_Adoptante,
    M.nombre AS Nombre_Mascota,
    M.especie,
    M.raza,
    M.edad,
    M.estado_salud,
    AD.fecha_adopcion
FROM Adopciones AD
JOIN Adoptantes A ON AD.id_adoptante = A.id_adoptante
JOIN Mascotas M ON AD.id_mascota = M.id_mascota;

--para que se pueda consultar la vista 
SELECT * FROM vista_adopciones_completas;


--PROCEDIMIENTO ALMACENADO
--registro de adopcion 
DELIMITER $$

CREATE PROCEDURE registrar_adopcion (
    IN p_id_mascota INT,
    IN p_id_adoptante INT,
    IN p_id_empleado INT,
    IN p_fecha_adopcion DATE
)
BEGIN
    -- Insertar nueva adopción
    INSERT INTO Adopciones (id_mascota, id_adoptante, id_empleado, fecha_adopcion)
    VALUES (p_id_mascota, p_id_adoptante, p_id_empleado, p_fecha_adopcion);

    -- Actualizar estado de adopción de la mascota
    UPDATE Mascotas
    SET estado_adopcion = 'Adoptada'
    WHERE id_mascota = p_id_mascota;
END $$

DELIMITER ;

--Ejemplo que utilicé
CALL registrar_adopcion(8, 6, 2, '2025-05-22');

-- Para ver si aparecia que estaba adoptada utilizé un SELECT
SELECT *
FROM Mascotas
WHERE estado_adopcion = 'Adoptada';

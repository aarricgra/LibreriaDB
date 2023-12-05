DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS personajes;

CREATE TABLE IF NOT EXISTS libros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    descripcion TEXT,
    autor TEXT,
    url TEXT
);


INSERT INTO libros VALUES
    (1, 'Harry Potter y la piedra filosofal', 'Un joven mago descubre su identidad en el mundo mágico.', 'J.K. Rowling', 'https://cdn.kobo.com/book-images/6750d058-29cb-4626-9c12-a62e816a80cc/166/300/False/harry-potter-and-the-philosopher-s-stone-3.jpg'),
    (2, 'Matar a un ruiseñor', 'Exploración de la injusticia racial en el sur de Estados Unidos.', 'Harper Lee', 'https://m.media-amazon.com/images/I/81+j6JIEweL._AC_UF1000,1000_QL80_.jpg'),
    (3, 'El gran Gatsby', 'Exploración de la decadencia de la sociedad estadounidense en la década de 1920.', 'F. Scott Fitzgerald', 'https://upload.wikimedia.org/wikipedia/commons/5/56/Portada_de_la_novel%C2%B7la_%22The_Great_Gatsby%22.gif'),
    (4, 'Cien años de soledad', 'La historia mágica y trágica de la familia Buendía en Macondo.', 'Gabriel García Márquez', 'https://m.media-amazon.com/images/I/91TvVQS7loL._AC_UF1000,1000_QL80_.jpg'),
    (5, 'Crimen y castigo', 'El estudiante Raskólnikov comete un asesinato y enfrenta las consecuencias.', 'Fyodor Dostoevsky', 'https://m.media-amazon.com/images/I/41dHO9-vxeL.jpg'),
    (6, 'Orgullo y prejuicio', 'El complicado romance entre Elizabeth Bennet y Mr. Darcy en la sociedad británica del siglo XIX.', 'Jane Austen', 'https://www.albaeditorial.es/wp-content/uploads/2020/10/9788484288060-orgullo-y-prejuicio-alba-editorial.jpg'),
    (7, '1984', 'Distopía que explora el control totalitario y la manipulación de la verdad.', 'George Orwell', 'https://m.media-amazon.com/images/I/61kjuGfZyML.jpg');


CREATE TABLE IF NOT EXISTS personajes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    descripcion TEXT,
    id_libro INTEGER,
    FOREIGN KEY (id_libro) REFERENCES libros(id)
    );

INSERT INTO personajes VALUES
    (1, 'Harry Potter', 'El niño que sobrevivió y protagonista principal.', 1),
    (2, 'Hermione Granger', 'Estudiante ejemplar con conocimientos excepcionales.', 1),
    (3, 'Ron Weasley', 'Leal amigo de Harry con una familia numerosa.', 1),
    (4, 'Atticus Finch', 'Abogado valiente y padre de Scout y Jem.', 2),
    (5, 'Scout Finch', 'Narradora joven y observadora de la historia.', 2),
    (6, 'Jem Finch', 'Hermano mayor de Scout, afectado por la injusticia racial.', 2),
    (7, 'Jay Gatsby', 'Misterioso anfitrión de fiestas lujosas.', 3),
    (8, 'Daisy Buchanan', 'Mujer elegante y figura central de la trama amorosa.', 3),
    (9, 'Nick Carraway', 'Narrador y observador de los eventos en la historia.', 3),
    (10, 'José Arcadio Buendía', 'Patriarca fundador de la familia Buendía en Macondo.', 4),
    (11, 'Úrsula Iguarán', 'Esposa de José Arcadio Buendía y matriarca de la familia Buendía.', 4),
    (12, 'Aureliano Buendía', 'Hijo de José Arcadio Buendía y Úrsula, líder militar y solitario.', 4),
    (13, 'Rebeca Buendía', 'Hija adoptiva de la familia Buendía con un pasado misterioso.', 4),
    (14, 'Rodion Raskólnikov', 'Estudiante atormentado que comete un crimen por una supuesta superioridad.', 5),
    (15, 'Sofía Semiónovna Marmeládov', 'Mujer que sufre las consecuencias de las acciones de Raskólnikov.', 5),
    (16, 'Porfirio Petrovich', 'Investigador que intenta resolver el crimen de Raskólnikov.', 5),
    (17, 'Avdotya Románovna Raskólnikova (Dunya)', 'Hermana de Raskólnikov que busca una vida mejor.', 5),
    (18, 'Elizabeth Bennet', 'Protagonista de "Orgullo y prejuicio", inteligente y de mente abierta.', 6),
    (19, 'Mr. Fitzwilliam Darcy', 'Héroe romántico y objeto del interés de Elizabeth Bennet.', 6),
    (20, 'Jane Bennet', 'Hermana mayor de Elizabeth, dulce y amable.', 6),
    (21, 'Charles Bingley', 'Amigo de Darcy y pretendiente de Jane Bennet.', 6),
    (22, 'Winston Smith', 'Protagonista que cuestiona el régimen totalitario.', 7),
    (23, 'Julia', 'Amante de Winston y rebelde contra el sistema.', 7),
    (24, 'Brien', 'Miembro del partido interior con un papel ambiguo.', 7),
    (25, 'Big Brother', 'Figura omnipresente y líder del régimen.', 7);

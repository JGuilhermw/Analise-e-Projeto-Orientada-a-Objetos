CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    periodo VARCHAR(20)
);

CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_professor INT,
    id_turma INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_disciplina INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);
INSERT INTO aluno (nome) VALUES 
('João'), ('Maria'), ('Carlos');

INSERT INTO professor (nome) VALUES 
('Ana'), ('Roberto');

INSERT INTO turma (periodo) VALUES 
('Manhã'), ('Noite');

INSERT INTO disciplina (nome, id_professor, id_turma) VALUES 
('Matemática', 1, 1),
('Português', 2, 2);

INSERT INTO matricula (id_aluno, id_disciplina, nota) VALUES 
(1, 1, 8.5),
(2, 1, 7.0),
(3, 2, 9.0);
SELECT 
    a.nome AS aluno,
    d.nome AS disciplina,
    p.nome AS professor,
    m.nota
FROM matricula m
INNER JOIN aluno a ON m.id_aluno = a.id_aluno
INNER JOIN disciplina d ON m.id_disciplina = d.id_disciplina
INNER JOIN professor p ON d.id_professor = p.id_professor
ORDER BY a.nome;
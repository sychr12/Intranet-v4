-- MySQL Dump Corrigido - Banco: intranet
-- Compatível com MySQL 8.x

-- ---------------------------------------------------------------------
-- Configuração inicial
-- ---------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS intranet
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE intranet;

-- ---------------------------------------------------------------------
-- Tabela: avisos
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS avisos;

CREATE TABLE avisos (
  id INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  texto TEXT NOT NULL,
  imagem VARCHAR(255) DEFAULT NULL,
  criado_em TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- Tabela: usuarios
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  nome VARCHAR(100) DEFAULT NULL,
  role VARCHAR(50) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- Dados iniciais
-- ---------------------------------------------------------------------
INSERT INTO usuarios (username, password, nome, role)
VALUES 
  ('suporteti', 'wtc1902crc', 'suporteti', 'admin'),
  ('admin', '1234', 'Administrador', 'admin');

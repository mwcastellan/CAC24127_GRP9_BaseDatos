
--**************************************************
--*  ESQUEMA. mcastellan_grp9                      *
--**************************************************

CREATE TABLE `categorias` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) NOT NULL,
  `PATH_IMAGEN` varchar(100) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `estado_pedidos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `id_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `subcategoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) NOT NULL,
  `PATH_IMAGEN` varchar(100) NOT NULL,
  `IDCATEGORIA` int(11) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `IDCATEGORIA_idx` (`IDCATEGORIA`),
  CONSTRAINT `IDCATEGORIA` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categorias` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) NOT NULL,
  `DESCRIPCION_AMPLIA` varchar(200) NOT NULL,
  `FECHA_VTO` date NOT NULL,
  `STOCK_DISPONIBLE` int(11) NOT NULL,
  `NOMBRE_IMAGEN` varchar(45) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `IDSUBCATEGORIA` int(11) NOT NULL,
  `CreatedAt` date NOT NULL,
  `UpdatedAt` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `IDSUBCATEGORIA_idx` (`IDSUBCATEGORIA`),
  CONSTRAINT `IDSUBCATEGORIA` FOREIGN KEY (`IDSUBCATEGORIA`) REFERENCES `subcategoria` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pedidos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_COMPRA` date NOT NULL,
  `IDCLIENTE` int(11) NOT NULL,
  `IDPRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO` double NOT NULL,
  `IMPORTE` double NOT NULL,
  `IDESTADO` int(11) NOT NULL DEFAULT 1,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `IDCLIENTE_idx` (`IDCLIENTE`),
  KEY `IDPRODUCTO_idx` (`IDPRODUCTO`),
  KEY `IDESTADO_idx` (`IDESTADO`),
  CONSTRAINT `IDCLIENTE` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`ID`),
  CONSTRAINT `IDESTADO` FOREIGN KEY (`IDESTADO`) REFERENCES `estado_pedidos` (`ID`),
  CONSTRAINT `IDPRODUCTO` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `productos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE VIEW `Vw_Pedidos` AS 
select `pe`.`ID` AS `ID`,`pe`.`FECHA_COMPRA` AS `FECHA_COMPRA`,`pe`.`IDCLIENTE` AS `IDCLIENTE`,`pe`.`IDPRODUCTO` AS `IDPRODUCTO`,`pe`.`CANTIDAD` AS `CANTIDAD`,`pe`.`PRECIO` AS `PRECIO`,`pe`.`IMPORTE` AS `IMPORTE`,`pe`.`IDESTADO` AS `IDESTADO`,`cl`.`EMAIL` AS `EMAIL_CLIENTE`,`pr`.`DESCRIPCION` AS `DESCRIPCION_PRODUCTO`,`sca`.`DESCRIPCION` AS `DESCRIPCION_SUBCATEGORIA`,`ca`.`DESCRIPCION` AS `DESCRIPCION_CATEGORIA`,`ep`.`DESCRIPCION` AS `DESCRIPCION_ESTADO_PEDIDOS` from (((((`pedidos` `pe` join `productos` `pr`) join `subcategoria` `sca`) join `categorias` `ca`) join `clientes` `cl`) join `estado_pedidos` `ep`) where `pe`.`IDPRODUCTO` = `pr`.`ID` and `pe`.`IDCLIENTE` = `cl`.`ID` and `pe`.`IDESTADO` = `ep`.`ID` and `pr`.`IDSUBCATEGORIA` = `sca`.`ID` and `sca`.`IDCATEGORIA` = `ca`.`ID`;

CREATE VIEW `Vw_Productos` AS 
select `pr`.`ID` AS `ID`,`pr`.`DESCRIPCION` AS `DESCRIPCION`,`pr`.`DESCRIPCION_AMPLIA` AS `DESCRIPCION_AMPLIA`,`pr`.`FECHA_VTO` AS `FECHA_VTO`,`pr`.`STOCK_DISPONIBLE` AS `STOCK_DISPONIBLE`,`pr`.`NOMBRE_IMAGEN` AS `NOMBRE_IMAGEN`,`pr`.`PRECIO` AS `PRECIO`,`pr`.`IDSUBCATEGORIA` AS `IDSUBCATEGORIA`,`sca`.`DESCRIPCION` AS `DESCRIPCION_SUBCATEGORIA`,`sca`.`PATH_IMAGEN` AS `PATH_SUBCATEGORIA`,`sca`.`IDCATEGORIA` AS `IDCATEGORIA`,`ca`.`DESCRIPCION` AS `DESCRIPCION_CATEGORIA`,`ca`.`PATH_IMAGEN` AS `PATH_CATEGORIA`,`pr`.`CreatedAt` AS `createdat`,`pr`.`UpdatedAt` AS `updatedat` from ((`productos` `pr` join `subcategoria` `sca`) join `categorias` `ca`) where `pr`.`IDSUBCATEGORIA` = `sca`.`ID` and `sca`.`IDCATEGORIA` = `ca`.`ID` order by `pr`.`ID`;

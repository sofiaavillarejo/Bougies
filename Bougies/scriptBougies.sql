DROP TABLE Categorias
DROP TABLE Descuentos
DROP TABLE DetallesPedido
DROP TABLE Pedidos
DROP TABLE Productos
DROP TABLE Usuarios
DROP TABLE Roles
DROP TABLE MetodoPago
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Valor] [decimal](5, 2) NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedido]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedido](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaPedido] [datetime] NULL,
	[Total] [decimal](10, 2) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
	[IdMetodoPago] [int] NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Ciudad] [nvarchar](100) NOT NULL,
	[CodigoPostal] [nvarchar](20) NOT NULL,
	[Poblacion] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDescuento] [int] NOT NULL,
	[Imagen] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Passwd] [nvarchar](max) NOT NULL,
	[IdRol] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1, N'Velas')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Descuentos] ON 

INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (1, N'Sin descuento', CAST(0.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (2, N'Descuento 20%', CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (3, N'Descuento 30%', CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (4, N'Descuento 50%', CAST(50.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (5, N'Descuento 70%', CAST(70.00 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[Descuentos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (1, N'Vela Aromática', N'Vela aromática de lavanda para ambientes relajantes', CAST(10.99 AS Decimal(10, 2)), 1001, 1, 1, N'velaLavanda.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (4, N'Vela Aromática de Lavanda', N'Vela aromática con fragancia de lavanda, perfecta para relajación.', CAST(12.99 AS Decimal(10, 2)), 50, 1, 1, N'velaLavanda.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (5, N'Vela de Cera de Soja', N'Vela ecológica hecha de cera de soja, ideal para un ambiente natural.', CAST(14.49 AS Decimal(10, 2)), 30, 1, 1, N'velaSoja.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (7, N'Vela Floral de Rosas', N'Vela con esencia de rosas frescas para un ambiente floral y delicado.', CAST(15.99 AS Decimal(10, 2)), 40, 1, 1, N'velaRosas.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (8, N'Vela de Coco y Vainilla', N'Vela con fragancia tropical de coco y vainilla, perfecta para relajarse.', CAST(13.99 AS Decimal(10, 2)), 25, 1, 1, N'velaCocoVainilla.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (9, N'velita de prueba', N'aaaa', CAST(12.00 AS Decimal(10, 2)), 23, 1, 1, N'vela1.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (10, N'sofi', N'aaaaa', CAST(12.99 AS Decimal(10, 2)), 23, 1, 1, N'vela1.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (11, N'sofi', N'aaa', CAST(12.99 AS Decimal(10, 2)), 12, 1, 1, N'vela1.jpg')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Email], [Passwd], [IdRol], [CreatedAt]) VALUES (1, N'Admin', N'sofia.villarejo@tajamar365.com', N'Admin123', 1, CAST(N'2025-02-19T09:16:59.177' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__75E3EFCFC5E6E2A7]    Script Date: 19/02/2025 13:45:54 ******/
ALTER TABLE [dbo].[Categorias] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MetodoPa__75E3EFCF62085F65]    Script Date: 19/02/2025 13:45:54 ******/
ALTER TABLE [dbo].[MetodoPago] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__75E3EFCF16AAEA0C]    Script Date: 19/02/2025 13:45:54 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__A9D10534A62EED82]    Script Date: 19/02/2025 13:45:54 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Descuentos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([Id])
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([IdMetodoPago])
REFERENCES [dbo].[MetodoPago] ([Id])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([IdDescuento])
REFERENCES [dbo].[Descuentos] ([Id])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PRODUCTO]    Script Date: 19/02/2025 13:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UPDATE_PRODUCTO] 
    @id INT,  
    @nombre NVARCHAR(200), 
    @descripcion NVARCHAR(MAX), 
    @precio DECIMAL(10,2), 
    @stock INT, 
    @idcategoria INT, 
    @iddescuento INT = NULL,  -- Opcional
    @imagen NVARCHAR(MAX)
AS
BEGIN
    UPDATE PRODUCTOS 
    SET 
        Nombre = @nombre,
        Descripcion = @descripcion,
        Precio = @precio,
        Stock = @stock,
        IdCategoria = @idcategoria,
        Imagen = @imagen,
        IdDescuento = CASE 
                        WHEN @iddescuento IS NULL THEN IdDescuento 
                        ELSE @iddescuento 
                      END
    WHERE Id = @id;
END;
GO
USE [master]
GO
ALTER DATABASE [BOUGIES] SET  READ_WRITE 
GO

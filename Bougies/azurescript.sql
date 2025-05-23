CREATE TABLE [dbo].[Categorias](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COCHES]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COCHES](
	[idcoche] [int] NOT NULL,
	[marca] [nvarchar](50) NULL,
	[modelo] [nvarchar](50) NULL,
	[conductor] [nvarchar](50) NULL,
	[imagen] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcoche] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CodigosCupon]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CodigosCupon](
	[Id] [int] NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Descuento] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Usado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[id_compra] [int] NOT NULL,
	[nombre_cubo] [nvarchar](50) NULL,
	[precio] [int] NOT NULL,
	[fechapedido] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRACUBOS]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRACUBOS](
	[id_pedido] [int] NOT NULL,
	[id_cubo] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fechapedido] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUBOS]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUBOS](
	[id_cubo] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[marca] [nvarchar](50) NOT NULL,
	[imagen] [nvarchar](500) NOT NULL,
	[precio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cubo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPT](
	[DEPT_NO] [int] NULL,
	[DNOMBRE] [nvarchar](50) NULL,
	[LOC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuentos]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuentos](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Valor] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedido]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedido](
	[Id] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTOR]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTOR](
	[HOSPITAL_COD] [int] NULL,
	[DOCTOR_NO] [int] NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[ESPECIALIDAD] [nvarchar](50) NULL,
	[SALARIO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMP](
	[EMP_NO] [int] NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[OFICIO] [nvarchar](50) NULL,
	[DIR] [int] NULL,
	[FECHA_ALT] [datetime] NULL,
	[SALARIO] [int] NULL,
	[COMISION] [int] NULL,
	[DEPT_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENFERMO]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENFERMO](
	[INSCRIPCION] [nvarchar](50) NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[FECHA_NAC] [datetime] NULL,
	[S] [nvarchar](50) NULL,
	[NSS] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOSPITAL]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOSPITAL](
	[HOSPITAL_COD] [int] NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](50) NULL,
	[TELEFONO] [nvarchar](50) NULL,
	[NUM_CAMA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCUPACION]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCUPACION](
	[INSCRIPCION] [int] NULL,
	[HOSPITAL_COD] [int] NULL,
	[SALA_COD] [int] NULL,
	[CAMA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] NOT NULL,
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAJES]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAJES](
	[IDPERSONAJE] [int] NOT NULL,
	[PERSONAJE] [nvarchar](60) NULL,
	[IMAGEN] [nvarchar](250) NULL,
	[IDSERIE] [int] NULL,
 CONSTRAINT [PK_PERSONAJES] PRIMARY KEY CLUSTERED 
(
	[IDPERSONAJE] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLANTILLA]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANTILLA](
	[HOSPITAL_COD] [int] NULL,
	[SALA_COD] [int] NULL,
	[EMPLEADO_NO] [int] NULL,
	[APELLIDO] [nvarchar](50) NULL,
	[FUNCION] [nvarchar](50) NULL,
	[T] [nvarchar](50) NULL,
	[SALARIO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDescuento] [int] NULL,
	[Imagen] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALA]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALA](
	[HOSPITAL_COD] [int] NULL,
	[SALA_COD] [int] NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[NUM_CAMA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERIES]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERIES](
	[IDSERIE] [int] NOT NULL,
	[NOMBRE] [nvarchar](160) NULL,
	[IMAGEN] [nvarchar](250) NULL,
	[ANYO] [int] NULL,
 CONSTRAINT [PK_SERIES] PRIMARY KEY CLUSTERED 
(
	[IDSERIE] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](150) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Passwd] [nvarchar](255) NOT NULL,
	[IdRol] [int] NULL,
	[Imagen] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOSCUBO]    Script Date: 28/04/2025 2:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOSCUBO](
	[ID_USUARIO] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[PASS] [nvarchar](50) NULL,
	[imagen] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1, N'Velas')
GO
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (1, N'DMC', N'DELOREAN', N'MARTY MCFLY', N'https://static.motor.es/fotos-noticias/2015/10/min652x435/curiosidades-delorean-regreso-al-futuro-201523728_4.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (2, N'PONTIAC', N'FIREBIRD', N'MICHAEL KNIGHT', N'https://i.ytimg.com/vi/UJFwmjfTSJw/hqdefault.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (3, N'VOLKSWAGEN', N'ESCARABAJO', N'HERBIE', N'https://i.ytimg.com/vi/AP-HLHi0HUw/maxresdefault.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (4, N'GMC', N'VANDURA', N'M.A BARRACUS', N'https://cdn.autobild.es/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2014/07/348079-gmc-vandura.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (5, N'CADILLAC', N'MILLER-METEOR', N'CAZAFANTASMA', N'https://aws.traveler.es/prod/designs/v1/assets/940x467/100066.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (6, N'CHEVROLET', N'CORVETTE 84', N'FENIX', N'http://3.bp.blogspot.com/-oSOLxXB9Ens/Vpla0HjL53I/AAAAAAAAB7I/zuAyq3BYThQ/s1600/corvette%2BC4.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (8, N'TRONCO', N'MOVIL', N'PEDRO PICAPIEDRA', N'https://tork.news/__export/1604167687354/sites/tork/img/2020/10/31/autosanimadospicapiedra.jpg_1339198878.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (9, N'DODGE', N'caxaaaaaaaaaau', N'RAYO MCQUEEN 2', N'https://www.clicacoches.com/wp-content/uploads/2018/10/rayo-mcqueen-1.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (10, N'AUTO', N'DOBLE CERO', N'PIERRE NODOYUNAa', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzL-oK0Y7dt02k4Phv30gSnHx_1MiL9CV0ToM2WtoSuEDNJ3V45GGt76nIcbsju7RVz2k&usqp=CAU')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (14, N'TRON', N'LEGACY', N'KEVIN FLYNN', N'https://i.blogs.es/cc6b89/ted_5938/1366_2000.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (15, N'LAND ROVER', N'DELANTER', N'CAPITAN NEMO', N'https://static.motor.es/fotos-noticias/2015/06/min652x435/a-la-venta-el-nautilus-el-coche-de-seis-ruedas-del-capitan-nemo-201521872_3_1.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (16, N'LANDSPEEDERrrr', N'X-34', N'LUKE SKYWALKERrrrrr', N'https://pics.imcdb.org/0is849/starwarslandspeeder1.3585.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (17, N'VOLKSWAGEN', N'BEETLE', N'HERBIE', N'https://www.motor.es/fotos-noticias/2013/03/ranking-los-20-mejores-coches-del-cine-y-la-television-del-10-al-1-201313031_8.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (18, N'DODGE', N'CHARGER', N'DOMINIC TORETTO', N'https://cdn.catawiki.net/assets/marketing/stories/storybanners-files/561-162bc729f501ef97d5e8b5cee126309ec79a4635-original.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (22, N'VOLKSWAGEN', N'V32', N'SCOOBY DOO', N'https://i.blogs.es/919b75/650_1000_mystery-machine-by-gas--7-/1366_2000.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (24, N'FORD', N'MUSTANG', N'ELEANOR', N'https://www.eluniversal.com.mx/sites/default/files/main-1.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (25, N'DODGE', N'CHALLENGER R/T', N'DEATH PROOF', N'https://cdn3.whatculture.com/images/2019/06/be0d2e81214a489b-600x338.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (77, N'Homer', N'El Homer', N'Homer Simpson', N'https://i.blogs.es/f41d7b/the-homer-02/450_1000.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (88, N'FORD', N'FALCON', N'MAD MAXA', N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/madmax-interceptor-1542044738.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (92, N'Tesla', N'Model X', N'Laura', N'https://d500.epimg.net/cincodias/imagenes/2021/05/06/motor/1620314670_167195_1620316112_rrss_normal.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (304, N'Ford', N'Ecosports', N'MARTA', N'https://storage.googleapis.com/clicars-storage-prod-public/photos/95/06/04/e07b2a498035b85199ae9e7ecec1f3c9-4809162-788ff3e47733943ab4dc26be8bc196d5dbdb0121-vehicle-gallery-medium.jpg')
INSERT [dbo].[COCHES] ([idcoche], [marca], [modelo], [conductor], [imagen]) VALUES (305, N'F1', N'EL PLAN PUFF', N'Fernando Alonso', N'https://cdn-images.motor.es/image/m/694w/fotos-noticias/2021/12/alpine-f1-plan-fernando-alonso-202183379-1639131282_1.jpg')
GO
INSERT [dbo].[CodigosCupon] ([Id], [Codigo], [Descuento], [Activo], [Usado]) VALUES (1, N'DESCUENTO10', 10, 1, 0)
INSERT [dbo].[CodigosCupon] ([Id], [Codigo], [Descuento], [Activo], [Usado]) VALUES (2, N'DESCUENTO20', 20, 1, 1)
INSERT [dbo].[CodigosCupon] ([Id], [Codigo], [Descuento], [Activo], [Usado]) VALUES (3, N'ENVIOGRATIS', 0, 1, 1)
GO
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (1, N'Sandwich', 3, CAST(N'2022-02-20T02:18:02.090' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (1, N'Mirror', 4, CAST(N'2022-02-20T02:18:02.307' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (1, N'Meilong', 4, CAST(N'2022-02-20T02:18:02.437' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (2, N'Megaminx', 3, CAST(N'2022-02-20T14:32:16.723' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (2, N'Meilong', 4, CAST(N'2022-02-20T14:32:16.890' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (3, N'Fisher cube', 5, CAST(N'2022-02-20T20:29:59.257' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (4, N'Fisher cube', 5, CAST(N'2022-02-20T20:45:23.100' AS DateTime))
INSERT [dbo].[COMPRA] ([id_compra], [nombre_cubo], [precio], [fechapedido]) VALUES (4, N'Lingpo', 3, CAST(N'2022-02-20T20:45:23.277' AS DateTime))
GO
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (1, 1, 1, CAST(N'2022-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (2, 2, 1, CAST(N'2022-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (3, 3, 1, CAST(N'2022-11-19T12:57:36.487' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (4, 4, 4, CAST(N'2022-11-21T09:42:53.840' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (5, 4, 4, CAST(N'2022-11-21T09:44:22.160' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (6, 4, 4, CAST(N'2022-11-21T09:44:31.237' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (7, 4, 1, CAST(N'2022-11-21T09:44:37.517' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (8, 4, 3, CAST(N'2022-11-21T09:45:13.720' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (9, 5, 2, CAST(N'2022-11-21T09:45:18.823' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (10, 5, 6, CAST(N'2022-11-21T09:46:08.400' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (11, 3, 5, CAST(N'2022-11-21T09:47:34.647' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (12, 3, 4, CAST(N'2022-11-21T09:47:42.850' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (13, 4, 3, CAST(N'2022-11-21T09:47:49.343' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (14, 4, 2, CAST(N'2022-11-21T09:48:10.043' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (15, 4, 4, CAST(N'2022-11-21T09:48:29.757' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (16, 4, 3, CAST(N'2022-11-21T09:48:54.383' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (17, 5, 2, CAST(N'2022-11-21T09:48:58.467' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (18, 3, 2, CAST(N'2022-11-21T09:49:02.900' AS DateTime))
INSERT [dbo].[COMPRACUBOS] ([id_pedido], [id_cubo], [id_usuario], [fechapedido]) VALUES (19, 1, 1, CAST(N'2025-04-24T01:34:15.997' AS DateTime))
GO
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (1, N'Kylin Pillow 3x3', N'Yuxin', N'yuxin-kylin-pillow-3x3.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (2, N'Megaminx', N'Megaminx', N'shengshou-legend-3x3-s.jpg', 3)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (3, N'Shield', N'DianSheng', N'diansheng-blade.jpg', 10)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (4, N'Sandwich', N'QiYi MoFangGe', N'17c496ece5b2e99c316777d06ef23eb63b433efa_original.jpeg', 3)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (5, N'Mirror 2x2x2', N'QiYi MoFangGe', N'554080103-0.jpg', 4)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (6, N'Meilong Pyraminx', N'MoYu', N'4545050103-0.jpg', 4)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (7, N'Fisher cube', N'QiYi MoFangGe', N'b8912421b62b2be51f17fd3a9bf39a499f580d5e_original.jpeg', 5)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (8, N'Lingpo', N'MoYu', N'61ZhSt6ZshL._SL1001_.jpg', 3)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (9, N'Skewb', N'ShengShou Cube', N'qiyi-qiheng-skewb.jpg', 5)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (10, N'Yileng Fisher', N'Fisher', N'qiyi-yileng-fisher-negro.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (11, N'Megaminx 13x13x13', N'ShengShou Cube', N'26dfa7e1eca203c545b2d58711ca29ad.jpg', 59)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (12, N'Elephant 2x2x2', N'QiYi MoFangGe', N'yongjun-special-2x2x2-cube-elephant-blue-35135.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (14, N'Mastermorphix 3x3x3', N'Mastermorphix', N'qiyi-mastermorphix.jpg', 5)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (15, N'Weipo WRS', N'MoYu', N'moyu-weipo-wrs-m-2x2.jpg', 4)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (16, N'DaYan TengYun', N'Dayan', N'dayan-tengyun-2x2-plus-m.jpg', 4)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (17, N'Qiyi Wuxia', N'QiYi MoFangGe', N'qiyi-wuxia-2x2-magnetico.jpg', 18)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (18, N'Shengshou 6x6', N'ShengShou Cube', N'shengshou-6x6.jpg', 20)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (19, N'Teraminx', N'ShengShou Cube', N'shengshou-teraminx.jpg', 70)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (20, N'Blue Kylin', N'Yuxin', N'yuxin-4x4-blue-kylin.jpg', 13)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (21, N'HuangLong', N'Yuxin', N'yuxin-9x9-huanglong.jpg', 65)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (22, N'Yuexiao 3x3 Pro', N'Guo Guan', N'guoguan-yuexiao-3x3-pro.jpg', 18)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (23, N'Xinghen', N'Guo Guan', N'guoguan-xinghen-2x2.jpg', 11)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (24, N'Xinghen M', N'Guo Guan', N'guoguan-xinghen-m-2x2.jpg', 17)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (25, N'Mirror', N'Hello Cube', N'hello-cube-mirro-2x2.jpg', 9)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (26, N'Gear Cube', N'Hello Cube', N'helocube-gear-cube-3x3.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (27, N'Cube Flat', N'Hello Cube', N'hello-cube-flat-2x2-.jpg', 8)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (28, N'Bandaged Kit', N'CubeTwist', N'cubetwist-bandaged-kit-3x3.jpg', 16)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (29, N'Oskar Gear', N'CubeTwist', N'cubetwist-oskar-gear-cube-5x5.jpg', 23)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (30, N'Feichang', N'Cyclone Boys', N'cyclone-boys-2x2-feichang.jpg', 5)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (31, N'Speed Cloud', N'Cyclone Boys', N'cyclone-boys-3x3-speed-cloud.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (32, N'Pyraminx', N'Cyclone Boys', N'cyclone-boys-pyraminx.jpg', 10)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (33, N'Feichi', N'Cyclone Boys', N'cyclone-boys-3x3-feichi.jpg', 9)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (34, N'Feilong', N'Cyclone Boys', N'cyclone-boys-feilong-6x6.jpg', 19)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (35, N'Feijue magnetico', N'Cyclone Boys', N'cyclone-boys-feiju-3x3-magnetico.jpg', 11)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (36, N'Skewb magnetico', N'Cyclone Boys', N'cyclone-boys-skewb-magnetico.jpg', 9)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (37, N'Megaminx', N'Cyclone Boys', N'cyclone-boys-megaminx.jpg', 9)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (38, N'Brick cube', N'DianSheng', N'diansheng-brick-cube.jpg', 10)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (39, N'Crazy', N'DianSheng', N'diansheng-3x3x2-crazy.jpg', 9)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (40, N'Cilindrico', N'DianSheng', N'diansheng-3x3-cilindrico.jpg', 7)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (41, N'Blade', N'DianSheng', N'diansheng-blade.jpg', 10)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (42, N'Ufo', N'DianSheng', N'diansheng-ufo.jpg', 8)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (43, N'Corner', N'DianSheng', N'diansheng-6-corner.jpg', 8)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (44, N'Layer Square', N'DianSheng', N'diansheng-2-layer-square1.jpg', 6)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (45, N'Queso', N'DianSheng', N'diansheng-2x2-queso.jpg', 7)
INSERT [dbo].[CUBOS] ([id_cubo], [nombre], [marca], [imagen], [precio]) VALUES (46, N'Cube of Mouse', N'DianSheng', N'diansheng-cube-of-mouse.jpg', 6)
GO
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (10, N'CONTABILIDAD', N'ELCHE')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (20, N'INVESTIGACION', N'MADRID')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (30, N'VENTAS', N'BARCELONA')
INSERT [dbo].[DEPT] ([DEPT_NO], [DNOMBRE], [LOC]) VALUES (40, N'PRODUCCION', N'SALAMANCA')
GO
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (1, N'Sin descuento', 0, 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (2, N'Descuento 20%', 20, 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (3, N'Descuento 30%', 30, 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (4, N'Descuento 50%', 50, 1)
INSERT [dbo].[Descuentos] ([Id], [Nombre], [Valor], [Activo]) VALUES (5, N'Descuento 70%', 70, 1)
GO
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (1, 2, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (2, 2, 5, 1, CAST(4.20 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (3, 3, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (4, 3, 5, 1, CAST(4.20 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (5, 3, 2, 1, CAST(11.59 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (6, 4, 3, 2, CAST(16.79 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (7, 4, 4, 1, CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (8, 5, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (9, 5, 4, 1, CAST(8.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (10, 7, 5, 1, CAST(4.20 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (11, 8, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (12, 9, 2, 1, CAST(11.59 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (13, 10, 1, 1, CAST(12.99 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (14, 11, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (15, 12, 1, 1, CAST(12.99 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (16, 13, 1, 1, CAST(12.99 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (17, 14, 2, 1, CAST(11.59 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (18, 15, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (19, 16, 3, 1, CAST(8.39 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (20, 16, 5, 1, CAST(4.20 AS Decimal(10, 2)))
INSERT [dbo].[DetallesPedido] ([Id], [IdPedido], [IdProducto], [Cantidad], [Total]) VALUES (21, 17, 2, 2, CAST(23.18 AS Decimal(10, 2)))
GO
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (22, 386, N'Cabeza D.', N'Psiquiatría', 152000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (22, 398, N'Best D.', N'Urología', 225000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (19, 435, N'López A.', N'Cardiología', 321000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (22, 453, N'Galo D.', N'Pediatría', 145222)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (45, 522, N'Adams C.', N'Neurología', 520000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (18, 585, N'Miller G.', N'Ginecología', 450111)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (45, 607, N'Chuki P.', N'Pediatría', 223000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (18, 982, N'Cajal R.', N'Cardiología', 151500)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (17, 521, N'Peke O.', N'Neurología', 231000)
INSERT [dbo].[DOCTOR] ([HOSPITAL_COD], [DOCTOR_NO], [APELLIDO], [ESPECIALIDAD], [SALARIO]) VALUES (17, 120, N'Curro F.', N'Urología', 211000)
GO
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7369, N'SANCHA', N'EMPLEADO', 7902, CAST(N'2010-12-17T00:00:00.000' AS DateTime), 104000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7499, N'ARROYO', N'VENDEDOR', 7698, CAST(N'2011-02-22T00:00:00.000' AS DateTime), 208000, 39000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7521, N'SALA', N'VENDEDOR', 7698, CAST(N'2011-02-22T00:00:00.000' AS DateTime), 162500, 65000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7566, N'JIMENEZ', N'DIRECTOR', 7839, CAST(N'2011-04-02T00:00:00.000' AS DateTime), 386763, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7654, N'MARTINEZ', N'VENDEDOR', 7698, CAST(N'2011-09-28T00:00:00.000' AS DateTime), 182000, 182000, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7698, N'NEGRO', N'DIRECTOR', 7839, CAST(N'2011-05-01T00:00:00.000' AS DateTime), 370513, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7782, N'CEREZO', N'DIRECTOR', 7839, CAST(N'2011-06-09T00:00:00.000' AS DateTime), 318513, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7788, N'GIL', N'ANALISTA', 7566, CAST(N'2017-03-30T00:00:00.000' AS DateTime), 390013, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7839, N'REY', N'PRESIDENTE', 0, CAST(N'2011-11-17T00:00:00.000' AS DateTime), 650000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7844, N'TOVAR', N'VENDEDOR', 7698, CAST(N'2011-09-08T00:00:00.000' AS DateTime), 195000, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7876, N'ALONSO', N'EMPLEADO', 7788, CAST(N'2017-05-03T00:00:00.000' AS DateTime), 143000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7900, N'JIMENO', N'EMPLEADO', 7698, CAST(N'2011-12-03T00:00:00.000' AS DateTime), 123500, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7902, N'FERNANDEZ', N'ANALISTA', 7566, CAST(N'2011-12-03T00:00:00.000' AS DateTime), 390013, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7934, N'MUÑOZ', N'EMPLEADO', 7782, CAST(N'2012-06-23T00:00:00.000' AS DateTime), 169000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7919, N'SERRA', N'DIRECTOR', 7839, CAST(N'2013-12-11T00:00:00.000' AS DateTime), 390013, 21000, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7988, N'SANTIUSTE', N'ANALISTA', 7919, CAST(N'2017-02-03T00:00:00.000' AS DateTime), 225013, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7322, N'FORD', N'VENDEDOR', 7919, CAST(N'2012-04-04T00:00:00.000' AS DateTime), 129000, 0, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7614, N'GUTIERREZ', N'ANALISTA', 7919, CAST(N'2006-10-31T00:00:00.000' AS DateTime), 219013, 25000, 20)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7589, N'CASALES', N'EMPLEADO', 7919, CAST(N'2014-11-28T00:00:00.000' AS DateTime), 179000, 0, 10)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7777, N'TORMO', N'VENDEDOR', 7788, CAST(N'2012-09-22T00:00:00.000' AS DateTime), 165900, 0, 30)
INSERT [dbo].[EMP] ([EMP_NO], [APELLIDO], [OFICIO], [DIR], [FECHA_ALT], [SALARIO], [COMISION], [DEPT_NO]) VALUES (7618, N'ALCALA', N'EMPLEADO', 7782, CAST(N'2017-01-14T00:00:00.000' AS DateTime), 119000, 0, 10)
GO
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'10995', N'Laguía M.', N'Goya 20', CAST(N'1956-05-16T00:00:00.000' AS DateTime), N'M', N'280862422')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'14024', N'Fernández M.', N'Recoletos 50', CAST(N'1960-05-21T00:00:00.000' AS DateTime), N'F', N'284991452')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'18004', N'Serrano V.', N'Alcalá 12', CAST(N'1967-06-23T00:00:00.000' AS DateTime), N'F', N'321790059')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'36658', N'Domin S.', N'Mayor 71', CAST(N'1942-01-01T00:00:00.000' AS DateTime), N'M', N'160654471')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'38702', N'Neal R.', N'Orense 11', CAST(N'1940-06-18T00:00:00.000' AS DateTime), N'F', N'380010217')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'39217', N'Cervantes M.', N'Perón 38', CAST(N'1952-02-29T00:00:00.000' AS DateTime), N'M', N'440294390')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'59076', N'Miller B.', N'López de Hoyos 2', CAST(N'1945-09-16T00:00:00.000' AS DateTime), N'F', N'311969044')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'63827', N'Ruiz P.', N'Ezquerdo 103', CAST(N'1980-12-26T00:00:00.000' AS DateTime), N'M', N'100973253')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'64823', N'Fraiser A.', N'Soto 3', CAST(N'1980-07-10T00:00:00.000' AS DateTime), N'F', N'285201776')
INSERT [dbo].[ENFERMO] ([INSCRIPCION], [APELLIDO], [DIRECCION], [FECHA_NAC], [S], [NSS]) VALUES (N'74835', N'Benítez E.', N'Argentina', CAST(N'1957-10-05T00:00:00.000' AS DateTime), N'M', N'154811767')
GO
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (19, N'Provincial', N'O'' Donell 50', N'964-4256', 502)
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (18, N'General', N'Atocha s/n', N'595-3111', 987)
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (22, N'La Paz', N'Castellana 1000', N'923-5411', 412)
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (45, N'San Carlos', N'Ciudad Univeritaria', N'597-1500', 845)
INSERT [dbo].[HOSPITAL] ([HOSPITAL_COD], [NOMBRE], [DIRECCION], [TELEFONO], [NUM_CAMA]) VALUES (17, N'Ruber', N'Juan Bravo, 49', N'91-4027100', 217)
GO
INSERT [dbo].[MetodoPago] ([Id], [Nombre]) VALUES (2, N'PayPal')
INSERT [dbo].[MetodoPago] ([Id], [Nombre]) VALUES (1, N'Tarjeta de Crédito')
GO
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (10995, 19, 6, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (18004, 19, 3, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (14024, 19, 6, 3)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (36658, 18, 4, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (38702, 18, 4, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (39217, 22, 1, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (59076, 22, 6, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (63827, 22, 6, 3)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (64882, 22, 2, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (78955, 45, 2, 1)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (56233, 45, 1, 2)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (59877, 17, 6, 5)
INSERT [dbo].[OCUPACION] ([INSCRIPCION], [HOSPITAL_COD], [SALA_COD], [CAMA]) VALUES (65231, 17, 3, 9)
GO
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (1, 2, CAST(N'2025-04-02T21:35:41.417' AS DateTime), CAST(12.59 AS Decimal(10, 2)), N'Pendiente', 1, N'aaaaaaa', N'eee', N'3', N'aaaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (2, 2, CAST(N'2025-04-02T21:42:00.133' AS DateTime), CAST(12.59 AS Decimal(10, 2)), N'Pendiente', 1, N'bbbbbbb', N'aaaa', N'28330', N'Aranjuez')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (3, 2, CAST(N'2025-04-02T21:44:19.813' AS DateTime), CAST(24.18 AS Decimal(10, 2)), N'Pendiente', 1, N'aaa', N'aaaa', N'28330', N'aaaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (4, 2, CAST(N'2025-04-11T12:09:48.120' AS DateTime), CAST(24.78 AS Decimal(10, 2)), N'Pendiente', 1, N'aaaaaaa', N'dddd', N'28300', N'Aranjuez')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (5, 2, CAST(N'2025-04-12T12:08:06.700' AS DateTime), CAST(16.39 AS Decimal(10, 2)), N'Pendiente', 1, N'aaaaaaa', N'eee', N'28330', N'Aranjuez')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (6, 2, CAST(N'2025-04-12T12:11:32.940' AS DateTime), CAST(8.00 AS Decimal(10, 2)), N'Pendiente', 1, N'aaaaaaa', N'ss', N'22222', N'sss')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (7, 2, CAST(N'2025-04-12T12:12:26.290' AS DateTime), CAST(4.20 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aaa', N'aaa', N'aa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (8, 2, CAST(N'2025-04-12T12:17:09.790' AS DateTime), CAST(8.39 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'aa', N'aa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (9, 2, CAST(N'2025-04-12T12:20:25.737' AS DateTime), CAST(11.59 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'a', N'a')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (10, 2, CAST(N'2025-04-12T12:26:22.917' AS DateTime), CAST(12.99 AS Decimal(10, 2)), N'Pendiente', 1, N'a', N'a', N'a', N'a')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (11, 2, CAST(N'2025-04-12T12:29:08.350' AS DateTime), CAST(8.39 AS Decimal(10, 2)), N'Pendiente', 1, N'a', N'a', N'a', N'a')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (12, 1, CAST(N'2025-04-21T13:15:46.030' AS DateTime), CAST(12.99 AS Decimal(10, 2)), N'Pendiente', 1, N'qaaa', N'aaa', N'23444', N'aaaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (13, 1, CAST(N'2025-04-21T17:35:07.170' AS DateTime), CAST(12.99 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'aa', N'aa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (14, 3, CAST(N'2025-04-25T23:04:44.197' AS DateTime), CAST(11.59 AS Decimal(10, 2)), N'Pendiente', 1, N'aaa', N'aaa', N'28300', N'aaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (15, 9, CAST(N'2025-04-28T01:03:49.180' AS DateTime), CAST(8.39 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'2333', N'aaaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (16, 9, CAST(N'2025-04-28T01:04:06.423' AS DateTime), CAST(12.59 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'2333', N'aaa')
INSERT [dbo].[Pedidos] ([Id], [IdUsuario], [FechaPedido], [Total], [Estado], [IdMetodoPago], [Direccion], [Ciudad], [CodigoPostal], [Poblacion]) VALUES (17, 9, CAST(N'2025-04-28T01:05:03.657' AS DateTime), CAST(23.18 AS Decimal(10, 2)), N'Pendiente', 1, N'aa', N'aa', N'2333', N'aaa')
GO
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (2, N'Barney Stinso', N'https://i.pinimg.com/originals/b9/e2/b3/b9e2b367ec3cdd3db683803f36e40b64.jpg', 7)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (3, N'Dustin Henderso', N'https://phantom-marca.unidadeditorial.es/4f95e661dc8eaa8c0773c1412bd064cc/assets/multimedia/imagenes/2021/02/16/16134683192170.jpg', 3)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (4, N'Oliver Atom', N'https://i.pinimg.com/originals/d6/da/4a/d6da4a6d4a2bc7029845abb5a59f702b.jpg', 7)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (5, N'Benji Price', N'https://media.revistagq.com/photos/5e7212ac9da1570008d603e5/16:9/w_1920,c_limit/benji-price-campeones-serie.jpg', 7)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (6, N'Once', N'https://vader.news/__export/1598037970333/sites/gadgets/img/2020/08/21/once.jpg_691115875.jpg', 3)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (7, N'Sheldon Cooper', N'https://www.bolsamania.com/cine/wp-content/uploads/2015/04/26.jpg', 4)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (9, N'El Mandaloriano', N'https://static.wikia.nocookie.net/esstarwars/images/8/8a/Pascal_as_The_Mando-Advanced_Graphics.png', 2)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (10, N'Baby Yoda', N'https://static2.abc.es/media/play/2020/11/13/baby-yoda-kdIH--620x349@abc.jpg', 2)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (12, N'Daenerys Targarye', N'https://assets.afcdn.com/story/20150813/736968_w980h638c1cx494cy293.jpg', 1)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (14, N'Tyrion Lannister', N'https://vader.news/__export/1593841129501/sites/gadgets/img/2020/07/04/tyrion_lannister_game_of_thrones.jpg_1255757245.jpg', 1)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (15, N'Pablo Escobar', N'https://api.time.com/wp-content/uploads/2016/09/narcos_season_2.jpg', 4)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (17, N'Agente Peña', N'https://cadenaser00.epimg.net/ser/imagenes/2017/09/28/television/1506579243_820899_1506581069_noticia_normal.jpg', 4)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (18, N'Patriota', N'https://e00-elmundo.uecdn.es/blogs/elmundo/asesinoenserie/imagenes_posts/2019/09/10/200156_540x309.jpg', 5)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (19, N'Luz Estelar', N'https://arsrolica.files.wordpress.com/2019/08/starlight.jpg', 5)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (20, N'Tokio', N'https://images.clarin.com/2017/12/20/SyJOzIdzG_1256x620.jpg', 9)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (21, N'Berli', N'https://tvserieswelove.com/wp-content/uploads/2022/09/Berlin-Money-Heist-1200-1-870x500.jpg', 9)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (22, N'Penny', N'https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/noticias-cine/the-big-bang-theory-y-el-secreto-del-apellido-de-penny/109791953-1-esl-ES/The-Big-Bang-Theory-y-el-secreto-del-apellido-de-Penny.jpg', 6)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (23, N'Robin Scherbatsky', N'https://i.pinimg.com/originals/00/29/68/0029683aad5d3c861b621dc1036113af.png', 8)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (24, N'Fry', N'https://i.pinimg.com/236x/19/d2/97/19d2974d5270ffb5b70ce1421bc5d33e--futurama-slug.jpg', 10)
INSERT [dbo].[PERSONAJES] ([IDPERSONAJE], [PERSONAJE], [IMAGEN], [IDSERIE]) VALUES (25, N'Bender', N'https://www.pintzap.com/storage/img/memegenerator/templates/bender.jpg', 10)
GO
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (22, 6, 1009, N'Higueras D.', N'Enfermera', N'T', 200500)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (45, 4, 1280, N'Amigo R.', N'Interino', N'N', 221000)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (19, 6, 3106, N'Hernández J.', N'Enfermero', N'T', 275000)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (19, 6, 3754, N'Díaz B.', N'Enfermera', N'T', 226200)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (22, 1, 6065, N'Rivera G.', N'Enfermera', N'N', 162600)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (18, 4, 6357, N'Karplus W.', N'Interino', N'T', 337900)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (22, 1, 7379, N'Carlos R.', N'Enfermera', N'T', 211900)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (22, 6, 8422, N'Bocina G.', N'Enfermero', N'M', 183800)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (45, 1, 8526, N'Frank H.', N'Enfermera', N'T', 252200)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (22, 2, 9901, N'Núñez C.', N'Interino', N'M', 221000)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (17, 6, 8521, N'Palomo C.', N'Interino', N'M', 219000)
INSERT [dbo].[PLANTILLA] ([HOSPITAL_COD], [SALA_COD], [EMPLEADO_NO], [APELLIDO], [FUNCION], [T], [SALARIO]) VALUES (17, 1, 8520, N'Cortes V.', N'Enfermera', N'N', 189500)
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (1, N'Vela de Lavanda', N'Vela aromática con fragancia de lavanda, perfecta para relajación.', CAST(12.99 AS Decimal(10, 2)), 50, 1, 1, N'velaLavanda.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (2, N'Vela de Cera de Soja', N'Vela ecológica hecha de cera de soja con olor a algodón, ideal para un ambiente natural.', CAST(14.49 AS Decimal(10, 2)), 30, 1, 2, N'fondo1.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (3, N'Vela de Canela y Naranja', N'Vela con mezcla de aromas de canela y naranja, para un ambiente cálido.', CAST(11.99 AS Decimal(10, 2)), 20, 1, 3, N'velasCanela.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (4, N'Vela de Rosas', N'Vela con esencia de rosas frescas para un ambiente floral y delicado.', CAST(15.99 AS Decimal(10, 2)), 40, 1, 4, N'velabonitas.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (5, N'Vela de Coco y Vainilla', N'Vela con fragancia tropical de coco y vainilla, perfecta para relajarse.', CAST(13.99 AS Decimal(10, 2)), 25, 1, 5, N'vela1.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (6, N'Vela El David', N'Vela artesanal con la forma de la escultura clásica "El David" de Miguel Ángel, hecha para los amantes del arte.', CAST(6.00 AS Decimal(10, 2)), 15, 1, 1, N'velaDavid.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (7, N'Vela Columna', N'Vela artesanal en forma de columna, elegante y minimalista, ideal para decorar cualquier espacio con un toque clásico y sofisticado.', CAST(6.00 AS Decimal(10, 2)), 15, 1, 1, N'velasColumnaRosas.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (8, N'Vela Knot', N'Vela artesanal con diseño de nudo, única y moderna, ideal para añadir un toque decorativo y sofisticado a cualquier espacio.', CAST(7.50 AS Decimal(10, 2)), 15, 1, 1, N'velaKnot.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (9, N'Vela Cilindro', N'Vela artesanal gruesa en forma de cilindro, perfecta para una decoración elegante y acogedora.', CAST(6.00 AS Decimal(10, 2)), 15, 1, 1, N'velasGrandes.jpg')
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio], [Stock], [IdCategoria], [IdDescuento], [Imagen]) VALUES (10, N'Vela Bubble', N'Vela artesanal con diseño de cubo y burbujas, moderna y decorativa, ideal para darle un toque único a cualquier espacio.', CAST(6.00 AS Decimal(10, 2)), 15, 1, 1, N'velaBubble.jpg')
GO
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Nombre]) VALUES (2, N'Cliente')
GO
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (19, 3, N'Cuidados Intensivos', 21)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (19, 6, N'Psiquiátricos', 67)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (18, 3, N'Cuidados Intensivos', 10)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (18, 4, N'Cardiología', 53)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (22, 1, N'Recuperación', 10)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (22, 6, N'Psiquiátricos', 118)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (22, 2, N'Maternidad', 34)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (45, 4, N'Cardiología', 55)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (45, 1, N'Recuperación', 15)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (45, 2, N'Maternidad', 24)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (17, 6, N'Psiquiátricos', 220)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (17, 1, N'Recuperación', 20)
INSERT [dbo].[SALA] ([HOSPITAL_COD], [SALA_COD], [NOMBRE], [NUM_CAMA]) VALUES (17, 2, N'Maternidad', 21)
GO
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (1, N'Juego de tronos', N'https://cadenaser00.epimg.net/ser/imagenes/2019/05/23/television/1558591913_020782_1558595107_noticia_normal.jpg', 2011)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (2, N'The Mandaloria', N'https://images-na.ssl-images-amazon.com/images/I/71bBDuXUvOL.jpg', 2019)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (3, N'Stranger Things', N'https://th.bing.com/th/id/R.a4d953164c6d3c3f174cac35deaa8d25?rik=IfEQFIpC36Zx0w&riu=http%3a%2f%2fwww.slashfilm.com%2fwp%2fwp-content%2fimages%2fstranger-things-1.jpg&ehk=4Ze%2bL3r5gM%2b7GgdQywfHdjFI%2fUJPBMgU6fBiFVFUwwo%3d&risl=1&pid=ImgRaw&r=0', 2016)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (4, N'Narcos', N'https://www.espanolavanzado.com/images/articles/spanish/narcos.jpg', 2015)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (5, N'The Boys', N'https://as01.epimg.net/epik/imagenes/2020/09/14/portada/1600093038_124653_1600093183_noticia_normal_recorte1.jpg', 2019)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (6, N'The Big Bang Theory', N'https://www.camaracivica.com/wp-content/uploads/2016/12/The-Big-Bang-Theory.jpg', 2007)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (7, N'Campeones: Oliver y Benji', N'https://www.dibujos-animados.net/wp-content/uploads/2016/11/serie-oliver-benji-campeones.jpg', 1983)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (8, N'Como conocí a vuestra madre', N'https://www.tendenciashoy.com/wp-content/uploads/2021/04/Como-conoci%CC%81-a-vuestra-madre.jpg', 2005)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (9, N'La casa de papel', N'https://s1.eestatic.com/2019/07/23/cultura/series/Netflix-Series-Ursula_Corbero-Series_415970383_130773402_1024x576.jpg', 2017)
INSERT [dbo].[SERIES] ([IDSERIE], [NOMBRE], [IMAGEN], [ANYO]) VALUES (10, N'Futurama', N'https://i.blogs.es/5bcb58/futurama/1366_2000.jpeg', 1999)
GO
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (1, N'Admin', NULL, N'sofia.villarejo@tajamar365.com', N'$2a$11$vcdF.maRk5//DioDmlvpgOAOnqwefgzcCt7eaK0dFNWxAGJEmSl.O', 1, NULL, CAST(N'2025-03-12T23:57:56.450' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (2, N'Carolina', N'Penalba', N'carolina@gmail.com', N'$2a$11$7gKa8T6JkoL8ohlF.BTxy.FQJhnGM7Ia.bVrx0CypFfR0VaNEqzsm', 2, N'08b91d64-8337-40ff-ba98-1da2cf413809.jpg', CAST(N'2025-03-13T09:06:52.463' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (3, N'sofiaaa', N'Villarejo', N'sofia@gmail.com', N'$2a$11$VnEZfJG37CYGCoCzjfaWdONP4HvUI6DRg9PtUAF3QqtUDbTCxDrnG', 2, N'userprofile.jpg', CAST(N'2025-03-13T10:48:07.170' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (4, N'w', N'w', N'w@gmail.com', N'$2a$11$UUcC/uIEeGL5gf8EHUx7QeRlJcqoktLdoc9Q54g4KPNfsI0pai2qS', 2, N'userprofile.jpg', CAST(N'2025-04-21T19:39:33.367' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (5, N'd', N'd', N'd@gmail.com', N'$2a$11$gfUDoaSQ2xEJA1ZJCwIdSeSw72qEj.6aTTFIG5RSqCRIgUDD4vyPC', 2, N'userprofile.jpg', CAST(N'2025-04-21T19:41:24.017' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (6, N'a', N'a', N'a@gmail.com', N'$2a$11$RUKaHTkPnTHoKLlAGk8XxuZFpHZMAoHoOQunO5KQJvK3.NMqok6IS', 2, N'', CAST(N'2025-04-25T17:02:28.197' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (7, N'Sofía', N'Villarejo', N'r@gmail.com', N'$2a$11$snal5vx9mQMLse60RLaynOCf2SejjOjgL6hfCzzzCygGduG60N9ee', 2, N'', CAST(N'2025-04-27T22:45:46.877' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (8, N'rodri', N'aaa', N'rodri@gmail.com', N'$2a$11$BSyX0WSyZ3ac3X3c1McevO/oDW82adRln69L1ZIhCRWvhFq3f.tOW', 2, N'', CAST(N'2025-04-27T23:33:10.037' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (9, N'ooo', N'oooo', N'o@gmail.com', N'$2a$11$a2ekafS9HeCw5oJ4Lkpg/uKaa7aAUThNfQ0umvuUZsAPK7l1YFI0y', 2, N'ad97370e-476e-473b-b183-fc289d874303.jpg', CAST(N'2025-04-28T00:02:38.110' AS DateTime))
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Apellidos], [Email], [Passwd], [IdRol], [Imagen], [CreatedAt]) VALUES (10, N'ii', N'iii', N'i@gmail.com', N'$2a$11$YuLFGHb0GzSIsv0iCYH1cetJ/iA8O9yDm0sHZ8533p8UiKx8efOSa', 2, N'userprofile.jpg', CAST(N'2025-04-27T23:52:17.877' AS DateTime))
GO
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (1, N'LEONARD', N'leonard@gmail.com', N'12345', N'leonard.jpg')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (2, N'SHELDON', N'sheldon@gmail.com', N'12345', N'sheldon.webp')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (3, N'PENNY', N'penny@gmail.com', N'12345', N'penny.jpg')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (4, N'HOWARD', N'howard@gmail.com', N'12345', N'howard.jpg')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (5, N'RAJESH', N'rajesh@gmail.com', N'12345', N'rajesh.jpg')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (6, N'STUART', N'stuart@gmail.com', N'12345', N'stuart.jpg')
INSERT [dbo].[USUARIOSCUBO] ([ID_USUARIO], [NOMBRE], [EMAIL], [PASS], [imagen]) VALUES (7, N'aaa', N'a@gmail.com', N'12345', N'')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__75E3EFCFB6AA9058]    Script Date: 28/04/2025 2:39:58 ******/
ALTER TABLE [dbo].[Categorias] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CodigosC__06370DACF0B43525]    Script Date: 28/04/2025 2:39:58 ******/
ALTER TABLE [dbo].[CodigosCupon] ADD UNIQUE NONCLUSTERED 
(
	[Codigo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MetodoPa__75E3EFCF17C1D538]    Script Date: 28/04/2025 2:39:58 ******/
ALTER TABLE [dbo].[MetodoPago] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__75E3EFCFD30FDFB7]    Script Date: 28/04/2025 2:39:58 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__A9D105348151D2C6]    Script Date: 28/04/2025 2:39:58 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CodigosCupon] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CodigosCupon] ADD  DEFAULT ((0)) FOR [Usado]
GO
ALTER TABLE [dbo].[Descuentos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((2)) FOR [IdRol]
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
/****** Object:  StoredProcedure [dbo].[SP_DOCTORES_HOSPITAL]    Script Date: 28/04/2025 2:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_DOCTORES_HOSPITAL]
(@nombre nvarchar(50))
as 
	select DOCTOR.APELLIDO, DOCTOR.ESPECIALIDAD, DOCTOR.SALARIO, HOSPITAL.NOMBRE, HOSPITAL.DIRECCION from DOCTOR
	inner join HOSPITAL
	on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD where HOSPITAL.NOMBRE = @nombre
GO
/****** Object:  StoredProcedure [dbo].[SP_EMPLEADOS_DEPARTAMENTOS]    Script Date: 28/04/2025 2:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_EMPLEADOS_DEPARTAMENTOS]
(@nombre nvarchar(50))
as 
	select EMP.APELLIDO, EMP.OFICIO, EMP.SALARIO, DEPT.DNOMBRE, DEPT.LOC from EMP
	inner join DEPT
	on EMP.DEPT_NO = DEPT.DEPT_NO where DEPT.DNOMBRE = @nombre
GO
/****** Object:  StoredProcedure [dbo].[SP_INCREMENTAR_SALARIO_EMP]    Script Date: 28/04/2025 2:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_INCREMENTAR_SALARIO_EMP]
(@apellido nvarchar(50), @incremento int)
as 
	update EMP set SALARIO = SALARIO + @incremento
	where APELLIDO = @apellido
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PRODUCTO]    Script Date: 28/04/2025 2:39:58 ******/
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
ALTER DATABASE [AZURETAJAMAR] SET  READ_WRITE 
GO

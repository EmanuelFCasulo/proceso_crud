USE [master]
GO
/****** Object:  Database [BD_CRUD_CURSO]    Script Date: 12/8/2023 6:30:46 PM ******/
CREATE DATABASE [BD_CRUD_CURSO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_CRUD_Curso', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLLABO\MSSQL\DATA\BD_CRUD_Curso.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_CRUD_Curso_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLLABO\MSSQL\DATA\BD_CRUD_Curso_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_CRUD_CURSO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_CRUD_CURSO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET  MULTI_USER 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_CRUD_CURSO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_CRUD_CURSO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_CRUD_CURSO] SET QUERY_STORE = ON
GO
ALTER DATABASE [BD_CRUD_CURSO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BD_CRUD_CURSO]
GO
/****** Object:  Table [dbo].[TB_CATEGORIAS]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CATEGORIAS](
	[cod_cat] [int] IDENTITY(1,1) NOT NULL,
	[descrip_cat] [varchar](20) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[cod_cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MEDIDAS]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MEDIDAS](
	[codigo_med] [int] IDENTITY(1,1) NOT NULL,
	[descrip_med] [varchar](20) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_MEDIDAS] PRIMARY KEY CLUSTERED 
(
	[codigo_med] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCTOS]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCTOS](
	[cod_prod] [int] IDENTITY(1,1) NOT NULL,
	[descrip_prod] [varchar](80) NULL,
	[marca_prod] [varchar](30) NULL,
	[codigo_me] [int] NULL,
	[codigo_ca] [int] NULL,
	[stock_actual] [numeric](18, 2) NULL,
	[fecha_creacion] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[cod_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_MEDIDAS] FOREIGN KEY([codigo_me])
REFERENCES [dbo].[TB_MEDIDAS] ([codigo_med])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_MEDIDAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTIVO_PROD]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_ACTIVO_PROD]
@nCodigo_Prod int,
@bEstado_activo bit
as
	update TB_PRODUCTOS set activo = @bEstado_activo 
						where cod_prod = @nCodigo_Prod;
GO
/****** Object:  StoredProcedure [dbo].[SP_GUARDAR_PROC]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_GUARDAR_PROC]
@opcion int=1, -- 1 nuevo registro / 2 actualizar registro
@nCodigo_pr int = 0, 
@cDescrip_prod varchar(80),
@cMarca_prod varchar(30),
@nCod_med int,
@nCod_cat int,
@nStock_actual numeric(18,2)
AS
	if @opcion = 1 -- nuevo registro
		begin
			insert into TB_PRODUCTOS (descrip_prod,
									  marca_prod,
									  codigo_me,
									  codigo_ca,
									  stock_actual,
									  fecha_creacion,
									  activo)
							   values(@cDescrip_prod,
									  @cMarca_prod,
									  @nCod_med,
									  @nCod_cat,
									  @nStock_actual,
									  GETDATE(),
									  1);
		end;
	else --actualizar registro
		begin
			update TB_PRODUCTOS set descrip_prod = descrip_prod,
									marca_prod = marca_prod,
									codigo_me = @nCod_med,
									codigo_ca = @nCod_cat,
									stock_actual = @nStock_actual
							where cod_prod = @nCodigo_pr;				
		end;
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_CAT]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_LISTADO_CAT]
AS
	SELECT descrip_cat,
			cod_cat
	FROM TB_CATEGORIAS
	WHERE ACTIVO = 1;
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_MED]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_LISTADO_MED]
AS
	SELECT DESCRIP_MED,
			CODIGO_MED
	FROM TB_MEDIDAS
	WHERE ACTIVO = 1;
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTADO_PROD]    Script Date: 12/8/2023 6:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_LISTADO_PROD]
@cTexto varchar(80)=''
AS
	SELECT a.cod_prod,
			a.descrip_prod,
			a.marca_prod,
			c.descrip_cat,
			m.descrip_med,
			a.stock_actual,
			a.codigo_me,
			a.codigo_ca
	FROM TB_PRODUCTOS a
	INNER JOIN TB_CATEGORIAS c on a.codigo_ca = c.cod_cat
	INNER JOIN TB_MEDIDAS m on a.codigo_me = m.codigo_med
	WHERE a.ACTIVO = 1 and 
		  upper(trim(a.descrip_prod) + trim(a.marca_prod)) like '%'+upper(trim(@cTexto))+'%'
		  order by a.cod_prod;
GO
USE [master]
GO
ALTER DATABASE [BD_CRUD_CURSO] SET  READ_WRITE 
GO

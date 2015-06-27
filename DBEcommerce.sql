USE [DBEcommerce]
GO
/****** Object:  Table [dbo].[CheckDataComments]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckDataComments](
	[CheckDataCommentID] [int] IDENTITY(1,1) NOT NULL,
	[WordRude] [nvarchar](200) NULL,
 CONSTRAINT [PK_CheckDataComments] PRIMARY KEY CLUSTERED 
(
	[CheckDataCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CheckDataComments] ON
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (1, N'phản động')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (2, N'Việt Tân')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (3, N'chống phá')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (4, N'cách mạng')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (5, N'chó')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (6, N'quỷ')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (7, N'khốn')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (8, N'tân việt')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (9, N'tư sản')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (10, N'tư bản')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (11, N'việt nam cộng hòa')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (12, N'VNCH')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (13, N'đàn áp')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (14, N'mày')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (15, N'thằng')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (16, N'con')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (17, N'fuck')
INSERT [dbo].[CheckDataComments] ([CheckDataCommentID], [WordRude]) VALUES (18, N'gái')
SET IDENTITY_INSERT [dbo].[CheckDataComments] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Description] [ntext] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentId]) VALUES (1, N'Phổ Thông', N'', 0)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentId]) VALUES (2, N'Trung Cấp', N'', 0)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [ParentId]) VALUES (3, N'Cao Cấp', N'', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Adverties]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adverties](
	[AdvertiseID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[LinkImage] [varchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Adverties] PRIMARY KEY CLUSTERED 
(
	[AdvertiseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Adverties] ON
INSERT [dbo].[Adverties] ([AdvertiseID], [CompanyName], [Address], [LinkImage], [StartDate], [EndDate], [Email], [Phone], [Type]) VALUES (1, N'CoCaCoLa', N'TPHCM', N'flowers_33.gif', CAST(0x0000A30F00000000 AS DateTime), CAST(0x0000A3C600000000 AS DateTime), N'coca@gmail.com', N'0988889999', 0)
INSERT [dbo].[Adverties] ([AdvertiseID], [CompanyName], [Address], [LinkImage], [StartDate], [EndDate], [Email], [Phone], [Type]) VALUES (2, N'ShopChungMinh', N'TPHCM', N'giay.jpg', CAST(0x0000A30F00000000 AS DateTime), CAST(0x0000A3C600000000 AS DateTime), N'chungminh@gmail.com', N'0911112222', 0)
INSERT [dbo].[Adverties] ([AdvertiseID], [CompanyName], [Address], [LinkImage], [StartDate], [EndDate], [Email], [Phone], [Type]) VALUES (3, N'Adidas', N'TPHCM', N'kiem.jpg', CAST(0x0000A30F00000000 AS DateTime), CAST(0x0000A3C600000000 AS DateTime), N'adidas@gmail.com', N'0823456789', 1)
SET IDENTITY_INSERT [dbo].[Adverties] OFF
/****** Object:  Table [dbo].[Suppliers]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Address] [nvarchar](60) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (1, N'SamSung', N'Hàn Quốc')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (2, N'Apple', N'Mỹ')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (3, N'Nokia', N'Phần Lan')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (4, N'HTC', N'Đài Loan')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (5, N'LG', N'Nhật Bản')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (6, N'Sony', N'Nhật Bản')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (7, N'Acer', N'Mỹ')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (8, N'Asus', N'Mỹ')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (9, N'TLC', N'Mỹ')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address]) VALUES (10, N'Motorola', N'Mỹ')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
/****** Object:  Table [dbo].[Sliders]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sliders](
	[SilderID] [int] IDENTITY(1,1) NOT NULL,
	[LinkImage] [varchar](100) NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[SilderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON
INSERT [dbo].[Sliders] ([SilderID], [LinkImage], [Title]) VALUES (1, N'girl1.jpg', N'Iphone 6S đã xuất hiện')
INSERT [dbo].[Sliders] ([SilderID], [LinkImage], [Title]) VALUES (2, N'girl2.jpg', N'Iphone 4S Gía Cực Sốc')
INSERT [dbo].[Sliders] ([SilderID], [LinkImage], [Title]) VALUES (3, N'girl3.jpg', N'Hãy Mua IPhone ngay hôm nay')
INSERT [dbo].[Sliders] ([SilderID], [LinkImage], [Title]) VALUES (4, N'girl1.jpg', N'IPhone 4S giá giảm mạnh')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'NhanVien')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'KhachHang')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitPrice] [money] NULL,
	[Unit] [nvarchar](15) NULL,
	[LinkImage] [nvarchar](100) NULL,
	[Discount] [float] NULL,
	[NumViews] [int] NULL,
	[DateReceived] [datetime] NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Details] [nvarchar](max) NULL,
	[NumInventory] [int] NULL,
	[LinkLargeImage] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (1, N'NoKia Asha 500 Dual', 1350000.0000, N'VNĐ', N'nokia-asha-500-dual-sim-300-nowatermark-120x120.jpg', NULL, 1, CAST(0x0000A4B900000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-asha-500-dual-sim-slider-2sim.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (2, N'NoKia Asha 501 Dual', 1190000.0000, N'VNĐ', N'Nokia-Asha-501-Dual-Sim-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 3.0", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~ 64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Nokia-Asha-501-Dual-Sim-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (3, N'NoKia Asha 503 Dual', 1900000.0000, N'VNĐ', N'nokia-asha-503-dual-sim-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 3.0", 240 x 320 Pixels_CPU~1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.2_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-asha-503-dual-sim-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (4, N'NoKia Lumia 520', 2790000.0000, N'VNĐ', N'Nokia-Lumia-520-m.jpg', NULL, 1, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~WVGA, 4.0_CPU~Qualcomm MSM8227, 2 nhân, 1 GHz_RAM~512 MB_Hệ điều hành~Windows Phone 8_Sim~1 Sim_Camera~5.0 MP, Quay phim HD 720p@30fps_Bộ nhớ trong~8 GB_Thẻ nhớ ngoài~64 GB_Dung lượng PIN~2000 mAh', 10, N'Nokia-Lumia-520-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (5, N'NoKia Lumia 525', 2990000.0000, N'VNĐ', N'nokia-lumia-525-300-yellow-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-525-300-yellow-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (6, N'NoKia Lumia 625', 4990000.0000, N'VNĐ', N'nokia-lumia-625-300-nowatermark-120x120.jpg', NULL, 2, CAST(0x0000A47C00000000 AS DateTime), 3, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-625-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (7, N'NoKia Lumia 720', 6690000.0000, N'VNĐ', N'nokia-lumia-720-1-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-720-1-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (8, N'NoKia Lumia 925', 8990000.0000, N'VNĐ', N'nokia-lumia-925-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-925-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (9, N'NoKia Lumia 1320', 7490000.0000, N'VNĐ', N'nokia-lumia-1320-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-1320-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (10, N'NoKia Lumia 1520', 12990000.0000, N'VNĐ', N'nokia-lumia-1520-red-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-lumia-1520-red-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (11, N'NoKia X', 2550000.0000, N'VNĐ', N'nokia-x-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-x-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (12, N'NoKia Asha 210 Dual', 1650000.0000, N'VNĐ', N'nokia-asha-210-dual-white-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-asha-210-dual-white-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (13, N'NoKia 515', 3500000.0000, N'VNĐ', N'nokia-515-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-515-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (14, N'NoKia 301', 1700000.0000, N'VNĐ', N'nokia-301-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-301-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (15, N'NoKia 220', 1000000.0000, N'VNĐ', N'nokia-220-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAhMàn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-220-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (16, N'NoKia 206', 1300000.0000, N'VNĐ', N'Nokia-206-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Nokia-206-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (17, N'NoKia 112', 930000.0000, N'VNĐ', N'Nokia-112-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Nokia-112-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (18, N'NoKia 110', 890000.0000, N'VNĐ', N'Nokia-110-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Nokia-110-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (19, N'NoKia 109', 850000.0000, N'VNĐ', N'Nokia-109-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Nokia-109-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (20, N'NoKia 108', 740000.0000, N'VNĐ', N'nokia-108-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-108-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (21, N'NoKia 107', 650000.0000, N'VNĐ', N'nokia-107-dual-sim-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-106-nokia-107-60x50.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (22, N'NoKia 106', 500000.0000, N'VNĐ', N'nokia-106-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-106-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (23, N'NoKia 105', 420000.0000, N'VNĐ', N'nokia-105-300-1-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 3, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'nokia-105-300-1-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (24, N'Iphone 5S 32GB', 1949000.0000, N'VNĐ', N'iphone-5s-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-5s-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (25, N'Iphone 5 16GB', 1499000.0000, N'VNĐ', N'iPhone-5-16GB-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iPhone-5-16gb-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (26, N'Iphone 5 64GB', 15490000.0000, N'VNĐ', N'iphone-5-64gb-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-5-64gb-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (27, N'Iphone 5S 64GB', 21890000.0000, N'VNĐ', N'iphone-5s-64gb-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-5s-64gb-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (28, N'Iphone 4 8GB', 6980000.0000, N'VNĐ', N'iphone-4-8gb-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-4s-8gb-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (29, N'Iphone 4S 8GB', 9990000.0000, N'VNĐ', N'iphone-4s-8gb-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-4s-8gb-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (30, N'Iphone 3G', 6500000.0000, N'VNĐ', N'iphone_3G.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone_3GS_b.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (31, N'Iphone 3GS 8GB', 7500000.0000, N'VNĐ', N'iPhone-3GS-8GB-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone-5c-300-nowatermark-120x120.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (32, N'Iphone 5C 32GB', 11990000.0000, N'VNĐ', N'iphone-5c-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 2, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'iphone_3G_b.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (33, N'HTC Desire 501 Dual Sim', 4999999.0000, N'VNĐ', N'htc-desire-501-dual-sim-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'HTC-Desire-501-Dual-Sim-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (34, N'HTC 8X', 4450550.0000, N'VNĐ', N'htc-8x-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'htc-8x-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (35, N'HTC One M8', 16790000.0000, N'VNĐ', N'htc-one-m8-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'HTC-One-M8-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (36, N'HTC One Max', 12990000.0000, N'VNĐ', N'htc-one-max-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'htc-one-max-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (37, N'HTC One Mini', 9690000.0000, N'VNĐ', N'htc-one-mini-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'htc-one-mini-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (38, N'HTC One 16GB', 11900000.0000, N'VNĐ', N'htc-one-16gb-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 4, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'htc-one-16gb-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (39, N'Samsung Galaxy Note 3', 16790000.0000, N'VNĐ', N'samsung-galaxy-note-3-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-galaxy-note-3-neo-ft-1-1-324×194.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (40, N'Samsung Galaxy S4', 11990000.0000, N'VNĐ', N'Samsung-Galaxy-S4-I9500-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Samsung-Galaxy-S4-I9500-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (41, N'Samsung Galaxy Grand 2', 8490000.0000, N'VNĐ', N'samsung-galaxy-grand-2-g7102-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-galaxy-grand-2-g7102-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (42, N'Samsung Galaxy Win', 5690000.0000, N'VNĐ', N'Samsung-Galaxy-Win-I8552-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Samsung-Galaxy-Win-I8552-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (43, N'Samsung Galaxy Core Duos', 4990000.0000, N'VNĐ', N'samsung-galaxy-core-duos-i8262-300-3-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-galaxy-core-duos-i8262-300-3-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (44, N'Samsung Galaxy Y', 1690000.0000, N'VNĐ', N'samsung-galaxy-y-s5360-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-galaxy-y-s5360-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (45, N'Samsung Rex 60 C3312R', 1190000.0000, N'VNĐ', N'samsung-rex-60-C3312R-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Samsung-C3312R-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (46, N'Samsung C3520', 1090000.0000, N'VNĐ', N'Samsung-C3520-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Samsung-C3520-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (47, N'Samsung Caramel DS E1272', 590000.0000, N'VNĐ', N'samsung-e1272-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-e1272-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (48, N'Samsung E1200', 350000.0000, N'VNĐ', N'samsung-e1200-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 1, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'samsung-e1200-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (49, N'Samsung Galaxy S3', 8490000.0000, N'VNĐ', N'Samsung-Galaxy-S3-I9300-m.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 1, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Samsung-Galaxy-S3-I9300-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (50, N'Sony Xperia T2 Ultra', 9990000.0000, N'VNĐ', N'sony-xperia-t2-ultra-300-nowatermark-120x120.jpg', NULL, 1, CAST(0x0000A47C00000000 AS DateTime), 6, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'sony-xperia-t2-ultra-300-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (51, N'Sony Xperia M', 4990000.0000, N'VNĐ', N'sony-xperia-m-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 6, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'sony-xperia-m-nowatermark-300x300.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (52, N'Sony Xperia E1', 3190000.0000, N'VNĐ', N'sony-xperia-e1-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 6, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Sony-Xperia-E1-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (53, N'Sony Xperia E', 2390000.0000, N'VNĐ', N'Sony-Xperia-E-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 6, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Sony-Xperia-E-l.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (54, N'Sony Xperia M2', 2590000.0000, N'VNĐ', N'sony-xpreia-m2-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 6, 2, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'Xperia-M2-355x220-note.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (55, N'LG G Flex', 15990000.0000, N'VNĐ', N'lg-g-flex-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 5, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'LG-G-Flex-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (56, N'LG G Pro 2', 13990000.0000, N'VNĐ', N'lg-g-pro-2-d837-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 5, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'LG-G-Pro-2-kich-355x220-thuoc.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [UnitPrice], [Unit], [LinkImage], [Discount], [NumViews], [DateReceived], [SupplierID], [CategoryID], [Details], [NumInventory], [LinkLargeImage]) VALUES (57, N'LG G2 Mini', 7390000.0000, N'VNĐ', N'lg-g2-mini-d620-300-nowatermark-120x120.jpg', NULL, 0, CAST(0x0000A47C00000000 AS DateTime), 5, 3, N'Màn hình~QVGA, 2.8", 240 x 320 Pixels_CPU~1 nhân, 1 GHz_RAM~64 MB_Hệ điều hành~Nokia Asha software platform 1.0_Sim~2 SIM 2 sóng_Camera~3.2 MP, Quay phim QVGA@15fps_Bộ nhớ trong~128 MB_Thẻ nhớ ngoài~32 GB_Dung lượng PIN~1200 mAh', 10, N'LG-G2-Mini-kich-355x220-thuoc.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[Accounts]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[RoleID] [int] NULL,
	[Enabled] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON
INSERT [dbo].[Accounts] ([AccountID], [UserName], [PassWord], [RoleID], [Enabled]) VALUES (1, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [PassWord], [RoleID], [Enabled]) VALUES (2, N'ngoctrinh', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [PassWord], [RoleID], [Enabled]) VALUES (4, N'an12ck2@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 3, 1)
INSERT [dbo].[Accounts] ([AccountID], [UserName], [PassWord], [RoleID], [Enabled]) VALUES (5, N'ngan2324@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 3, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](30) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Sex] [nvarchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FullName], [BirthDate], [Sex], [Address], [Phone], [AccountID]) VALUES (1, N'Ngọc Trinh', CAST(0x0000867A00000000 AS DateTime), N'Nữ', N'112 Mã Lò Q.6', N'0969696969', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Customers]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](10) NULL,
	[BirthDay] [datetime] NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CustomerID], [AccountID], [FullName], [Sex], [BirthDay], [Address], [Email]) VALUES (2, 2, N'Đỗ Thị Hảo', N'Nữ', CAST(0x0000836200000000 AS DateTime), N'Lê Đức Thọ', N'haonguyen@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [AccountID], [FullName], [Sex], [BirthDay], [Address], [Email]) VALUES (3, 4, N'Nguyễn Trọng Ân', N'Nam', CAST(0x0000859A00000000 AS DateTime), N'Nguyễn Văn Lượng', N'an12ck2@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [AccountID], [FullName], [Sex], [BirthDay], [Address], [Email]) VALUES (4, 5, N'Nguyễn Trọng Ân', N'Nam', CAST(0x0000859A00000000 AS DateTime), N'', N'ngan2324@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
/****** Object:  Table [dbo].[Comments]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[NameUserComment] [varchar](50) NULL,
	[Contents] [nvarchar](150) NULL,
	[DateComment] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReplyComments]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReplyComments](
	[ReplyCommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NULL,
	[NameUserReply] [varchar](50) NULL,
	[Contents] [nvarchar](150) NULL,
	[DateReply] [datetime] NULL,
 CONSTRAINT [PK_ReplyComents] PRIMARY KEY CLUSTERED 
(
	[ReplyCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[DateBuy] [datetime] NULL,
	[Status] [int] NULL,
	[Payments] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [DateBuy], [Status], [Payments]) VALUES (5, 2, 1, CAST(0x0000A4C400000000 AS DateTime), 1, N'1')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [DateBuy], [Status], [Payments]) VALUES (6, 3, 1, CAST(0x0000A4C400000000 AS DateTime), 1, N'1')
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 06/27/2015 19:28:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
	[TotalMoney] [money] NULL,
 CONSTRAINT [pk_OrderDetails_Products] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [TotalMoney]) VALUES (5, 1, 1350000.0000, 2, 2700000.0000)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity], [TotalMoney]) VALUES (6, 2, 1190000.0000, 4, 4760000.0000)
/****** Object:  ForeignKey [FK_Accounts_Roles]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
/****** Object:  ForeignKey [FK_Comments_Products]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
/****** Object:  ForeignKey [FK_Customers_Accounts]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Accounts]
GO
/****** Object:  ForeignKey [FK_Employees_Accounts]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Accounts]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Orders]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
/****** Object:  ForeignKey [FK_OrderDetails_Products]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
/****** Object:  ForeignKey [FK_Orders_Customers]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
/****** Object:  ForeignKey [FK_Orders_Employees]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
/****** Object:  ForeignKey [FK_Products_Categories]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  ForeignKey [FK_Products_Suppliers]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
/****** Object:  ForeignKey [FK_ReplyComments_Comments]    Script Date: 06/27/2015 19:28:38 ******/
ALTER TABLE [dbo].[ReplyComments]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComments_Comments] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
ALTER TABLE [dbo].[ReplyComments] CHECK CONSTRAINT [FK_ReplyComments_Comments]
GO

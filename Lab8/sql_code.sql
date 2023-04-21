USE [lab7]
GO
/****** Object:  User [admin]    Script Date: 4/18/2023 5:49:15 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [saler]    Script Date: 4/18/2023 5:49:15 PM ******/
CREATE USER [saler] FOR LOGIN [saler] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cpu]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpu](
	[id] [bigint] NOT NULL,
	[cores] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[frequency] [real] NOT NULL,
	[model] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cpu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[design]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[design](
	[id] [bigint] NOT NULL,
	[material] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_design] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [bigint] NOT NULL,
	[apple] [nvarchar](50) NOT NULL,
	[samsung] [nvarchar](50) NOT NULL,
	[xiaomi] [nvarchar](50) NOT NULL,
	[google] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [bigint] NOT NULL,
	[width] [real] NOT NULL,
	[hieght] [real] NOT NULL,
	[weight] [real] NOT NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[screen]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[screen](
	[id] [bigint] NOT NULL,
	[matrix] [nvarchar](50) NOT NULL,
	[diagonal] [real] NOT NULL,
	[resolution] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_screen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[smartphone]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smartphone](
	[id] [bigint] NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[os] [nvarchar](50) NOT NULL,
	[release] [date] NOT NULL,
	[screen_id] [bigint] NOT NULL,
	[size_id] [bigint] NOT NULL,
	[brand_id] [bigint] NOT NULL,
	[design_id] [bigint] NOT NULL,
	[cpu_id] [bigint] NOT NULL,
 CONSTRAINT [PK_smartphone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT   dbo.smartphone.id, dbo.size.width, dbo.size.hieght, dbo.size.weight, dbo.screen.matrix, dbo.screen.diagonal, dbo.screen.resolution, dbo.design.material, dbo.cpu.cores, dbo.cpu.capacity, dbo.cpu.frequency, dbo.cpu.model, dbo.brand.apple, 
                    dbo.brand.samsung, dbo.brand.xiaomi, dbo.brand.google, dbo.smartphone.type, dbo.smartphone.os, dbo.smartphone.release
FROM       dbo.brand INNER JOIN
                    dbo.cpu ON dbo.brand.id = dbo.cpu.id INNER JOIN
                    dbo.design ON dbo.brand.id = dbo.design.id INNER JOIN
                    dbo.screen ON dbo.brand.id = dbo.screen.id INNER JOIN
                    dbo.size ON dbo.brand.id = dbo.size.id INNER JOIN
                    dbo.smartphone ON dbo.brand.id = dbo.smartphone.brand_id AND dbo.cpu.id = dbo.smartphone.cpu_id AND dbo.design.id = dbo.smartphone.design_id AND dbo.screen.id = dbo.smartphone.screen_id AND dbo.size.id = dbo.smartphone.size_id
GO
/****** Object:  Table [dbo].[availability]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[availability](
	[id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[shop_id] [bigint] NOT NULL,
	[arrival_date] [date] NOT NULL,
	[count] [int] NOT NULL,
	[sale_price] [real] NOT NULL,
 CONSTRAINT [PK_availability] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [bigint] NOT NULL,
	[black] [nvarchar](50) NOT NULL,
	[white] [nvarchar](50) NOT NULL,
	[gold] [nvarchar](50) NOT NULL,
	[silver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contract]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contract](
	[id] [bigint] NOT NULL,
	[number] [int] NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[salary] [real] NOT NULL,
	[starts] [date] NOT NULL,
	[ends] [date] NOT NULL,
 CONSTRAINT [PK_contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [bigint] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[shop_id] [bigint] NOT NULL,
	[contract_id] [bigint] NOT NULL,
	[passport_id] [bigint] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passport]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passport](
	[id] [bigint] NOT NULL,
	[ident_number] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[number] [int] NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[bth] [date] NOT NULL,
 CONSTRAINT [PK_passport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] NOT NULL,
	[smartphone_id] [bigint] NOT NULL,
	[sale_price] [real] NOT NULL,
	[buying_price] [real] NOT NULL,
	[availability] [tinyint] NOT NULL,
	[vendor_code] [nvarchar](50) NOT NULL,
	[color_id] [bigint] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shop]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop](
	[id] [bigint] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[earnings] [real] NOT NULL,
 CONSTRAINT [PK_shop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sold]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sold](
	[id] [bigint] NOT NULL,
	[price] [real] NOT NULL,
	[amount] [real] NOT NULL,
	[shop_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[arrival_date] [date] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [bigint] NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supply]    Script Date: 4/18/2023 5:49:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supply](
	[id] [bigint] NOT NULL,
	[product_id] [bigint] NOT NULL,
	[stock_id] [bigint] NOT NULL,
	[arrival_date] [date] NOT NULL,
	[count] [int] NOT NULL,
	[price] [real] NOT NULL,
	[supplier_id] [bigint] NOT NULL,
 CONSTRAINT [PK_supply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[availability]  WITH CHECK ADD  CONSTRAINT [FK_availability_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[availability] CHECK CONSTRAINT [FK_availability_product]
GO
ALTER TABLE [dbo].[availability]  WITH CHECK ADD  CONSTRAINT [FK_availability_shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shop] ([id])
GO
ALTER TABLE [dbo].[availability] CHECK CONSTRAINT [FK_availability_shop]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_contract] FOREIGN KEY([contract_id])
REFERENCES [dbo].[contract] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_contract]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_passport] FOREIGN KEY([passport_id])
REFERENCES [dbo].[passport] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_passport]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shop] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_shop]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_color] FOREIGN KEY([color_id])
REFERENCES [dbo].[color] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_color]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_smartphone] FOREIGN KEY([smartphone_id])
REFERENCES [dbo].[smartphone] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_smartphone]
GO
ALTER TABLE [dbo].[smartphone]  WITH CHECK ADD  CONSTRAINT [FK_smartphone_brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[smartphone] CHECK CONSTRAINT [FK_smartphone_brand]
GO
ALTER TABLE [dbo].[smartphone]  WITH CHECK ADD  CONSTRAINT [FK_smartphone_cpu] FOREIGN KEY([cpu_id])
REFERENCES [dbo].[cpu] ([id])
GO
ALTER TABLE [dbo].[smartphone] CHECK CONSTRAINT [FK_smartphone_cpu]
GO
ALTER TABLE [dbo].[smartphone]  WITH CHECK ADD  CONSTRAINT [FK_smartphone_design] FOREIGN KEY([design_id])
REFERENCES [dbo].[design] ([id])
GO
ALTER TABLE [dbo].[smartphone] CHECK CONSTRAINT [FK_smartphone_design]
GO
ALTER TABLE [dbo].[smartphone]  WITH CHECK ADD  CONSTRAINT [FK_smartphone_screen] FOREIGN KEY([screen_id])
REFERENCES [dbo].[screen] ([id])
GO
ALTER TABLE [dbo].[smartphone] CHECK CONSTRAINT [FK_smartphone_screen]
GO
ALTER TABLE [dbo].[smartphone]  WITH CHECK ADD  CONSTRAINT [FK_smartphone_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[smartphone] CHECK CONSTRAINT [FK_smartphone_size]
GO
ALTER TABLE [dbo].[sold]  WITH CHECK ADD  CONSTRAINT [FK_sold_shop] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shop] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[sold] CHECK CONSTRAINT [FK_sold_shop]
GO
ALTER TABLE [dbo].[stock]  WITH CHECK ADD  CONSTRAINT [FK_stock_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[stock] CHECK CONSTRAINT [FK_stock_product]
GO
ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_product]
GO
ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_stock] FOREIGN KEY([stock_id])
REFERENCES [dbo].[stock] ([id])
GO
ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_stock]
GO
ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_supplier]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD  CONSTRAINT [CK_contract] CHECK  (([starts]<=[ends]))
GO
ALTER TABLE [dbo].[contract] CHECK CONSTRAINT [CK_contract]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "brand"
            Begin Extent = 
               Top = 7
               Left = 46
               Bottom = 154
               Right = 239
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "cpu"
            Begin Extent = 
               Top = 7
               Left = 285
               Bottom = 154
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "design"
            Begin Extent = 
               Top = 7
               Left = 524
               Bottom = 116
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "screen"
            Begin Extent = 
               Top = 7
               Left = 763
               Bottom = 154
               Right = 956
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "size"
            Begin Extent = 
               Top = 7
               Left = 1002
               Bottom = 154
               Right = 1195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "smartphone"
            Begin Extent = 
               Top = 7
               Left = 1241
               Bottom = 154
               Right = 1434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1241
         Width = 1241
         Width ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1241
         Width = 1241
         Width = 1241
         Width = 1241
         Width = 1241
         Width = 1241
         Width = 1241
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO

CREATE TABLE [dbo].[Users]
(
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([ID] ASC) 
)
GO

CREATE TABLE [dbo].[Suppliers]
(
	[ID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED ([ID] ASC)
)
GO

CREATE TABLE [dbo].[Products]
(
	[ID] [int] NOT NULL,
	[SupplierID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[UnitsInStock] [int] NULL,
	CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID]) REFERENCES [dbo].[Suppliers] ([ID])
) 
GO

CREATE TABLE [dbo].[Orders]
(
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderDate] [smalldatetime] NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_Orders_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID]),
	CONSTRAINT [FK_Orders_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ID])
)
GO

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (1, N'Maria', N'Anders', N'maria.anders@gmail.com', N'Odesa', N'Active')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (2, N'Anna', N'Trujilo', N'anatrujilo@gmail.com', N'Kyiv', N'Active')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (3, N'Martin', N'Sommer', N'martin.sommer@gmail.com', N'Kyiv', N'Inactive')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (4, N'Frederique', N'Citeaux', N'frederique.citeaux@gmail.com', N'Lviv', N'Active')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (5, N'Victoria', N'Ashworth', N'ashworthvictoria@gmail.com', N'Kharkiv', N'Inactive')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (6, N'Hanna', N'Moos', N'hanna.moos@gmail.com', N'Lviv', N'Active')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (7, N'Anna', N'Hardy', N'anna.hardy@gmail.com', N'Lviv', N'Active')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (8, N'Antonio', N'Moreno', N'antoniomoreno@gmail.com', N'Odesa', N'Inactive')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (9, N'Christopher', N'Moren', N'ChristopherMoren@gmail.com', N'Vinnytsia', N'Blocked')
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Email], [Address], [Status]) VALUES (10, N'Daria', N'Samon', N'daria.samon@gmail.com', N'Poltava', N'Blocked')

INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (1, N'Developed Tea', N'Kyiv', N'Active')
INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (2, N'Central Grocery', N'Poltava', N'Active')
INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (3, N'Foodsy', N'Odesa', N'Active')
INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (4, N'Marketque', N'Ternopil', N'Inactive')
INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (5, N'Vital Market', N'Kherson', N'Inactive')
INSERT [dbo].[Suppliers] ([ID], [Name], [Address], [Status]) VALUES (6, N'Winezen', N'Ternopil', N'Inactive')

INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (1, 1, N'Black Tea', N'Classic English breakfast tea.', 25.5, 12)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (2, 4, N'Meat seasoning', N'Chef Anton Cajun Seasoning.', 220, 5)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (3, 5, N'Tofu', N'', 23.25, 15)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (4, 2, N'Arugula salad', N'Fresh salad', 53, 3)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (5, 2, N'Tea cup - whiskers', N'Tea cup with cats design', 250, 1)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (6, 2, N'Tea cup - flowers', N'Tea cup with flowers design', 250, 0)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (7, 3, N'Maple syrup', N'Canadian maple syrup', 702.26, 6)
INSERT [dbo].[Products] ([ID], [SupplierID], [Name], [Description], [Price], [UnitsInStock]) VALUES (8, 3, N'Olive oil', N'', 191, 16)

INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (1, 1, 7, CAST(N'2020-05-12 16:00:55' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (2, 5, 6, CAST(N'2020-06-01 10:10:10' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (3, 2, 4, CAST(N'2020-05-01 00:01:51' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (4, 2, 3, CAST(N'2020-05-02 13:45:25' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (5, 3, 6, CAST(N'2020-05-02 20:20:00' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (6, 6, 2, CAST(N'2020-04-22 11:57:50' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (7, 7, 1, CAST(N'2020-03-20 12:00:00' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (8, 7, 1, CAST(N'2020-04-20 12:00:00' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (9, 7, 1, CAST(N'2020-05-20 12:00:00' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (10, 4, 8, CAST(N'2020-05-30 23:20:55' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (11, 1, 8, CAST(N'2020-05-30 17:20:00' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [UserID], [ProductID], [OrderDate]) VALUES (12, 5, 1, CAST(N'2020-06-01 10:10:10' AS smalldatetime))
INSERT [dbo].[Orders] ([ID], [ProductID], [OrderDate]) VALUES (13, 1, CAST(N'2020-06-11 10:40:10' AS smalldatetime))
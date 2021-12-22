IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Customers] (
    [Id] int NOT NULL IDENTITY,
    [Name] nvarchar(max) NOT NULL,
    [CountryId] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Customers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [ODataOrders] (
    [Id] int NOT NULL IDENTITY,
    [Product] nvarchar(max) NOT NULL,
    [orderDate] datetime2 NOT NULL,
    [Quantity] int NOT NULL,
    [Revenue] int NOT NULL,
    [CustomerId] int NOT NULL,
    CONSTRAINT [PK_ODataOrders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ODataOrders_Customers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_ODataOrders_CustomerId] ON [ODataOrders] ([CustomerId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211222161948_initial', N'6.0.1');
GO

COMMIT;
GO


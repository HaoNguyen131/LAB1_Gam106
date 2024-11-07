BEGIN TRANSACTION;
GO

CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [RegionID] int NOT NULL,
    [Avatar] nvarchar(max) NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(450) NOT NULL,
    [ProviderKey] nvarchar(450) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(450) NOT NULL,
    [Name] nvarchar(450) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
GO

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241029094401_addUserModelToDb', N'8.0.10');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'LevelId', N'Description', N'title') AND [object_id] = OBJECT_ID(N'[GameLevels]'))
    SET IDENTITY_INSERT [GameLevels] ON;
INSERT INTO [GameLevels] ([LevelId], [Description], [title])
VALUES (1, NULL, N'Cấp độ 1'),
(2, NULL, N'Cấp độ 2'),
(3, NULL, N'Cấp độ 3');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'LevelId', N'Description', N'title') AND [object_id] = OBJECT_ID(N'[GameLevels]'))
    SET IDENTITY_INSERT [GameLevels] OFF;
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'QuestionID', N'Answer', N'ContentQuestion', N'LevelID', N'Option1', N'Option2', N'Option3', N'Option4') AND [object_id] = OBJECT_ID(N'[Questions]'))
    SET IDENTITY_INSERT [Questions] ON;
INSERT INTO [Questions] ([QuestionID], [Answer], [ContentQuestion], [LevelID], [Option1], [Option2], [Option3], [Option4])
VALUES (1, N'Đáp án 1', N'Câu hỏi 1', 1, N'Đáp án 1', N'Đáp án 2', N'Đáp án 3', N'Đáp án 4'),
(2, N'Đáp án 2', N'Câu hỏi 2', 2, N'Đáp án 1', N'Đáp án 2', N'Đáp án 3', N'Đáp án 4');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'QuestionID', N'Answer', N'ContentQuestion', N'LevelID', N'Option1', N'Option2', N'Option3', N'Option4') AND [object_id] = OBJECT_ID(N'[Questions]'))
    SET IDENTITY_INSERT [Questions] OFF;
GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RegionID', N'Name') AND [object_id] = OBJECT_ID(N'[Regions]'))
    SET IDENTITY_INSERT [Regions] ON;
INSERT INTO [Regions] ([RegionID], [Name])
VALUES (1, N'Đồng bằng sông Hồng'),
(2, N'Đồng bằng sông Cửu Long');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'RegionID', N'Name') AND [object_id] = OBJECT_ID(N'[Regions]'))
    SET IDENTITY_INSERT [Regions] OFF;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241029095836_lab2', N'8.0.10');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [LevelResults] (
    [QuizResultId] int NOT NULL IDENTITY,
    [UserId] nvarchar(max) NOT NULL,
    [LevelId] int NOT NULL,
    [Score] int NOT NULL,
    [CompletionDate] date NOT NULL,
    CONSTRAINT [PK_LevelResults] PRIMARY KEY ([QuizResultId])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20241029100152_addModelsGameToDb2', N'8.0.10');
GO

COMMIT;
GO


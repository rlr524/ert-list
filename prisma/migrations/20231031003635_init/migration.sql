BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[ERTMember] (
    [id] INT NOT NULL IDENTITY(1,1),
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [ERTMember_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    [lastName] VARCHAR(255) NOT NULL,
    [firstName] VARCHAR(255) NOT NULL,
    [homePhone] VARCHAR(255) NOT NULL,
    [mobilePhone] VARCHAR(255) NOT NULL,
    [title] VARCHAR(255) NOT NULL,
    [locationId] INT NOT NULL,
    CONSTRAINT [ERTMember_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[Location] (
    [id] INT NOT NULL IDENTITY(1,1),
    [locationNumber] VARCHAR(10) NOT NULL,
    [locationName] VARCHAR(255) NOT NULL,
    [locationTypeId] INT NOT NULL,
    CONSTRAINT [Location_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [Location_locationTypeId_key] UNIQUE NONCLUSTERED ([locationTypeId])
);

-- CreateTable
CREATE TABLE [dbo].[Type] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] VARCHAR(255) NOT NULL,
    CONSTRAINT [Type_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- AddForeignKey
ALTER TABLE [dbo].[ERTMember] ADD CONSTRAINT [ERTMember_locationId_fkey] FOREIGN KEY ([locationId]) REFERENCES [dbo].[Location]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Location] ADD CONSTRAINT [Location_locationTypeId_fkey] FOREIGN KEY ([locationTypeId]) REFERENCES [dbo].[Type]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

/*****************************************************************************************************************
NAME:    dbo.tblNAICSCodeHier
PURPOSE: Create the dbo.tblNAICSCodeHier table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     3/15/2021   Oliver Tragante       1. Built this table for LDS BC IT240
1.1     3/26/2021   Oliver Tragante       1. Added PK and NOT NULL constraints  



RUNTIME: 


NOTES: 
NAICS Code Hierarchy

******************************************************************************************************************/

USE [DFNB3]
GO

/****** Object:  Table [dbo].[tblNAICSCodeHier]    Script Date: 11/17/2019 10:54:42 AM ******/
DROP TABLE [dbo].[tblNAICSCodeHier]
GO

/****** Object:  Table [dbo].[tblNAICSCodeHier]    Script Date: 11/17/2019 10:54:42 AM ******/

CREATE TABLE [dbo].[tblNAICSCodeHier](
 	[industry_sector_code][float] NOT NULL,
 	[industry_sector_desc][nvarchar] (500) NOT NULL,
 	[industry_sub_sector_code][float] NOT NULL,
  	[industry_sub_sector_desc][nvarchar] (500) NOT NULL,
  	[industry_group_code][float] NOT NULL,
  	[industry_group_desc][nvarchar] (500) NOT NULL,
  	[industry_code][float] NOT NULL,
  	[industry_desc][nvarchar] (500) NOT NULL,
  	[nation_industry_code][float] NOT NULL,
  	[nation_industry_desc][nvarchar] (500) NOT NULL,
CONSTRAINT [PK_tblNAICSCodeHier] PRIMARY KEY CLUSTERED
(
	[nation_industry_code] ASC
)
)
;

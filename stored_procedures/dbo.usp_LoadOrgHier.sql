USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHier]    Script Date: 3/25/2021 11:43:11 AM ******/
DROP PROCEDURE [dbo].[usp_LoadOrgHier]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadOrgHier]    Script Date: 3/25/2021 11:43:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_LoadOrgHier] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadOrgHier
PURPOSE: Create and Load the dbo.Nums table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/25/2021   Oliver Tragante       1. Built this table for LDS BC IT243



RUNTIME: 
Approx. 1 sec

NOTES: 



LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 

Example usage...

EXEC dbo.usp_LoadOrgHier 
   
******************************************************************************************************************/

    BEGIN

        -- 1) Truncate existing data

		TRUNCATE TABLE dbo.tblOrgHier;

        -- 2) Reload data

		INSERT INTO dbo.tblOrgHier
		SELECT DISTINCT 
       s.acct_branch_id AS branch_id
     , s.acct_branch_code AS branch_code
     , s.acct_branch_desc AS branch_desc
     , s.acct_region_id AS region_id
	 , 'Unknown' AS region_desc
     , s.acct_area_id AS area_id
	 , 'Unknown' AS area_desc
	FROM dbo.stg_p1 AS s
	ORDER BY 1;

        END;

GO



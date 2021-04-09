USE [DFNB3];
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 3/25/2021 5:21:50 PM ******/

DROP PROCEDURE dbo.usp_HandleRefEnteg;
GO

/****** Object:  StoredProcedure [dbo].[usp_HandleRefEnteg]    Script Date: 3/25/2021 5:21:50 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO



CREATE PROCEDURE dbo.usp_HandleRefEnteg(@v_op AS VARCHAR(10))
AS

/*****************************************************************************************************************
NAME:    dbo.usp_HandleRefEnteg
PURPOSE: Handle referential integrity

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/23/2019   JJAUSSI       1. Built this table for LDS BC IT243



RUNTIME: 
Approx. 30 sec

NOTES: 
@v_op
- op = operation
- drop = drop foreign keys, primary keys, indexes
- add = add foreign keys, primary keys, indexes

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

    BEGIN


        -- 1) Drop

        IF @v_op = 'drop'

            BEGIN


                -- 1.1) Foreign Keys

                --1.1.1)

                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblBranchDim_region_id_tblRegionDim_region_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblBranchDim_area_id_tblAreaDim_area_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblBranchDim_branch_add_id_tblAddressDim_add_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountFact_acct_id_tblAccountDim_acct_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountFact')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountDim_prod_id_tblProductDim_prod_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;

                END;


                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id;

                END;

                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblTransactionFact_branch_id_tblBranchDim_branch_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
                )
                    BEGIN

                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id;

                END;

                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
                )
                    BEGIN

                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id;

                END;

                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblOrgHier_area_id_tblAreaDim_area_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblOrgHier')
                )
                    BEGIN

                        ALTER TABLE dbo.tblOrgHier DROP CONSTRAINT FK_tblOrgHier_area_id_tblAreaDim_area_id;

                END;

                IF EXISTS
                (
                    SELECT fk.*
                      FROM sys.foreign_keys AS fk
                     WHERE fk.name = 'FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id'
                           AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
                )
                    BEGIN

                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id;

                END;

                -- 1.2) Primary Keys


                -- 1.2.1) Account Customer Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT PK_tblAccountCustomerDim;
                END; 




                -- 1.2.2) Account Customer Role Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerRoleDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountCustomerRoleDim DROP CONSTRAINT PK_tblAccountCustomerRoleDim;
                END; 



                -- 1.2.3) Account Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAccountDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT PK_tblAccountDim;
                END; 




                -- 1.2.4) Branch Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblBranchDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT PK_tblBranchDim;
                END; 



                -- 1.2.5) Region Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblRegionDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblRegionDim DROP CONSTRAINT PK_tblRegionDim;
                END; 



                -- 1.2.6) Area Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAreaDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAreaDim DROP CONSTRAINT PK_tblAreaDim;
                END; 




                -- 1.2.7) Product Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblProductDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblProductDim DROP CONSTRAINT PK_tblProductDim;
                END; 




                -- 1.2.8) Customer Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblCustomerDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT PK_tblCustomerDim;
                END; 





                -- 1.2.9) Account Fact

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAccountFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT PK_tblAccountFact;
                END; 




                -- 1.2.10) Address Dimension

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblAddressDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblAddressDim DROP CONSTRAINT PK_tblAddressDim;
                END; 


                --1.2.11) TransactionTypeDim

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblTransactionTypeDim')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionTypeDim DROP CONSTRAINT PK_tblTransactionTypeDim;
                END; 


                --1.2.12) Transaction Fact

                IF EXISTS
                (
                    SELECT 1
                      FROM sys.key_constraints
                     WHERE type = 'PK'
                           AND parent_object_id = OBJECT_ID('dbo.tblTransactionFact')
                )
                    BEGIN
                        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT PK_tblTransactionFact;
                END; 




                -- 1.3) Indexes

                --1.3.1) TransactionFact

                IF EXISTS
                (
                    SELECT *
                      FROM sys.indexes
                     WHERE name = 'APK_tblTransactionFact'
                )
                    BEGIN
                        DROP INDEX APK_tblTransactionFact ON dbo.tblTransactionFact;
                END;
        END;



        -- 2) Add

        IF @v_op = 'add'

            BEGIN


                -- 2.1) Primary Keys

                -- 2.1.1) Account Customer Dimension

                ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY(acct_id, cust_id);



                -- 2.1.2) Account Customer Role Dimension


                ALTER TABLE dbo.tblAccountCustomerRoleDim
                ADD CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY(acct_cust_role_id);



                -- 2.1.3) Account Dimension


                ALTER TABLE dbo.tblAccountDim
                ADD CONSTRAINT PK_tblAccountDim PRIMARY KEY(acct_id);



                -- 2.1.4) Branch Dimension


                ALTER TABLE dbo.tblBranchDim
                ADD CONSTRAINT PK_tblBranchDim PRIMARY KEY(branch_id);



                -- 2.1.5) Region Dimension


                ALTER TABLE dbo.tblRegionDim
                ADD CONSTRAINT PK_tblRegionDim PRIMARY KEY(region_id);



                -- 2.1.6) Area Dimension


                ALTER TABLE dbo.tblAreaDim
                ADD CONSTRAINT PK_tblAreaDim PRIMARY KEY(area_id);



                -- 2.1.7) Product Dimension


                ALTER TABLE dbo.tblProductDim
                ADD CONSTRAINT PK_tblProductDim PRIMARY KEY(prod_id);



                -- 2.1.8) Customer Dimension


                ALTER TABLE dbo.tblCustomerDim
                ADD CONSTRAINT PK_tblCustomerDim PRIMARY KEY(cust_id);



                -- 2.1.9) Account Fact


                ALTER TABLE dbo.tblAccountFact
                ADD CONSTRAINT PK_tblAccountFact PRIMARY KEY(as_of_date, acct_id);



                -- 2.1.10) Address Dimension


                ALTER TABLE dbo.tblAddressDim
                ADD CONSTRAINT PK_tblAddressDim PRIMARY KEY(add_id);

                --2.1.11) Transaction Type Dimension

                ALTER TABLE dbo.tblTransactionTypeDim
                ADD CONSTRAINT PK_tblTransactionTypeDim PRIMARY KEY(tran_type_id);

                --2.1.12) Transaction Fact
                ALTER TABLE dbo.tblTransactionFact
                ADD CONSTRAINT PK_tblTransactionFact PRIMARY KEY(tran_id);




                -- 2.2) Foreign Keys

                -- 2.2.1) Account Customer Dimension

                ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id FOREIGN KEY(cust_id) REFERENCES dbo.tblCustomerDim(cust_id);


                ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);


                ALTER TABLE dbo.tblAccountCustomerDim
                ADD CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id FOREIGN KEY(acct_cust_role_id) REFERENCES dbo.tblAccountCustomerRoleDim(acct_cust_role_id);



                -- 2.2.2) Account Customer Role Dimension



                -- 2.2.3) Account Dimension

                ALTER TABLE dbo.tblAccountDim
                ADD CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id FOREIGN KEY(prod_id) REFERENCES dbo.tblProductDim(prod_id);


                ALTER TABLE dbo.tblAccountDim
                ADD CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);


                ALTER TABLE dbo.tblAccountDim
                ADD CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id FOREIGN KEY(pri_cust_id) REFERENCES dbo.tblCustomerDim(cust_id);



                -- 2.2.4) Branch Dimension


                ALTER TABLE dbo.tblBranchDim
                ADD CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id FOREIGN KEY(branch_add_id) REFERENCES dbo.tblAddressDim(add_id);


                ALTER TABLE dbo.tblBranchDim
                ADD CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id FOREIGN KEY(region_id) REFERENCES dbo.tblRegionDim(region_id);


                ALTER TABLE dbo.tblBranchDim
                ADD CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id FOREIGN KEY(area_id) REFERENCES dbo.tblAreaDim(area_id);


                -- 2.2.5) Region Dimension



                -- 2.2.6) Area Dimension



                -- 2.2.7) Product Dimension



                -- 2.2.8) Customer Dimension


                ALTER TABLE dbo.tblCustomerDim
                ADD CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id FOREIGN KEY(pri_branch_id) REFERENCES dbo.tblBranchDim(branch_id);


                ALTER TABLE dbo.tblCustomerDim
                ADD CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id FOREIGN KEY(cust_add_id) REFERENCES dbo.tblAddressDim(add_id);



                -- 2.2.9) Account Fact


                ALTER TABLE dbo.tblAccountFact
                ADD CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);



                -- 2.2.10) Address Dimension

                --2.2.11) TransacrioFact

                ALTER TABLE dbo.tblTransactionFact
                ADD CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);

                ALTER TABLE dbo.tblTransactionFact
                ADD CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id FOREIGN KEY(tran_type_id) REFERENCES dbo.tblTransactionTypeDim(tran_type_id);

                --2.2.12) OrgHier
                ALTER TABLE dbo.tblOrgHier
                ADD CONSTRAINT FK_tblOrgHier_area_id_tblAreaDim_area_id FOREIGN KEY(area_id) REFERENCES dbo.tblAreaDim(area_id);

                -- 2.3) Indexes

                --2.3.1) TransactionFact

                CREATE UNIQUE NONCLUSTERED INDEX APK_tblTransactionFact ON dbo.tblTransactionFact
                (tran_date ASC, tran_time ASC, branch_id ASC, acct_id ASC, tran_type_id ASC
                );


        END;

    END;

GO
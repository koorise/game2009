if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[FK_CMS_HelpList_sys_CMS_Class]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [GM].[CMS_HelpList] DROP CONSTRAINT FK_CMS_HelpList_sys_CMS_Class
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_addtosourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_addtosourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_addtosourcecontrol_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_addtosourcecontrol_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_adduserobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_adduserobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_adduserobject_vcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_adduserobject_vcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkinobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkinobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkinobject_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkinobject_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkoutobject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkoutobject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_checkoutobject_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_checkoutobject_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_displayoaerror]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_displayoaerror]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_displayoaerror_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_displayoaerror_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_droppropertiesbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_droppropertiesbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_dropuserobjectbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_dropuserobjectbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_generateansiname]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_generateansiname]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getobjwithprop]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getobjwithprop]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getobjwithprop_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getobjwithprop_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_vcs]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_vcs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_getpropertiesbyid_vcs_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_getpropertiesbyid_vcs_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_isundersourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_isundersourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_isundersourcecontrol_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_isundersourcecontrol_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_removefromsourcecontrol]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_removefromsourcecontrol]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_setpropertybyid]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_setpropertybyid]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_setpropertybyid_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_setpropertybyid_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_validateloginparams]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_validateloginparams]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_validateloginparams_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_validateloginparams_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_vcsenabled]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_vcsenabled]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_verstamp006]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_verstamp006]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_verstamp007]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_verstamp007]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_whocheckedout]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_whocheckedout]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dt_whocheckedout_u]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[dt_whocheckedout_u]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spAll_ReturnRows]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spAll_ReturnRows]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[vwCMSHelpList]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [GM].[vwCMSHelpList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[vw_orderInfo_for_Saler]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [GM].[vw_orderInfo_for_Saler]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[vwOrderInfoList]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [GM].[vwOrderInfoList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[vwProductsBaseDetail]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [GM].[vwProductsBaseDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[vwShopRecommendlist]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [GM].[vwShopRecommendlist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[AdminCustomerService]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[AdminCustomerService]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[AdminInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[AdminInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[AdminLogs]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[AdminLogs]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[CMS_HelpList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[CMS_HelpList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[OprateInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[OprateInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[ProductsMessageInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[ProductsMessageInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[ShopInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[ShopInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShopPayRecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ShopPayRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShopProductType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ShopProductType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[ShopRecommendList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[ShopRecommendList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SysAppConfig]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SysAppConfig]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SysChargeCashStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SysChargeCashStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[User_Scrt_info]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[User_Scrt_info]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[User_passportApplication]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[User_passportApplication]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[dtproperties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[dtproperties]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gAccountForOut]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gAccountForOut]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[gAccountInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[gAccountInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gAccountRecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gAccountRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gOrderInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gOrderInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gProducts]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gProducts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gUserInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gUserInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysAccountRecordStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysAccountRecordStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysCity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysCity]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysFlag]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysFlag]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysGame]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysGame]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysJob]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysJob]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysMoneyType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysMoneyType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysOrderStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysOrderStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysOrderType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysOrderType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysPriceChannel]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysPriceChannel]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysPriceType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysPriceType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysProductsStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysProductsStatus]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sysProvince]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sysProvince]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysQuestion]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysQuestion]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysRace]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysRace]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysSaleMethod]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysSaleMethod]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysSaleType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysSaleType]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sysServer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sysServer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[GM].[sys_CMS_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [GM].[sys_CMS_Class]
GO

CREATE TABLE [GM].[AdminCustomerService] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CustomerService] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[AdminInfo] (
	[AdminID] [int] IDENTITY (1, 1) NOT NULL ,
	[CustomerServiceID] [int] NULL ,
	[DayorNight] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[TypeID] [int] NULL ,
	[UserName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[PassWD] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQ] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[MSN] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[TelPhone] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[isLogin] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[AdminLogs] (
	[LogID] [int] IDENTITY (1, 1) NOT NULL ,
	[AdminID] [int] NOT NULL ,
	[passWD] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[isLogIn] [bit] NOT NULL ,
	[LoginIP] [nchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[inTime] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[CMS_HelpList] (
	[UNID] [int] IDENTITY (1, 1) NOT NULL ,
	[CMSClassID] [int] NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[isURL] [bit] NULL ,
	[UrlAddress] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[keyWord] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NULL ,
	[inTime] [datetime] NULL ,
	[hits] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[OprateInfo] (
	[OprateID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProductID] [int] NULL ,
	[AccountID] [int] NULL ,
	[CustomerServiceID] [int] NULL ,
	[CustomerServiceAdvice] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[DealMakerID] [int] NULL ,
	[DealMakerAdvice] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[Statues] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[ProductsMessageInfo] (
	[pMsgID] [int] IDENTITY (1, 1) NOT NULL ,
	[userName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[PNKID] [decimal](20, 0) NOT NULL ,
	[MSG] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[inTime] [datetime] NOT NULL ,
	[reMsg] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[reTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[ShopInfo] (
	[ShopID] [int] IDENTITY (1, 1) NOT NULL ,
	[userID] [int] NOT NULL ,
	[ShopName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ShopType] [int] NULL ,
	[ShopLogo] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[ShopSign] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[StartTime] [datetime] NULL ,
	[EndTime] [datetime] NULL ,
	[ShopNotice] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsStatus] [int] NULL ,
	[About] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[Contract] [text] COLLATE Chinese_PRC_CI_AS NULL ,
	[Style] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[FriendLink] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Recommend] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[HotList] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ShopPayRecord] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ShopID] [int] NOT NULL ,
	[StartTime] [datetime] NULL ,
	[EndTime] [datetime] NULL ,
	[InTime] [datetime] NULL ,
	[InType] [int] NULL ,
	[Price] [money] NULL ,
	[IsAuto] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ShopProductType] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ShopID] [int] NOT NULL ,
	[TagName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[TagIdx] [int] NULL ,
	[TagIcon] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParentID] [int] NULL ,
	[Products] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsExpend] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[ShopRecommendList] (
	[RecommendID] [int] IDENTITY (1, 1) NOT NULL ,
	[ShopID] [int] NULL ,
	[PNKID] [decimal](20, 0) NULL ,
	[isShow] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SysAppConfig] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ConfigCode] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ConfigValue] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SysChargeCashStatus] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[StatusName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[User_Scrt_info] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[userID] [int] NULL ,
	[AlipayName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[AlipayID] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[BankName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[proviceID] [int] NULL ,
	[cityID] [int] NULL ,
	[BankManName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[BankCardID] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQ] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Phone] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mobile] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[inTime] [datetime] NULL ,
	[UpdateTime] [datetime] NULL ,
	[isUsed] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[User_passportApplication] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NID] [decimal](20, 0) NOT NULL ,
	[UserID] [int] NULL ,
	[TypeID] [int] NULL ,
	[ApplicationType] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[RealName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[TelPhone] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQ] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[eMail] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mobile] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQOld] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Phone] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[BankName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[BankID] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[AliPayName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[AliPayID] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[Reason] [nvarchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[StatusID] [int] NULL ,
	[Results] [int] NULL ,
	[inTime] [datetime] NULL ,
	[OKTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[dtproperties] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[objectid] [int] NULL ,
	[property] [varchar] (64) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[value] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[uvalue] [nvarchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[lvalue] [image] NULL ,
	[version] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[gAccountForOut] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[RunningID] [numeric](18, 0) NOT NULL ,
	[RunningNum] [numeric](18, 0) NULL ,
	[PriceTypeID] [int] NOT NULL ,
	[PriceChannelID] [int] NOT NULL ,
	[ApplyPrice] [money] NOT NULL ,
	[OperatePrice] [money] NULL ,
	[ServiceCharge] [money] NULL ,
	[AccountName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountNum] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ServiceID] [int] NULL ,
	[StartTime] [datetime] NOT NULL ,
	[FinTime] [datetime] NULL ,
	[isStatus] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[gAccountInfo] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[ProductID] [int] NULL ,
	[PNKID] [numeric](20, 0) NOT NULL ,
	[GameID] [int] NULL ,
	[ServerID] [int] NULL ,
	[JobID] [int] NULL ,
	[RaceID] [int] NULL ,
	[FlagID] [int] NULL ,
	[AccountName] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountPassWD] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountRoleName] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountTimeReg] [datetime] NULL ,
	[AccountTimeEnd] [datetime] NULL ,
	[AccountTimeLastLogin] [datetime] NULL ,
	[AccountPassport] [bit] NOT NULL ,
	[AccountPassportQuestion] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountPassportAnswer] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountMail] [bit] NOT NULL ,
	[AccountMailAddress] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountMailPassWD] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountMailInfo] [nvarchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[AccountYellowPage] [bit] NOT NULL ,
	[AccountYellowPageURL] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[inTime] [smalldatetime] NULL ,
	[AccountisDisplay] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[gAccountRecord] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[RunningID] [numeric](20, 0) NOT NULL ,
	[UserID] [int] NOT NULL ,
	[OrderNumber] [decimal](20, 0) NOT NULL ,
	[PNKID] [decimal](20, 0) NOT NULL ,
	[MoneyType] [int] NOT NULL ,
	[PriceType] [int] NOT NULL ,
	[inTime] [datetime] NULL ,
	[OperatePrice] [money] NULL ,
	[cPrice] [money] NULL ,
	[bak] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[isStatus] [int] NULL ,
	[FinishTime] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[gOrderInfo] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[uID] [int] NOT NULL ,
	[PNKID] [numeric](20, 0) NOT NULL ,
	[OrderNumber] [numeric](20, 0) NULL ,
	[OrderType] [int] NULL ,
	[inTime] [datetime] NULL ,
	[PriceNow] [money] NULL ,
	[PriceAgent] [money] NULL ,
	[OrderStatus] [int] NULL ,
	[ProductCount] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[gProducts] (
	[PID] [int] IDENTITY (1, 1) NOT NULL ,
	[PNKID] [numeric](20, 0) NOT NULL ,
	[GameID] [int] NOT NULL ,
	[ServerID] [int] NOT NULL ,
	[JobID] [int] NOT NULL ,
	[RaceID] [int] NOT NULL ,
	[FlagID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[pTitle] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SaleMethodID] [int] NOT NULL ,
	[SaleTypeID] [int] NOT NULL ,
	[StatusID] [int] NOT NULL ,
	[pDetails] [nvarchar] (4000) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[pAccountNums] [int] NULL ,
	[pTimeStart] [datetime] NULL ,
	[pTimeEnd] [datetime] NULL ,
	[pPriceBase] [money] NULL ,
	[pPriceTop] [money] NULL ,
	[pPriceStep] [int] NULL ,
	[pPriceNow] [money] NULL ,
	[pFastKey] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[pPromise] [bit] NULL ,
	[ProductsPromise] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[CustomerServiceID] [int] NULL ,
	[QQ] [int] NULL ,
	[Phone] [int] NULL ,
	[isHits] [int] NULL ,
	[inTime] [smalldatetime] NOT NULL ,
	[isYellow] [bit] NULL ,
	[isPassPort] [bit] NULL ,
	[isMail] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[gUserInfo] (
	[uID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[PassWD] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[QuestionType] [int] NULL ,
	[MyKey] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[uMail] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[inIP] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[isBuyerScores] [int] NULL ,
	[isBuyerPer] [decimal](5, 4) NULL ,
	[isBuyerDealPer] [decimal](5, 4) NULL ,
	[isSalerScores] [int] NULL ,
	[isSalerPer] [decimal](5, 4) NULL ,
	[isSalerDealPer] [decimal](5, 4) NULL ,
	[isStars1] [float] NULL ,
	[isStars2] [float] NULL ,
	[inTime] [datetime] NULL ,
	[isBlock] [int] NULL ,
	[QQ] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[TelPhone] [nvarchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysAccountRecordStatus] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[StatusName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysCity] (
	[CityID] [int] IDENTITY (1, 1) NOT NULL ,
	[CityName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[CitySort] [int] NOT NULL ,
	[ProvinceID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysFlag] (
	[FlagID] [int] IDENTITY (1, 1) NOT NULL ,
	[flag] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GameID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysGame] (
	[GameID] [int] IDENTITY (1, 1) NOT NULL ,
	[GameName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysJob] (
	[JobID] [int] IDENTITY (1, 1) NOT NULL ,
	[JobName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GameID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysMoneyType] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Type] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysOrderStatus] (
	[ID] [int] NOT NULL ,
	[Status] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysOrderType] (
	[orderTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[orderType] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysPriceChannel] (
	[PriceChannelID] [int] IDENTITY (1, 1) NOT NULL ,
	[PriceChannelName] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysPriceType] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TypeName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysProductsStatus] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProductsStatus] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sysProvince] (
	[ProvinceID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProvinceName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ProvinceSort] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysQuestion] (
	[qID] [int] IDENTITY (1, 1) NOT NULL ,
	[Question] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysRace] (
	[RaceID] [int] IDENTITY (1, 1) NOT NULL ,
	[RaceName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[GameID] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysSaleMethod] (
	[TypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[TypeName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysSaleType] (
	[SaleTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SaleType] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sysServer] (
	[ServerID] [int] IDENTITY (1, 1) NOT NULL ,
	[ServerName] [nvarchar] (500) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GameID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [GM].[sys_CMS_Class] (
	[CMSClassID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClassName] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[orderflag] [int] NULL ,
	[SortID] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [GM].[AdminCustomerService] WITH NOCHECK ADD 
	CONSTRAINT [PK_AdminCustomerService] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[AdminInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_AdminInfo] PRIMARY KEY  CLUSTERED 
	(
		[AdminID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[AdminLogs] WITH NOCHECK ADD 
	CONSTRAINT [PK_AdminLogs] PRIMARY KEY  CLUSTERED 
	(
		[LogID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[CMS_HelpList] WITH NOCHECK ADD 
	CONSTRAINT [PK_CMS_HelpList] PRIMARY KEY  CLUSTERED 
	(
		[UNID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[OprateInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_OprateInfo] PRIMARY KEY  CLUSTERED 
	(
		[OprateID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[ProductsMessageInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ProductsMessageInfo] PRIMARY KEY  CLUSTERED 
	(
		[pMsgID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[ShopInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShopInfo] PRIMARY KEY  CLUSTERED 
	(
		[ShopID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ShopPayRecord] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShopPayRecord] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ShopProductType] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShopProductType] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[ShopRecommendList] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShopRecommendList] PRIMARY KEY  CLUSTERED 
	(
		[RecommendID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SysAppConfig] WITH NOCHECK ADD 
	CONSTRAINT [PK_SysAppConfig] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SysChargeCashStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_ChargeCashStatus] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[User_Scrt_info] WITH NOCHECK ADD 
	CONSTRAINT [PK_H] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[User_passportApplication] WITH NOCHECK ADD 
	CONSTRAINT [PK_User_passportApplication] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[dtproperties] WITH NOCHECK ADD 
	CONSTRAINT [pk_dtproperties] PRIMARY KEY  CLUSTERED 
	(
		[id],
		[property]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gAccountForOut] WITH NOCHECK ADD 
	CONSTRAINT [PK_gAccountForOut] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[gAccountInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_gAccountInfo] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gAccountRecord] WITH NOCHECK ADD 
	CONSTRAINT [PK_gAccountRecord] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gOrderInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_cBuyers] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gProducts] WITH NOCHECK ADD 
	CONSTRAINT [PK_gProducts] PRIMARY KEY  CLUSTERED 
	(
		[PID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gUserInfo] WITH NOCHECK ADD 
	CONSTRAINT [PK_gUserInfo] PRIMARY KEY  CLUSTERED 
	(
		[uID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysAccountRecordStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysAccountRecordStatus] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysCity] WITH NOCHECK ADD 
	CONSTRAINT [PK_City] PRIMARY KEY  CLUSTERED 
	(
		[CityID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysFlag] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysFlag] PRIMARY KEY  CLUSTERED 
	(
		[FlagID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysGame] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysGame] PRIMARY KEY  CLUSTERED 
	(
		[GameID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysJob] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysJob] PRIMARY KEY  CLUSTERED 
	(
		[JobID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysMoneyType] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysMoneyType] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysOrderStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysOrderStatus] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysOrderType] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysOrderType] PRIMARY KEY  CLUSTERED 
	(
		[orderTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysPriceChannel] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysPriceChannel] PRIMARY KEY  CLUSTERED 
	(
		[PriceChannelID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysPriceType] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysPriceType] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysProductsStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysProductsStatus] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sysProvince] WITH NOCHECK ADD 
	CONSTRAINT [PK_Province] PRIMARY KEY  CLUSTERED 
	(
		[ProvinceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysQuestion] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysQuestion] PRIMARY KEY  CLUSTERED 
	(
		[qID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysRace] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysRace] PRIMARY KEY  CLUSTERED 
	(
		[RaceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysSaleMethod] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysType] PRIMARY KEY  CLUSTERED 
	(
		[TypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysSaleType] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysSaleType] PRIMARY KEY  CLUSTERED 
	(
		[SaleTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sysServer] WITH NOCHECK ADD 
	CONSTRAINT [PK_sysServer] PRIMARY KEY  CLUSTERED 
	(
		[ServerID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[sys_CMS_Class] WITH NOCHECK ADD 
	CONSTRAINT [PK_sys_CMS_Class] PRIMARY KEY  CLUSTERED 
	(
		[CMSClassID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [GM].[AdminLogs] ADD 
	CONSTRAINT [DF_AdminLogs_inTime] DEFAULT (getdate()) FOR [inTime]
GO

ALTER TABLE [GM].[ProductsMessageInfo] ADD 
	CONSTRAINT [DF_ProductsMessageInfo_inTime] DEFAULT (getdate()) FOR [inTime]
GO

ALTER TABLE [GM].[User_Scrt_info] ADD 
	CONSTRAINT [DF_User_Scrt_info_inTime] DEFAULT (getdate()) FOR [inTime]
GO

ALTER TABLE [dbo].[dtproperties] ADD 
	CONSTRAINT [DF__dtpropert__versi__0BC6C43E] DEFAULT (0) FOR [version]
GO

ALTER TABLE [GM].[gAccountInfo] ADD 
	CONSTRAINT [DF_gAccountInfo_inTime] DEFAULT (getdate()) FOR [inTime]
GO

 CREATE  UNIQUE  INDEX [IX_gAccountRecord] ON [dbo].[gAccountRecord]([RunningID]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[gProducts] ADD 
	CONSTRAINT [DF_gProducts_inTime] DEFAULT (getdate()) FOR [inTime]
GO

 CREATE  UNIQUE  INDEX [IX_gProducts] ON [dbo].[gProducts]([PNKID]) ON [PRIMARY]
GO

ALTER TABLE [dbo].[gUserInfo] ADD 
	CONSTRAINT [DF_gUserInfo_inTime] DEFAULT (getdate()) FOR [inTime]
GO

ALTER TABLE [GM].[CMS_HelpList] ADD 
	CONSTRAINT [FK_CMS_HelpList_sys_CMS_Class] FOREIGN KEY 
	(
		[CMSClassID]
	) REFERENCES [GM].[sys_CMS_Class] (
		[CMSClassID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

setuser N'GM'
GO


CREATE VIEW GM.vwOrderInfoList
AS
SELECT dbo.gOrderInfo.*, dbo.gUserInfo.UserName
FROM dbo.gOrderInfo INNER JOIN
      dbo.gUserInfo ON dbo.gOrderInfo.uID = dbo.gUserInfo.uID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

setuser N'GM'
GO


CREATE VIEW GM.vwProductsBaseDetail
AS
SELECT dbo.gProducts.PID, dbo.gProducts.PNKID, dbo.gProducts.GameID, 
      dbo.gProducts.ServerID, dbo.gProducts.JobID, dbo.gProducts.RaceID, 
      dbo.gProducts.FlagID, dbo.gProducts.UserID, dbo.gProducts.pTitle, 
      dbo.gProducts.SaleMethodID, dbo.gProducts.SaleTypeID, dbo.gProducts.StatusID, 
      dbo.gProducts.pDetails, dbo.gProducts.pAccountNums, dbo.gProducts.pTimeStart, 
      dbo.gProducts.pTimeEnd, dbo.gProducts.pPriceBase, dbo.gProducts.pPriceTop, 
      dbo.gProducts.pFastKey, dbo.gProducts.ProductsPromise, 
      dbo.gProducts.CustomerServiceID, dbo.gProducts.QQ, dbo.gProducts.Phone, 
      dbo.gProducts.isHits, dbo.gProducts.inTime, dbo.sysGame.GameName, 
      dbo.sysServer.ServerName, dbo.sysSaleMethod.TypeName AS SaleMethod, 
      GM.sysProductsStatus.ProductsStatus, dbo.sysSaleType.SaleType, 
      dbo.gProducts.pPriceStep, dbo.gProducts.pPromise, dbo.gProducts.pPriceNow, 
      dbo.gProducts.isYellow, dbo.gProducts.isPassPort, dbo.gProducts.isMail
FROM dbo.sysServer INNER JOIN
      dbo.gProducts INNER JOIN
      dbo.sysGame ON dbo.gProducts.GameID = dbo.sysGame.GameID INNER JOIN
      dbo.sysSaleMethod ON 
      dbo.gProducts.SaleMethodID = dbo.sysSaleMethod.TypeID ON 
      dbo.sysServer.ServerID = dbo.gProducts.ServerID INNER JOIN
      GM.sysProductsStatus ON 
      dbo.gProducts.StatusID = GM.sysProductsStatus.ID INNER JOIN
      dbo.sysSaleType ON dbo.gProducts.SaleTypeID = dbo.sysSaleType.SaleTypeID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

setuser N'GM'
GO


CREATE VIEW GM.vwShopRecommendlist
AS
SELECT GM.ShopRecommendList.RecommendID, GM.ShopRecommendList.PNKID, 
      GM.ShopRecommendList.ShopID, GM.ShopRecommendList.isShow, 
      dbo.gProducts.pPriceTop, dbo.gProducts.pTitle
FROM GM.ShopRecommendList INNER JOIN
      dbo.gProducts ON GM.ShopRecommendList.ShopID = dbo.gProducts.PNKID


GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

setuser N'GM'
GO

CREATE VIEW GM.vwCMSHelpList
AS
SELECT GM.CMS_HelpList.UNID, GM.CMS_HelpList.CMSClassID, GM.CMS_HelpList.Title, 
      GM.CMS_HelpList.isURL, GM.CMS_HelpList.UrlAddress, GM.CMS_HelpList.keyWord, 
      GM.CMS_HelpList.Content, GM.CMS_HelpList.inTime, GM.CMS_HelpList.hits, 
      sys_CMS_Class_1.ClassName AS SmallClass, 
      GM.sys_CMS_Class.ClassName AS BigClass, 
      GM.sys_CMS_Class.CMSClassID AS CMSBigClassID
FROM GM.sys_CMS_Class INNER JOIN
      GM.sys_CMS_Class AS sys_CMS_Class_1 ON 
      GM.sys_CMS_Class.CMSClassID = sys_CMS_Class_1.orderflag INNER JOIN
      GM.CMS_HelpList ON 
      sys_CMS_Class_1.CMSClassID = GM.CMS_HelpList.CMSClassID

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

setuser N'GM'
GO

CREATE VIEW GM.vw_orderInfo_for_Saler
AS
SELECT dbo.gOrderInfo.ID, dbo.gOrderInfo.uID, dbo.gOrderInfo.OrderNumber, 
      dbo.gOrderInfo.OrderType, dbo.gOrderInfo.inTime AS OrderIntime, 
      dbo.gOrderInfo.PriceNow, dbo.gOrderInfo.PriceAgent, dbo.gOrderInfo.OrderStatus, 
      dbo.gOrderInfo.ProductCount, GM.vwProductsBaseDetail.PID, 
      GM.vwProductsBaseDetail.PNKID, GM.vwProductsBaseDetail.GameID, 
      GM.vwProductsBaseDetail.ServerID, GM.vwProductsBaseDetail.JobID, 
      GM.vwProductsBaseDetail.RaceID, GM.vwProductsBaseDetail.FlagID, 
      GM.vwProductsBaseDetail.UserID, GM.vwProductsBaseDetail.pTitle, 
      GM.vwProductsBaseDetail.SaleMethodID, GM.vwProductsBaseDetail.SaleTypeID, 
      GM.vwProductsBaseDetail.StatusID, GM.vwProductsBaseDetail.pDetails, 
      GM.vwProductsBaseDetail.pAccountNums, GM.vwProductsBaseDetail.pTimeStart, 
      GM.vwProductsBaseDetail.pTimeEnd, GM.vwProductsBaseDetail.pPriceBase, 
      GM.vwProductsBaseDetail.pPriceTop, GM.vwProductsBaseDetail.pFastKey, 
      GM.vwProductsBaseDetail.ProductsPromise, 
      GM.vwProductsBaseDetail.CustomerServiceID, GM.vwProductsBaseDetail.QQ, 
      GM.vwProductsBaseDetail.Phone, GM.vwProductsBaseDetail.isHits, 
      GM.vwProductsBaseDetail.inTime, GM.vwProductsBaseDetail.GameName, 
      GM.vwProductsBaseDetail.ServerName, GM.vwProductsBaseDetail.SaleMethod, 
      GM.vwProductsBaseDetail.ProductsStatus, GM.vwProductsBaseDetail.SaleType, 
      GM.vwProductsBaseDetail.pPriceStep, GM.vwProductsBaseDetail.pPromise, 
      GM.vwProductsBaseDetail.pPriceNow, GM.vwProductsBaseDetail.isYellow, 
      GM.vwProductsBaseDetail.isPassPort, GM.vwProductsBaseDetail.isMail, 
      dbo.gUserInfo.UserName, dbo.gUserInfo.isBuyerScores, dbo.gUserInfo.isBuyerPer, 
      dbo.gUserInfo.isBuyerDealPer, dbo.gUserInfo.isSalerScores, 
      dbo.gUserInfo.isSalerPer, dbo.gUserInfo.isSalerDealPer, dbo.gUserInfo.isStars1, 
      dbo.gUserInfo.isStars2
FROM dbo.gOrderInfo INNER JOIN
      GM.vwProductsBaseDetail ON 
      dbo.gOrderInfo.PNKID = GM.vwProductsBaseDetail.PNKID INNER JOIN
      dbo.gUserInfo ON dbo.gOrderInfo.uID = dbo.gUserInfo.uID

GO
setuser
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_addtosourcecontrol
    @vchSourceSafeINI varchar(255) = '',
    @vchProjectName   varchar(255) ='',
    @vchComment       varchar(255) ='',
    @vchLoginName     varchar(255) ='',
    @vchPassword      varchar(255) =''

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId = 0

declare @iStreamObjectId int
select @iStreamObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

declare @vchDatabaseName varchar(255)
select @vchDatabaseName = db_name()

declare @iReturnValue int
select @iReturnValue = 0

declare @iPropertyObjectId int
declare @vchParentId varchar(255)

declare @iObjectCount int
select @iObjectCount = 0

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError


    /* Create Project in SS */
    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'AddProjectToSourceSafe',
											NULL,
											@vchSourceSafeINI,
											@vchProjectName output,
											@@SERVERNAME,
											@vchDatabaseName,
											@vchLoginName,
											@vchPassword,
											@vchComment


    if @iReturn <> 0 GOTO E_OAError

    /* Set Database Properties */

    begin tran SetProperties

    /* add high level object */

    exec @iPropertyObjectId = dbo.dt_adduserobject_vcs 'VCSProjectID'

    select @vchParentId = CONVERT(varchar(255),@iPropertyObjectId)

    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProjectID', @vchParentId , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSProject' , @vchProjectName , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSourceSafeINI' , @vchSourceSafeINI , NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLServer', @@SERVERNAME, NULL
    exec dbo.dt_setpropertybyid @iPropertyObjectId, 'VCSSQLDatabase', @vchDatabaseName, NULL

    if @@error <> 0 GOTO E_General_Error

    commit tran SetProperties
    
    select @iObjectCount = 0;

CleanUp:
    select @vchProjectName
    select @iObjectCount
    return

E_General_Error:
    /* this is an all or nothing.  No specific error messages */
    goto CleanUp

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_addtosourcecontrol_u
    @vchSourceSafeINI nvarchar(255) = '',
    @vchProjectName   nvarchar(255) ='',
    @vchComment       nvarchar(255) ='',
    @vchLoginName     nvarchar(255) ='',
    @vchPassword      nvarchar(255) =''

as
	-- This procedure should no longer be called;  dt_addtosourcecontrol should be called instead.
	-- Calls are forwarded to dt_addtosourcecontrol to maintain backward compatibility
	set nocount on
	exec dbo.dt_addtosourcecontrol 
		@vchSourceSafeINI, 
		@vchProjectName, 
		@vchComment, 
		@vchLoginName, 
		@vchPassword




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Add an object to the dtproperties table
*/
create procedure dbo.dt_adduserobject
as
	set nocount on
	/*
	** Create the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_adduserobject_vcs
    @vchProperty varchar(64)

as

set nocount on

declare @iReturn int
    /*
    ** Create the user object if it does not exist already
    */
    begin transaction
        select @iReturn = objectid from dbo.dtproperties where property = @vchProperty
        if @iReturn IS NULL
        begin
            insert dbo.dtproperties (property) VALUES (@vchProperty)
            update dbo.dtproperties set objectid=@@identity
                    where id=@@identity and property=@vchProperty
            select @iReturn = @@identity
        end
    commit
    return @iReturn




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkinobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255)='',
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     Text = '', /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     Text = '', /* create stream */
    @txStream3     Text = ''  /* grant stream  */


as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0
	declare @iStreamObjectId int

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iPropertyObjectId int
	select @iPropertyObjectId  = 0

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    declare @iReturnValue	  int
    declare @pos			  int
    declare @vchProcLinePiece varchar(255)

    
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        if @iActionFlag = 1
        begin
            /* Procedure Can have up to three streams
            Drop Stream, Create Stream, GRANT stream */

            begin tran compile_all

            /* try to compile the streams */
            exec (@txStream1)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream2)
            if @@error <> 0 GOTO E_Compile_Fail

            exec (@txStream3)
            if @@error <> 0 GOTO E_Compile_Fail
        end

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT
        if @iReturn <> 0 GOTO E_OAError
        
        if @iActionFlag = 1
        begin
            
            declare @iStreamLength int
			
			select @pos=1
			select @iStreamLength = datalength(@txStream2)
			
			if @iStreamLength > 0
			begin
			
				while @pos < @iStreamLength
				begin
						
					select @vchProcLinePiece = substring(@txStream2, @pos, 255)
					
					exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
            		if @iReturn <> 0 GOTO E_OAError
            		
					select @pos = @pos + 255
					
				end
            
				exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
														'CheckIn_StoredProcedure',
														NULL,
														@sProjectName = @vchProjectName,
														@sSourceSafeINI = @vchSourceSafeINI,
														@sServerName = @vchServerName,
														@sDatabaseName = @vchDatabaseName,
														@sObjectName = @vchObjectName,
														@sComment = @vchComment,
														@sLoginName = @vchLoginName,
														@sPassword = @vchPassword,
														@iVCSFlags = @iVCSFlags,
														@iActionFlag = @iActionFlag,
														@sStream = ''
                                        
			end
        end
        else
        begin
        
            select colid, text into #ProcLines
            from syscomments
            where id = object_id(@vchObjectName)
            order by colid

            declare @iCurProcLine int
            declare @iProcLines int
            select @iCurProcLine = 1
            select @iProcLines = (select count(*) from #ProcLines)
            while @iCurProcLine <= @iProcLines
            begin
                select @pos = 1
                declare @iCurLineSize int
                select @iCurLineSize = len((select text from #ProcLines where colid = @iCurProcLine))
                while @pos <= @iCurLineSize
                begin                
                    select @vchProcLinePiece = convert(varchar(255),
                        substring((select text from #ProcLines where colid = @iCurProcLine),
                                  @pos, 255 ))
                    exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'AddStream', @iReturnValue OUT, @vchProcLinePiece
                    if @iReturn <> 0 GOTO E_OAError
                    select @pos = @pos + 255                  
                end
                select @iCurProcLine = @iCurProcLine + 1
            end
            drop table #ProcLines

            exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
													'CheckIn_StoredProcedure',
													NULL,
													@sProjectName = @vchProjectName,
													@sSourceSafeINI = @vchSourceSafeINI,
													@sServerName = @vchServerName,
													@sDatabaseName = @vchDatabaseName,
													@sObjectName = @vchObjectName,
													@sComment = @vchComment,
													@sLoginName = @vchLoginName,
													@sPassword = @vchPassword,
													@iVCSFlags = @iVCSFlags,
													@iActionFlag = @iActionFlag,
													@sStream = ''
        end

        if @iReturn <> 0 GOTO E_OAError

        if @iActionFlag = 1
        begin
            commit tran compile_all
            if @@error <> 0 GOTO E_Compile_Fail
        end

    end

CleanUp:
	return

E_Compile_Fail:
	declare @lerror int
	select @lerror = @@error
	rollback tran compile_all
	RAISERROR (@lerror,16,-1)
	goto CleanUp

E_OAError:
	if @iActionFlag = 1 rollback tran compile_all
	exec dbo.dt_displayoaerror @iObjectId, @iReturn
	goto CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkinobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255)='',
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)='',
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0,   /* 0 => AddFile, 1 => CheckIn */
    @txStream1     text = '',  /* drop stream   */ /* There is a bug that if items are NULL they do not pass to OLE servers */
    @txStream2     text = '',  /* create stream */
    @txStream3     text = ''   /* grant stream  */

as	
	-- This procedure should no longer be called;  dt_checkinobject should be called instead.
	-- Calls are forwarded to dt_checkinobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkinobject
		@chObjectType,
		@vchObjectName,
		@vchComment,
		@vchLoginName,
		@vchPassword,
		@iVCSFlags,
		@iActionFlag,   
		@txStream1,		
		@txStream2,		
		@txStream3		




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkoutobject
    @chObjectType  char(4),
    @vchObjectName varchar(255),
    @vchComment    varchar(255),
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId =0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @vchTempText varchar(255)

	/* this is for our strings */
	declare @iStreamObjectId int
	select @iStreamObjectId = 0

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        /* Procedure Can have up to three streams
           Drop Stream, Create Stream, GRANT stream */

        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'CheckOut_StoredProcedure',
												NULL,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sComment = @vchComment,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword,
												@iVCSFlags = @iVCSFlags,
												@iActionFlag = @iActionFlag

        if @iReturn <> 0 GOTO E_OAError


        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #commenttext (id int identity, sourcecode varchar(255))


        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #commenttext (sourcecode) select @vchTempText
        end

        select 'VCS'=sourcecode from #commenttext order by id
        select 'SQL'=text from syscomments where id = object_id(@vchObjectName) order by colid

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_checkoutobject_u
    @chObjectType  char(4),
    @vchObjectName nvarchar(255),
    @vchComment    nvarchar(255),
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255),
    @iVCSFlags     int = 0,
    @iActionFlag   int = 0/* 0 => Checkout, 1 => GetLatest, 2 => UndoCheckOut */

as

	-- This procedure should no longer be called;  dt_checkoutobject should be called instead.
	-- Calls are forwarded to dt_checkoutobject to maintain backward compatibility.
	set nocount on
	exec dbo.dt_checkoutobject
		@chObjectType,  
		@vchObjectName, 
		@vchComment,    
		@vchLoginName,  
		@vchPassword,  
		@iVCSFlags,    
		@iActionFlag 




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.dt_displayoaerror
    @iObject int,
    @iresult int
as

set nocount on

declare @vchOutput      varchar(255)
declare @hr             int
declare @vchSource      varchar(255)
declare @vchDescription varchar(255)

    exec @hr = master.dbo.sp_OAGetErrorInfo @iObject, @vchSource OUT, @vchDescription OUT

    select @vchOutput = @vchSource + ': ' + @vchDescription
    raiserror (@vchOutput,16,-1)

    return



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE dbo.dt_displayoaerror_u
    @iObject int,
    @iresult int
as
	-- This procedure should no longer be called;  dt_displayoaerror should be called instead.
	-- Calls are forwarded to dt_displayoaerror to maintain backward compatibility.
	set nocount on
	exec dbo.dt_displayoaerror
		@iObject,
		@iresult




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Drop one or all the associated properties of an object or an attribute 
**
**	dt_dropproperties objid, null or '' -- drop all properties of the object itself
**	dt_dropproperties objid, property -- drop the property
*/
create procedure dbo.dt_droppropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		delete from dbo.dtproperties where objectid=@id
	else
		delete from dbo.dtproperties 
			where objectid=@id and property=@property



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Drop an object from the dbo.dtproperties table
*/
create procedure dbo.dt_dropuserobjectbyid
	@id int
as
	set nocount on
	delete from dbo.dtproperties where objectid=@id


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/* 
**	Generate an ansi name that is unique in the dtproperties.value column 
*/ 
create procedure dbo.dt_generateansiname(@name varchar(255) output) 
as 
	declare @prologue varchar(20) 
	declare @indexstring varchar(20) 
	declare @index integer 
 
	set @prologue = 'MSDT-A-' 
	set @index = 1 
 
	while 1 = 1 
	begin 
		set @indexstring = cast(@index as varchar(20)) 
		set @name = @prologue + @indexstring 
		if not exists (select value from dtproperties where value = @name) 
			break 
		 
		set @index = @index + 1 
 
		if (@index = 10000) 
			goto TooMany 
	end 
 
Leave: 
 
	return 
 
TooMany: 
 
	set @name = 'DIAGRAM' 
	goto Leave 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop
	@property varchar(30),
	@value varchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@value is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and value=@value


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve the owner object(s) of a given property
*/
create procedure dbo.dt_getobjwithprop_u
	@property varchar(30),
	@uvalue nvarchar(255)
as
	set nocount on

	if (@property is null) or (@property = '')
	begin
		raiserror('Must specify a property name.',-1,-1)
		return (1)
	end

	if (@uvalue is null)
		select objectid id from dbo.dtproperties
			where property=@property

	else
		select objectid id from dbo.dtproperties
			where property=@property and uvalue=@uvalue


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, value, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	Retrieve properties by id's
**
**	dt_getproperties objid, null or '' -- retrieve all properties of the object itself
**	dt_getproperties objid, property -- retrieve the property specified
*/
create procedure dbo.dt_getpropertiesbyid_u
	@id int,
	@property varchar(64)
as
	set nocount on

	if (@property is null) or (@property = '')
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid
	else
		select property, version, uvalue, lvalue
			from dbo.dtproperties
			where  @id=objectid and @property=property


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_getpropertiesbyid_vcs
    @id       int,
    @property varchar(64),
    @value    varchar(255) = NULL OUT

as

    set nocount on

    select @value = (
        select value
                from dbo.dtproperties
                where @id=objectid and @property=property
                )



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_getpropertiesbyid_vcs_u
    @id       int,
    @property varchar(64),
    @value    nvarchar(255) = NULL OUT

as

    -- This procedure should no longer be called;  dt_getpropertiesbyid_vcsshould be called instead.
	-- Calls are forwarded to dt_getpropertiesbyid_vcs to maintain backward compatibility.
	set nocount on
    exec dbo.dt_getpropertiesbyid_vcs
		@id,
		@property,
		@value output



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_isundersourcecontrol
    @vchLoginName varchar(255) = '',
    @vchPassword  varchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as

	set nocount on

	declare @iReturn int
	declare @iObjectId int
	select @iObjectId = 0

	declare @VSSGUID varchar(100)
	select @VSSGUID = 'SQLVersionControl.VCS_SQL'

	declare @iReturnValue int
	select @iReturnValue = 0

	declare @iStreamObjectId int
	select @iStreamObjectId   = 0

	declare @vchTempText varchar(255)

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if (@vchProjectName = '')	set @vchProjectName		= null
    if (@vchSourceSafeINI = '') set @vchSourceSafeINI	= null
    if (@vchServerName = '')	set @vchServerName		= null
    if (@vchDatabaseName = '')	set @vchDatabaseName	= null
    
    if (@vchProjectName is null) or (@vchSourceSafeINI is null) or (@vchServerName is null) or (@vchDatabaseName is null)
    begin
        RAISERROR('Not Under Source Control',16,-1)
        return
    end

    if @iWhoToo = 1
    begin

        /* Get List of Procs in the project */
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'GetListOfObjects',
												NULL,
												@vchProjectName,
												@vchSourceSafeINI,
												@vchServerName,
												@vchDatabaseName,
												@vchLoginName,
												@vchPassword

        if @iReturn <> 0 GOTO E_OAError

        exec @iReturn = master.dbo.sp_OAGetProperty @iObjectId, 'GetStreamObject', @iStreamObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        create table #ObjectList (id int identity, vchObjectlist varchar(255))

        select @vchTempText = 'STUB'
        while @vchTempText is not null
        begin
            exec @iReturn = master.dbo.sp_OAMethod @iStreamObjectId, 'GetStream', @iReturnValue OUT, @vchTempText OUT
            if @iReturn <> 0 GOTO E_OAError
            
            if (@vchTempText = '') set @vchTempText = null
            if (@vchTempText is not null) insert into #ObjectList (vchObjectlist ) select @vchTempText
        end

        select vchObjectlist from #ObjectList order by id
    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    goto CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_isundersourcecontrol_u
    @vchLoginName nvarchar(255) = '',
    @vchPassword  nvarchar(255) = '',
    @iWhoToo      int = 0 /* 0 => Just check project; 1 => get list of objs */

as
	-- This procedure should no longer be called;  dt_isundersourcecontrol should be called instead.
	-- Calls are forwarded to dt_isundersourcecontrol to maintain backward compatibility.
	set nocount on
	exec dbo.dt_isundersourcecontrol
		@vchLoginName,
		@vchPassword,
		@iWhoToo 




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create procedure dbo.dt_removefromsourcecontrol

as

    set nocount on

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    exec dbo.dt_droppropertiesbyid @iPropertyObjectId, null

    /* -1 is returned by dt_droppopertiesbyid */
    if @@error <> 0 and @@error <> -1 return 1

    return 0




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		value -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid
	@id int,
	@property varchar(64),
	@value varchar(255),
	@lvalue image
as
	set nocount on
	declare @uvalue nvarchar(255) 
	set @uvalue = convert(nvarchar(255), @value) 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@value, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @value, @uvalue, @lvalue)
	end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	If the property already exists, reset the value; otherwise add property
**		id -- the id in sysobjects of the object
**		property -- the name of the property
**		uvalue -- the text value of the property
**		lvalue -- the binary value of the property (image)
*/
create procedure dbo.dt_setpropertybyid_u
	@id int,
	@property varchar(64),
	@uvalue nvarchar(255),
	@lvalue image
as
	set nocount on
	-- 
	-- If we are writing the name property, find the ansi equivalent. 
	-- If there is no lossless translation, generate an ansi name. 
	-- 
	declare @avalue varchar(255) 
	set @avalue = null 
	if (@uvalue is not null) 
	begin 
		if (convert(nvarchar(255), convert(varchar(255), @uvalue)) = @uvalue) 
		begin 
			set @avalue = convert(varchar(255), @uvalue) 
		end 
		else 
		begin 
			if 'DtgSchemaNAME' = @property 
			begin 
				exec dbo.dt_generateansiname @avalue output 
			end 
		end 
	end 
	if exists (select * from dbo.dtproperties 
			where objectid=@id and property=@property)
	begin
		--
		-- bump the version count for this row as we update it
		--
		update dbo.dtproperties set value=@avalue, uvalue=@uvalue, lvalue=@lvalue, version=version+1
			where objectid=@id and property=@property
	end
	else
	begin
		--
		-- version count is auto-set to 0 on initial insert
		--
		insert dbo.dtproperties (property, objectid, value, uvalue, lvalue)
			values (@property, @id, @avalue, @uvalue, @lvalue)
	end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_validateloginparams
    @vchLoginName  varchar(255),
    @vchPassword   varchar(255)
as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int
    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchSourceSafeINI varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT

    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 GOTO E_OAError

    exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
											'ValidateLoginParams',
											NULL,
											@sSourceSafeINI = @vchSourceSafeINI,
											@sLoginName = @vchLoginName,
											@sPassword = @vchPassword
    if @iReturn <> 0 GOTO E_OAError

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_validateloginparams_u
    @vchLoginName  nvarchar(255),
    @vchPassword   nvarchar(255)
as

	-- This procedure should no longer be called;  dt_validateloginparams should be called instead.
	-- Calls are forwarded to dt_validateloginparams to maintain backward compatibility.
	set nocount on
	exec dbo.dt_validateloginparams
		@vchLoginName,
		@vchPassword 




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_vcsenabled

as

set nocount on

declare @iObjectId int
select @iObjectId = 0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iReturn int
    exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT
    if @iReturn <> 0 raiserror('', 16, -1) /* Can't Load Helper DLLC */




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	This procedure returns the version number of the stored
**    procedures used by legacy versions of the Microsoft
**	Visual Database Tools.  Version is 7.0.00.
*/
create procedure dbo.dt_verstamp006
as
	select 7000


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/*
**	This procedure returns the version number of the stored
**    procedures used by the the Microsoft Visual Database Tools.
**	Version is 7.0.05.
*/
create procedure dbo.dt_verstamp007
as
	select 7005


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_whocheckedout
        @chObjectType  char(4),
        @vchObjectName varchar(255),
        @vchLoginName  varchar(255),
        @vchPassword   varchar(255)

as

set nocount on

declare @iReturn int
declare @iObjectId int
select @iObjectId =0

declare @VSSGUID varchar(100)
select @VSSGUID = 'SQLVersionControl.VCS_SQL'

    declare @iPropertyObjectId int

    select @iPropertyObjectId = (select objectid from dbo.dtproperties where property = 'VCSProjectID')

    declare @vchProjectName   varchar(255)
    declare @vchSourceSafeINI varchar(255)
    declare @vchServerName    varchar(255)
    declare @vchDatabaseName  varchar(255)
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSProject',       @vchProjectName   OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSourceSafeINI', @vchSourceSafeINI OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLServer',     @vchServerName    OUT
    exec dbo.dt_getpropertiesbyid_vcs @iPropertyObjectId, 'VCSSQLDatabase',   @vchDatabaseName  OUT

    if @chObjectType = 'PROC'
    begin
        exec @iReturn = master.dbo.sp_OACreate @VSSGUID, @iObjectId OUT

        if @iReturn <> 0 GOTO E_OAError

        declare @vchReturnValue varchar(255)
        select @vchReturnValue = ''

        exec @iReturn = master.dbo.sp_OAMethod @iObjectId,
												'WhoCheckedOut',
												@vchReturnValue OUT,
												@sProjectName = @vchProjectName,
												@sSourceSafeINI = @vchSourceSafeINI,
												@sObjectName = @vchObjectName,
												@sServerName = @vchServerName,
												@sDatabaseName = @vchDatabaseName,
												@sLoginName = @vchLoginName,
												@sPassword = @vchPassword

        if @iReturn <> 0 GOTO E_OAError

        select @vchReturnValue

    end

CleanUp:
    return

E_OAError:
    exec dbo.dt_displayoaerror @iObjectId, @iReturn
    GOTO CleanUp




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create proc dbo.dt_whocheckedout_u
        @chObjectType  char(4),
        @vchObjectName nvarchar(255),
        @vchLoginName  nvarchar(255),
        @vchPassword   nvarchar(255)

as

	-- This procedure should no longer be called;  dt_whocheckedout should be called instead.
	-- Calls are forwarded to dt_whocheckedout to maintain backward compatibility.
	set nocount on
	exec dbo.dt_whocheckedout
		@chObjectType, 
		@vchObjectName,
		@vchLoginName, 
		@vchPassword  




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


/*
名称:spAll_ReturnRows
输入:
输出:
调用:
  EXEC spAll_ReturnRows 'SELECT  * FROM 表名', 页号, 返回记录数, '主键', '排序字段'
  spAll_ReturnRows 'SELECT  * FROM all_Categories',2,10,'[ID]','[ID]'
说明:[百万级]通用存储过程.分页存储过程..返回指定返回条数、指定页数的记录

*/

CREATE PROCEDURE dbo.spAll_ReturnRows
(
@SQL nVARCHAR(4000),
@Page int,
@RecsPerPage int,
@ID VARCHAR(255),
@Sort VARCHAR(255)
)
AS

DECLARE @Str nVARCHAR(4000)

SET @Str='SELECT   TOP '+CAST(@RecsPerPage AS VARCHAR(20))+' * FROM ('+@SQL+') T WHERE T.'+@ID+' NOT IN
(SELECT   TOP '+CAST((@RecsPerPage*(@Page-1)) AS VARCHAR(20))+' '+@ID+' FROM ('+@SQL+') T9 ORDER BY '+@Sort+') ORDER BY '+@Sort

PRINT @Str

EXEC sp_ExecuteSql @Str

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


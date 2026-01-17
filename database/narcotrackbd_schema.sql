CREATE TABLE `ROLES` (
  `RoleID` int PRIMARY KEY,
  `RoleName` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `FORCES` (
  `ForceID` int PRIMARY KEY,
  `ForceName` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `ROLE_FORCE` (
  `RoleForceID` int PRIMARY KEY,
  `RoleID` int NOT NULL,
  `ForceID` int NOT NULL,
  `Rank` varchar(50) NOT NULL,
  `CanCreateAccount` boolean NOT NULL
);

CREATE TABLE `PERMISSIONS` (
  `PermissionID` int PRIMARY KEY,
  `PermissionCode` varchar(50) UNIQUE NOT NULL,
  `Description` varchar(100)
);

CREATE TABLE `ROLE_PERMISSIONS` (
  `RolePermissionID` int PRIMARY KEY,
  `RoleForceID` int NOT NULL,
  `PermissionID` int NOT NULL
);

CREATE TABLE `USERS` (
  `UserID` int PRIMARY KEY,
  `FullName` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) UNIQUE NOT NULL,
  `RoleID` int NOT NULL,
  `ForceID` int NOT NULL,
  `Status` varchar(20) NOT NULL,
  `CreatedAt` datetime NOT NULL
);

CREATE TABLE `USER_CREDENTIALS` (
  `CredentialID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `Username` varchar(50) UNIQUE NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `IsActive` boolean NOT NULL
);

CREATE TABLE `USER_DOCUMENTS` (
  `DocumentID` int PRIMARY KEY,
  `UserID` int NOT NULL,
  `DocumentType` varchar(50) NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `UploadedAt` datetime NOT NULL,
  `VerificationStatus` varchar(20) NOT NULL,
  `VerifiedBy` int,
  `VerifiedAt` datetime
);

CREATE TABLE `ADMIN_ZONE` (
  `ZoneID` int PRIMARY KEY,
  `ZoneName` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `DIVISION` (
  `DivisionID` int PRIMARY KEY,
  `DivisionName` varchar(50) UNIQUE NOT NULL
);

CREATE TABLE `DISTRICT` (
  `DistrictID` int PRIMARY KEY,
  `DivisionID` int NOT NULL,
  `DistrictName` varchar(50) NOT NULL
);

CREATE TABLE `THANA` (
  `ThanaID` int PRIMARY KEY,
  `DistrictID` int NOT NULL,
  `ThanaName` varchar(80) NOT NULL
);

CREATE TABLE `POLICE_DETAILS` (
  `PoliceID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `BadgeNumber` varchar(50) UNIQUE NOT NULL,
  `PostingDivisionID` int NOT NULL,
  `ZoneID` int NOT NULL,
  `ThanaID` int NOT NULL
);

CREATE TABLE `RAB_DETAILS` (
  `RabID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `Rank` varchar(30) NOT NULL,
  `RabBadgeNumber` varchar(50) UNIQUE NOT NULL,
  `Battalion` varchar(20) NOT NULL,
  `Wing` varchar(50) NOT NULL
);

CREATE TABLE `DNC_DETAILS` (
  `DncID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `BadgeNumber` varchar(50) UNIQUE NOT NULL,
  `PostingUnit` varchar(100) NOT NULL
);

CREATE TABLE `BGB_DETAILS` (
  `BgbID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `BadgeNumber` varchar(50) UNIQUE NOT NULL,
  `BattalionNumber` varchar(30) NOT NULL,
  `Sector` varchar(50) NOT NULL,
  `BorderArea` varchar(100) NOT NULL
);

CREATE TABLE `COAST_GUARD_DETAILS` (
  `CoastGuardID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `BadgeNumber` varchar(50) UNIQUE NOT NULL,
  `PostingUnit` varchar(100) NOT NULL
);

CREATE TABLE `CUSTOMS_DETAILS` (
  `CustomsID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `BadgeNumber` varchar(50) UNIQUE NOT NULL,
  `PostingStation` varchar(100) NOT NULL
);

CREATE TABLE `LAB_OFFICER_DETAILS` (
  `LabOfficerID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `LabName` varchar(100) NOT NULL,
  `PostingCity` varchar(50) NOT NULL
);

CREATE TABLE `ANALYST_DETAILS` (
  `AnalystID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `Department` varchar(100) NOT NULL,
  `AnalystCode` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `AUDITOR_DETAILS` (
  `AuditorID` int PRIMARY KEY,
  `UserID` int UNIQUE NOT NULL,
  `AuditorCode` varchar(30) UNIQUE NOT NULL
);

CREATE TABLE `CASE_FILE` (
  `CaseID` int PRIMARY KEY,
  `CaseNumber` varchar(50) UNIQUE NOT NULL,
  `CreatedBy` int NOT NULL,
  `Description` text,
  `CaseStatus` varchar(30) NOT NULL,
  `CreatedAt` datetime NOT NULL
);

CREATE TABLE `CASE_LOCATION` (
  `LocationID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `DivisionID` int NOT NULL,
  `DistrictID` int NOT NULL,
  `ThanaID` int NOT NULL
);

CREATE TABLE `SEIZURE` (
  `SeizureID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `SeizedByUserID` int NOT NULL,
  `SeizedTime` datetime NOT NULL
);

CREATE TABLE `EVIDENCE` (
  `EvidenceID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `DrugType` varchar(50) NOT NULL,
  `Quantity` float NOT NULL,
  `Weight` float NOT NULL,
  `SealNumber` varchar(30) UNIQUE NOT NULL,
  `PackagingDetails` varchar(100)
);

CREATE TABLE `DIGITAL_EVIDENCE` (
  `DigitalEvidenceID` int PRIMARY KEY,
  `EvidenceID` int NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `FileType` varchar(30) NOT NULL,
  `HashValue` varchar(255) UNIQUE NOT NULL,
  `UploadedBy` int NOT NULL
);

CREATE TABLE `CHAIN_OF_CUSTODY` (
  `TransferID` int PRIMARY KEY,
  `EvidenceID` int NOT NULL,
  `FromUser` int NOT NULL,
  `ToUser` int NOT NULL,
  `TransferTime` datetime NOT NULL,
  `Location` varchar(100) NOT NULL
);

CREATE TABLE `SUSPECT` (
  `SuspectID` int PRIMARY KEY,
  `Name` varchar(100) NOT NULL,
  `Age` int,
  `Gender` varchar(20) NOT NULL,
  `NID` varchar(30) UNIQUE,
  `Address` varchar(200)
);

CREATE TABLE `CASE_SUSPECT` (
  `CaseSuspectID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `SuspectID` int NOT NULL
);

CREATE TABLE `WITNESS` (
  `WitnessID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Statement` text
);

CREATE TABLE `LAB_REPORT` (
  `LabReportID` int PRIMARY KEY,
  `EvidenceID` int UNIQUE NOT NULL,
  `LabOfficerID` int NOT NULL,
  `Result` text NOT NULL,
  `Purity` float,
  `ReportTime` datetime NOT NULL
);

CREATE TABLE `TRAFFICKING_ROUTE` (
  `RouteID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `FromDistrictID` int NOT NULL,
  `ToDistrictID` int NOT NULL,
  `FrequencyScore` int,
  `PatternType` varchar(50)
);

CREATE TABLE `ANALYST_REPORT` (
  `AnalystReportID` int PRIMARY KEY,
  `AnalystID` int NOT NULL,
  `CaseID` int NOT NULL,
  `RouteID` int,
  `AnalysisResult` text NOT NULL
);

CREATE TABLE `GANG` (
  `GangID` int PRIMARY KEY,
  `GangName` varchar(50) UNIQUE NOT NULL,
  `Area` varchar(50)
);

CREATE TABLE `GANG_MEMBER` (
  `GangMemberID` int PRIMARY KEY,
  `GangID` int NOT NULL,
  `SuspectID` int NOT NULL,
  `RoleInGang` varchar(50)
);

CREATE TABLE `AUDIT_LOG` (
  `AuditID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `AuditorID` int NOT NULL,
  `Comments` text,
  `AuditStatus` varchar(20) NOT NULL,
  `AuditTime` datetime NOT NULL
);

CREATE TABLE `LEGAL_REPORT` (
  `ReportID` int PRIMARY KEY,
  `CaseID` int NOT NULL,
  `GeneratedBy` int NOT NULL,
  `PDFPath` varchar(255) NOT NULL,
  `GeneratedTime` datetime NOT NULL
);

CREATE TABLE `SUPER_ADMIN` (
  `SuperAdminID` int PRIMARY KEY,
  `FullName` varchar(100) NOT NULL,
  `AuthorityName` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL
);

CREATE TABLE `DISTRICT_ADMIN` (
  `DistrictAdminID` int PRIMARY KEY,
  `FullName` varchar(100) NOT NULL,
  `DistrictID` int NOT NULL,
  `AuthorityOffice` varchar(100) NOT NULL,
  `CreatedBySuperAdmin` int NOT NULL,
  `CreatedAt` datetime NOT NULL
);

CREATE TABLE `UNIT_ADMIN` (
  `UnitAdminID` int PRIMARY KEY,
  `UserID` int UNIQUE,
  `ForceID` int,
  `UnitType` varchar(30),
  `UnitID` int,
  `CreatedAt` datetime
);

ALTER TABLE `ROLE_FORCE` ADD FOREIGN KEY (`RoleID`) REFERENCES `ROLES` (`RoleID`);

ALTER TABLE `ROLE_FORCE` ADD FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

ALTER TABLE `ROLE_PERMISSIONS` ADD FOREIGN KEY (`RoleForceID`) REFERENCES `ROLE_FORCE` (`RoleForceID`);

ALTER TABLE `ROLE_PERMISSIONS` ADD FOREIGN KEY (`PermissionID`) REFERENCES `PERMISSIONS` (`PermissionID`);

ALTER TABLE `USERS` ADD FOREIGN KEY (`RoleID`) REFERENCES `ROLES` (`RoleID`);

ALTER TABLE `USERS` ADD FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

ALTER TABLE `USER_CREDENTIALS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `USER_DOCUMENTS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `USER_DOCUMENTS` ADD FOREIGN KEY (`VerifiedBy`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `DISTRICT` ADD FOREIGN KEY (`DivisionID`) REFERENCES `DIVISION` (`DivisionID`);

ALTER TABLE `THANA` ADD FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

ALTER TABLE `POLICE_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `POLICE_DETAILS` ADD FOREIGN KEY (`PostingDivisionID`) REFERENCES `DIVISION` (`DivisionID`);

ALTER TABLE `POLICE_DETAILS` ADD FOREIGN KEY (`ZoneID`) REFERENCES `ADMIN_ZONE` (`ZoneID`);

ALTER TABLE `POLICE_DETAILS` ADD FOREIGN KEY (`ThanaID`) REFERENCES `THANA` (`ThanaID`);

ALTER TABLE `RAB_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `DNC_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `BGB_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `COAST_GUARD_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CUSTOMS_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `LAB_OFFICER_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `ANALYST_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `AUDITOR_DETAILS` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CASE_FILE` ADD FOREIGN KEY (`CreatedBy`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CASE_LOCATION` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `CASE_LOCATION` ADD FOREIGN KEY (`DivisionID`) REFERENCES `DIVISION` (`DivisionID`);

ALTER TABLE `CASE_LOCATION` ADD FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

ALTER TABLE `CASE_LOCATION` ADD FOREIGN KEY (`ThanaID`) REFERENCES `THANA` (`ThanaID`);

ALTER TABLE `SEIZURE` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `SEIZURE` ADD FOREIGN KEY (`SeizedByUserID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `EVIDENCE` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `DIGITAL_EVIDENCE` ADD FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`);

ALTER TABLE `DIGITAL_EVIDENCE` ADD FOREIGN KEY (`UploadedBy`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CHAIN_OF_CUSTODY` ADD FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`);

ALTER TABLE `CHAIN_OF_CUSTODY` ADD FOREIGN KEY (`FromUser`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CHAIN_OF_CUSTODY` ADD FOREIGN KEY (`ToUser`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `CASE_SUSPECT` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `CASE_SUSPECT` ADD FOREIGN KEY (`SuspectID`) REFERENCES `SUSPECT` (`SuspectID`);

ALTER TABLE `WITNESS` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `LAB_REPORT` ADD FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`);

ALTER TABLE `LAB_REPORT` ADD FOREIGN KEY (`LabOfficerID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `TRAFFICKING_ROUTE` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `TRAFFICKING_ROUTE` ADD FOREIGN KEY (`FromDistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

ALTER TABLE `TRAFFICKING_ROUTE` ADD FOREIGN KEY (`ToDistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

ALTER TABLE `ANALYST_REPORT` ADD FOREIGN KEY (`AnalystID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `ANALYST_REPORT` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `ANALYST_REPORT` ADD FOREIGN KEY (`RouteID`) REFERENCES `TRAFFICKING_ROUTE` (`RouteID`);

ALTER TABLE `GANG_MEMBER` ADD FOREIGN KEY (`GangID`) REFERENCES `GANG` (`GangID`);

ALTER TABLE `GANG_MEMBER` ADD FOREIGN KEY (`SuspectID`) REFERENCES `SUSPECT` (`SuspectID`);

ALTER TABLE `AUDIT_LOG` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `AUDIT_LOG` ADD FOREIGN KEY (`AuditorID`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `LEGAL_REPORT` ADD FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

ALTER TABLE `LEGAL_REPORT` ADD FOREIGN KEY (`GeneratedBy`) REFERENCES `USERS` (`UserID`);

ALTER TABLE `DISTRICT_ADMIN` ADD FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

ALTER TABLE `DISTRICT_ADMIN` ADD FOREIGN KEY (`CreatedBySuperAdmin`) REFERENCES `SUPER_ADMIN` (`SuperAdminID`);

ALTER TABLE `UNIT_ADMIN` ADD FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

ALTER TABLE `UNIT_ADMIN` ADD FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2019 at 10:08 AM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shule`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_class_levels`
--

CREATE TABLE `academic_class_levels` (
  `AcademicClassLevelId` int(11) NOT NULL,
  `AcademicClassLevelName` varchar(5000) NOT NULL,
  `AcademicClassLevelDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actual_terms`
--

CREATE TABLE `actual_terms` (
  `ActualTermId` int(11) NOT NULL,
  `TermIterationId` int(11) NOT NULL,
  `TermStartDate` datetime NOT NULL,
  `TermEndDate` datetime NOT NULL,
  `Year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actual_term_information`
--

CREATE TABLE `actual_term_information` (
  `ActualTermInformationId` int(11) NOT NULL,
  `ActualTermInformationTypeId` int(11) NOT NULL,
  `ActualTermId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actual_term_information_types`
--

CREATE TABLE `actual_term_information_types` (
  `ActualTermInformationTypeId` int(11) NOT NULL,
  `ActualTermInformationTypeCategoryId` int(11) NOT NULL,
  `TypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actual_term_information_type_categories`
--

CREATE TABLE `actual_term_information_type_categories` (
  `ActualTermInformationTypeCategoryId` int(11) NOT NULL,
  `Description` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `actual_weeks`
--

CREATE TABLE `actual_weeks` (
  `ActualWeekId` int(11) NOT NULL,
  `WeekIterationId` int(11) NOT NULL,
  `ActualTermId` int(11) NOT NULL,
  `WeekStartDate` datetime NOT NULL,
  `WeekEndDate` datetime NOT NULL,
  `InspectionFlag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassId` int(11) NOT NULL,
  `AcademicClassLevelId` int(11) NOT NULL,
  `ClassStreamId` int(11) NOT NULL,
  `ClassNickName` varchar(5000) NOT NULL,
  `ClassDescription` varchar(9000) NOT NULL,
  `PhysicalAddress` varchar(9000) NOT NULL,
  `ClassRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_prefect_relationship`
--

CREATE TABLE `class_prefect_relationship` (
  `ClassPrefectRelationshipId` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `PrefectId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_specific_subjects`
--

CREATE TABLE `class_specific_subjects` (
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `ClassId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_specific_subject_information`
--

CREATE TABLE `class_specific_subject_information` (
  `ClassSpecificSubjectInformationId` int(11) NOT NULL,
  `CSSITId` int(11) NOT NULL,
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_specific_subject_information_types`
--

CREATE TABLE `class_specific_subject_information_types` (
  `CSSITId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_streams`
--

CREATE TABLE `class_streams` (
  `ClassStreamId` int(11) NOT NULL,
  `ClassStreamName` varchar(5000) NOT NULL,
  `ClassStreamDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_teachers`
--

CREATE TABLE `class_teachers` (
  `ClassTeacherId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `ClassId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_teachers_class_specific_subjects`
--

CREATE TABLE `class_teachers_class_specific_subjects` (
  `ClassTeachersClassSpecificSubjectId` int(11) NOT NULL,
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `ClassTeacherId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher_class_specific_subject_information`
--

CREATE TABLE `class_teacher_class_specific_subject_information` (
  `CTCSSInformationId` int(11) NOT NULL,
  `InformationTypeId` int(11) NOT NULL,
  `ClassTeachersClassSpecificSubjectId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher_class_specific_subject_information_types`
--

CREATE TABLE `class_teacher_class_specific_subject_information_types` (
  `InformationTypeId` int(11) NOT NULL,
  `TypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_text_books`
--

CREATE TABLE `class_text_books` (
  `ClassTextBookId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `FieldId` int(11) NOT NULL,
  `AcademicClassLevelId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentId` int(11) NOT NULL,
  `DepartmentTypeId` int(11) NOT NULL,
  `DepartmentName` varchar(5000) NOT NULL,
  `DepartmentDescription` varchar(9000) NOT NULL,
  `DepartmentRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department_types`
--

CREATE TABLE `department_types` (
  `DepartmentTypeId` int(11) NOT NULL,
  `DepartmentTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dormitories`
--

CREATE TABLE `dormitories` (
  `DormitoryId` int(11) NOT NULL,
  `DormitoryName` varchar(900) NOT NULL,
  `PhysicalAddress` varchar(9000) NOT NULL,
  `DormitoryDescription` varchar(9000) NOT NULL,
  `DormitoryRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory_individual_qualities`
--

CREATE TABLE `dormitory_individual_qualities` (
  `DormitoryIndividualQualityId` int(11) NOT NULL,
  `DormitoryId` int(11) NOT NULL,
  `DormitoryTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory_information`
--

CREATE TABLE `dormitory_information` (
  `DormitoryInformationId` int(11) NOT NULL,
  `DormitoryInformationTypeId` int(11) NOT NULL,
  `DormitoryId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory_information_types`
--

CREATE TABLE `dormitory_information_types` (
  `DormitoryInformationTypeId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dormitory_types`
--

CREATE TABLE `dormitory_types` (
  `DormitoryTypeId` int(11) NOT NULL,
  `DormitoryTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duty_configurations`
--

CREATE TABLE `duty_configurations` (
  `DutyConfigurationId` int(11) NOT NULL,
  `DutyTypeId` int(11) NOT NULL,
  `ActualWeekId` int(11) NOT NULL,
  `DutyDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duty_types`
--

CREATE TABLE `duty_types` (
  `DutyTypeId` int(11) NOT NULL,
  `DutyTypeCategoryId` int(11) NOT NULL,
  `DutyTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duty_type_categories`
--

CREATE TABLE `duty_type_categories` (
  `DutyTypeCategoryId` int(11) NOT NULL,
  `DutyTypeCategoryDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `ExamId` int(11) NOT NULL,
  `ExamTypeId` int(11) NOT NULL,
  `ActualTermId` int(11) NOT NULL,
  `ExamStartDate` datetime NOT NULL,
  `ExamEndDate` datetime NOT NULL,
  `ConfiguredBy` int(11) NOT NULL,
  `ConfigurationDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_information`
--

CREATE TABLE `exam_information` (
  `ExamInformationId` int(11) NOT NULL,
  `ExamInformationTypeId` int(11) NOT NULL,
  `ExamId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_information_types`
--

CREATE TABLE `exam_information_types` (
  `ExamInformationTypeId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_papers`
--

CREATE TABLE `exam_papers` (
  `ExamPaperId` int(11) NOT NULL,
  `ExamId` int(11) NOT NULL,
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `ExamPaperStartDate` datetime NOT NULL,
  `ExamPaperEndDate` datetime NOT NULL,
  `ConfiguredBy` int(11) NOT NULL,
  `ConfigurationDate` datetime NOT NULL,
  `WasItDone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

CREATE TABLE `exam_type` (
  `ExamTypeId` int(11) NOT NULL,
  `ExamTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fields_`
--

CREATE TABLE `fields_` (
  `fieldId` int(11) NOT NULL,
  `FieldCategoryId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `FieldName` varchar(900) NOT NULL,
  `FieldDescription` varchar(9000) NOT NULL,
  `FieldRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field_categories`
--

CREATE TABLE `field_categories` (
  `FieldCategoryId` int(11) NOT NULL,
  `FieldCategoryDescription` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field_grade_configuration`
--

CREATE TABLE `field_grade_configuration` (
  `FieldGradeConfigurationId` int(11) NOT NULL,
  `FieldId` int(11) NOT NULL,
  `AcademicClassLevelId` int(11) NOT NULL,
  `LowerBound` int(11) NOT NULL,
  `UpperBound` int(11) NOT NULL,
  `Grade` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `LessonId` int(11) NOT NULL,
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `LessonStartDate` datetime NOT NULL,
  `LessonEndDate` datetime NOT NULL,
  `DidTeacherAttend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `library_fields`
--

CREATE TABLE `library_fields` (
  `LibraryFieldId` int(11) NOT NULL,
  `LibraryFieldName` varchar(900) NOT NULL,
  `LibraryFieldDescription` varchar(9000) NOT NULL,
  `LibraryFieldRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_configuration`
--

CREATE TABLE `location_configuration` (
  `LocationConfigurationId` int(11) NOT NULL,
  `LocationTypeId` int(11) NOT NULL,
  `LocationRefNo` varchar(900) NOT NULL,
  `LocationDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location_types`
--

CREATE TABLE `location_types` (
  `LocationTypeId` int(11) NOT NULL,
  `LocationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_catalogue`
--

CREATE TABLE `master_catalogue` (
  `MasterCatalogueId` int(11) NOT NULL,
  `LibraryFieldId` int(11) NOT NULL,
  `LocationConfigurationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefects`
--

CREATE TABLE `prefects` (
  `PrefectId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefects_duty_roster`
--

CREATE TABLE `prefects_duty_roster` (
  `PrefectDutyRosterId` int(11) NOT NULL,
  `PrefectId` int(11) NOT NULL,
  `DutyConfigurationId` int(11) NOT NULL,
  `WasDutyDone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefects_on_duty_information_types`
--

CREATE TABLE `prefects_on_duty_information_types` (
  `PrefectOnDutyInformationTypeId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_individual_qualities`
--

CREATE TABLE `prefect_individual_qualities` (
  `PrefectIndividualQualityId` int(11) NOT NULL,
  `PrefectId` int(11) NOT NULL,
  `PrefectTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_on_duty_information`
--

CREATE TABLE `prefect_on_duty_information` (
  `PrefectOnDutyInformationId` int(11) NOT NULL,
  `PrefectOnDutyInformationTypeId` int(11) NOT NULL,
  `PrefectDutyRosterId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_team_leads`
--

CREATE TABLE `prefect_team_leads` (
  `PrefectTeamLeadId` int(11) NOT NULL,
  `PrefectId` int(11) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_team_lead_roles`
--

CREATE TABLE `prefect_team_lead_roles` (
  `PrefectTeamLeadRoleId` int(11) NOT NULL,
  `PrefectTeamLeadId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_team_members`
--

CREATE TABLE `prefect_team_members` (
  `PrefectTeamMemberId` int(11) NOT NULL,
  `PrefectId` int(11) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_team_member_roles`
--

CREATE TABLE `prefect_team_member_roles` (
  `PrefectTeamMemberRoleId` int(11) NOT NULL,
  `PrefectTeamMemberId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_types`
--

CREATE TABLE `prefect_types` (
  `PrefectTypeId` int(11) NOT NULL,
  `PrefectTypeCategoryId` int(11) NOT NULL,
  `PrefectTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prefect_type_categories`
--

CREATE TABLE `prefect_type_categories` (
  `PrefectTypeCategoryId` int(11) NOT NULL,
  `CategoryDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `ResourceId` int(11) NOT NULL,
  `ResourceName` varchar(900) NOT NULL,
  `ResourceDescription` varchar(9000) NOT NULL,
  `ResourceRefNo` varchar(900) NOT NULL,
  `AdmissionDate` datetime NOT NULL,
  `ResourceCondition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_authors`
--

CREATE TABLE `resource_authors` (
  `ResourceAuthorId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `AuthorName` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_catalogue`
--

CREATE TABLE `resource_catalogue` (
  `ResourceCatalogueId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `SubLocationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_individual_qualities`
--

CREATE TABLE `resource_individual_qualities` (
  `ResourceIndividualQualityId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `ResourceTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_publishers`
--

CREATE TABLE `resource_publishers` (
  `ResourcePublisherId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `PublisherName` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_rule_statements`
--

CREATE TABLE `resource_rule_statements` (
  `ResourceRuleStatementId` int(11) NOT NULL,
  `RuleAspectId` int(11) NOT NULL,
  `ResourceTypeId` int(11) NOT NULL,
  `Statement` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_types`
--

CREATE TABLE `resource_types` (
  `ResourceTypeId` int(11) NOT NULL,
  `ResourceTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `RoleCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rule_aspects`
--

CREATE TABLE `rule_aspects` (
  `RuleAspectId` int(11) NOT NULL,
  `RuleAspectDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specific_student_exam_papers`
--

CREATE TABLE `specific_student_exam_papers` (
  `SpecificStudentExamPaperId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `ExamPaperId` int(11) NOT NULL,
  `Marks` int(11) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specific_student_exam_papers_information`
--

CREATE TABLE `specific_student_exam_papers_information` (
  `SSEPIId` int(11) NOT NULL,
  `SSEPITId` int(11) NOT NULL,
  `SPecificStudentExamPaperId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specific_student_exam_papers_information_types`
--

CREATE TABLE `specific_student_exam_papers_information_types` (
  `SSEPITId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_department_relationship`
--

CREATE TABLE `staff_department_relationship` (
  `StaffDepartmentRelationshipId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_individual_qualities`
--

CREATE TABLE `staff_individual_qualities` (
  `StaffIndividualQualityId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `StaffTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_members`
--

CREATE TABLE `staff_members` (
  `StaffMemberId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `FirstName` varchar(900) NOT NULL,
  `MiddleName` varchar(900) NOT NULL,
  `Surname` varchar(900) NOT NULL,
  `Gender` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `NationalId` varchar(900) NOT NULL,
  `Email` varchar(900) NOT NULL,
  `PhysicalAddress` varchar(9000) NOT NULL,
  `EncryptedPassword` varchar(9000) NOT NULL,
  `Salt` varchar(9000) NOT NULL,
  `EmploymentDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_member_roles`
--

CREATE TABLE `staff_member_roles` (
  `StaffMemberRoleId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_records`
--

CREATE TABLE `staff_records` (
  `StaffRecordId` int(11) NOT NULL,
  `StaffRecordTypeId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `Record` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_record_types`
--

CREATE TABLE `staff_record_types` (
  `StaffRecordTypeId` int(11) NOT NULL,
  `Description` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_resource_leasing`
--

CREATE TABLE `staff_resource_leasing` (
  `StaffResourceLeasingId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `LeasedBy` int(11) NOT NULL,
  `LeasedDate` datetime NOT NULL,
  `ExpectedReturnDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_resource_leasing_information`
--

CREATE TABLE `staff_resource_leasing_information` (
  `StaffRLIId` int(11) NOT NULL,
  `StaffRLITId` int(11) NOT NULL,
  `StaffResourceLeasingId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_resource_leasing_information_types`
--

CREATE TABLE `staff_resource_leasing_information_types` (
  `StaffRLITId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_team_leads`
--

CREATE TABLE `staff_team_leads` (
  `StaffTeamLeadId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_team_lead_roles`
--

CREATE TABLE `staff_team_lead_roles` (
  `StaffTeamLeadRoleId` int(11) NOT NULL,
  `StaffTeamLeadId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_team_members`
--

CREATE TABLE `staff_team_members` (
  `StaffTeamMemberId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_team_member_roles`
--

CREATE TABLE `staff_team_member_roles` (
  `StaffTeamMemberRoleId` int(11) NOT NULL,
  `StaffTeamMemberId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_types`
--

CREATE TABLE `staff_types` (
  `StaffTypeId` int(11) NOT NULL,
  `StaffTypeCategoryId` int(11) NOT NULL,
  `StaffTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_type_categories`
--

CREATE TABLE `staff_type_categories` (
  `StaffTypeCategoryId` int(11) NOT NULL,
  `CategoryDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `FirstName` varchar(900) NOT NULL,
  `MiddleName` varchar(900) NOT NULL,
  `Surname` varchar(900) NOT NULL,
  `Gender` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `DormitoryId` int(11) NOT NULL,
  `AdmissionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students_class_duty_roster`
--

CREATE TABLE `students_class_duty_roster` (
  `StudentClassDutyRosterId` int(11) NOT NULL,
  `StudentsClassDutyRosterTypeId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `DutyConfigurationId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students_class_duty_roster_types`
--

CREATE TABLE `students_class_duty_roster_types` (
  `StudentsClassDutyRosterTypeId` int(11) NOT NULL,
  `Description` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_class_specific_subject_information`
--

CREATE TABLE `student_class_specific_subject_information` (
  `SCSSIId` int(11) NOT NULL,
  `SCSSITId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_class_specific_subject_rship`
--

CREATE TABLE `student_class_specific_subject_rship` (
  `SCSSRId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `ClassSpecificSubjectId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_class_subject_specific_information_types`
--

CREATE TABLE `student_class_subject_specific_information_types` (
  `SCSSITId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_guardian`
--

CREATE TABLE `student_guardian` (
  `StudentGuardianId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `FirstName` varchar(1000) NOT NULL,
  `MiddleName` varchar(1000) NOT NULL,
  `Surname` varchar(1000) NOT NULL,
  `PhoneNumber` varchar(1000) NOT NULL,
  `Email` varchar(1000) NOT NULL,
  `Gender` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `NationalId` varchar(1000) NOT NULL,
  `PhysicalAddress` varchar(9000) NOT NULL,
  `StudentGuardianRelationship` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_individual_qualities`
--

CREATE TABLE `student_individual_qualities` (
  `StudentIndividualQualityId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `StudentTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_records`
--

CREATE TABLE `student_records` (
  `StudentRecordId` int(11) NOT NULL,
  `StudentRecordTypeId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `Record` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_record_types`
--

CREATE TABLE `student_record_types` (
  `StudentRecordTypeId` int(11) NOT NULL,
  `RecordTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_resource_leasing`
--

CREATE TABLE `student_resource_leasing` (
  `StudentResourceLeasingId` int(11) NOT NULL,
  `ResourceId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `LeasedBy` int(11) NOT NULL,
  `LeasedDate` datetime NOT NULL,
  `ExpectedReturnDate` datetime NOT NULL,
  `WasResourceReturned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_resource_leasing_information`
--

CREATE TABLE `student_resource_leasing_information` (
  `SRLIId` int(11) NOT NULL,
  `SRLITId` int(11) NOT NULL,
  `StudentResourceLeasingId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_resource_leasing_information_types`
--

CREATE TABLE `student_resource_leasing_information_types` (
  `SRLITId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_team_leads`
--

CREATE TABLE `student_team_leads` (
  `StudentTeamLeadId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_team_lead_roles`
--

CREATE TABLE `student_team_lead_roles` (
  `StudentTeamLeadRoleId` int(11) NOT NULL,
  `StudentTeamLeadId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_team_members`
--

CREATE TABLE `student_team_members` (
  `StudentTeamMemberId` int(11) NOT NULL,
  `AdmissionNo` varchar(900) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_team_member_roles`
--

CREATE TABLE `student_team_member_roles` (
  `StudentTeamMemberRoleId` int(11) NOT NULL,
  `StudentTeamMemberId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `Done` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_types`
--

CREATE TABLE `student_types` (
  `StudentTypeId` int(11) NOT NULL,
  `StudentTypeCategoryId` int(11) NOT NULL,
  `StudentTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_type_categories`
--

CREATE TABLE `student_type_categories` (
  `StudentTypeCategoryId` int(11) NOT NULL,
  `CategoryDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `SubjectId` int(11) NOT NULL,
  `FieldId` int(11) NOT NULL,
  `SubjectName` varchar(900) NOT NULL,
  `SubjectDescription` varchar(9000) NOT NULL,
  `SubjectRefNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject_categories`
--

CREATE TABLE `subject_categories` (
  `SubjectCategoryId` int(11) NOT NULL,
  `SubjectCategoryDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_locations`
--

CREATE TABLE `sub_locations` (
  `SubLocationId` int(11) NOT NULL,
  `LocationConfigurationId` int(11) NOT NULL,
  `SubLocationRefNo` varchar(900) NOT NULL,
  `SubLocationDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teachers_duty_roster`
--

CREATE TABLE `teachers_duty_roster` (
  `TeacherDutyRosterId` int(11) NOT NULL,
  `ClassTeacherId` int(11) NOT NULL,
  `DutyConfigurationId` int(11) NOT NULL,
  `WasDutyPerformed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_on_duty_information`
--

CREATE TABLE `teacher_on_duty_information` (
  `TeacherOnDutyInformationId` int(11) NOT NULL,
  `TeacherOnDutyInformationTypeId` int(11) NOT NULL,
  `TeacherDutyRosterId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedDate` int(11) NOT NULL,
  `RecordedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_on_duty_information_types`
--

CREATE TABLE `teacher_on_duty_information_types` (
  `TeacherOnDutyInformationTypeId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_on_duty_staff_records`
--

CREATE TABLE `teacher_on_duty_staff_records` (
  `TeacherOnDutyStaffRecordId` int(11) NOT NULL,
  `TeacherDutyRosterId` int(11) NOT NULL,
  `StaffNo` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_on_duty_student_record`
--

CREATE TABLE `teacher_on_duty_student_record` (
  `TeacherOnDutyRecordStudentRecordRshipId` int(11) NOT NULL,
  `TeacherDutyRosterId` int(11) NOT NULL,
  `StudentRecordId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_configuration`
--

CREATE TABLE `team_configuration` (
  `TeamId` int(11) NOT NULL,
  `TeamName` varchar(900) NOT NULL,
  `TeamDescription` varchar(9000) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_duty_roster`
--

CREATE TABLE `team_duty_roster` (
  `TeamDutyRosterId` int(11) NOT NULL,
  `TeamId` int(11) NOT NULL,
  `DutyConfigurationId` int(11) NOT NULL,
  `DutyStartDate` datetime NOT NULL,
  `DutyEndDate` datetime NOT NULL,
  `AssignedBy` int(11) NOT NULL,
  `AssignedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_duty_roster_information`
--

CREATE TABLE `team_duty_roster_information` (
  `TeamDutyRosterInformationId` int(11) NOT NULL,
  `TeamDutyRosterInformationTypeId` int(11) NOT NULL,
  `TeamDutyRosterId` int(11) NOT NULL,
  `Information` varchar(9000) NOT NULL,
  `RecordedBy` int(11) NOT NULL,
  `RecordedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_duty_roster_information_types`
--

CREATE TABLE `team_duty_roster_information_types` (
  `TeamDutyRosterInformationTypeId` int(11) NOT NULL,
  `InformationTypeDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `term_iterations`
--

CREATE TABLE `term_iterations` (
  `TermIterationId` int(11) NOT NULL,
  `IterationDescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `week_iterations`
--

CREATE TABLE `week_iterations` (
  `WeekIterationId` int(11) NOT NULL,
  `WeekIterationDescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_class_levels`
--
ALTER TABLE `academic_class_levels`
  ADD PRIMARY KEY (`AcademicClassLevelId`);

--
-- Indexes for table `actual_terms`
--
ALTER TABLE `actual_terms`
  ADD PRIMARY KEY (`ActualTermId`),
  ADD KEY `TermIterationId` (`TermIterationId`);

--
-- Indexes for table `actual_term_information`
--
ALTER TABLE `actual_term_information`
  ADD PRIMARY KEY (`ActualTermInformationId`),
  ADD KEY `ActualTermInformationTypeId` (`ActualTermInformationTypeId`),
  ADD KEY `ActualTermId` (`ActualTermId`);

--
-- Indexes for table `actual_term_information_types`
--
ALTER TABLE `actual_term_information_types`
  ADD PRIMARY KEY (`ActualTermInformationTypeId`),
  ADD KEY `ActualTermInformationTypeCategoryId` (`ActualTermInformationTypeCategoryId`);

--
-- Indexes for table `actual_term_information_type_categories`
--
ALTER TABLE `actual_term_information_type_categories`
  ADD PRIMARY KEY (`ActualTermInformationTypeCategoryId`);

--
-- Indexes for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  ADD PRIMARY KEY (`ActualWeekId`),
  ADD KEY `WeekIterationId` (`WeekIterationId`),
  ADD KEY `ActualTermId` (`ActualTermId`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassId`),
  ADD KEY `AcademicClassLevelId` (`AcademicClassLevelId`),
  ADD KEY `ClassStreamId` (`ClassStreamId`);

--
-- Indexes for table `class_prefect_relationship`
--
ALTER TABLE `class_prefect_relationship`
  ADD PRIMARY KEY (`ClassPrefectRelationshipId`),
  ADD KEY `ClassId` (`ClassId`),
  ADD KEY `PrefectId` (`PrefectId`);

--
-- Indexes for table `class_specific_subjects`
--
ALTER TABLE `class_specific_subjects`
  ADD PRIMARY KEY (`ClassSpecificSubjectId`),
  ADD KEY `SubjectId` (`SubjectId`),
  ADD KEY `ClassId` (`ClassId`);

--
-- Indexes for table `class_specific_subject_information`
--
ALTER TABLE `class_specific_subject_information`
  ADD PRIMARY KEY (`ClassSpecificSubjectInformationId`),
  ADD KEY `CSSITId` (`CSSITId`),
  ADD KEY `ClassSpecificSubjectId` (`ClassSpecificSubjectId`);

--
-- Indexes for table `class_specific_subject_information_types`
--
ALTER TABLE `class_specific_subject_information_types`
  ADD PRIMARY KEY (`CSSITId`);

--
-- Indexes for table `class_streams`
--
ALTER TABLE `class_streams`
  ADD PRIMARY KEY (`ClassStreamId`);

--
-- Indexes for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD PRIMARY KEY (`ClassTeacherId`),
  ADD KEY `StaffNo` (`StaffNo`),
  ADD KEY `ClassId` (`ClassId`);

--
-- Indexes for table `class_teachers_class_specific_subjects`
--
ALTER TABLE `class_teachers_class_specific_subjects`
  ADD PRIMARY KEY (`ClassTeachersClassSpecificSubjectId`),
  ADD KEY `ClassSpecificSubjectId` (`ClassSpecificSubjectId`),
  ADD KEY `ClassTeacherId` (`ClassTeacherId`);

--
-- Indexes for table `class_teacher_class_specific_subject_information`
--
ALTER TABLE `class_teacher_class_specific_subject_information`
  ADD PRIMARY KEY (`CTCSSInformationId`),
  ADD KEY `InformationTypeId` (`InformationTypeId`),
  ADD KEY `ClassTeachersClassSpecificSubjectId` (`ClassTeachersClassSpecificSubjectId`);

--
-- Indexes for table `class_teacher_class_specific_subject_information_types`
--
ALTER TABLE `class_teacher_class_specific_subject_information_types`
  ADD PRIMARY KEY (`InformationTypeId`);

--
-- Indexes for table `class_text_books`
--
ALTER TABLE `class_text_books`
  ADD PRIMARY KEY (`ClassTextBookId`),
  ADD KEY `ResourceId` (`ResourceId`),
  ADD KEY `FieldId` (`FieldId`),
  ADD KEY `AcademicClassLevelId` (`AcademicClassLevelId`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentId`),
  ADD KEY `DepartmentTypeId` (`DepartmentTypeId`);

--
-- Indexes for table `department_types`
--
ALTER TABLE `department_types`
  ADD PRIMARY KEY (`DepartmentTypeId`);

--
-- Indexes for table `dormitories`
--
ALTER TABLE `dormitories`
  ADD PRIMARY KEY (`DormitoryId`);

--
-- Indexes for table `dormitory_individual_qualities`
--
ALTER TABLE `dormitory_individual_qualities`
  ADD PRIMARY KEY (`DormitoryIndividualQualityId`),
  ADD KEY `DormitoryId` (`DormitoryId`),
  ADD KEY `DormitoryTypeId` (`DormitoryTypeId`);

--
-- Indexes for table `dormitory_information`
--
ALTER TABLE `dormitory_information`
  ADD PRIMARY KEY (`DormitoryInformationId`),
  ADD KEY `DormitoryInformationTypeId` (`DormitoryInformationTypeId`),
  ADD KEY `DormitoryId` (`DormitoryId`);

--
-- Indexes for table `dormitory_information_types`
--
ALTER TABLE `dormitory_information_types`
  ADD PRIMARY KEY (`DormitoryInformationTypeId`);

--
-- Indexes for table `dormitory_types`
--
ALTER TABLE `dormitory_types`
  ADD PRIMARY KEY (`DormitoryTypeId`);

--
-- Indexes for table `duty_configurations`
--
ALTER TABLE `duty_configurations`
  ADD PRIMARY KEY (`DutyConfigurationId`),
  ADD KEY `DutyTypeId` (`DutyTypeId`),
  ADD KEY `ActualWeekId` (`ActualWeekId`);

--
-- Indexes for table `duty_types`
--
ALTER TABLE `duty_types`
  ADD PRIMARY KEY (`DutyTypeId`),
  ADD KEY `DutyTypeCategoryId` (`DutyTypeCategoryId`);

--
-- Indexes for table `duty_type_categories`
--
ALTER TABLE `duty_type_categories`
  ADD PRIMARY KEY (`DutyTypeCategoryId`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`ExamId`),
  ADD KEY `ExamTypeId` (`ExamTypeId`),
  ADD KEY `ActualTermId` (`ActualTermId`);

--
-- Indexes for table `exam_information`
--
ALTER TABLE `exam_information`
  ADD PRIMARY KEY (`ExamInformationId`),
  ADD KEY `ExamInformationTypeId` (`ExamInformationTypeId`),
  ADD KEY `ExamId` (`ExamId`);

--
-- Indexes for table `exam_information_types`
--
ALTER TABLE `exam_information_types`
  ADD PRIMARY KEY (`ExamInformationTypeId`);

--
-- Indexes for table `exam_papers`
--
ALTER TABLE `exam_papers`
  ADD PRIMARY KEY (`ExamPaperId`),
  ADD KEY `ExamId` (`ExamId`),
  ADD KEY `ClassSpecificSubjectId` (`ClassSpecificSubjectId`);

--
-- Indexes for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD PRIMARY KEY (`ExamTypeId`);

--
-- Indexes for table `fields_`
--
ALTER TABLE `fields_`
  ADD PRIMARY KEY (`fieldId`),
  ADD KEY `FieldCategoryId` (`FieldCategoryId`),
  ADD KEY `DepartmentId` (`DepartmentId`);

--
-- Indexes for table `field_categories`
--
ALTER TABLE `field_categories`
  ADD PRIMARY KEY (`FieldCategoryId`);

--
-- Indexes for table `field_grade_configuration`
--
ALTER TABLE `field_grade_configuration`
  ADD PRIMARY KEY (`FieldGradeConfigurationId`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`LessonId`),
  ADD KEY `ClassSpecificSubjectId` (`ClassSpecificSubjectId`);

--
-- Indexes for table `library_fields`
--
ALTER TABLE `library_fields`
  ADD PRIMARY KEY (`LibraryFieldId`);

--
-- Indexes for table `location_configuration`
--
ALTER TABLE `location_configuration`
  ADD PRIMARY KEY (`LocationConfigurationId`),
  ADD KEY `LocationTypeId` (`LocationTypeId`);

--
-- Indexes for table `location_types`
--
ALTER TABLE `location_types`
  ADD PRIMARY KEY (`LocationTypeId`);

--
-- Indexes for table `master_catalogue`
--
ALTER TABLE `master_catalogue`
  ADD PRIMARY KEY (`MasterCatalogueId`),
  ADD KEY `LibraryFieldId` (`LibraryFieldId`),
  ADD KEY `LocationConfigurationId` (`LocationConfigurationId`);

--
-- Indexes for table `prefects`
--
ALTER TABLE `prefects`
  ADD PRIMARY KEY (`PrefectId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `prefects_duty_roster`
--
ALTER TABLE `prefects_duty_roster`
  ADD PRIMARY KEY (`PrefectDutyRosterId`),
  ADD KEY `PrefectId` (`PrefectId`),
  ADD KEY `DutyConfigurationId` (`DutyConfigurationId`);

--
-- Indexes for table `prefects_on_duty_information_types`
--
ALTER TABLE `prefects_on_duty_information_types`
  ADD PRIMARY KEY (`PrefectOnDutyInformationTypeId`);

--
-- Indexes for table `prefect_individual_qualities`
--
ALTER TABLE `prefect_individual_qualities`
  ADD PRIMARY KEY (`PrefectIndividualQualityId`),
  ADD KEY `PrefectId` (`PrefectId`),
  ADD KEY `PrefectTypeId` (`PrefectTypeId`);

--
-- Indexes for table `prefect_on_duty_information`
--
ALTER TABLE `prefect_on_duty_information`
  ADD PRIMARY KEY (`PrefectOnDutyInformationId`),
  ADD KEY `PrefectOnDutyInformationTypeId` (`PrefectOnDutyInformationTypeId`),
  ADD KEY `PrefectDutyRosterId` (`PrefectDutyRosterId`);

--
-- Indexes for table `prefect_team_leads`
--
ALTER TABLE `prefect_team_leads`
  ADD PRIMARY KEY (`PrefectTeamLeadId`),
  ADD KEY `PrefectId` (`PrefectId`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `prefect_team_lead_roles`
--
ALTER TABLE `prefect_team_lead_roles`
  ADD PRIMARY KEY (`PrefectTeamLeadRoleId`),
  ADD KEY `PrefectTeamLeadId` (`PrefectTeamLeadId`);

--
-- Indexes for table `prefect_team_members`
--
ALTER TABLE `prefect_team_members`
  ADD PRIMARY KEY (`PrefectTeamMemberId`),
  ADD KEY `PrefectId` (`PrefectId`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `prefect_team_member_roles`
--
ALTER TABLE `prefect_team_member_roles`
  ADD PRIMARY KEY (`PrefectTeamMemberRoleId`),
  ADD KEY `PrefectTeamMemberId` (`PrefectTeamMemberId`);

--
-- Indexes for table `prefect_types`
--
ALTER TABLE `prefect_types`
  ADD PRIMARY KEY (`PrefectTypeId`),
  ADD KEY `PrefectTypeCategoryId` (`PrefectTypeCategoryId`);

--
-- Indexes for table `prefect_type_categories`
--
ALTER TABLE `prefect_type_categories`
  ADD PRIMARY KEY (`PrefectTypeCategoryId`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`ResourceId`);

--
-- Indexes for table `resource_authors`
--
ALTER TABLE `resource_authors`
  ADD PRIMARY KEY (`ResourceAuthorId`),
  ADD KEY `ResourceId` (`ResourceId`);

--
-- Indexes for table `resource_catalogue`
--
ALTER TABLE `resource_catalogue`
  ADD PRIMARY KEY (`ResourceCatalogueId`),
  ADD KEY `ResourceId` (`ResourceId`),
  ADD KEY `SubLocationId` (`SubLocationId`);

--
-- Indexes for table `resource_individual_qualities`
--
ALTER TABLE `resource_individual_qualities`
  ADD PRIMARY KEY (`ResourceIndividualQualityId`),
  ADD KEY `ResourceId` (`ResourceId`),
  ADD KEY `ResourceTypeId` (`ResourceTypeId`);

--
-- Indexes for table `resource_publishers`
--
ALTER TABLE `resource_publishers`
  ADD PRIMARY KEY (`ResourcePublisherId`),
  ADD KEY `ResourceId` (`ResourceId`);

--
-- Indexes for table `resource_rule_statements`
--
ALTER TABLE `resource_rule_statements`
  ADD PRIMARY KEY (`ResourceRuleStatementId`),
  ADD KEY `RuleAspectId` (`RuleAspectId`),
  ADD KEY `ResourceTypeId` (`ResourceTypeId`);

--
-- Indexes for table `resource_types`
--
ALTER TABLE `resource_types`
  ADD PRIMARY KEY (`ResourceTypeId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `rule_aspects`
--
ALTER TABLE `rule_aspects`
  ADD PRIMARY KEY (`RuleAspectId`);

--
-- Indexes for table `specific_student_exam_papers`
--
ALTER TABLE `specific_student_exam_papers`
  ADD PRIMARY KEY (`SpecificStudentExamPaperId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `ExamPaperId` (`ExamPaperId`);

--
-- Indexes for table `specific_student_exam_papers_information`
--
ALTER TABLE `specific_student_exam_papers_information`
  ADD PRIMARY KEY (`SSEPIId`),
  ADD KEY `SSEPITId` (`SSEPITId`),
  ADD KEY `SPecificStudentExamPaperId` (`SPecificStudentExamPaperId`);

--
-- Indexes for table `specific_student_exam_papers_information_types`
--
ALTER TABLE `specific_student_exam_papers_information_types`
  ADD PRIMARY KEY (`SSEPITId`);

--
-- Indexes for table `staff_department_relationship`
--
ALTER TABLE `staff_department_relationship`
  ADD PRIMARY KEY (`StaffDepartmentRelationshipId`),
  ADD KEY `StaffNo` (`StaffNo`),
  ADD KEY `DepartmentId` (`DepartmentId`);

--
-- Indexes for table `staff_individual_qualities`
--
ALTER TABLE `staff_individual_qualities`
  ADD PRIMARY KEY (`StaffIndividualQualityId`),
  ADD KEY `StaffTypeId` (`StaffTypeId`),
  ADD KEY `StaffNo` (`StaffNo`);

--
-- Indexes for table `staff_members`
--
ALTER TABLE `staff_members`
  ADD PRIMARY KEY (`StaffMemberId`),
  ADD UNIQUE KEY `StaffNo` (`StaffNo`);

--
-- Indexes for table `staff_member_roles`
--
ALTER TABLE `staff_member_roles`
  ADD PRIMARY KEY (`StaffMemberRoleId`),
  ADD KEY `StaffNo` (`StaffNo`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Indexes for table `staff_records`
--
ALTER TABLE `staff_records`
  ADD PRIMARY KEY (`StaffRecordId`),
  ADD KEY `StaffRecordTypeId` (`StaffRecordTypeId`),
  ADD KEY `StaffNo` (`StaffNo`);

--
-- Indexes for table `staff_record_types`
--
ALTER TABLE `staff_record_types`
  ADD PRIMARY KEY (`StaffRecordTypeId`);

--
-- Indexes for table `staff_resource_leasing`
--
ALTER TABLE `staff_resource_leasing`
  ADD PRIMARY KEY (`StaffResourceLeasingId`),
  ADD KEY `ResourceId` (`ResourceId`),
  ADD KEY `StaffNo` (`StaffNo`);

--
-- Indexes for table `staff_resource_leasing_information`
--
ALTER TABLE `staff_resource_leasing_information`
  ADD PRIMARY KEY (`StaffRLIId`),
  ADD KEY `StaffRLITId` (`StaffRLITId`),
  ADD KEY `StaffResourceLeasingId` (`StaffResourceLeasingId`);

--
-- Indexes for table `staff_resource_leasing_information_types`
--
ALTER TABLE `staff_resource_leasing_information_types`
  ADD PRIMARY KEY (`StaffRLITId`);

--
-- Indexes for table `staff_team_leads`
--
ALTER TABLE `staff_team_leads`
  ADD PRIMARY KEY (`StaffTeamLeadId`),
  ADD KEY `StaffNo` (`StaffNo`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `staff_team_lead_roles`
--
ALTER TABLE `staff_team_lead_roles`
  ADD PRIMARY KEY (`StaffTeamLeadRoleId`),
  ADD KEY `StaffTeamLeadId` (`StaffTeamLeadId`);

--
-- Indexes for table `staff_team_members`
--
ALTER TABLE `staff_team_members`
  ADD PRIMARY KEY (`StaffTeamMemberId`),
  ADD KEY `StaffNo` (`StaffNo`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `staff_team_member_roles`
--
ALTER TABLE `staff_team_member_roles`
  ADD PRIMARY KEY (`StaffTeamMemberRoleId`),
  ADD KEY `StaffTeamMemberId` (`StaffTeamMemberId`);

--
-- Indexes for table `staff_types`
--
ALTER TABLE `staff_types`
  ADD PRIMARY KEY (`StaffTypeId`),
  ADD KEY `StaffTypeCategoryId` (`StaffTypeCategoryId`);

--
-- Indexes for table `staff_type_categories`
--
ALTER TABLE `staff_type_categories`
  ADD PRIMARY KEY (`StaffTypeCategoryId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentId`),
  ADD UNIQUE KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `ClassId` (`ClassId`);

--
-- Indexes for table `students_class_duty_roster`
--
ALTER TABLE `students_class_duty_roster`
  ADD PRIMARY KEY (`StudentClassDutyRosterId`),
  ADD KEY `StudentsClassDutyRosterTypeId` (`StudentsClassDutyRosterTypeId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `DutyConfigurationId` (`DutyConfigurationId`);

--
-- Indexes for table `students_class_duty_roster_types`
--
ALTER TABLE `students_class_duty_roster_types`
  ADD PRIMARY KEY (`StudentsClassDutyRosterTypeId`);

--
-- Indexes for table `student_class_specific_subject_information`
--
ALTER TABLE `student_class_specific_subject_information`
  ADD PRIMARY KEY (`SCSSIId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `SCSSITId` (`SCSSITId`);

--
-- Indexes for table `student_class_specific_subject_rship`
--
ALTER TABLE `student_class_specific_subject_rship`
  ADD PRIMARY KEY (`SCSSRId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `ClassSpecificSubjectId` (`ClassSpecificSubjectId`);

--
-- Indexes for table `student_class_subject_specific_information_types`
--
ALTER TABLE `student_class_subject_specific_information_types`
  ADD PRIMARY KEY (`SCSSITId`);

--
-- Indexes for table `student_guardian`
--
ALTER TABLE `student_guardian`
  ADD PRIMARY KEY (`StudentGuardianId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `student_individual_qualities`
--
ALTER TABLE `student_individual_qualities`
  ADD PRIMARY KEY (`StudentIndividualQualityId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `StudentTypeId` (`StudentTypeId`);

--
-- Indexes for table `student_records`
--
ALTER TABLE `student_records`
  ADD PRIMARY KEY (`StudentRecordId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `StudentRecordTypeId` (`StudentRecordTypeId`);

--
-- Indexes for table `student_record_types`
--
ALTER TABLE `student_record_types`
  ADD PRIMARY KEY (`StudentRecordTypeId`);

--
-- Indexes for table `student_resource_leasing`
--
ALTER TABLE `student_resource_leasing`
  ADD PRIMARY KEY (`StudentResourceLeasingId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `ResourceId` (`ResourceId`);

--
-- Indexes for table `student_resource_leasing_information`
--
ALTER TABLE `student_resource_leasing_information`
  ADD PRIMARY KEY (`SRLIId`),
  ADD KEY `SRLITId` (`SRLITId`),
  ADD KEY `StudentResourceLeasingId` (`StudentResourceLeasingId`);

--
-- Indexes for table `student_resource_leasing_information_types`
--
ALTER TABLE `student_resource_leasing_information_types`
  ADD PRIMARY KEY (`SRLITId`);

--
-- Indexes for table `student_team_leads`
--
ALTER TABLE `student_team_leads`
  ADD PRIMARY KEY (`StudentTeamLeadId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `student_team_lead_roles`
--
ALTER TABLE `student_team_lead_roles`
  ADD PRIMARY KEY (`StudentTeamLeadRoleId`),
  ADD KEY `StudentTeamLeadId` (`StudentTeamLeadId`);

--
-- Indexes for table `student_team_members`
--
ALTER TABLE `student_team_members`
  ADD PRIMARY KEY (`StudentTeamMemberId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `student_team_member_roles`
--
ALTER TABLE `student_team_member_roles`
  ADD PRIMARY KEY (`StudentTeamMemberRoleId`),
  ADD KEY `StudentTeamMemberId` (`StudentTeamMemberId`);

--
-- Indexes for table `student_types`
--
ALTER TABLE `student_types`
  ADD PRIMARY KEY (`StudentTypeId`),
  ADD KEY `StudentTypeCategoryId` (`StudentTypeCategoryId`);

--
-- Indexes for table `student_type_categories`
--
ALTER TABLE `student_type_categories`
  ADD PRIMARY KEY (`StudentTypeCategoryId`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`SubjectId`),
  ADD KEY `FieldId` (`FieldId`);

--
-- Indexes for table `subject_categories`
--
ALTER TABLE `subject_categories`
  ADD PRIMARY KEY (`SubjectCategoryId`);

--
-- Indexes for table `sub_locations`
--
ALTER TABLE `sub_locations`
  ADD PRIMARY KEY (`SubLocationId`),
  ADD KEY `LocationConfigurationId` (`LocationConfigurationId`);

--
-- Indexes for table `teachers_duty_roster`
--
ALTER TABLE `teachers_duty_roster`
  ADD PRIMARY KEY (`TeacherDutyRosterId`),
  ADD KEY `ClassTeacherId` (`ClassTeacherId`),
  ADD KEY `DutyConfigurationId` (`DutyConfigurationId`);

--
-- Indexes for table `teacher_on_duty_information`
--
ALTER TABLE `teacher_on_duty_information`
  ADD PRIMARY KEY (`TeacherOnDutyInformationId`),
  ADD KEY `TeacherOnDutyInformationTypeId` (`TeacherOnDutyInformationTypeId`),
  ADD KEY `TeacherDutyRosterId` (`TeacherDutyRosterId`);

--
-- Indexes for table `teacher_on_duty_information_types`
--
ALTER TABLE `teacher_on_duty_information_types`
  ADD PRIMARY KEY (`TeacherOnDutyInformationTypeId`);

--
-- Indexes for table `teacher_on_duty_staff_records`
--
ALTER TABLE `teacher_on_duty_staff_records`
  ADD PRIMARY KEY (`TeacherOnDutyStaffRecordId`),
  ADD KEY `TeacherDutyRosterId` (`TeacherDutyRosterId`),
  ADD KEY `StaffNo` (`StaffNo`);

--
-- Indexes for table `teacher_on_duty_student_record`
--
ALTER TABLE `teacher_on_duty_student_record`
  ADD PRIMARY KEY (`TeacherOnDutyRecordStudentRecordRshipId`),
  ADD KEY `TeacherDutyRosterId` (`TeacherDutyRosterId`);

--
-- Indexes for table `team_configuration`
--
ALTER TABLE `team_configuration`
  ADD PRIMARY KEY (`TeamId`);

--
-- Indexes for table `team_duty_roster`
--
ALTER TABLE `team_duty_roster`
  ADD PRIMARY KEY (`TeamDutyRosterId`),
  ADD KEY `TeamId` (`TeamId`),
  ADD KEY `DutyConfigurationId` (`DutyConfigurationId`);

--
-- Indexes for table `team_duty_roster_information`
--
ALTER TABLE `team_duty_roster_information`
  ADD PRIMARY KEY (`TeamDutyRosterInformationId`),
  ADD KEY `TeamDutyRosterInformationTypeId` (`TeamDutyRosterInformationTypeId`),
  ADD KEY `TeamDutyRosterId` (`TeamDutyRosterId`);

--
-- Indexes for table `team_duty_roster_information_types`
--
ALTER TABLE `team_duty_roster_information_types`
  ADD PRIMARY KEY (`TeamDutyRosterInformationTypeId`);

--
-- Indexes for table `term_iterations`
--
ALTER TABLE `term_iterations`
  ADD PRIMARY KEY (`TermIterationId`);

--
-- Indexes for table `week_iterations`
--
ALTER TABLE `week_iterations`
  ADD PRIMARY KEY (`WeekIterationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_class_levels`
--
ALTER TABLE `academic_class_levels`
  MODIFY `AcademicClassLevelId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `actual_terms`
--
ALTER TABLE `actual_terms`
  MODIFY `ActualTermId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `actual_term_information`
--
ALTER TABLE `actual_term_information`
  MODIFY `ActualTermInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `actual_term_information_types`
--
ALTER TABLE `actual_term_information_types`
  MODIFY `ActualTermInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `actual_term_information_type_categories`
--
ALTER TABLE `actual_term_information_type_categories`
  MODIFY `ActualTermInformationTypeCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  MODIFY `ActualWeekId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_prefect_relationship`
--
ALTER TABLE `class_prefect_relationship`
  MODIFY `ClassPrefectRelationshipId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_specific_subjects`
--
ALTER TABLE `class_specific_subjects`
  MODIFY `ClassSpecificSubjectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_specific_subject_information`
--
ALTER TABLE `class_specific_subject_information`
  MODIFY `ClassSpecificSubjectInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_specific_subject_information_types`
--
ALTER TABLE `class_specific_subject_information_types`
  MODIFY `CSSITId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_streams`
--
ALTER TABLE `class_streams`
  MODIFY `ClassStreamId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_teachers`
--
ALTER TABLE `class_teachers`
  MODIFY `ClassTeacherId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_teachers_class_specific_subjects`
--
ALTER TABLE `class_teachers_class_specific_subjects`
  MODIFY `ClassTeachersClassSpecificSubjectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_teacher_class_specific_subject_information`
--
ALTER TABLE `class_teacher_class_specific_subject_information`
  MODIFY `CTCSSInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_teacher_class_specific_subject_information_types`
--
ALTER TABLE `class_teacher_class_specific_subject_information_types`
  MODIFY `InformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_text_books`
--
ALTER TABLE `class_text_books`
  MODIFY `ClassTextBookId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `DepartmentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department_types`
--
ALTER TABLE `department_types`
  MODIFY `DepartmentTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitories`
--
ALTER TABLE `dormitories`
  MODIFY `DormitoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory_individual_qualities`
--
ALTER TABLE `dormitory_individual_qualities`
  MODIFY `DormitoryIndividualQualityId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory_information`
--
ALTER TABLE `dormitory_information`
  MODIFY `DormitoryInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory_information_types`
--
ALTER TABLE `dormitory_information_types`
  MODIFY `DormitoryInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dormitory_types`
--
ALTER TABLE `dormitory_types`
  MODIFY `DormitoryTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `duty_configurations`
--
ALTER TABLE `duty_configurations`
  MODIFY `DutyConfigurationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `duty_types`
--
ALTER TABLE `duty_types`
  MODIFY `DutyTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `duty_type_categories`
--
ALTER TABLE `duty_type_categories`
  MODIFY `DutyTypeCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `ExamId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_information`
--
ALTER TABLE `exam_information`
  MODIFY `ExamInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_information_types`
--
ALTER TABLE `exam_information_types`
  MODIFY `ExamInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_papers`
--
ALTER TABLE `exam_papers`
  MODIFY `ExamPaperId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_type`
--
ALTER TABLE `exam_type`
  MODIFY `ExamTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fields_`
--
ALTER TABLE `fields_`
  MODIFY `fieldId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `field_categories`
--
ALTER TABLE `field_categories`
  MODIFY `FieldCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `field_grade_configuration`
--
ALTER TABLE `field_grade_configuration`
  MODIFY `FieldGradeConfigurationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `LessonId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `library_fields`
--
ALTER TABLE `library_fields`
  MODIFY `LibraryFieldId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_configuration`
--
ALTER TABLE `location_configuration`
  MODIFY `LocationConfigurationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location_types`
--
ALTER TABLE `location_types`
  MODIFY `LocationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `master_catalogue`
--
ALTER TABLE `master_catalogue`
  MODIFY `MasterCatalogueId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefects`
--
ALTER TABLE `prefects`
  MODIFY `PrefectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefects_duty_roster`
--
ALTER TABLE `prefects_duty_roster`
  MODIFY `PrefectDutyRosterId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefects_on_duty_information_types`
--
ALTER TABLE `prefects_on_duty_information_types`
  MODIFY `PrefectOnDutyInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_individual_qualities`
--
ALTER TABLE `prefect_individual_qualities`
  MODIFY `PrefectIndividualQualityId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_on_duty_information`
--
ALTER TABLE `prefect_on_duty_information`
  MODIFY `PrefectOnDutyInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_team_leads`
--
ALTER TABLE `prefect_team_leads`
  MODIFY `PrefectTeamLeadId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_team_lead_roles`
--
ALTER TABLE `prefect_team_lead_roles`
  MODIFY `PrefectTeamLeadRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_team_members`
--
ALTER TABLE `prefect_team_members`
  MODIFY `PrefectTeamMemberId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_team_member_roles`
--
ALTER TABLE `prefect_team_member_roles`
  MODIFY `PrefectTeamMemberRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_types`
--
ALTER TABLE `prefect_types`
  MODIFY `PrefectTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prefect_type_categories`
--
ALTER TABLE `prefect_type_categories`
  MODIFY `PrefectTypeCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `ResourceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_authors`
--
ALTER TABLE `resource_authors`
  MODIFY `ResourceAuthorId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_catalogue`
--
ALTER TABLE `resource_catalogue`
  MODIFY `ResourceCatalogueId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_individual_qualities`
--
ALTER TABLE `resource_individual_qualities`
  MODIFY `ResourceIndividualQualityId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_publishers`
--
ALTER TABLE `resource_publishers`
  MODIFY `ResourcePublisherId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_rule_statements`
--
ALTER TABLE `resource_rule_statements`
  MODIFY `ResourceRuleStatementId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resource_types`
--
ALTER TABLE `resource_types`
  MODIFY `ResourceTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rule_aspects`
--
ALTER TABLE `rule_aspects`
  MODIFY `RuleAspectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specific_student_exam_papers`
--
ALTER TABLE `specific_student_exam_papers`
  MODIFY `SpecificStudentExamPaperId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specific_student_exam_papers_information`
--
ALTER TABLE `specific_student_exam_papers_information`
  MODIFY `SSEPIId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specific_student_exam_papers_information_types`
--
ALTER TABLE `specific_student_exam_papers_information_types`
  MODIFY `SSEPITId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_department_relationship`
--
ALTER TABLE `staff_department_relationship`
  MODIFY `StaffDepartmentRelationshipId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_individual_qualities`
--
ALTER TABLE `staff_individual_qualities`
  MODIFY `StaffIndividualQualityId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_members`
--
ALTER TABLE `staff_members`
  MODIFY `StaffMemberId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_member_roles`
--
ALTER TABLE `staff_member_roles`
  MODIFY `StaffMemberRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_records`
--
ALTER TABLE `staff_records`
  MODIFY `StaffRecordId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_record_types`
--
ALTER TABLE `staff_record_types`
  MODIFY `StaffRecordTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_resource_leasing`
--
ALTER TABLE `staff_resource_leasing`
  MODIFY `StaffResourceLeasingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_resource_leasing_information`
--
ALTER TABLE `staff_resource_leasing_information`
  MODIFY `StaffRLIId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_resource_leasing_information_types`
--
ALTER TABLE `staff_resource_leasing_information_types`
  MODIFY `StaffRLITId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_team_leads`
--
ALTER TABLE `staff_team_leads`
  MODIFY `StaffTeamLeadId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_team_lead_roles`
--
ALTER TABLE `staff_team_lead_roles`
  MODIFY `StaffTeamLeadRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_team_members`
--
ALTER TABLE `staff_team_members`
  MODIFY `StaffTeamMemberId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_team_member_roles`
--
ALTER TABLE `staff_team_member_roles`
  MODIFY `StaffTeamMemberRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_types`
--
ALTER TABLE `staff_types`
  MODIFY `StaffTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_type_categories`
--
ALTER TABLE `staff_type_categories`
  MODIFY `StaffTypeCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students_class_duty_roster`
--
ALTER TABLE `students_class_duty_roster`
  MODIFY `StudentClassDutyRosterId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students_class_duty_roster_types`
--
ALTER TABLE `students_class_duty_roster_types`
  MODIFY `StudentsClassDutyRosterTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_class_specific_subject_information`
--
ALTER TABLE `student_class_specific_subject_information`
  MODIFY `SCSSIId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_class_specific_subject_rship`
--
ALTER TABLE `student_class_specific_subject_rship`
  MODIFY `SCSSRId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_class_subject_specific_information_types`
--
ALTER TABLE `student_class_subject_specific_information_types`
  MODIFY `SCSSITId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_guardian`
--
ALTER TABLE `student_guardian`
  MODIFY `StudentGuardianId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_individual_qualities`
--
ALTER TABLE `student_individual_qualities`
  MODIFY `StudentIndividualQualityId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_records`
--
ALTER TABLE `student_records`
  MODIFY `StudentRecordId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_record_types`
--
ALTER TABLE `student_record_types`
  MODIFY `StudentRecordTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_resource_leasing`
--
ALTER TABLE `student_resource_leasing`
  MODIFY `StudentResourceLeasingId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_resource_leasing_information`
--
ALTER TABLE `student_resource_leasing_information`
  MODIFY `SRLIId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_resource_leasing_information_types`
--
ALTER TABLE `student_resource_leasing_information_types`
  MODIFY `SRLITId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_team_leads`
--
ALTER TABLE `student_team_leads`
  MODIFY `StudentTeamLeadId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_team_lead_roles`
--
ALTER TABLE `student_team_lead_roles`
  MODIFY `StudentTeamLeadRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_team_members`
--
ALTER TABLE `student_team_members`
  MODIFY `StudentTeamMemberId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_team_member_roles`
--
ALTER TABLE `student_team_member_roles`
  MODIFY `StudentTeamMemberRoleId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_types`
--
ALTER TABLE `student_types`
  MODIFY `StudentTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_type_categories`
--
ALTER TABLE `student_type_categories`
  MODIFY `StudentTypeCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `SubjectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subject_categories`
--
ALTER TABLE `subject_categories`
  MODIFY `SubjectCategoryId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub_locations`
--
ALTER TABLE `sub_locations`
  MODIFY `SubLocationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teachers_duty_roster`
--
ALTER TABLE `teachers_duty_roster`
  MODIFY `TeacherDutyRosterId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_on_duty_information`
--
ALTER TABLE `teacher_on_duty_information`
  MODIFY `TeacherOnDutyInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_on_duty_information_types`
--
ALTER TABLE `teacher_on_duty_information_types`
  MODIFY `TeacherOnDutyInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_on_duty_staff_records`
--
ALTER TABLE `teacher_on_duty_staff_records`
  MODIFY `TeacherOnDutyStaffRecordId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teacher_on_duty_student_record`
--
ALTER TABLE `teacher_on_duty_student_record`
  MODIFY `TeacherOnDutyRecordStudentRecordRshipId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_configuration`
--
ALTER TABLE `team_configuration`
  MODIFY `TeamId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_duty_roster`
--
ALTER TABLE `team_duty_roster`
  MODIFY `TeamDutyRosterId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_duty_roster_information`
--
ALTER TABLE `team_duty_roster_information`
  MODIFY `TeamDutyRosterInformationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_duty_roster_information_types`
--
ALTER TABLE `team_duty_roster_information_types`
  MODIFY `TeamDutyRosterInformationTypeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `term_iterations`
--
ALTER TABLE `term_iterations`
  MODIFY `TermIterationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `week_iterations`
--
ALTER TABLE `week_iterations`
  MODIFY `WeekIterationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `actual_terms`
--
ALTER TABLE `actual_terms`
  ADD CONSTRAINT `actual_terms_ibfk_1` FOREIGN KEY (`TermIterationId`) REFERENCES `term_iterations` (`TermIterationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actual_term_information`
--
ALTER TABLE `actual_term_information`
  ADD CONSTRAINT `actual_term_information_ibfk_1` FOREIGN KEY (`ActualTermInformationTypeId`) REFERENCES `actual_term_information_types` (`ActualTermInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actual_term_information_ibfk_2` FOREIGN KEY (`ActualTermId`) REFERENCES `actual_terms` (`ActualTermId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actual_term_information_types`
--
ALTER TABLE `actual_term_information_types`
  ADD CONSTRAINT `actual_term_information_types_ibfk_1` FOREIGN KEY (`ActualTermInformationTypeCategoryId`) REFERENCES `actual_term_information_type_categories` (`ActualTermInformationTypeCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  ADD CONSTRAINT `actual_weeks_ibfk_1` FOREIGN KEY (`WeekIterationId`) REFERENCES `week_iterations` (`WeekIterationId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actual_weeks_ibfk_2` FOREIGN KEY (`ActualTermId`) REFERENCES `actual_terms` (`ActualTermId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`AcademicClassLevelId`) REFERENCES `academic_class_levels` (`AcademicClassLevelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ClassStreamId`) REFERENCES `class_streams` (`ClassStreamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_prefect_relationship`
--
ALTER TABLE `class_prefect_relationship`
  ADD CONSTRAINT `class_prefect_relationship_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_prefect_relationship_ibfk_2` FOREIGN KEY (`PrefectId`) REFERENCES `prefects` (`PrefectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_specific_subjects`
--
ALTER TABLE `class_specific_subjects`
  ADD CONSTRAINT `class_specific_subjects_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `subjects` (`SubjectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_specific_subjects_ibfk_2` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_specific_subject_information`
--
ALTER TABLE `class_specific_subject_information`
  ADD CONSTRAINT `class_specific_subject_information_ibfk_1` FOREIGN KEY (`CSSITId`) REFERENCES `class_specific_subject_information_types` (`CSSITId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_specific_subject_information_ibfk_2` FOREIGN KEY (`ClassSpecificSubjectId`) REFERENCES `class_specific_subjects` (`ClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD CONSTRAINT `class_teachers_ibfk_1` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_teachers_ibfk_2` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_teachers_class_specific_subjects`
--
ALTER TABLE `class_teachers_class_specific_subjects`
  ADD CONSTRAINT `class_teachers_class_specific_subjects_ibfk_1` FOREIGN KEY (`ClassSpecificSubjectId`) REFERENCES `class_specific_subjects` (`ClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_teachers_class_specific_subjects_ibfk_2` FOREIGN KEY (`ClassTeacherId`) REFERENCES `class_teachers` (`ClassTeacherId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_teacher_class_specific_subject_information`
--
ALTER TABLE `class_teacher_class_specific_subject_information`
  ADD CONSTRAINT `class_teacher_class_specific_subject_information_ibfk_1` FOREIGN KEY (`InformationTypeId`) REFERENCES `class_teacher_class_specific_subject_information_types` (`InformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_teacher_class_specific_subject_information_ibfk_2` FOREIGN KEY (`ClassTeachersClassSpecificSubjectId`) REFERENCES `class_teachers_class_specific_subjects` (`ClassTeachersClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_text_books`
--
ALTER TABLE `class_text_books`
  ADD CONSTRAINT `class_text_books_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_text_books_ibfk_2` FOREIGN KEY (`FieldId`) REFERENCES `fields_` (`fieldId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_text_books_ibfk_3` FOREIGN KEY (`AcademicClassLevelId`) REFERENCES `academic_class_levels` (`AcademicClassLevelId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`DepartmentTypeId`) REFERENCES `department_types` (`DepartmentTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dormitory_individual_qualities`
--
ALTER TABLE `dormitory_individual_qualities`
  ADD CONSTRAINT `dormitory_individual_qualities_ibfk_1` FOREIGN KEY (`DormitoryId`) REFERENCES `dormitories` (`DormitoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dormitory_individual_qualities_ibfk_2` FOREIGN KEY (`DormitoryTypeId`) REFERENCES `dormitory_types` (`DormitoryTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dormitory_information`
--
ALTER TABLE `dormitory_information`
  ADD CONSTRAINT `dormitory_information_ibfk_1` FOREIGN KEY (`DormitoryInformationTypeId`) REFERENCES `dormitory_information_types` (`DormitoryInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dormitory_information_ibfk_2` FOREIGN KEY (`DormitoryId`) REFERENCES `dormitories` (`DormitoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duty_configurations`
--
ALTER TABLE `duty_configurations`
  ADD CONSTRAINT `duty_configurations_ibfk_1` FOREIGN KEY (`DutyTypeId`) REFERENCES `duty_types` (`DutyTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duty_configurations_ibfk_2` FOREIGN KEY (`ActualWeekId`) REFERENCES `actual_weeks` (`ActualWeekId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duty_types`
--
ALTER TABLE `duty_types`
  ADD CONSTRAINT `duty_types_ibfk_1` FOREIGN KEY (`DutyTypeCategoryId`) REFERENCES `duty_type_categories` (`DutyTypeCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`ExamTypeId`) REFERENCES `exam_type` (`ExamTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`ActualTermId`) REFERENCES `actual_terms` (`ActualTermId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_information`
--
ALTER TABLE `exam_information`
  ADD CONSTRAINT `exam_information_ibfk_1` FOREIGN KEY (`ExamInformationTypeId`) REFERENCES `exam_information_types` (`ExamInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_information_ibfk_2` FOREIGN KEY (`ExamId`) REFERENCES `exam` (`ExamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_papers`
--
ALTER TABLE `exam_papers`
  ADD CONSTRAINT `exam_papers_ibfk_1` FOREIGN KEY (`ExamId`) REFERENCES `exam` (`ExamId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_papers_ibfk_2` FOREIGN KEY (`ClassSpecificSubjectId`) REFERENCES `class_specific_subjects` (`ClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fields_`
--
ALTER TABLE `fields_`
  ADD CONSTRAINT `fields__ibfk_1` FOREIGN KEY (`FieldCategoryId`) REFERENCES `field_categories` (`FieldCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fields__ibfk_2` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`ClassSpecificSubjectId`) REFERENCES `class_specific_subjects` (`ClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location_configuration`
--
ALTER TABLE `location_configuration`
  ADD CONSTRAINT `location_configuration_ibfk_1` FOREIGN KEY (`LocationTypeId`) REFERENCES `location_types` (`LocationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_catalogue`
--
ALTER TABLE `master_catalogue`
  ADD CONSTRAINT `master_catalogue_ibfk_1` FOREIGN KEY (`LibraryFieldId`) REFERENCES `library_fields` (`LibraryFieldId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `master_catalogue_ibfk_2` FOREIGN KEY (`LocationConfigurationId`) REFERENCES `location_configuration` (`LocationConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefects`
--
ALTER TABLE `prefects`
  ADD CONSTRAINT `prefects_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefects_duty_roster`
--
ALTER TABLE `prefects_duty_roster`
  ADD CONSTRAINT `prefects_duty_roster_ibfk_1` FOREIGN KEY (`PrefectId`) REFERENCES `prefects` (`PrefectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prefects_duty_roster_ibfk_2` FOREIGN KEY (`DutyConfigurationId`) REFERENCES `duty_configurations` (`DutyConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_individual_qualities`
--
ALTER TABLE `prefect_individual_qualities`
  ADD CONSTRAINT `prefect_individual_qualities_ibfk_1` FOREIGN KEY (`PrefectId`) REFERENCES `prefects` (`PrefectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prefect_individual_qualities_ibfk_2` FOREIGN KEY (`PrefectTypeId`) REFERENCES `prefect_types` (`PrefectTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_on_duty_information`
--
ALTER TABLE `prefect_on_duty_information`
  ADD CONSTRAINT `prefect_on_duty_information_ibfk_1` FOREIGN KEY (`PrefectOnDutyInformationTypeId`) REFERENCES `prefects_on_duty_information_types` (`PrefectOnDutyInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prefect_on_duty_information_ibfk_2` FOREIGN KEY (`PrefectDutyRosterId`) REFERENCES `prefects_duty_roster` (`PrefectDutyRosterId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_team_leads`
--
ALTER TABLE `prefect_team_leads`
  ADD CONSTRAINT `prefect_team_leads_ibfk_1` FOREIGN KEY (`PrefectId`) REFERENCES `prefects` (`PrefectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prefect_team_leads_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_team_lead_roles`
--
ALTER TABLE `prefect_team_lead_roles`
  ADD CONSTRAINT `prefect_team_lead_roles_ibfk_1` FOREIGN KEY (`PrefectTeamLeadId`) REFERENCES `prefect_team_leads` (`PrefectTeamLeadId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_team_members`
--
ALTER TABLE `prefect_team_members`
  ADD CONSTRAINT `prefect_team_members_ibfk_1` FOREIGN KEY (`PrefectId`) REFERENCES `prefects` (`PrefectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prefect_team_members_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_team_member_roles`
--
ALTER TABLE `prefect_team_member_roles`
  ADD CONSTRAINT `prefect_team_member_roles_ibfk_1` FOREIGN KEY (`PrefectTeamMemberId`) REFERENCES `prefect_team_members` (`PrefectTeamMemberId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prefect_types`
--
ALTER TABLE `prefect_types`
  ADD CONSTRAINT `prefect_types_ibfk_1` FOREIGN KEY (`PrefectTypeCategoryId`) REFERENCES `prefect_type_categories` (`PrefectTypeCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_authors`
--
ALTER TABLE `resource_authors`
  ADD CONSTRAINT `resource_authors_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_catalogue`
--
ALTER TABLE `resource_catalogue`
  ADD CONSTRAINT `resource_catalogue_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_catalogue_ibfk_2` FOREIGN KEY (`SubLocationId`) REFERENCES `sub_locations` (`SubLocationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_individual_qualities`
--
ALTER TABLE `resource_individual_qualities`
  ADD CONSTRAINT `resource_individual_qualities_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_individual_qualities_ibfk_2` FOREIGN KEY (`ResourceTypeId`) REFERENCES `resource_types` (`ResourceTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_publishers`
--
ALTER TABLE `resource_publishers`
  ADD CONSTRAINT `resource_publishers_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_rule_statements`
--
ALTER TABLE `resource_rule_statements`
  ADD CONSTRAINT `resource_rule_statements_ibfk_1` FOREIGN KEY (`RuleAspectId`) REFERENCES `rule_aspects` (`RuleAspectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_rule_statements_ibfk_2` FOREIGN KEY (`ResourceTypeId`) REFERENCES `resource_types` (`ResourceTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specific_student_exam_papers`
--
ALTER TABLE `specific_student_exam_papers`
  ADD CONSTRAINT `specific_student_exam_papers_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specific_student_exam_papers_ibfk_2` FOREIGN KEY (`ExamPaperId`) REFERENCES `exam_papers` (`ExamPaperId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specific_student_exam_papers_information`
--
ALTER TABLE `specific_student_exam_papers_information`
  ADD CONSTRAINT `specific_student_exam_papers_information_ibfk_1` FOREIGN KEY (`SSEPITId`) REFERENCES `specific_student_exam_papers_information_types` (`SSEPITId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specific_student_exam_papers_information_ibfk_2` FOREIGN KEY (`SPecificStudentExamPaperId`) REFERENCES `specific_student_exam_papers` (`SpecificStudentExamPaperId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_department_relationship`
--
ALTER TABLE `staff_department_relationship`
  ADD CONSTRAINT `staff_department_relationship_ibfk_1` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_department_relationship_ibfk_2` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`DepartmentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_individual_qualities`
--
ALTER TABLE `staff_individual_qualities`
  ADD CONSTRAINT `staff_individual_qualities_ibfk_1` FOREIGN KEY (`StaffTypeId`) REFERENCES `staff_types` (`StaffTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_individual_qualities_ibfk_2` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_member_roles`
--
ALTER TABLE `staff_member_roles`
  ADD CONSTRAINT `staff_member_roles_ibfk_1` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_member_roles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_records`
--
ALTER TABLE `staff_records`
  ADD CONSTRAINT `staff_records_ibfk_1` FOREIGN KEY (`StaffRecordTypeId`) REFERENCES `staff_record_types` (`StaffRecordTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_records_ibfk_2` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_resource_leasing`
--
ALTER TABLE `staff_resource_leasing`
  ADD CONSTRAINT `staff_resource_leasing_ibfk_1` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_resource_leasing_ibfk_2` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_resource_leasing_ibfk_3` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_resource_leasing_information`
--
ALTER TABLE `staff_resource_leasing_information`
  ADD CONSTRAINT `staff_resource_leasing_information_ibfk_1` FOREIGN KEY (`StaffRLITId`) REFERENCES `staff_resource_leasing_information_types` (`StaffRLITId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_resource_leasing_information_ibfk_2` FOREIGN KEY (`StaffResourceLeasingId`) REFERENCES `staff_resource_leasing` (`StaffResourceLeasingId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_team_leads`
--
ALTER TABLE `staff_team_leads`
  ADD CONSTRAINT `staff_team_leads_ibfk_1` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_team_leads_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_team_lead_roles`
--
ALTER TABLE `staff_team_lead_roles`
  ADD CONSTRAINT `staff_team_lead_roles_ibfk_1` FOREIGN KEY (`StaffTeamLeadId`) REFERENCES `staff_team_leads` (`StaffTeamLeadId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_team_members`
--
ALTER TABLE `staff_team_members`
  ADD CONSTRAINT `staff_team_members_ibfk_1` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_team_members_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_team_member_roles`
--
ALTER TABLE `staff_team_member_roles`
  ADD CONSTRAINT `staff_team_member_roles_ibfk_1` FOREIGN KEY (`StaffTeamMemberId`) REFERENCES `staff_team_members` (`StaffTeamMemberId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_types`
--
ALTER TABLE `staff_types`
  ADD CONSTRAINT `staff_types_ibfk_1` FOREIGN KEY (`StaffTypeCategoryId`) REFERENCES `staff_type_categories` (`StaffTypeCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students_class_duty_roster`
--
ALTER TABLE `students_class_duty_roster`
  ADD CONSTRAINT `students_class_duty_roster_ibfk_1` FOREIGN KEY (`StudentsClassDutyRosterTypeId`) REFERENCES `students_class_duty_roster_types` (`StudentsClassDutyRosterTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_class_duty_roster_ibfk_2` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_class_duty_roster_ibfk_3` FOREIGN KEY (`DutyConfigurationId`) REFERENCES `duty_configurations` (`DutyConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_class_specific_subject_information`
--
ALTER TABLE `student_class_specific_subject_information`
  ADD CONSTRAINT `student_class_specific_subject_information_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_class_specific_subject_information_ibfk_2` FOREIGN KEY (`SCSSITId`) REFERENCES `student_class_subject_specific_information_types` (`SCSSITId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_class_specific_subject_rship`
--
ALTER TABLE `student_class_specific_subject_rship`
  ADD CONSTRAINT `student_class_specific_subject_rship_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_class_specific_subject_rship_ibfk_2` FOREIGN KEY (`ClassSpecificSubjectId`) REFERENCES `class_specific_subjects` (`ClassSpecificSubjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_guardian`
--
ALTER TABLE `student_guardian`
  ADD CONSTRAINT `student_guardian_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_individual_qualities`
--
ALTER TABLE `student_individual_qualities`
  ADD CONSTRAINT `student_individual_qualities_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_individual_qualities_ibfk_2` FOREIGN KEY (`StudentTypeId`) REFERENCES `student_types` (`StudentTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_records`
--
ALTER TABLE `student_records`
  ADD CONSTRAINT `student_records_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_records_ibfk_2` FOREIGN KEY (`StudentRecordTypeId`) REFERENCES `student_record_types` (`StudentRecordTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_resource_leasing`
--
ALTER TABLE `student_resource_leasing`
  ADD CONSTRAINT `student_resource_leasing_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_resource_leasing_ibfk_2` FOREIGN KEY (`ResourceId`) REFERENCES `resources` (`ResourceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_resource_leasing_information`
--
ALTER TABLE `student_resource_leasing_information`
  ADD CONSTRAINT `student_resource_leasing_information_ibfk_1` FOREIGN KEY (`SRLITId`) REFERENCES `student_resource_leasing_information_types` (`SRLITId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_resource_leasing_information_ibfk_2` FOREIGN KEY (`StudentResourceLeasingId`) REFERENCES `student_resource_leasing` (`StudentResourceLeasingId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_team_leads`
--
ALTER TABLE `student_team_leads`
  ADD CONSTRAINT `student_team_leads_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_team_leads_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_team_lead_roles`
--
ALTER TABLE `student_team_lead_roles`
  ADD CONSTRAINT `student_team_lead_roles_ibfk_1` FOREIGN KEY (`StudentTeamLeadId`) REFERENCES `student_team_leads` (`StudentTeamLeadId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_team_members`
--
ALTER TABLE `student_team_members`
  ADD CONSTRAINT `student_team_members_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_team_members_ibfk_2` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_team_member_roles`
--
ALTER TABLE `student_team_member_roles`
  ADD CONSTRAINT `student_team_member_roles_ibfk_1` FOREIGN KEY (`StudentTeamMemberId`) REFERENCES `student_team_members` (`StudentTeamMemberId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_types`
--
ALTER TABLE `student_types`
  ADD CONSTRAINT `student_types_ibfk_1` FOREIGN KEY (`StudentTypeCategoryId`) REFERENCES `student_type_categories` (`StudentTypeCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`FieldId`) REFERENCES `fields_` (`fieldId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_locations`
--
ALTER TABLE `sub_locations`
  ADD CONSTRAINT `sub_locations_ibfk_1` FOREIGN KEY (`LocationConfigurationId`) REFERENCES `location_configuration` (`LocationConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers_duty_roster`
--
ALTER TABLE `teachers_duty_roster`
  ADD CONSTRAINT `teachers_duty_roster_ibfk_1` FOREIGN KEY (`ClassTeacherId`) REFERENCES `class_teachers` (`ClassTeacherId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teachers_duty_roster_ibfk_2` FOREIGN KEY (`DutyConfigurationId`) REFERENCES `duty_configurations` (`DutyConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_on_duty_information`
--
ALTER TABLE `teacher_on_duty_information`
  ADD CONSTRAINT `teacher_on_duty_information_ibfk_1` FOREIGN KEY (`TeacherOnDutyInformationTypeId`) REFERENCES `teacher_on_duty_information_types` (`TeacherOnDutyInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_on_duty_information_ibfk_2` FOREIGN KEY (`TeacherDutyRosterId`) REFERENCES `teachers_duty_roster` (`TeacherDutyRosterId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_on_duty_staff_records`
--
ALTER TABLE `teacher_on_duty_staff_records`
  ADD CONSTRAINT `teacher_on_duty_staff_records_ibfk_1` FOREIGN KEY (`TeacherDutyRosterId`) REFERENCES `teachers_duty_roster` (`TeacherDutyRosterId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_on_duty_staff_records_ibfk_2` FOREIGN KEY (`StaffNo`) REFERENCES `staff_members` (`StaffNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_on_duty_student_record`
--
ALTER TABLE `teacher_on_duty_student_record`
  ADD CONSTRAINT `teacher_on_duty_student_record_ibfk_1` FOREIGN KEY (`TeacherDutyRosterId`) REFERENCES `teachers_duty_roster` (`TeacherDutyRosterId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_duty_roster`
--
ALTER TABLE `team_duty_roster`
  ADD CONSTRAINT `team_duty_roster_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `team_configuration` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_duty_roster_ibfk_2` FOREIGN KEY (`DutyConfigurationId`) REFERENCES `duty_configurations` (`DutyConfigurationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_duty_roster_information`
--
ALTER TABLE `team_duty_roster_information`
  ADD CONSTRAINT `team_duty_roster_information_ibfk_1` FOREIGN KEY (`TeamDutyRosterInformationTypeId`) REFERENCES `team_duty_roster_information_types` (`TeamDutyRosterInformationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_duty_roster_information_ibfk_2` FOREIGN KEY (`TeamDutyRosterId`) REFERENCES `team_duty_roster` (`TeamDutyRosterId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

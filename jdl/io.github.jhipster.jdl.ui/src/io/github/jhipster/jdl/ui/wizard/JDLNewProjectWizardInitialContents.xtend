package io.github.jhipster.jdl.ui.wizard

import com.google.inject.Inject
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.resource.FileExtensionProvider

class JDLNewProjectWizardInitialContents {

	@Inject FileExtensionProvider fileExtensionProvider

	def generateInitialContents(IFileSystemAccess2 fsa) {
		fsa => [
			generateExampleModel
		]
	}

	def private generateExampleModel(IFileSystemAccess2 it) {
		generateFile('''src/model/Model.«fileExtensionProvider.fileExtensions.last»''', 
			'''
				/**
				 * Generated by JHipster IDE plugin
				 */
				
				entity Department {
				  departmentId Long,
				  departmentName String required
				}
				
				entity JobHistory {
				  startDate ZonedDateTime,
				  endDate ZonedDateTime,
				  language Language
				}
				
				enum Language {
				  FRENCH, ENGLISH, SPANISH
				}
				
				enum JobType {
				  CEO, ENGINEER, BA
				}
				
				entity Job {
				  jobId Long,
				  jobTitle String minlength(5) maxlength(25),
				  jobType JobType,
				  minSalary Long,
				  maxSalary Long
				}
				
				entity Employee {
				  employeeId Long,
				  firstName String,
				  lastName String,
				  email String,
				  phoneNumber String,
				  hireDate ZonedDateTime,
				  salary Long,
				  commissionPct Long
				}
				
				entity Location {
				  locationId Long,
				  streetAddress String,
				  postalCode String,
				  city String,
				  stateProvince String
				}
				
				entity Task {
				  taskId Long,
				  title String,
				  description String
				}
				
				entity Country {
				  countryId Long,
				  countryName String
				}
				
				entity Region {
				  regionId Long,
				  regionName String
				}
				
				relationship OneToOne {
				  JobHistory{department} to Department
				}
				
				relationship OneToOne {
				  JobHistory{job} to Job
				}
				
				relationship OneToOne {
				  JobHistory{employee} to Employee
				}
				
				relationship ManyToMany {
				  Job{chore(title)} to Task{job}
				}
				
				relationship ManyToOne {
				  Employee{user(login)} to User{employee}
				}
				
				relationship OneToOne {
				  Department{location} to Location
				}
				
				relationship OneToMany {
				  Department{employee} to Employee{department}
				}
				
				relationship ManyToOne {
				  Employee{manager} to Employee
				}
				
				relationship OneToMany {
				  Employee{job} to Job{employee}
				}
				
				relationship OneToOne {
				  Location{country} to Country
				}
				
				relationship OneToOne {
				  Country{region} to Region
				}
				
				paginate JobHistory, Employee with infinite-scroll
				paginate Job with pagination
				dto * with mapstruct
				service * with serviceClass
				microservice * with mymicroservice
			'''
		)
	}

}

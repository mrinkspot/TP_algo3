!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook johnLennon paulMcCaurtney ringoStarr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 16:03:35'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self 
		compareTimeOf:  [customerBook addCustomerNamed: johnLennon]
		with: 50.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 16:02:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: paulMcCaurtney.
	
	self 
		compareTimeOf:  [customerBook removeCustomerNamed: paulMcCaurtney]
		with: 100.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:15:59'!
test03CanNotAddACustomerWithEmptyName 
		
	self should: [customerBook addCustomerNamed: ''] 
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 15:55:16'!
test04CanNotRemoveAnInvalidCustomer

	customerBook addCustomerNamed: johnLennon.

	self should:  [customerBook removeCustomerNamed: paulMcCaurtney] 
		raise: NotFound 
		withExceptionDo: [ :anError |
				self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:15:13'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCaurtney .
	customerBook suspendCustomerNamed: paulMcCaurtney.

	self 
		assertAmountOfActiveCustomers: 0 
		assertAmountOfSuspendedCustomers: 1
		assertTotalAmountOfCustomers: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCaurtney).! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:15:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	customerBook addCustomerNamed: paulMcCaurtney.
	customerBook suspendCustomerNamed: paulMcCaurtney.
	customerBook removeCustomerNamed: paulMcCaurtney .
	
	self 
		assertAmountOfActiveCustomers: 0 
		assertAmountOfSuspendedCustomers: 0
		assertTotalAmountOfCustomers: 0.

	self deny: (customerBook includesCustomerNamed: paulMcCaurtney).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 16:06:33'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: ringoStarr] raise: CantSuspend withExceptionDo: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon ) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 16:07:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	customerBook addCustomerNamed: johnLennon .
	customerBook suspendCustomerNamed: johnLennon .
	
	self should: [ customerBook suspendCustomerNamed: johnLennon ] raise: CantSuspend withExceptionDo: [  :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !


!CustomerBookTest methodsFor: 'privates' stamp: 'F 10/14/2021 17:15:13'!
assertAmountOfActiveCustomers: cantidadDeActives assertAmountOfSuspendedCustomers: cantidadDeSuspended assertTotalAmountOfCustomers: cantidadTotal

	self assert: cantidadDeActives equals: customerBook numberOfActiveCustomers.
	self assert: cantidadDeSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: cantidadTotal equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'privates' stamp: 'F 10/14/2021 16:02:18'!
compareTimeOf: aMessage with:maximumTime 

	|millisecondsBeforeRunning millisecondsAfterRunning| 	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aMessage.		
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (maximumTime * millisecond).! !

!CustomerBookTest methodsFor: 'privates' stamp: 'AlgebraDeBoole 10/14/2021 01:31:15'!
setUp
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCaurtney := 'Paul McCaurtney'.
	ringoStarr := 'Ringo Starr'.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'AlgebraDeBoole 10/13/2021 16:28:04'!
initialize
	active := OrderedCollection new.
	suspended:= OrderedCollection new.
! !


!CustomerBook methodsFor: 'customer management' stamp: 'F 10/14/2021 18:05:15'!
addCustomerNamed: aName
	self validateName: aName.
	self assertIfExistsCustomerNamed: aName.
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'F 10/14/2021 17:06:35'!
removeCustomerNamed: aName 
	^ active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [ ^ NotFound signal ] ].
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'F 10/14/2021 17:37:27'!
suspendCustomerNamed: aName
	active remove: aName ifAbsent: [ ^ CantSuspend signal ].
	suspended add: aName.! !


!CustomerBook methodsFor: 'accessing' stamp: 'AlgebraDeBoole 10/13/2021 16:03:21'!
numberOfActiveCustomers

	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'F 10/14/2021 16:10:08'!
numberOfCustomers

	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'AlgebraDeBoole 10/13/2021 16:03:31'!
numberOfSuspendedCustomers

	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'F 10/14/2021 18:11:58'!
assertIfExistsCustomerNamed: aName
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ]. ! !

!CustomerBook methodsFor: 'testing' stamp: 'AlgebraDeBoole 10/13/2021 16:03:42'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'F 10/14/2021 17:43:01'!
isEmpty

	^ self numberOfCustomers = 0.! !

!CustomerBook methodsFor: 'testing' stamp: 'F 10/14/2021 17:45:50'!
validateName: aName
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !


!CustomerBook methodsFor: 'signal errors' stamp: 'AlgebraDeBoole 10/13/2021 16:03:55'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'AlgebraDeBoole 10/13/2021 16:03:58'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'AlgebraDeBoole 10/13/2021 16:05:09'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'AlgebraDeBoole 10/13/2021 16:05:05'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

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

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:28:27'!
inicializarObjetosDePrueba
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCaurtney := 'Paul McCaurtney'.
	ringoStarr := 'Ringo Starr'.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:33:34'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	self inicializarObjetosDePrueba.
	
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: johnLennon.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:28:00'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	self inicializarObjetosDePrueba.
	
	customerBook addCustomerNamed: paulMcCaurtney.
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCaurtney .
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:29:23'!
test03CanNotAddACustomerWithEmptyName 

	self inicializarObjetosDePrueba.
	
	[ customerBook addCustomerNamed: '' ]
	
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:31:50'!
test04CanNotRemoveAnInvalidCustomer
	
	self inicializarObjetosDePrueba.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: paulMcCaurtney]
	
		on: NotFound 
		do: [ self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:28:00'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self inicializarObjetosDePrueba.
	
	customerBook addCustomerNamed: paulMcCaurtney .
	customerBook suspendCustomerNamed: paulMcCaurtney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCaurtney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:28:00'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self inicializarObjetosDePrueba.

	customerBook addCustomerNamed: paulMcCaurtney.
	customerBook suspendCustomerNamed: paulMcCaurtney.
	customerBook removeCustomerNamed: paulMcCaurtney .
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCaurtney).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:31:20'!
test07CanNotSuspendAnInvalidCustomer

	self inicializarObjetosDePrueba.
	
	customerBook addCustomerNamed: johnLennon .
	
	[ customerBook suspendCustomerNamed: ringoStarr]
		on: CantSuspend 
		do: [self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon ) ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'Frank 10/13/2021 15:30:49'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self inicializarObjetosDePrueba.
	
	customerBook addCustomerNamed: johnLennon .
	customerBook suspendCustomerNamed: johnLennon .
	
	[ customerBook suspendCustomerNamed: johnLennon ]
		on: CantSuspend 
		do: [ self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'Frank 10/13/2021 14:11:36'!
initialize
	
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Frank 10/13/2021 14:13:12'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

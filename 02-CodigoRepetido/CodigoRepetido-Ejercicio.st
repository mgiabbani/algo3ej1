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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 16:24:05'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook addCustomerActionClosure |
	
	customerBook := CustomerBook new.
	
	addCustomerActionClosure  :=  [ customerBook addCustomerNamed: 'JohnLennon'. ] .
	
	self should: addCustomerActionClosure notTakeMoreThan: 50 milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:08:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook removeCustomerNamedClosure paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithCustomer: paulMcCartney .
  
	removeCustomerNamedClosure  := [ customerBook removeCustomerNamed: paulMcCartney ].
	
	self should: removeCustomerNamedClosure notTakeMoreThan: 100 milliSeconds.	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:09:35'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithCustomer: johnLennon .
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assertTheOnlyCustomerInTheBook: customerBook is: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:14:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedCustomer: paulMcCartney .

	self assertThisCustomerBook: customerBook hasThisActiveCustomers: 0 andThisInactiveCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:14:11'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedCustomer: paulMcCartney .
	
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThisCustomerBook: customerBook hasThisActiveCustomers: 0 andThisInactiveCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:11:02'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithCustomer: johnLennon .
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assertTheOnlyCustomerInTheBook: customerBook is: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sp 9/25/2022 17:14:25'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithSuspendedCustomer: johnLennon .
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assertTheOnlyCustomerInTheBook: customerBook is: johnLennon ]
! !


!CustomerBookTest methodsFor: 'asserts' stamp: 'sp 9/24/2022 15:56:48'!
assertTheOnlyCustomerInTheBook: customerBook is: aCustomer
	self assert: (customerBook numberOfCustomers = 1).
	self assert: (customerBook includesCustomerNamed: aCustomer)! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'sp 9/25/2022 16:58:11'!
assertThisCustomerBook: customerBook hasThisActiveCustomers: numberOfActiveCustomers andThisInactiveCustomers: numberOfInactiveCustomers
	self assert: numberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: numberOfInactiveCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: ( numberOfActiveCustomers +numberOfInactiveCustomers ) equals: customerBook numberOfCustomers.! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'sp 9/25/2022 17:07:48'!
newCustomerBookWithCustomer: aCustomer
	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed:  aCustomer.
	^customerBook.! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'sp 9/25/2022 17:13:35'!
newCustomerBookWithSuspendedCustomer: aCustomer
	| customerBook |
	customerBook := self newCustomerBookWithCustomer: aCustomer .
	customerBook suspendCustomerNamed: aCustomer.
	^customerBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook'!


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'sp 9/25/2022 16:48:05'!
addCustomerNamed: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ]. "Customer name validations.".
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].

	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'sp 9/25/2022 16:34:54'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [
			^NotFound signal
			]
		].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'sp 9/24/2022 16:20:15'!
suspendCustomerNamed: aName 

	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

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

!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:56:50'!
test01
	| account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer
		amount: 0 * peso
		from: account1
		to: account2.
	self
		assert: account1 balance
		equals: 0 * peso.
	self
		assert: account2 balance
		equals: 0 * peso.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:56:57'!
test02
	| account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer
		amount: 1 * peso
		from: account1
		to: account2.
	self
		assert: account1 balance
		equals: -1 * peso.
	self
		assert: account2 balance
		equals: 1 * peso.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:57:05'!
test03
	| account1 account2 |
	account1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account1.
	account2 _ ReceptiveAccount new.
	Transfer
		amount: 25 * peso
		from: account1
		to: account2.
	self
		assert: account1 balance
		equals: 75 * peso.
	self
		assert: account2 balance
		equals: 25 * peso.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:57:44'!
test04
	| account1 account2 transfer |
	account1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account1.
	account2 _ ReceptiveAccount new.
	transfer _ Transfer
		amount: 25 * peso
		from: account1
		to: account2.
	self
		assert: transfer value
		equals: 25 * peso.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 20:19:01'!
test05
	| account1 account2 |
	account1 _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account1.
	account2 _ ReceptiveAccount new.
	Transfer
		amount: 25 * peso
		from: account1
		to: account2.
	self assert: (((account1 transactions at: 1) getCounterpart) isKindOf: Deposit).
	self assert: (((account2 transactions at: 1) getCounterpart) isKindOf: Withdraw)	.	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:30:35'!
initializeFor: aValue 

	value := aValue.
! !

!Deposit methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:07:37'!
setCounterpart: aCounterpart
	counterpart := aCounterpart .! !


!Deposit methodsFor: 'value' stamp: 'mg 11/9/2022 19:52:37'!
absoluteValue
	^ value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'accessing' stamp: 'mg 11/9/2022 20:14:46'!
getCounterpart
	^counterpart .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:21:21'!
getCounterpart
	^counterpart .! !

!Withdraw methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:30:45'!
initializeFor: aValue

	value := aValue .
! !

!Withdraw methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:12:44'!
setCounterpart: aCounterpart
	counterpart := aCounterpart .! !


!Withdraw methodsFor: 'value' stamp: 'mg 11/9/2022 19:52:52'!
absoluteValue
	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'mg 11/9/2022 19:54:13'!
balance
	|aBalance |
	aBalance := 0.
	transactions do: [:aTransaction | aBalance :=aBalance + aTransaction absoluteValue].

	^aBalance. ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'deposit withdraw value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 20:09:36'!
amount: anAmount from: aSenderAccount to: aReceiverAccount 

	deposit := Deposit register: anAmount on: aReceiverAccount.
	withdraw := Withdraw register: anAmount on: aSenderAccount.
	value := anAmount.
	deposit setCounterpart: withdraw .
	withdraw setCounterpart: deposit .! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:55:00'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'mg 11/9/2022 19:56:11'!
amount: anAmount from: aSender to: aReceiver
	^ Transfer new
		amount: anAmount
		from: aSender
		to: aReceiver.! !

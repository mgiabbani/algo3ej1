!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:47:15'!
test01newPortfolioHasZeroPesosBalance
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso .! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:47:58'!
test02addAccountAsMember
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addMember: account.
	
	self assert: (portfolio hasMember: account).! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:48:16'!
test03portfolioBalanceReturnsAccountBalance
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio addMember: account.
	
	self assert: (portfolio hasMember: account).
	self assert: portfolio balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:48:35'!
test04portfolioBalanceReturnsSumOfBalances
	| portfolio account1 account2 |
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 100 * peso on: account1.
	Deposit register: 1000 * peso on: account2.
	
	portfolio addMember: account1.
	portfolio addMember: account2.

	self assert: portfolio balance equals: 1100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:49:32'!
test05doesNotHaveARegisteredDeposit
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.

	self assert: (portfolio hasRegistered: deposit) not.! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:49:46'!
test06hasARegisteredDeposit
	| portfolio account deposit |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	portfolio addMember: account .
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:50:05'!
test07getAccountTransactionsHasCorrectTransactions
	| portfolio account deposit withdraw expectedReturn |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 12 * peso on: account.
	portfolio addMember: account .
	expectedReturn := OrderedCollection new.
	expectedReturn add: deposit .
	expectedReturn add: withdraw .
	self assert: (portfolio getAccountTransactions: account) equals: expectedReturn.! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:50:20'!
test08cannotAddAnAccountTwice
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio addMember: account.
	
	
	self assert: (portfolio addMember: account) equals: Portfolio errorDuplicatedAccount .! !

!PortfolioTest methodsFor: 'test' stamp: 'sp 11/10/2022 23:54:25'!
test09cannotAddHimselfAsMember
	| portfolio |
	portfolio := Portfolio new.
	
	self assert: (portfolio addMember: portfolio ) equals: Portfolio errorCannotAddHimselfAsMember .
	! !


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

!TransferTest methodsFor: 'test' stamp: 'sp 11/10/2022 19:17:51'!
test01
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
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

!TransferTest methodsFor: 'test' stamp: 'mg 11/9/2022 19:56:57'!
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

!TransferTest methodsFor: 'test' stamp: 'mg 11/9/2022 19:57:05'!
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

!TransferTest methodsFor: 'test' stamp: 'mg 11/9/2022 19:57:44'!
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

!TransferTest methodsFor: 'test' stamp: 'sp 11/9/2022 20:44:51'!
test05
	| account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer
		amount: 25 * peso
		from: account1
		to: account2.
	account1 balance .
	account2 .
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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'members'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'sp 11/10/2022 23:53:07'!
addMember: aMember
	(self == aMember) ifTrue: [
		^Portfolio errorCannotAddHimselfAsMember.
		].
	(self hasMember: aMember ) ifTrue: [
		^Portfolio errorDuplicatedAccount .	
		].
	members add: aMember.
	! !

!Portfolio methodsFor: 'initialization' stamp: 'sp 11/10/2022 23:21:59'!
getAccountTransactions: anAccount
	| account |
	account := members detect: [ :member |
				member hasMember: anAccount .
		].
	^account transactions .! !

!Portfolio methodsFor: 'initialization' stamp: 'sp 11/10/2022 19:43:44'!
initialize
	members := OrderedCollection new.! !


!Portfolio methodsFor: 'accessing' stamp: 'sp 11/10/2022 23:18:03'!
hasMember: aMember
	^members anySatisfy: [ :member |
				^member hasMember: aMember .
		].! !

!Portfolio methodsFor: 'accessing' stamp: 'sp 11/10/2022 23:18:26'!
hasRegistered: aTransaction
	^members anySatisfy: [ :member |
		^member hasRegistered: aTransaction
	].! !


!Portfolio methodsFor: 'balance' stamp: 'sp 11/10/2022 23:38:42'!
balance
	^members sum: [ :member | member balance.
	] ifEmpty: [0*peso].
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'initialization' stamp: 'sp 11/10/2022 19:29:25'!
newEmpty
	Portfolio new initialize.! !


!Portfolio class methodsFor: 'errors' stamp: 'sp 11/10/2022 23:53:35'!
errorCannotAddHimselfAsMember
	^'Cannot be himself as member.'.! !

!Portfolio class methodsFor: 'errors' stamp: 'sp 11/10/2022 23:53:45'!
errorDuplicatedAccount
	^'Cant add the same account twice'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'sp 11/10/2022 23:06:41'!
hasMember: aMember
	^aMember == self.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sp 11/10/2022 23:38:05'!
balance
 	^transactions sum: [ :aTransaction | aTransaction absoluteValue] ifEmpty: [^0 * peso].! !

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

!Transfer methodsFor: 'accessing' stamp: 'mg 11/9/2022 19:55:00'!
value
	^ value.! !


!Transfer methodsFor: 'initialization' stamp: 'mg 11/9/2022 20:09:36'!
amount: anAmount from: aSenderAccount to: aReceiverAccount 

	deposit := Deposit register: anAmount on: aReceiverAccount.
	withdraw := Withdraw register: anAmount on: aSenderAccount.
	value := anAmount.
	deposit setCounterpart: withdraw .
	withdraw setCounterpart: deposit .! !

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

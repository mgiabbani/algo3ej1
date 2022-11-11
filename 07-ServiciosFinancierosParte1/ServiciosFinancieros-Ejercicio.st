!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolioT accountT accountWith100Peso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!
!PortfolioTest commentStamp: 'mg 11/11/2022 14:29:56' prior: 0!
setUp
	portfolioT := Portfolio new.
	accountT := ReceptiveAccount new.
!


!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 15:46:32'!
test01newPortfolioHasZeroPesosBalance
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso .! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 14:33:53'!
test02addAccountAsMember

	portfolioT addMember: accountT.
	
	self assert: (portfolioT hasMember: accountT).! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 14:48:05'!
test03portfolioBalanceReturnsAccountBalance

	portfolioT addMember: accountWith100Peso.
	
	self assert: (portfolioT hasMember: accountWith100Peso).
	self assert: portfolioT balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 15:46:23'!
test04portfolioBalanceReturnsSumOfBalances

	Deposit register: 1000 * peso on: accountT.
	
	portfolioT addMember: accountWith100Peso.
	portfolioT addMember: accountT.

	self assert: portfolioT balance equals: 1100 * peso.! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 14:42:58'!
test05doesNotHaveARegisteredDeposit
	| deposit |

	deposit := Deposit register: 100 * peso on: accountT.

	self assert: (portfolioT hasRegistered: deposit) not.! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 15:44:37'!
test06hasARegisteredDeposit
	| deposit |

	deposit := Deposit register: 100 * peso on: accountT.
	portfolioT addMember: accountT .
	
	self assert: (portfolioT hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 15:44:18'!
test07getAccountTransactionsHasCorrectTransactions
	|  deposit withdraw expectedReturn |
	
	deposit := Deposit register: 100 * peso on: accountT.
	withdraw := Withdraw register: 12 * peso on: accountT.
	portfolioT addMember: accountT .
	
	expectedReturn := OrderedCollection new.
	expectedReturn add: deposit .
	expectedReturn add: withdraw .
	
	self assert: (portfolioT getAccountTransactions: accountT) equals: expectedReturn.! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 14:43:19'!
test08cannotAddAnAccountTwice
	
	portfolioT addMember: accountT.
	
	self assert: (portfolioT addMember: accountT) equals: Portfolio errorDuplicatedAccount .! !

!PortfolioTest methodsFor: 'test' stamp: 'mg 11/11/2022 14:41:22'!
test09cannotAddHimselfAsMember
	
	self assert: (portfolioT addMember: portfolioT ) equals: Portfolio errorCannotAddHimselfAsMember .
	! !


!PortfolioTest methodsFor: 'setUp/tearDown' stamp: 'mg 11/11/2022 14:52:04'!
setUp
	portfolioT := Portfolio new.
	accountT := ReceptiveAccount new.
	accountWith100Peso := ReceptiveAccount new.
	Deposit register: 100 * peso on: accountWith100Peso .
	
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'accountT'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 11/11/2022 15:34:50'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: accountT.
		
	self assert: 100 * peso equals: accountT balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 11/11/2022 15:35:21'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: accountT.
	Withdraw register: 50 * peso on: accountT.
		
	self assert: 50 * peso equals: accountT balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 11/11/2022 15:37:09'!
test04WithdrawValueMustBePositive 

	|  withdrawValue |
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: accountT) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 11/11/2022 15:39:03'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |

	deposit := Deposit register: 100 * peso on: accountT.
	withdraw := Withdraw register: 50 * peso on: accountT.
		
	self assert: (accountT hasRegistered: deposit).
	self assert: (accountT hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'mg 11/11/2022 15:41:34'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (accountT hasRegistered: deposit).
	self deny: (accountT hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setUp/tearDown' stamp: 'mg 11/11/2022 15:34:25'!
setUp
	
	accountT := ReceptiveAccount new.
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'accountX accountY'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'mg 11/11/2022 10:13:46'!
test01EmptyTransferDoesNotChangeAccountBalance

	Transfer		amount: 0 * peso		from: accountX	to: accountY.
	
	self	assert: accountX balance		equals: 0 * peso.
	self	assert: accountY balance		equals: 0 * peso.! !

!TransferTest methodsFor: 'test' stamp: 'mg 11/11/2022 10:14:34'!
test02OnePesoTranferGivesAndTakesOnePesoFromBalance

	Transfer 		amount: 1 * peso		from: accountX		to: accountY.
	
	self assert: accountX balance		equals: -1 * peso.
	self assert: accountY balance		equals: 1 * peso.! !

!TransferTest methodsFor: 'test' stamp: 'mg 11/11/2022 10:25:27'!
test03XPesoTransferGivesAndTakesXPesoFromBalance

	Deposit 	register: 100 * peso		on: accountX.
	Transfer		amount: 25 * peso		from: accountX		to: accountY.
	
	self assert: accountX balance 	equals: 75 * peso.
	self assert: accountY balance		equals: 25 * peso.! !

!TransferTest methodsFor: 'test' stamp: 'mg 11/11/2022 10:18:46'!
test04TransferKnowsTheTransactionValue
	| transfer |
	
	Deposit 	register: 100 * peso		on: accountX.
	transfer _ Transfer		amount: 25 * peso		from: accountX		to: accountY.
	
	self assert: transfer value		equals: 25 * peso.! !

!TransferTest methodsFor: 'test' stamp: 'mg 11/11/2022 15:48:34'!
test05TranferSidesKnowTheirCounterpart

	Transfer		amount: 25 * peso		from: accountX		to: accountY.
	
	self assert: (((accountX transactions at: 1) getCounterpart) isKindOf: Deposit).
	self assert: (((accountY transactions at: 1) getCounterpart) isKindOf: Withdraw)	.	! !


!TransferTest methodsFor: 'setUp/tearDown' stamp: 'mg 11/11/2022 10:01:49'!
setUp

	accountX := ReceptiveAccount new.
	accountY := ReceptiveAccount new.
! !


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

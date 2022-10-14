!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'finder testStackWithSentences testMatches'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'mg 10/14/2022 14:07:09'!
addSentences: sentencesArray

	sentencesArray do: [:sentence | testStackWithSentences push: sentence ].! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'mg 10/14/2022 14:06:52'!
addSentencesTestDomain: sentencesArray

	testStackWithSentences := OOStack new.
	self addSentences: sentencesArray.! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'mg 10/14/2022 13:01:14'!
assertTheStack: stackA isEqual: stackB
	|sentenceA sentenceB|
	
	self assert: stackA size = stackB size.
	
	[stackA isEmpty] whileFalse: [
		sentenceA :=  stackA pop.
		sentenceB := stackB pop.
		self assert: sentenceA = sentenceB.
	].
	^true.
	! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'mg 10/14/2022 14:06:43'!
createFinderWith: prefix

	finder := SentenceFinderByPrefix new.
	finder addSearchedPrefix: prefix.
	finder addSearchStack: testStackWithSentences copy.! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'mg 10/14/2022 14:06:28'!
startUpAndLookForPrefix: prefix InTheSentences: sentencesArray
	|matches |
	
	self addSentencesTestDomain: sentencesArray.
	self createFinderWith: prefix.
	matches := finder find.
	^matches.
	
! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 14:00:34'!
test01CanNotSearchEmptyPrefix
	| aFinder|
	
	aFinder := SentenceFinderByPrefix new.
	self
		should: [ aFinder addSearchedPrefix: '' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 14:01:05'!
test02CanNotSearchPrefixWithWhiteSpace
	| aFinder|
	
	aFinder := SentenceFinderByPrefix new.
	self
		should: [ aFinder addSearchedPrefix: 'small talk' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix whiteSpaceInPrefixErrorDescription equals: anError messageText ]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 12:40:54'!
test03NoFindignsNoMateches

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Summer is coming' 'here is not the prefix').
	
	self assert: testMatches isEmpty.
		
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:33:39'!
test04MatchesIsNotEmptyWhenThereIsAFinding

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Winter is coming' 'im already running out of exaples').
	
	self deny: testMatches isEmpty.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:48:35'!
test05TwoFindingsAddTwoMatches

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Winter is coming' 'im already running out of exaples' 'Winter Winter').
	
	self assert: testMatches size = 2.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:49:35'!
test06NumberOfAddedFindingsAreCaseSensitive

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Winter is coming' 'im already running out of exaples' 'winter Winter').
	
	self assert: testMatches size = 1.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:50:27'!
test07FindingsAreCaseSensitive

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('winter is coming' 'im already running out of exaples' 'winter Winter').
	
	self assert: testMatches isEmpty.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:52:43'!
test08FindingsAreReallyPrefixes

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('is the Winter coming?' 'im already running out of exaples' 'Wind is comming in winter').
	
	self assert: testMatches isEmpty.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:54:48'!
test09AddedFindingsAreCaseSensitive

	testMatches := self startUpAndLookForPrefix: 'We' InTheSentences: #('winter is coming' 'im already running out of exaples' 'We will rock you' 'Wimbledon' 'we are the champions').
	
	self assert: testMatches size = 1.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 11:56:11'!
test10AddedFindingsAreCaseSensitiveAndPrefixes

	testMatches := self startUpAndLookForPrefix: 'We' InTheSentences: #('winter is coming' 'im already running out of exaples' 'We will rock you' 'Wimbledon' 'we are the champions' 'are we good at smalltak?').
	
	self assert: testMatches size = 1.
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 14:01:18'!
test11NoFindingsNoMatechesNoOriginalStackModification

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Summer is coming' 'here is not the prefix').
	
	self assert: testMatches isEmpty.
	self assertTheStack: testStackWithSentences isEqual: (finder getSearchStack) .

		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 14:01:18'!
test12AddingFindignsDoesNotModifyOriginalStack

	testMatches := self startUpAndLookForPrefix: 'Winter' InTheSentences: #('Winter is coming' 'im already running out of exaples' 'the cold Winter' 'winter').
	
	self assertTheStack: testStackWithSentences isEqual: (finder getSearchStack) .

		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'mg 10/14/2022 14:23:50'!
test13FindingsAreCorrectMatches
	"Internally, SentenceFinderByPrefix uses an OOStack object to store the sentences, a second one is used to store the answers thats why the answerStack may seem upsdie down"

	|answersStack|
	answersStack := OOStack new.
	answersStack push: 'Window'.
	answersStack push: 'Winter is coming'.
	
	testMatches := self startUpAndLookForPrefix: 'Wi' InTheSentences: #('Winter is coming' 'im already running out of exaples' 'the cold Winter' 'winter' 'Window' 'winner').
	
	self assertTheStack: answersStack isEqual: testMatches .

		! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'roof size orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'mg 10/14/2022 14:09:20'!
initialize
	|flor|
	
	orderedCollection := OrderedCollection new.
	flor := Floor new.
	size := 0.
	roof := flor.! !

!OOStack methodsFor: 'private' stamp: 'mg 10/14/2022 14:09:34'!
popMy: oldRoof
	|popedValue|
	
	popedValue  := oldRoof getValue .
	roof := oldRoof getPrevious .
	^popedValue .

	! !


!OOStack methodsFor: 'adding' stamp: 'mg 10/14/2022 14:09:37'!
push: anElementToPush
	|stackBlock|
	
	stackBlock := Node new.
	stackBlock addValue: anElementToPush .
	stackBlock addPrevious: roof.
	roof := stackBlock .
	
	size := size + 1.
	! !


!OOStack methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:09:26'!
isEmpty

	^roof isEmpty .! !

!OOStack methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:09:29'!
pop

	^roof popFrom: self .! !

!OOStack methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:09:40'!
size

	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:09:43'!
top

	^roof top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'searchStack prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:07:56'!
getSearchStack

	^searchStack.
	! !


!SentenceFinderByPrefix methodsFor: 'adding' stamp: 'mg 10/14/2022 14:07:42'!
addSearchStack: phrasesStack

	searchStack  := phrasesStack.
	! !

!SentenceFinderByPrefix methodsFor: 'adding' stamp: 'mg 10/14/2022 14:07:47'!
addSearchedPrefix: thePrefix

	thePrefix isEmpty ifTrue: [
		self error: self class prefixEmptyErrorDescription.
		].
	(thePrefix findString: ' ' startingAt: 1) > 0 ifTrue:  [
		self error: self class whiteSpaceInPrefixErrorDescription.
		].
	prefix  := thePrefix .
	! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'mg 10/14/2022 11:29:22'!
find
	|matches helpStack sentence|
	
	matches := OOStack new.
	helpStack := searchStack copy.
	
	[helpStack isEmpty] whileFalse: [
		sentence := helpStack pop.
		(sentence beginsWith: prefix) ifTrue: [
			matches push: sentence
		].
	].
	^matches.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'mg 10/13/2022 17:49:30'!
prefixEmptyErrorDescription
	^'Prefix can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'mg 10/13/2022 18:44:24'!
whiteSpaceInPrefixErrorDescription
	^'Prefix can not have white spaces'! !


!classDefinition: #StackSkeleton category: 'Stack-Exercise'!
Object subclass: #StackSkeleton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackSkeleton methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:27:04'!
isEmpty
	self subclassResponsibility ! !

!StackSkeleton methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:27:09'!
popFrom: theStack
	self subclassResponsibility ! !

!StackSkeleton methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:27:16'!
top
	self subclassResponsibility ! !


!classDefinition: #Floor category: 'Stack-Exercise'!
StackSkeleton subclass: #Floor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Floor methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:10'!
isEmpty

	^true .! !

!Floor methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:14'!
popFrom: theStack

	OOStack error: OOStack stackEmptyErrorDescription .! !

!Floor methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:17'!
top

	OOStack error: OOStack stackEmptyErrorDescription .! !


!classDefinition: #Node category: 'Stack-Exercise'!
StackSkeleton subclass: #Node
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'adding' stamp: 'mg 10/14/2022 14:08:25'!
addPrevious: aBlock

	previous := aBlock .! !

!Node methodsFor: 'adding' stamp: 'mg 10/14/2022 14:08:34'!
addValue: aValue

	value := aValue.! !


!Node methodsFor: 'stack - dd' stamp: 'mg 10/14/2022 14:09:00'!
popFrom: theStack

	^theStack popMy: self.
! !


!Node methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:39'!
getPrevious

	^previous.! !

!Node methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:44'!
getValue

	^value! !

!Node methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:08:53'!
isEmpty

	^false.! !

!Node methodsFor: 'accessing' stamp: 'mg 10/14/2022 14:09:07'!
top

	^value! !

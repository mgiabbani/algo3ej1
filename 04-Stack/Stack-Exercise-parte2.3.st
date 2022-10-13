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
	instanceVariableNames: 'finderTest stackWithSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 18:41:44'!
test01CannotSearchEmptyPrefix

	| finder|
	
	finder := SentenceFinderByPrefix new.
	self
		should: [ finder addSearchedPrefix: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix prefixEmptyErrorDescription equals: anError messageText ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 19:02:29'!
test02CannotSearchPrefixWithWhiteSpace


	| finder|
	
	finder := SentenceFinderByPrefix new.
	self
		should: [ finder addSearchedPrefix: 'small talk' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: SentenceFinderByPrefix whiteSpaceInPrefixErrorDescription equals: anError messageText ]
		! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'roof size orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 18:53:48'!
initialize
	|flor|
	orderedCollection := OrderedCollection new.
	flor := Floor new.
	size := 0.
	roof := flor.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 15:58:29'!
isEmpty
	^roof isEmpty .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 16:00:55'!
pop
	^roof popFrom: self .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 16:15:08'!
popMy: oldRoof
	|popedValue|
	popedValue  := oldRoof getValue .
	roof := oldRoof getPrevious .
	^popedValue .

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 16:34:26'!
push: anElementToPush
	|stackBlock|
	stackBlock := Node new.
	stackBlock addValue: anElementToPush .
	stackBlock addPrevious: roof.
	roof := stackBlock .
	
	size := size + 1.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 14:07:57'!
size
	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 16:15:36'!
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
	instanceVariableNames: 'searchStack matchesStack auxStack searchedPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 17:43:24'!
addSearchStack: phrasesStack
	searchStack  := phrasesStack.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 18:44:24'!
addSearchedPrefix: thePrefix
	thePrefix isEmpty ifTrue: [
		SentenceFinderByPrefix error: SentenceFinderByPrefix prefixEmptyErrorDescription.
		].
	(thePrefix findString: ' ' startingAt: 1) = 0 ifTrue:  [
		SentenceFinderByPrefix error: SentenceFinderByPrefix whiteSpaceInPrefixErrorDescription.
		].
	searchedPrefix  := thePrefix .
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'mg 10/13/2022 17:42:57'!
initialize
	matchesStack  := OOStack new.! !

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

!Floor methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:25:16'!
isEmpty
	^true .! !

!Floor methodsFor: 'accessing' stamp: 'mg 10/13/2022 14:15:42'!
popFrom: theStack
	OOStack error: OOStack stackEmptyErrorDescription .! !

!Floor methodsFor: 'accessing' stamp: 'mg 10/13/2022 14:17:19'!
top
	OOStack error: OOStack stackEmptyErrorDescription .! !


!classDefinition: #Node category: 'Stack-Exercise'!
StackSkeleton subclass: #Node
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'adding' stamp: 'mg 10/13/2022 16:34:13'!
addPrevious: aBlock
	previous := aBlock .! !

!Node methodsFor: 'adding' stamp: 'mg 10/13/2022 16:34:26'!
addValue: aValue
	value := aValue.! !


!Node methodsFor: 'stack - dd' stamp: 'mg 10/13/2022 16:02:52'!
popFrom: theStack
	^theStack popMy: self.
! !


!Node methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:12:10'!
getPrevious
	^previous.! !

!Node methodsFor: 'accessing' stamp: 'mg 10/13/2022 16:06:47'!
getValue
	^value! !

!Node methodsFor: 'accessing' stamp: 'mg 10/13/2022 12:39:41'!
isEmpty
	^false.! !

!Node methodsFor: 'accessing' stamp: 'mg 10/13/2022 14:02:51'!
top
	^value! !

!classDefinition: #StackTest category: 'Stack-ejercicio04'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ejercicio04'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'sp 10/6/2022 18:18:46'!
test01newStackIsEmpty
	| stack |
	stack := Stack new initialize .
	
	Assert assert: stack isEmpty description: 'A new stack is empty'.
	Assert assert: (stack size = 0) description: 'A new stack has zero elements'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'sp 10/6/2022 18:31:15'!
test02pushAnElementIsGood
	| stack one |
	stack := Stack new initialize .
	one := 1.
	
	stack push: one.
	
	Assert assert: stack isEmpty not description: 'The stack is not empty'.
	Assert assert: (stack size = 1) description: 'The stack has 1 element.'.
	Assert assert: (stack top == one ) description: 'The top of the stack is the wanted value'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'sp 10/6/2022 18:32:37'!
test03removingAnElementFromAnArrayWithOneItem
	| stack one popedItem |
	stack := Stack new initialize .
	one := 1.
	
	stack push: one.
	popedItem := stack pop .
	
	Assert assert: stack isEmpty description: 'The stack is empty'.
	Assert assert: (stack size = 0) description: 'The stack has 0 elements.'.
	"Assert that top throws an error. TODO."
	Assert assert: (popedItem == one ) description: 'The top of the stack is the wanted value'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'sp 10/6/2022 18:55:15'!
test04popingFromAnEmptyStackThrowsError
	| stack |
	
	stack := Stack new initialize .

	self 
		should: [ stack pop. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'Cant pop from an empty stack.'.].! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'sp 10/6/2022 19:01:13'!
test05insertingAndRemovingMultipleItemsIsOk
	| stack numbersCollection |
	
	stack := Stack new initialize .
	
	numbersCollection := 1 to: 10.
	numbersCollection do: [ :aNumber |
		stack push: aNumber 
	].
	
	numbersCollection reverseDo: [ :aNumber |
		Assert assert: (stack top  == aNumber ) description: '		El ultimo elemento es el correcto'.
		Assert assert: (stack size  =  aNumber) description: 'El stack tiene la cantidad de items correcta'.
		Assert assert: (stack pop == aNumber)	 description: 'Popear el ultimo elemento devuelve el objeto correcto'.
	].


	Assert assert: stack isEmpty description: 'Despues de eliminar todos los elementos el stack esta vacio'.
	Assert assert: (stack size = 0) description: 'Despues de eliminar todos los elementos el stack tiene cero elementos.'.
	
	
	self 
		should: [ stack pop. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText = 'Cant pop from an empty stack.'.].! !


!classDefinition: #Stack category: 'Stack-ejercicio04'!
Object subclass: #Stack
	instanceVariableNames: 'orderedCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ejercicio04'!

!Stack methodsFor: 'initialization' stamp: 'sp 10/6/2022 17:16:49'!
initialize
	orderedCollection := OrderedCollection new.
	! !


!Stack methodsFor: 'basic-operations' stamp: 'sp 10/6/2022 17:30:46'!
isEmpty
	^orderedCollection isEmpty .! !

!Stack methodsFor: 'basic-operations' stamp: 'sp 10/6/2022 18:31:42'!
pop
	^orderedCollection isEmpty ifFalse: [	^orderedCollection removeLast.] ifTrue: [	^Error new signal: 'Cant pop from an empty stack.'].! !

!Stack methodsFor: 'basic-operations' stamp: 'sp 10/6/2022 17:18:50'!
push: anElementToPush
	orderedCollection addLast: anElementToPush .
	! !

!Stack methodsFor: 'basic-operations' stamp: 'sp 10/6/2022 18:18:46'!
size
	^orderedCollection size .! !

!Stack methodsFor: 'basic-operations' stamp: 'sp 10/6/2022 18:27:44'!
top
	^orderedCollection last .! !

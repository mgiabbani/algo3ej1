!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:25:43'!
addWithAFraccion: anAugend
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:25:39'!
addWithAnEntero: anAugend
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'mg 10/1/2022 17:28:57'!
divideFromAFraccion: aDividend
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:00'!
divideFromAnEntero: aDividend
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:25:10'!
multiplyWithAFraccion: aMultiplier
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:25:19'!
multiplyWithAnEntero: aMultiplier
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:53'!
substractFromAnEntero: aMinuend
	self subclassResponsability.! !

!Numero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:16:06'!
subtractFromAFraccion: aMinuend
	self subclassResponsability.! !


!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:15:16'!
* aMultiplier 
	^aMultiplier multiplyWithAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:14:41'!
+ anAdder 
	^anAdder addWithAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:15:54'!
- aSubtrahend 
	^aSubtrahend substractFromAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:15:00'!
/ aDivisor 
	^aDivisor divideFromAnEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'mg 10/1/2022 18:19:22'!
fibonacci
	self subclassResponsibility .! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:00'!
isNegative
	self subclassResponsibility .! !

!Entero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:16'!
isOne
	
	self subclassResponsibility .! !

!Entero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:23'!
isZero
	
	self subclassResponsibility .! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:26:02'!
addWithAFraccion: anAugend
	^self  * anAugend denominator + anAugend numerator  / anAugend denominator.! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:26:06'!
addWithAnEntero: anAugend
	^self class with: value + anAugend integerValue.! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'mg 10/1/2022 17:12:27'!
divideFromAFraccion: aDividend
	^(aDividend numerator) / (aDividend denominator *self)
! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:00'!
divideFromAnEntero: aDividend
	^Fraccion with: aDividend over: self
! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:26:22'!
multiplyWithAFraccion: aMultiplier
	^aMultiplier numerator * self / aMultiplier denominator .! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:26:26'!
multiplyWithAnEntero: aMultiplier
	^self class with: value * aMultiplier integerValue ! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:54'!
substractFromAnEntero: aMinuend
	^ self class with: aMinuend integerValue - self integerValue .
! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:16:06'!
subtractFromAFraccion: aMinuend
	^(aMinuend numerator - (self * aMinuend denominator))  / aMinuend denominator.! !


!Entero methodsFor: 'private' stamp: 'sp 10/2/2022 23:31:13'!
tryToCreateAFraccionWithTheDividend: aDividend
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'mg 10/1/2022 19:08:43'!
with: aValue 
	|classSelected|
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	classSelected := (Entero subclasses ) detect: [:aSubclass | aSubclass thisNumberIsYours: aValue].
	^classSelected new initializeWith: aValue.

	! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:46'!
isNegative
	^false.! !

!Cero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:51'!
isOne
	^false.! !

!Cero methodsFor: 'testing' stamp: 'sp 10/2/2022 23:02:37'!
isZero
	^true.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'sp 10/1/2022 19:01:30'!
fibonacci
	^Entero with: 1.! !


!Cero methodsFor: 'private' stamp: 'sp 10/2/2022 23:31:13'!
tryToCreateAFraccionWithTheDividend: aDividend
	Fraccion error: Fraccion canNotDivideByZeroErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'mg 10/2/2022 22:18:24'!
thisNumberIsYours: aValue
	^(aValue = 0)! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:14'!
isNegative
	^true.! !

!Negativo methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:07'!
isOne
	^false.! !

!Negativo methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:04'!
isZero
	^false.! !


!Negativo methodsFor: 'private' stamp: 'sp 10/2/2022 23:31:13'!
tryToCreateAFraccionWithTheDividend: aDividend
	^aDividend negated / self negated! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'mg 10/1/2022 17:55:09'!
fibonacci
 ^self error: Entero negativeFibonacciErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'mg 10/1/2022 18:29:45'!
thisNumberIsYours: aValue
	^(aValue < 0)! !


!classDefinition: #PositivoDistintoDeUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #PositivoDistintoDeUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!PositivoDistintoDeUno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:28'!
isNegative
	^false
	! !

!PositivoDistintoDeUno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:45'!
isOne
	^false
	! !

!PositivoDistintoDeUno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:25'!
isZero
	^false
	! !


!PositivoDistintoDeUno methodsFor: 'arithmetic operations' stamp: 'mg 10/1/2022 18:12:53'!
fibonacci
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	^ (self - one) fibonacci + (self - two) fibonacci! !


!PositivoDistintoDeUno methodsFor: 'private' stamp: 'sp 10/2/2022 23:31:13'!
tryToCreateAFraccionWithTheDividend: aDividend
	| greatestCommonDivisor numerator denominator |
	
	aDividend isZero ifTrue: [ ^aDividend ].

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositivoDistintoDeUno class' category: 'Numeros-Parte2-Ejercicio'!
PositivoDistintoDeUno class
	instanceVariableNames: ''!

!PositivoDistintoDeUno class methodsFor: 'as yet unclassified' stamp: 'mg 10/1/2022 18:30:10'!
thisNumberIsYours: aValue
	^(aValue > 1 )! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'private' stamp: 'sp 10/2/2022 23:31:13'!
tryToCreateAFraccionWithTheDividend: aDividend
	| greatestCommonDivisor numerator denominator |
	
	aDividend isZero ifTrue: [ ^aDividend ].

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!Uno methodsFor: 'arithmetic operations' stamp: 'mg 10/2/2022 22:18:41'!
fibonacci
	^Entero with: 1.! !


!Uno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:04:07'!
isNegative
	^false.! !

!Uno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:03:56'!
isOne
	^true.! !

!Uno methodsFor: 'testing' stamp: 'sp 10/2/2022 23:04:01'!
isZero
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'mg 10/2/2022 22:17:58'!
thisNumberIsYours: aValue
	^(aValue = 1)! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:13:14'!
* aMultiplier 
	^aMultiplier multiplyWithAFraccion: self.

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:14:23'!
+ anAdder 
	
	^anAdder addWithAFraccion: self .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sp 10/2/2022 23:16:06'!
- aSubtrahend 
	^aSubtrahend  subtractFromAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'mg 10/1/2022 17:14:22'!
/ aDivisor 
 	^aDivisor divideFromAFraccion: self
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:27:27'!
addWithAFraccion: anAugend
	| newNumerator newDenominator |
	
	newNumerator := (anAugend numerator * self denominator) + (anAugend denominator * self numerator).
	newDenominator := anAugend denominator * self denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:27:31'!
addWithAnEntero: anAugend
	^anAugend  * self denominator + self numerator  / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'mg 10/1/2022 17:13:55'!
divideFromAFraccion: aDividend
	^(aDividend numerator * self denominator) / (aDividend denominator * self numerator)
! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:00'!
divideFromAnEntero: aDividend
		^ (self denominator * aDividend)/(self numerator)! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:27:48'!
multiplyWithAFraccion: aMultiplier
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:27:58'!
multiplyWithAnEntero: aMultiplier
	^self numerator * aMultiplier / self denominator .! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:15:54'!
substractFromAnEntero: aMinuend
^((aMinuend * self denominator) - self numerator)  / self denominator.! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'sp 10/2/2022 23:16:06'!
subtractFromAFraccion: aMinuend
	| newNumerator newDenominator |
	
	newNumerator := (aMinuend numerator * self denominator) - (aMinuend denominator * self numerator).
	newDenominator := aMinuend denominator * self denominator.
	
	^newNumerator / newDenominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'sp 10/2/2022 23:31:13'!
with: aDividend over: aDivisor
	^aDivisor tryToCreateAFraccionWithTheDividend: aDividend

		
	
	

	
	! !

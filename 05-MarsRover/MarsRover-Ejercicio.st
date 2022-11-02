!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'sp 11/2/2022 20:39:57'!
test01nuevoMarsRoverEmpiezaConLaPosicionDeseada
	| marsRover posicionInicial puntoCardinalInicial |
	
	posicionInicial := Point x: 0 y: 0.
	puntoCardinalInicial := Norte new.
	
	marsRover := MarsRover new conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	
	self assert: marsRover posicionActual = posicionInicial .
	self assert: marsRover direccionActual = puntoCardinalInicial .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'sp 11/2/2022 20:39:57'!
test02secuenciaSimpleSeEjecutaCorrectamente
	| marsRover posicionInicial puntoCardinalInicial secuenciaDeMovimientos posicionFinalEsperada |
	
	posicionInicial := Point x: 0 y: 0.
	puntoCardinalInicial := Norte new.
	
	marsRover := MarsRover new conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	
	secuenciaDeMovimientos := #('f').
	posicionFinalEsperada := Point x: 0 y: 1.
	
	marsRover ejecutarSecuenciaDeMovimientos: secuenciaDeMovimientos .
	
	self assert: marsRover posicionActual = posicionFinalEsperada .
	self assert: marsRover direccionActual = puntoCardinalInicial .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'sp 11/2/2022 20:39:57'!
test03avanzarYRetrocederVuelveALaMismaPosicion
	| marsRover posicionInicial puntoCardinalInicial secuenciaDeMovimientos posicionFinalEsperada |
	
	posicionInicial := Point x: 12 y: 11.
	puntoCardinalInicial := Sur new.
	
	marsRover := MarsRover new conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	
	secuenciaDeMovimientos := #('f' 'b').
	posicionFinalEsperada := Point x: 12 y: 11.
	
	marsRover ejecutarSecuenciaDeMovimientos: secuenciaDeMovimientos .
	
	self assert: marsRover posicionActual = posicionFinalEsperada .
	self assert: marsRover direccionActual = puntoCardinalInicial .	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'sp 11/2/2022 20:39:57'!
test04cambiarRumboYAvanzarLlevaAPosicionEsperada
	| marsRover posicionInicial puntoCardinalInicial secuenciaDeMovimientos posicionFinalEsperada |
	
	posicionInicial := Point x: 0 y: 0.
	puntoCardinalInicial := Norte new.
	
	marsRover := MarsRover new conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	
	secuenciaDeMovimientos := #('f' 'r' 'f').
	posicionFinalEsperada := Point x: 1 y: 1.
	
	marsRover ejecutarSecuenciaDeMovimientos: secuenciaDeMovimientos .
	
	self assert: marsRover posicionActual = posicionFinalEsperada .
	self assert: (marsRover direccionActual isKindOf: Este) .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'sp 11/2/2022 20:39:57'!
test05multiplesAccionesJuntas
	| marsRover posicionInicial puntoCardinalInicial secuenciaDeMovimientos posicionFinalEsperada |
	
	posicionInicial := Point x: 0 y: 0.
	puntoCardinalInicial := Norte new.
	
	marsRover := MarsRover new conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	
	secuenciaDeMovimientos := #('f' 'r' 'f' 'f' 'f' 'b' 'r' 'l' 'r' 'f' 'b' 'l' 'f' 'r' 'f' 'f' 'f' 'b' 'r' 'l' 'r' 'f' 'b' 'l' 'f' 'r' 'f' 'f' 'f' 'b' 'r' 'l' 'r' 'f' 'b' 'l').
	posicionFinalEsperada := Point x: 1 y: -2.
	
	marsRover ejecutarSecuenciaDeMovimientos: secuenciaDeMovimientos .
	
	self assert: marsRover posicionActual = posicionFinalEsperada .
	self assert: (marsRover direccionActual isKindOf: Oeste) .! !


!classDefinition: #Accion category: 'MarsRover'!
Object subclass: #Accion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Accion class' category: 'MarsRover'!
Accion class
	instanceVariableNames: ''!

!Accion class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:32:29'!
aPartirDelCaracter: unCaracter
	| claseSeleccionada |
	claseSeleccionada := (AccionValida subclasses) detect: [ :unaSubclase | unaSubclase esteCaracterTeDefine: unCaracter ]
	ifNone: [^AccionInvalida new].
	^claseSeleccionada new.
! !

!Accion class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:26:55'!
esteCaracterTeDefine: unCaracter
	^self subclassResponsibility .! !


!classDefinition: #AccionInvalida category: 'MarsRover'!
Accion subclass: #AccionInvalida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!AccionInvalida methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:36:01'!
aplicarSobre: unAplicable
	^unAplicable.! !


!classDefinition: #AccionValida category: 'MarsRover'!
Accion subclass: #AccionValida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #Avanzar category: 'MarsRover'!
AccionValida subclass: #Avanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Avanzar methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:36:27'!
aplicarSobre: unAplicable
	unAplicable avanzar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avanzar class' category: 'MarsRover'!
Avanzar class
	instanceVariableNames: ''!

!Avanzar class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:27:25'!
esteCaracterTeDefine: unCaracter
	^unCaracter = 'f' .! !


!classDefinition: #GirarDerecha category: 'MarsRover'!
AccionValida subclass: #GirarDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GirarDerecha methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:36:41'!
aplicarSobre: unAplicable
	unAplicable girarDerecha.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GirarDerecha class' category: 'MarsRover'!
GirarDerecha class
	instanceVariableNames: ''!

!GirarDerecha class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:27:35'!
esteCaracterTeDefine: unCaracter
	^unCaracter = 'r' .! !


!classDefinition: #GirarIzquierda category: 'MarsRover'!
AccionValida subclass: #GirarIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GirarIzquierda methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:36:54'!
aplicarSobre: unAplicable
	unAplicable girarIzquierda.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GirarIzquierda class' category: 'MarsRover'!
GirarIzquierda class
	instanceVariableNames: ''!

!GirarIzquierda class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:27:43'!
esteCaracterTeDefine: unCaracter
	^unCaracter = 'l' .! !


!classDefinition: #Retroceder category: 'MarsRover'!
AccionValida subclass: #Retroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Retroceder methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:37:07'!
aplicarSobre: unAplicable
	unAplicable retroceder.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Retroceder class' category: 'MarsRover'!
Retroceder class
	instanceVariableNames: ''!

!Retroceder class methodsFor: 'as yet unclassified' stamp: 'sp 11/2/2022 20:27:52'!
esteCaracterTeDefine: unCaracter
	^unCaracter = 'b' .! !


!classDefinition: #Direccion category: 'MarsRover'!
Object subclass: #Direccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direccion methodsFor: 'redireccion' stamp: 'sp 11/2/2022 20:16:00'!
avanzar
	^self subclassResponsibility .! !

!Direccion methodsFor: 'redireccion' stamp: 'sp 11/2/2022 20:15:51'!
girar90GradosDerecha
	^self subclassResponsibility .! !

!Direccion methodsFor: 'redireccion' stamp: 'sp 11/2/2022 20:15:57'!
girar90GradosIzquierda
	^self subclassResponsibility .! !


!classDefinition: #Este category: 'MarsRover'!
Direccion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:57:03'!
avanzar
	^Point x: 1 y: 0.! !

!Este methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:40:33'!
girar90GradosDerecha
	^Sur new.! !

!Este methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:40:27'!
girar90GradosIzquierda
	^Norte new.! !


!classDefinition: #Norte category: 'MarsRover'!
Direccion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:57:14'!
avanzar
	^Point x: 0 y: 1.! !

!Norte methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:40:59'!
girar90GradosDerecha
	^Este new.! !

!Norte methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:41:05'!
girar90GradosIzquierda
	^Oeste new.! !


!classDefinition: #Oeste category: 'MarsRover'!
Direccion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:57:21'!
avanzar
	^Point x: -1 y: 0.! !

!Oeste methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:41:23'!
girar90GradosDerecha
	^Norte new.! !

!Oeste methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:41:35'!
girar90GradosIzquierda
	^Sur new.! !


!classDefinition: #Sur category: 'MarsRover'!
Direccion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:57:40'!
avanzar
	^Point x: 0 y: -1.! !

!Sur methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:42:01'!
girar90GradosDerecha
	^Oeste new.! !

!Sur methodsFor: 'redireccion' stamp: 'sp 11/2/2022 19:42:06'!
girar90GradosIzquierda
	^Este new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'inicializacion' stamp: 'sp 11/2/2022 19:34:54'!
conPosicionInicial: posicionInicial yPuntoCardinal: puntoCardinalInicial .
	posicion := posicionInicial .
	direccion := puntoCardinalInicial .! !


!MarsRover methodsFor: 'movimiento' stamp: 'sp 11/2/2022 20:37:56'!
avanzar
	posicion := posicion + direccion avanzar .! !

!MarsRover methodsFor: 'movimiento' stamp: 'sp 11/2/2022 20:39:07'!
ejecutarSecuenciaDeMovimientos: secuenciaDeMovimientos
	secuenciaDeMovimientos do: [:movimiento | | accion |
		accion := Accion aPartirDelCaracter: movimiento.
		accion aplicarSobre: self.
	].! !

!MarsRover methodsFor: 'movimiento' stamp: 'sp 11/2/2022 20:38:50'!
girarDerecha
	direccion := direccion girar90GradosDerecha .! !

!MarsRover methodsFor: 'movimiento' stamp: 'sp 11/2/2022 20:38:32'!
girarIzquierda
	direccion := direccion girar90GradosIzquierda .! !

!MarsRover methodsFor: 'movimiento' stamp: 'sp 11/2/2022 20:38:04'!
retroceder
	posicion := posicion - direccion avanzar .! !


!MarsRover methodsFor: 'informacion' stamp: 'sp 11/2/2022 20:39:57'!
direccionActual
	^direccion.! !

!MarsRover methodsFor: 'informacion' stamp: 'sp 11/2/2022 18:53:48'!
posicionActual
	^posicion.! !

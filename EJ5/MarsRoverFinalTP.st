!classDefinition: #Comando category: 'MarsRover'!
TestCase subclass: #Comando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Comando methodsFor: 'interpretacion' stamp: 'AlgebraDeBoole 11/17/2021 22:39:44'!
serInterpretadoPor: unMarsRover
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comando class' category: 'MarsRover'!
Comando class
	instanceVariableNames: ''!

!Comando class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 22:14:32'!
canInstanceWith: unComando
	self subclassResponsibility ! !

!Comando class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:06:42'!
with: unComando
	|selectedSubclass|
	selectedSubclass := Comando subclasses detect: [:subclass | (subclass canInstanceWith: unComando)] ifNone: [self error: 	MarsRover comandoInvalidoErrorDescription ].
	^ selectedSubclass new.! !


!classDefinition: #Backward category: 'MarsRover'!
Comando subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backward methodsFor: 'interpretacion' stamp: 'AlgebraDeBoole 11/18/2021 10:19:53'!
serInterpretadoPor: unMarsRover

	unMarsRover procesarBackward.	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 22:14:32'!
canInstanceWith: unComando
	^ unComando = $b! !


!classDefinition: #Forward category: 'MarsRover'!
Comando subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'interpretacion' stamp: 'AlgebraDeBoole 11/18/2021 10:19:47'!
serInterpretadoPor: unMarsRover

	unMarsRover procesarForward.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 22:14:32'!
canInstanceWith: unComando
	^ unComando = $f! !


!classDefinition: #Left category: 'MarsRover'!
Comando subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Left methodsFor: 'interpretacion' stamp: 'AlgebraDeBoole 11/18/2021 10:19:43'!
serInterpretadoPor: unMarsRover

	unMarsRover procesarLeft.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 22:14:32'!
canInstanceWith: unComando
	^ unComando = $l! !


!classDefinition: #Right category: 'MarsRover'!
Comando subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Right methodsFor: 'interpretacion' stamp: 'AlgebraDeBoole 11/18/2021 10:19:28'!
serInterpretadoPor: unMarsRover
	
	unMarsRover procesarRight.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 22:14:32'!
canInstanceWith: unComando
	^ unComando = $r! !


!classDefinition: #Direccion category: 'MarsRover'!
TestCase subclass: #Direccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direccion methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:05'!
descripcion
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Direccion class' category: 'MarsRover'!
Direccion class
	instanceVariableNames: ''!

!Direccion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:22:26'!
canInstanceWith: unaDireccion
	self subclassResponsibility ! !

!Direccion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:21:54'!
with: unaDireccion
	|selectedSubclass|
	selectedSubclass := Direccion subclasses detect: [:subclass | (subclass canInstanceWith: unaDireccion)].
	^ selectedSubclass new.! !


!classDefinition: #Este category: 'MarsRover'!
Direccion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:17:48'!
avanzar: unMarsRover
	unMarsRover avanzarConDireccionEste! !

!Este methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:18'!
descripcion
	 ^'E'! !

!Este methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:47'!
girarDerecha: unMarsRover
	unMarsRover girarDerechaConDireccionEste! !

!Este methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:16:22'!
girarIzquierda: unMarsRover.
	unMarsRover girarIzquierdaConDireccionEste! !

!Este methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:17:25'!
retroceder: unMarsRover
	unMarsRover retrocederConDireccionEste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:22:59'!
canInstanceWith: unaDireccion
	^ unaDireccion = 'E'! !


!classDefinition: #Norte category: 'MarsRover'!
Direccion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:17'!
avanzar: unMarsRover
	unMarsRover avanzarConDireccionNorte.! !

!Norte methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:24'!
descripcion
	 ^'N'! !

!Norte methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:47'!
girarDerecha: unMarsRover
	unMarsRover girarDerechaConDireccionNorte! !

!Norte methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:16:22'!
girarIzquierda: unMarsRover.
	unMarsRover girarIzquierdaConDireccionNorte! !

!Norte methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:19:20'!
retroceder: unMarsRover
	unMarsRover retrocederConDireccionNorte! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:23:07'!
canInstanceWith: unaDireccion
	^ unaDireccion = 'N'! !


!classDefinition: #Oeste category: 'MarsRover'!
Direccion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:17'!
avanzar: unMarsRover
	unMarsRover avanzarConDireccionOeste.! !

!Oeste methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:29'!
descripcion
	 ^'O'! !

!Oeste methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:47'!
girarDerecha: unMarsRover
	unMarsRover girarDerechaConDireccionOeste! !

!Oeste methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:16:22'!
girarIzquierda: unMarsRover.
	unMarsRover girarIzquierdaConDireccionOeste! !

!Oeste methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:19:30'!
retroceder: unMarsRover
	unMarsRover retrocederConDireccionOeste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:23:11'!
canInstanceWith: unaDireccion
	^ unaDireccion = 'O'! !


!classDefinition: #Sur category: 'MarsRover'!
Direccion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:17'!
avanzar: unMarsRover
	unMarsRover avanzarConDireccionSur.! !

!Sur methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:35'!
descripcion
	 ^'S'! !

!Sur methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:14:47'!
girarDerecha: unMarsRover
	unMarsRover girarDerechaConDireccionSur! !

!Sur methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:16:22'!
girarIzquierda: unMarsRover.
	unMarsRover girarIzquierdaConDireccionSur! !

!Sur methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:19:39'!
retroceder: unMarsRover
	unMarsRover retrocederConDireccionSur! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 23:23:15'!
canInstanceWith: unaDireccion
	^ unaDireccion = 'S'! !


!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'coordenadaOrigen norte oeste sur este forward backward left right comandoVacio comandoInvalido unMarsRover2 posicionFinal2 comando'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 10:50:17'!
setUp
	
	coordenadaOrigen := 0@0.
	
	norte := 'N'.
	oeste := 'O'.
	sur := 'S'.
	este := 'E'.
	
	forward := 'f'.
	backward := 'b'.
	left := 'l'.
	right := 'r'.
	
	comandoVacio := ''.
	
	comandoInvalido := 'x'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 10:50:28'!
test01SiMarsRoverRecibeUnComandoVacioElMismoNoCambiaDePosicion
	
	unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: norte .
	unMarsRover2 recibirComandos: comandoVacio .
	self assert: unMarsRover2 posicion equals: coordenadaOrigen .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:16:07'!
test02SiMarsRoverApuntaAlNorteYAvanzaAumentaSuCoordenadaY
	
	self 
		assertconUnaDireccionInicial: norte
		elComando: forward 
		yElPuntoDeLlegada: (0@1) ! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:16:25'!
test03SiMarsRoverApuntaAlNorteYRetrocedeDisminuyeSuCoordenadaY
	
	self 
		assertconUnaDireccionInicial: norte
		elComando: backward 
		yElPuntoDeLlegada: (0@-1) 
		! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:16:44'!
test04SiMarsRoverApuntaAlSurYAvanzaDisminuyeSuCoordenadaY
	
	self 
		assertconUnaDireccionInicial: sur
		elComando: forward 
		yElPuntoDeLlegada: (0@-1) 
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:17:32'!
test05SiMarsRoverApuntaAlSurYRetrocedeAumentaSuCoordenadaY
	
	self 
		assertconUnaDireccionInicial: sur
		elComando: backward 
		yElPuntoDeLlegada: (0@1) 
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:17:53'!
test06SiMarsRoverApuntaAlEsteYAvanzaAumentaSuCoordenadaX

self 
		assertconUnaDireccionInicial: este
		elComando: forward 
		yElPuntoDeLlegada: (1@0) 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:18:18'!
test07SiMarsRoverApuntaAlEsteYRetrocedeDisminuyeSuCoordenadaX

self 
		assertconUnaDireccionInicial: este
		elComando: backward 
		yElPuntoDeLlegada: (-1@0) 

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:18:35'!
test08SiMarsRoverApuntaAlOesteYAvanzaDisminuyeSuCoordenadaX

self 
		assertconUnaDireccionInicial: oeste
		elComando: forward 
		yElPuntoDeLlegada: (-1@0) 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:19:04'!
test09SiMarsRoverApuntaAlOesteYRetrocedeAumentaSuCoordenadaX

self 
		assertconUnaDireccionInicial: oeste 
		elComando: backward 
		yElPuntoDeLlegada: (1@0) 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:20:35'!
test10SiMarsRoverAvanzaNoCambiaLaDireccion

self
	assertconUnaDireccionInicial: norte
	elComando: forward 
	yLaDireccionDeLlegada: norte 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:21:07'!
test11SiMarsRoverRetrocedeNoCambiaLaDireccion

self
	assertconUnaDireccionInicial: norte
	elComando: backward 
	yLaDireccionDeLlegada: norte 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:21:27'!
test12SiMarsRoverApuntaAlNorteYGiraIzquierdaApuntaAlOeste

self
	assertconUnaDireccionInicial: norte
	elComando: left
	yLaDireccionDeLlegada: oeste ! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:21:57'!
test13SiMarsRoverApuntaAlNorteYGiraDerechaApuntaAlEste

self
	assertconUnaDireccionInicial: norte
	elComando: right
	yLaDireccionDeLlegada: este 

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:22:21'!
test14SiMarsRoverApuntaAlOesteYGiraDerechaApuntaAlNorte

self
	assertconUnaDireccionInicial: oeste
	elComando: right
	yLaDireccionDeLlegada: norte 

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:22:39'!
test15SiMarsRoverApuntaAlSurYGiraIzquierdaApuntaAlEste

self
	assertconUnaDireccionInicial: sur
	elComando: left
	yLaDireccionDeLlegada: este ! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:22:56'!
test16SiMarsRoverApuntaAlSurYGiraDerechaApuntaAlOeste

self
	assertconUnaDireccionInicial: sur
	elComando: right
	yLaDireccionDeLlegada: oeste 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:23:15'!
test17SiMarsRoverApuntaAlEsteYGiraIzquierdaApuntaAlNorte

self
	assertconUnaDireccionInicial: este
	elComando: left
	yLaDireccionDeLlegada: norte 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:23:35'!
test18SiMarsRoverApuntaEsteYGiraDerechaApuntaAlSur

self
	assertconUnaDireccionInicial: este
	elComando: right
	yLaDireccionDeLlegada: sur 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:24:12'!
test19SiMarsRoverApuntaAlNorteYGiraDosVecesTerminaApuntandoAlSur
	
self
	assertconUnaDireccionInicial: norte
	elComando: 'rr'
	yLaDireccionDeLlegada: sur
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 11:10:57'!
test20SiMarsRoverRecibeMasDeUnComandoValidoLosRealiza
	
	unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: norte .
	posicionFinal2 := -1@-1.
	comando := 'brb'.
	unMarsRover2 recibirComandos: comando.
	self assert: unMarsRover2 direccion equals: este.
	self assert: unMarsRover2 posicion equals: posicionFinal2.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 11:06:30'!
test21SiMarsRoverSeLeIngresaUnComandoInvalidoDevuelveUnErrorYNoRealizaMovimientos

  	unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: norte.
	self
		should: [unMarsRover2 recibirComandos: comandoInvalido ] 
		raise: Error 
		withExceptionDo: [ :e |
	            self assert: e messageText equals: MarsRover comandoInvalidoErrorDescription. 
	            self assert: unMarsRover2 posicion equals: coordenadaOrigen .
	            self assert: unMarsRover2 direccion equals: norte.].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AlgebraDeBoole 11/18/2021 18:06:20'!
test22SiMarsRoverSeLeIngresanComandosValidosLosProcesaHastaQueSeProceseUnComandoInvalido

    unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: norte .
    posicionFinal2 := 0@1.
    comando := 'frxbl'.
    self 
		should: [ (unMarsRover2 recibirComandos: comando) ]  
    		raise: Error 
    		withExceptionDo: [ :e |
            self assert: unMarsRover2 posicion equals: posicionFinal2 .
            self assert: unMarsRover2 direccion equals: este.
        ].! !


!MarsRoverTest methodsFor: 'assert-private' stamp: 'AlgebraDeBoole 11/18/2021 18:12:14'!
assertconUnaDireccionInicial: direccion elComando: comandoIngresado yElPuntoDeLlegada: posicionFinal

	unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: direccion .
	unMarsRover2 recibirComandos: comandoIngresado.
	self assert: unMarsRover2 posicion equals: posicionFinal.! !

!MarsRoverTest methodsFor: 'assert-private' stamp: 'AlgebraDeBoole 11/18/2021 18:20:14'!
assertconUnaDireccionInicial: direccion elComando: comandoIngresado yLaDireccionDeLlegada: direccionFinal

	unMarsRover2 := MarsRover new posicionadoEn: coordenadaOrigen  conDireccionHacia: direccion .
	unMarsRover2 recibirComandos: comandoIngresado.
	self assert: unMarsRover2 direccion equals: direccionFinal.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion direccion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/17/2021 23:27:58'!
direccion
	^ direccion descripcion .! !

!MarsRover methodsFor: 'operations' stamp: 'Frank 11/13/2021 15:28:02'!
posicion
	^ posicion.	! !

!MarsRover methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/18/2021 10:21:13'!
recibirComandos: comandos

	self procesarComandos: comandos.! !


!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:58:16'!
avanzarConDireccionEste
	posicion := posicion + (1@0).! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:57:13'!
avanzarConDireccionNorte
	posicion := posicion + (0@1).! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:58:11'!
avanzarConDireccionOeste
	posicion := posicion + (-1@0).! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:57:23'!
avanzarConDireccionSur
	posicion := posicion + (0@-1).! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:12'!
girarDerechaConDireccionEste
	direccion := Sur new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:17'!
girarDerechaConDireccionNorte
	direccion := Este new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:06'!
girarDerechaConDireccionOeste
	direccion := Norte new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:23'!
girarDerechaConDireccionSur
	direccion := Oeste new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:28'!
girarIzquierdaConDireccionEste
	direccion := Norte new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:32'!
girarIzquierdaConDireccionNorte
	direccion := Oeste new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:37'!
girarIzquierdaConDireccionOeste
	direccion := Sur new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:29:42'!
girarIzquierdaConDireccionSur
	direccion := Este new.! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 23:24:54'!
posicionadoEn: unPunto conDireccionHacia: unaDireccion
	
	posicion := unPunto.
	direccion := Direccion with: unaDireccion .! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:55:40'!
procesarComandoInvalido
	self error: MarsRover comandoInvalidoErrorDescription ! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:59:06'!
retrocederConDireccionEste
	posicion := posicion + (-1@0).		! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:58:41'!
retrocederConDireccionNorte
	posicion := posicion + (0@-1).		! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:58:57'!
retrocederConDireccionOeste
	posicion := posicion + (1@0).		! !

!MarsRover methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/17/2021 21:58:49'!
retrocederConDireccionSur
	posicion := posicion + (0@1).		! !


!MarsRover methodsFor: 'procesar-private' stamp: 'AlgebraDeBoole 11/18/2021 10:17:03'!
procesarBackward
	direccion retroceder:self . ! !

!MarsRover methodsFor: 'procesar-private' stamp: 'AlgebraDeBoole 11/17/2021 22:53:02'!
procesarComandos: comandos
	comandos do: [:comando | 
		(Comando with: comando) serInterpretadoPor: self.
		].! !

!MarsRover methodsFor: 'procesar-private' stamp: 'AlgebraDeBoole 11/18/2021 10:16:45'!
procesarForward
	direccion avanzar:self . ! !

!MarsRover methodsFor: 'procesar-private' stamp: 'AlgebraDeBoole 11/18/2021 10:17:15'!
procesarLeft
	direccion girarIzquierda:self . ! !

!MarsRover methodsFor: 'procesar-private' stamp: 'AlgebraDeBoole 11/18/2021 10:17:27'!
procesarRight
	direccion girarDerecha:self . ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/17/2021 20:35:17'!
comandoInvalidoErrorDescription
	^'Comando invalido'.! !

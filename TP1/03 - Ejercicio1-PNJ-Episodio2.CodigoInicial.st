!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frasesSiPjEsDesconocido frasesSiPjEsPrometedor cantidadDeInteraccionesPorPersonajes'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:16:11'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaSegunNumeroDeInteraccion |
	
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar .
	respuestaSegunNumeroDeInteraccion := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	
	(self verificarFinalDeDialogosPara: unPersonajeJugadorAInteractuar ) ifTrue: [
		self cambiarLaCalificacionAPrometedorDe: 		unPersonajeJugadorAInteractuar].
	
	^ respuestaSegunNumeroDeInteraccion.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 14:57:45'!
olvidar
	cantidadDeInteraccionesPorPersonajes := Dictionary new.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 17:56:35'!
reiniciarInteraccionesDe: unPersonaje
	cantidadDeInteraccionesPorPersonajes at: unPersonaje put: 0.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 18:35:09'!
cambiarLaCalificacionAPrometedorDe: unPersonaje
	self ciudadDeRiverwood agregarPersonajeAListaDePrometedores: unPersonaje.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 15:26:11'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesPorPersonajes at: unPersonaje put: 0.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 14:54:52'!
recordarInteraccionCon: UnPersonaje
	| numeroDeInteraccionActual |
	numeroDeInteraccionActual  := cantidadDeInteraccionesPorPersonajes at: 	UnPersonaje ifAbsent: [0].
	cantidadDeInteraccionesPorPersonajes at: UnPersonaje put: numeroDeInteraccionActual + 1.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 18:36:48'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteracciones |
	cantidadDeInteracciones := cantidadDeInteraccionesPorPersonajes at: unPersonaje.
	(self ciudadDeRiverwood saberSiUnPersonajeEsPrometedor: unPersonaje ) ifTrue: [^ frasesSiPjEsPrometedor at: (cantidadDeInteracciones min: 	frasesSiPjEsPrometedor size) ].
	^ frasesSiPjEsDesconocido at: (cantidadDeInteracciones min: frasesSiPjEsDesconocido size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 18:34:10'!
verificarFinalDeDialogosPara: unPersonaje
	^ (self ciudadDeRiverwood saberSiUnPersonajeEsPrometedor: unPersonaje ) not and: ( (cantidadDeInteraccionesPorPersonajes at: unPersonaje) >= 	(frasesSiPjEsDesconocido size)).! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'ciudad' stamp: 'AlgebraDeBoole 9/29/2021 17:59:58'!
ciudadDeRiverwood
	^Riverwood! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 18:40:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesSiPjEsDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesSiPjEsPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorPersonajes := ((Dictionary new)).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hamilton class' category: 'Ejercicio1-PNJ-Episodio2'!
Hamilton class
	instanceVariableNames: 'esPrometedorEnRiverwood'!

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:31:59'!
esPrometedorEnRiverwood
	^ esPrometedorEnRiverwood.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:31:00'!
hacerQueRiverwoodLoVeaDesconocido
	esPrometedorEnRiverwood := false.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:31:00'!
hacerQueRiverwoodLoVeaPrometedor
	esPrometedorEnRiverwood := true.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 18:40:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	esPrometedorEnRiverwood := true.! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'AlgebraDeBoole 9/29/2021 16:44:01'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton).! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 14:59:51'!
carolinaLaCurandera
	^ CarolinaLaCuranderaDeRiverwood ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 18:11:43'!
ciudadDeRiverwood
	^ Riverwood .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 14:59:42'!
hamilton
	^ Hamilton ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 14:46:11'!
tirion
	^ Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:12:11'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^ unPersonaje esPrometedorEnRiverwood.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:12:30'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:12:49'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"Implementar cuando sea necesario"
	self ciudadDeRiverwood olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:13:13'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self ciudadDeRiverwood agregarPersonajeAListaDePrometedores: Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 18:08:38'!
ciudadDeRiverwood
	^ Riverwood! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 14:18:04'!
hamilton
	^ Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'AlgebraDeBoole 9/29/2021 14:45:28'!
tirion
	^ Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:09:09'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"Implementar cuando sea necesario"
	self ciudadDeRiverwood olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:09:59'!
hacerQueRiverwoodVeaPrometedorAHamilton
	"Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'."
	self ciudadDeRiverwood agregarPersonajeAListaDePrometedores: Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:10:38'!
olvidarInteraccionesYOpiniones
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'listaDePersonajesPrometedores'!

!Riverwood class methodsFor: 'NPCs' stamp: 'AlgebraDeBoole 9/29/2021 17:35:09'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood.! !

!Riverwood class methodsFor: 'NPCs' stamp: 'AlgebraDeBoole 9/29/2021 17:35:31'!
treborElGuardian
	^TreborElGuardiaDeSkyrim .! !


!Riverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 17:56:10'!
agregarPersonajeAListaDePrometedores: unPersonaje
	listaDePersonajesPrometedores add: unPersonaje.
	self treborElGuardian reiniciarInteraccionesDe: unPersonaje.
	self carolinaLaCurandera reiniciarInteraccionesDe: unPersonaje.
	! !

!Riverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 17:37:50'!
olvidar
	listaDePersonajesPrometedores := OrderedCollection new.
	self reiniciarInteraccionesDeNPCdeRiverwood.! !

!Riverwood class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 17:39:48'!
saberSiUnPersonajeEsPrometedor: unPersonaje
	^ (listaDePersonajesPrometedores includes: unPersonaje ).! !


!Riverwood class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 17:37:33'!
reiniciarInteraccionesDeNPCdeRiverwood
	self carolinaLaCurandera olvidar.
	self treborElGuardian olvidar.! !


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 18:40:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	listaDePersonajesPrometedores := ((OrderedCollection new)).! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tirion class' category: 'Ejercicio1-PNJ-Episodio2'!
Tirion class
	instanceVariableNames: 'esPrometedorEnRiverwood'!

!Tirion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:32:35'!
esPrometedorEnRiverwood
	^ esPrometedorEnRiverwood.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:32:35'!
hacerQueRiverwoodLoVeaDesconocido
	esPrometedorEnRiverwood := false.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 14:32:35'!
hacerQueRiverwoodLoVeaPrometedor
	esPrometedorEnRiverwood := true.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 18:40:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	esPrometedorEnRiverwood := false.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaPjConCalificacionDesconocido frasesParaPjConCalificacionPrometedora cantidadDeInteraccionesPorPersonajes'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 16:25:55'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaSegunNumeroDeInteraccion |

	self recordarInteraccionCon: unPersonajeJugadorAInteractuar .
	self cambiarDialogosPara: unPersonajeJugadorAInteractuar .
	respuestaSegunNumeroDeInteraccion := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	^ respuestaSegunNumeroDeInteraccion.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 14:07:28'!
olvidar
	cantidadDeInteraccionesPorPersonajes := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'AlgebraDeBoole 9/29/2021 17:56:10'!
reiniciarInteraccionesDe: unPersonaje
	cantidadDeInteraccionesPorPersonajes at: unPersonaje put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'ciudad' stamp: 'AlgebraDeBoole 9/29/2021 17:46:43'!
ciudadDeRiverwood
	^Riverwood .! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 17:57:26'!
cambiarDialogosPara: unPersonaje
"
	(unPersonaje esPrometedorEnRiverwood and:  ( (cantidadDeInteraccionesPorPersonajes at: unPersonaje) < (2)) )ifTrue:[cantidadDeInteraccionesPorPersonajes at: unPersonaje put: 1]."
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 14:05:35'!
recordarInteraccionCon: UnPersonaje
	| numeroDeInteraccionActual |
	numeroDeInteraccionActual  := cantidadDeInteraccionesPorPersonajes at: 	UnPersonaje ifAbsent: [0].
	cantidadDeInteraccionesPorPersonajes at: UnPersonaje put: numeroDeInteraccionActual + 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'AlgebraDeBoole 9/29/2021 17:49:30'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteracciones |
	cantidadDeInteracciones := cantidadDeInteraccionesPorPersonajes at: unPersonaje.
	(self ciudadDeRiverwood saberSiUnPersonajeEsPrometedor: unPersonaje) ifTrue: [^ frasesParaPjConCalificacionPrometedora at: 	(cantidadDeInteracciones min: 	frasesParaPjConCalificacionPrometedora size) ].
	^ frasesParaPjConCalificacionDesconocido at: (cantidadDeInteracciones min: frasesParaPjConCalificacionDesconocido size).! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 9/29/2021 18:40:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPjConCalificacionDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaPjConCalificacionPrometedora := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPorPersonajes := ((Dictionary new) add: (Hamilton->4); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Riverwood initializeAfterFileIn!
Tirion initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
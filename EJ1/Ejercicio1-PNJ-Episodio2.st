!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frasesSiPjEsDesconocido frasesSiPjEsPrometedor cantidadDeInteraccionesPorPJ'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:34:39'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaSegunNumeroDeInteraccion |
	
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	respuestaSegunNumeroDeInteraccion := self responderSegunCantidadDeInteraccionesCon: 	unPersonajeJugadorAInteractuar.
	
	(self verificarFinalDeDialogosPara: unPersonajeJugadorAInteractuar) ifTrue: [
		self cambiarLaCalificacionAPrometedorDe: 		unPersonajeJugadorAInteractuar].
	
	^ respuestaSegunNumeroDeInteraccion.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:06:54'!
olvidar
	cantidadDeInteraccionesPorPJ := Dictionary new.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:06:53'!
reiniciarInteraccionesDe: unPersonaje
	cantidadDeInteraccionesPorPJ at: unPersonaje put: 0.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 16:52:34'!
cambiarLaCalificacionAPrometedorDe: unPersonaje
	Riverwood hacerPrometedorA: unPersonaje.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:06:54'!
olvidarInteraccionesCon: unPersonaje
	cantidadDeInteraccionesPorPJ at: unPersonaje put: 0.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:29:03'!
recordarInteraccionCon: unPJ
	| numeroDeInteraccionActual |
	numeroDeInteraccionActual  := cantidadDeInteraccionesPorPJ at: 	unPJ ifAbsent: [0].
	cantidadDeInteraccionesPorPJ at: unPJ put: numeroDeInteraccionActual + 1.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:06:54'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteracciones |
	cantidadDeInteracciones := cantidadDeInteraccionesPorPJ at: unPersonaje.
	(Riverwood saberSiEsPrometedor: unPersonaje ) ifTrue: [^ frasesSiPjEsPrometedor at: (cantidadDeInteracciones min: 	frasesSiPjEsPrometedor size) ].
	^ frasesSiPjEsDesconocido at: (cantidadDeInteracciones min: frasesSiPjEsDesconocido size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:34:28'!
verificarFinalDeDialogosPara: unPersonaje
	^ (Riverwood saberSiEsPrometedor: unPersonaje ) not and: ( (cantidadDeInteraccionesPorPJ at: unPersonaje) >= 	(frasesSiPjEsDesconocido size)).! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'Frank 9/30/2021 18:41:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesSiPjEsDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesSiPjEsPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorPJ := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hamilton class' category: 'Ejercicio1-PNJ-Episodio2'!
Hamilton class
	instanceVariableNames: 'pueblo'!

!Hamilton class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 16:46:46'!
esPrometedorEnRiverwood
	^ (pueblo saberSiEsPrometedor: self).! !

!Hamilton class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 16:36:48'!
hacerQueRiverwoodLoVeaDesconocido
	pueblo hacerDesconocidoA: self.! !

!Hamilton class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 17:18:28'!
hacerQueRiverwoodLoVeaPrometedor
	pueblo hacerPrometedorA: self.! !


!Hamilton class methodsFor: 'as yet unclassified' stamp: 'Frank 9/30/2021 18:41:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	pueblo := Riverwood.! !


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

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'Frank 9/30/2021 17:08:52'!
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


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Frank 9/30/2021 16:35:47'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^ unPersonaje esPrometedorEnRiverwood.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Frank 9/30/2021 17:09:01'!
hacerQueLaCuranderaOlvideSusInteracciones
	self carolinaLaCurandera olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:12:49'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"Implementar cuando sea necesario"
	self ciudadDeRiverwood olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Frank 9/30/2021 16:33:34'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self ciudadDeRiverwood hacerPrometedorA: Hamilton.! !

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

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'Frank 9/30/2021 17:25:56'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self ciudadDeRiverwood hacerPrometedorA: Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'AlgebraDeBoole 9/29/2021 18:10:38'!
olvidarInteraccionesYOpiniones
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'extras' stamp: 'Frank 9/30/2021 17:25:07'!
ciudadDeRiverwood
	^ Riverwood.! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'PJsPrometedores'!

!Riverwood class methodsFor: 'NPCs' stamp: 'AlgebraDeBoole 9/29/2021 17:35:09'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood.! !

!Riverwood class methodsFor: 'NPCs' stamp: 'Frank 9/30/2021 17:11:14'!
treborElGuardia
	^TreborElGuardiaDeSkyrim .! !


!Riverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 16:38:18'!
hacerDesconocidoA: unPJ
	PJsPrometedores remove: unPJ.! !

!Riverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:20:20'!
hacerPrometedorA: unPJ
	PJsPrometedores add: unPJ.
	self treborElGuardia reiniciarInteraccionesDe: unPJ.
	self carolinaLaCurandera reiniciarInteraccionesDe: unPJ.
	! !

!Riverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 16:38:18'!
olvidar
	PJsPrometedores := OrderedCollection new.
	self reiniciarInteraccionesDeNPCdeRiverwood.! !

!Riverwood class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:20:51'!
saberSiEsPrometedor: unPJ
	^ (PJsPrometedores includes: unPJ ).! !


!Riverwood class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:11:14'!
reiniciarInteraccionesDeNPCdeRiverwood
	self carolinaLaCurandera olvidar.
	self treborElGuardia olvidar.! !


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'Frank 9/30/2021 18:41:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	PJsPrometedores := ((OrderedCollection new)).! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tirion class' category: 'Ejercicio1-PNJ-Episodio2'!
Tirion class
	instanceVariableNames: 'pueblo'!

!Tirion class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 16:40:18'!
esPrometedorEnRiverwood
	^ pueblo saberSiEsPrometedor: self.! !

!Tirion class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 16:40:44'!
hacerQueRiverwoodLoVeaDesconocido
	pueblo hacerDesconocidoA: self.! !

!Tirion class methodsFor: 'opiniones' stamp: 'Frank 9/30/2021 17:18:55'!
hacerQueRiverwoodLoVeaPrometedor
	pueblo hacerPrometedorA: self.! !


!Tirion class methodsFor: 'as yet unclassified' stamp: 'Frank 9/30/2021 18:41:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	pueblo := Riverwood.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaPjConCalificacionDesconocido frasesParaPjConCalificacionPrometedora cantidadDeInteraccionesPorPJ'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:23:18'!
interactuarCon: unPersonajeJugadorAInteractuar
	| respuestaSegunNumeroDeInteraccion |

	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	respuestaSegunNumeroDeInteraccion := self responderSegunCantidadDeInteraccionesCon: 	unPersonajeJugadorAInteractuar.
	^ respuestaSegunNumeroDeInteraccion.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:07:16'!
olvidar
	cantidadDeInteraccionesPorPJ := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Frank 9/30/2021 17:07:16'!
reiniciarInteraccionesDe: unPersonaje
	cantidadDeInteraccionesPorPJ at: unPersonaje put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:07:16'!
recordarInteraccionCon: UnPersonaje
	| numeroDeInteraccionActual |
	numeroDeInteraccionActual  := cantidadDeInteraccionesPorPJ at: 	UnPersonaje ifAbsent: [0].
	cantidadDeInteraccionesPorPJ at: UnPersonaje put: numeroDeInteraccionActual + 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Frank 9/30/2021 17:27:26'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	| cantidadDeInteracciones |
	cantidadDeInteracciones := cantidadDeInteraccionesPorPJ at: unPersonaje.
	(Riverwood saberSiEsPrometedor: unPersonaje) ifTrue: [^ frasesParaPjConCalificacionPrometedora at: 	(cantidadDeInteracciones min: 	frasesParaPjConCalificacionPrometedora size) ].
	^ frasesParaPjConCalificacionDesconocido at: (cantidadDeInteracciones min: frasesParaPjConCalificacionDesconocido size).! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'Frank 9/30/2021 18:41:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPjConCalificacionDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaPjConCalificacionPrometedora := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPorPJ := ((Dictionary new)).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Riverwood initializeAfterFileIn!
Tirion initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
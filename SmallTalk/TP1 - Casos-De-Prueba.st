TestCase subclass: #AlgoViajesTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:59'!
test09ElMismoViajeConDestinoSudamericanoResultaMasBaratoParaUnUsuarioArgentino
	| algoViajes viajeCaro viajeBarato tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") * 1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   	viajeCaro := algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.
	viajeBarato :=  algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.

	"Assert"
	self assert: viajeBarato tarifa < viajeCaro tarifa.
	self assert: (viajeBarato destino)  equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeBarato tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:58'!
test16LosVuelosDeNativosDeUnPaisExtranjeroHaciaSuMismoPaisSeConsideranVuelosInternacionales
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Miguel' deNacionalidad: 'EstadoUnidense' conDestinoACiudad: 'Alabama' delPais: 'EstadosUnidos' aKms: 3247.
	tarifaEsperada := (3247 "Kms" log + 3600 "tarifa de preembarco internacional") "No hay descuento al viaje internacioal".
	tarifaEsperada := tarifaEsperada raisedTo: 1.2.
	
	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Miguel'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Alabama' en: 'EstadosUnidos').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:00'!
test03ElViajeMasBaratoParaUnUsuarioExtranjeroDadoUnDestinoSudamericanoYUnoNacionalEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Joaquin' deNacionalidad: 'Española' conDestinoACiudad: 'San Carlos de Bariloche' delPais: 'Argentina' aKms: 1578.
	algoViajes registrarPasajePara: 'Joaquin' deNacionalidad: 'Española' conDestinoACiudad: 'Cusco' delPais: 'Peru' aKms: 3236.
	tarifaEsperada := ((1578 "Kms" * 1.28 "tarifa destino nacional") - 1500 "Descuento por extranjero yendo a destino nacional"). 
	tarifaEsperada := tarifaEsperada raisedTo: 1.2 "Recargo por Extranjero".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Joaquin'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'San Carlos de Bariloche' en: 'Argentina').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:01'!
test12ElViajeMasBaratoParaUnUsuarioExtranjeroDadoUnDestinoSudamericanoYUnoInternacionalEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Joaquin' deNacionalidad: 'Española' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	algoViajes registrarPasajePara: 'Joaquin' deNacionalidad: 'Española' conDestinoACiudad: 'Cusco' delPais: 'Peru' aKms: 3236.
	tarifaEsperada := (10215 "Kms" log + 3600 "tarifa de preembarco con destino internacional")  "No hay descuento de extranjero a viaje internacional". 
	tarifaEsperada := tarifaEsperada raisedTo: 1.2 "Recargo por Extranjero".

	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Joaquin'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Lisboa' en: 'Portugal').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:59'!
test08ElMismoViajeConDestinoNacionalResultaMasBaratoParaUnUsuarioArgentino
	| algoViajes viajeCaro viajeBarato tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	tarifaEsperada := ((2377 "Kms" * 1.28 "tarifa destino nacional") sqrt "Descuento por ley de impulso turismo nacional") * 1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   	viajeCaro := algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.
	viajeBarato :=  algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.

	"Assert"
	self assert: viajeBarato tarifa < viajeCaro tarifa.
	self assert: (viajeBarato destino)  equals: (CiudadEsperada nombre: 'Ushuaia' en: 'Argentina').
	self assert: (viajeBarato tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:00'!
test01ElViajeMasBaratoParaUnUsuarioExtranjeroEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	tarifaEsperada := ((2377 "Kms" * 1.28 "tarifa destino nacional") - 1500 "Descuento por extranjero yendo a destino nacional").
	tarifaEsperada := tarifaEsperada raisedTo: 1.2 "Recargo por Extranjero".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Ushuaia' en: 'Argentina').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:01'!
test05ElViajeMasBaratoParaUnUsuarioArgentinoEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	tarifaEsperada := ((2377 "Kms" * 1.28 "tarifa destino nacional") sqrt "Descuento por ley de impulso turismo nacional") * 1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Ushuaia' en: 'Argentina').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:58'!
test15ElViajeDeUnSudamericanoHaciaOtroPaisDeSudamericaEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Ronaldhino' deNacionalidad: 'Brasilera' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") "No hay descuento al viaje internacioal".
	tarifaEsperada := tarifaEsperada raisedTo: 1.2.
	
	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Ronaldhino'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:59'!
test17LosVuelosDeNativosDeUnPaisSudamericanoHaciaSuMismoPaisSeConsideranVuelosSudamericanos
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Esteban' deNacionalidad: 'Peruano' conDestinoACiudad: 'Lima' delPais: 'Peru' aKms: 3247.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a sudamerica"). "No hay descuento al viaje internacional"
	tarifaEsperada := tarifaEsperada raisedTo: 1.2.
	
	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Esteban'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Lima' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:59'!
test10ElMismoViajeConDestinoInternacionalResultaMasBaratoParaUnUsuarioNacional
	| algoViajes viajeCaro viajeBarato tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	tarifaEsperada := (10215 "Kms" log + 3600 "tarifa de preembarco con destino internacional")  *1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   	viajeBarato := algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.
	viajeCaro :=  algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.

	"Assert"
	self assert: viajeBarato tarifa < viajeCaro tarifa.
	self assert: (viajeBarato destino)  equals: (CiudadEsperada nombre: 'Lisboa' en: 'Portugal').
	self assert: (viajeBarato tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:01'!
test02ElViajeMasBaratoParaUnUsuarioExtranjeroHaciaUnDestinoDeSudamericaEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") "No hay descuento de extranjero a viaje a sudamerica".
	tarifaEsperada := tarifaEsperada raisedTo: 1.2 "Recargo por Extranjero".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.

	"Assert"
	self assert: (viajeObtenido destino) equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:01'!
test07ElViajeMasBaratoParaUnUsuarioArgentinoHaciaUnDestinoInternacionalEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Diego' deNacionalidad: 'Argentina' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	tarifaEsperada := (10215 "Kms" log + 3600 "tarifa de preembarco con destino internacional") * 1.2 "Impuesto al viaje para turistas nacionales".
	
	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Diego'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Lisboa' en: 'Portugal').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:00'!
test06ElViajeMasBaratoParaUnUsuarioArgentinoHaciaUnDestinoDeSudamericaEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Diego' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") * 1.2 "Impuesto al viaje para turistas nacionales".
	
	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Diego'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:00'!
test04ElViajeMasBaratoParaUnUsuarioExtranjeroHaciaUnDestinoInternacionalEsElIndicado
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.
	algoViajes registrarPasajePara: 'Alejo' deNacionalidad: 'Italiana' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.

	tarifaEsperada := (10215 "Kms" log + 3600 "tarifa de preembarco con destino internacional")  "No hay descuento de extranjero a viaje internacional". 
	tarifaEsperada := tarifaEsperada raisedTo: 1.2 "Recargo por Extranjero".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Alejo'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Lisboa' en: 'Portugal').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:58'!
test14ElViajeMasCaroParaUnUsuarioExtranjeroEntreDistintasOpcionesEsElSudamericano
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Maximo'.

	algoViajes registrarPasajePara: 'Kiev' deNacionalidad: 'Ruso' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes registrarPasajePara: 'Kiev' deNacionalidad: 'Ruso' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	algoViajes registrarPasajePara: 'Kiev' deNacionalidad: 'Ruso' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") "No hay descuento al viaje internacioal".
	tarifaEsperada := tarifaEsperada raisedTo: 1.2.
	
	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Kiev'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 17:00'!
test13ElViajeMasCaroParaUnUsuarioArgentinoEntreDistintasOpcionesEsElSudamericano
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Maximo'.

	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	tarifaEsperada := (3247 "Kms" raisedTo: 1.12 "tarifa de preembarco a destino mercosur") * 1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !

!AlgoViajesTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/12/2023 16:59'!
test11ElViajeMasBaratoParaUnUsuarioArgentinoEntreDistintasOpcionesEsElNacional
	| algoViajes viajeObtenido tarifaEsperada |
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Lisboa' delPais: 'Portugal' aKms: 10215.
	tarifaEsperada := ((2377 "Kms" * 1.28 "tarifa destino nacional") sqrt "Descuento por ley de impulso turismo nacional") * 1.2 "Impuesto al viaje para turistas nacionales".

	"Act"
   	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.

	"Assert"
	self assert: (viajeObtenido destino)  equals: (CiudadEsperada nombre: 'Ushuaia' en: 'Argentina').
	self assert: (viajeObtenido tarifa) equals: tarifaEsperada! !


TestCase subclass: #CiudadEsperadaTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!CiudadEsperadaTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:02'!
test01AlLlamarAlConstructorEsteNosDevuelveUnaInstanciaDeCiudadEsperadaCorrectamente
| ciudad otraCiudad |

	"Arrange"
   ciudad := CiudadEsperada nombre: 'Buenos Aires' en: 'Argentina'.

	"Act"
   otraCiudad := CiudadEsperada new.
   otraCiudad establecerNombre: 'Buenos Aires'.

	"Assert"
    self assert: ciudad nombre equals: otraCiudad nombre.! !


TestCase subclass: #CriterioTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!CriterioTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/8/2023 19:08'!
test02PuedoObtenerUnViajeSegunUnCriterioMaximoYMinimo
| algoViajes algoViajes2 viajeObtenido viajeObtenido2|
	
	"Arrange"
	algoViajes := AlgoViajes ConCriterio: 'Maximo'.
	algoViajes2 := AlgoViajes ConCriterio: 'Minimo'.

	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	viajeObtenido := algoViajes viajeIndicadoSegunCriterioPara: 'Pablo'.
	
	algoViajes2 registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 2377.
	algoViajes2 registrarPasajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Cuzco' delPais: 'Peru' aKms: 3247.
	viajeObtenido2 := algoViajes2 viajeIndicadoSegunCriterioPara: 'Pablo'.
	
	"Act & Assert"
  self assert: viajeObtenido destino equals: (CiudadEsperada nombre: 'Cuzco' en: 'Peru').
  self assert: viajeObtenido2 destino equals: (CiudadEsperada nombre: 'Ushuaia' en: 'Argentina').
! !

!CriterioTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/8/2023 18:47'!
test01NoPuedoObtenerUnViajeSegunUnCriterioInvalido
	| criterioInventado |
	
	"Arrange"
	criterioInventado := 'MasoMenos'.
	
	"Act & Assert"
	self should: [ Criterio ConCriterio: criterioInventado ] raise: CriterioInexistente .
! !


TestCase subclass: #DescuentoTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!DescuentoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:33'!
test03NoSeAplicaDescuentoSiElViajeNoEsAArgentina
|descuento descuentoAplicado nacionalidad costeInicial paisDestino importeEsperado|
	
	"Arrange"
	nacionalidad := 'Peru'.
	costeInicial := 5000.
	paisDestino := 'Peru'.
	importeEsperado := 5000.
	
	"Act"
	descuento := Descuento ConDestino: paisDestino ConNacionalidad: nacionalidad.
	descuentoAplicado := descuento aplicarDescuentoA: costeInicial.
	
	"Act"
	self assert: descuentoAplicado equals: importeEsperado! !

!DescuentoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:32'!
test01SeAplicaElDescuentoCorrectoSiElPasajeroEsArgentinoYViajaAArgentina
|descuento descuentoAplicado nacionalidad costeInicial paisDestino importeEsperado|

	"Arrange"
	nacionalidad := 'Argentina'.
	costeInicial := 5000.
	paisDestino := 'Argentina'.
	importeEsperado := 5000 sqrt.
	
	"Act"
	descuento := Descuento ConDestino: paisDestino ConNacionalidad: nacionalidad.
	descuentoAplicado := descuento aplicarDescuentoA: costeInicial.
	
	"Assert"
	self assert: descuentoAplicado equals: importeEsperado! !

!DescuentoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:33'!
test02SeAplicaElDescuentoCorrectoSiElPasajeroEsExtranjeroYViajaAArgentina
|descuento descuentoAplicado nacionalidad costeInicial paisDestino importeEsperado|

	"Arrange"
	nacionalidad := 'Peru'.
	costeInicial := 5000.
	paisDestino := 'Argentina'.
	importeEsperado := 3500.
	
	"Act"
	descuento := Descuento ConDestino: paisDestino ConNacionalidad: nacionalidad.
	descuentoAplicado := descuento aplicarDescuentoA: costeInicial.
	
	"Assert"
	self assert: descuentoAplicado equals: importeEsperado! !


TestCase subclass: #ImpuestoTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!ImpuestoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:01'!
test03SiLaNacionaliadadEsArgentinaEntoncesElImpuestoSeCobraCorrectamenteAlViajarOtroPais
|tramite impuestoAlPasajero gastosDeAerolinea paisDestino nacionalidad|

	"Arrange"
	gastosDeAerolinea := 100.
	paisDestino := 'Portugal'.
	nacionalidad := 'Argentina'.

	"Act"
	tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
	impuestoAlPasajero := tramite aplicarImpuestoA: gastosDeAerolinea.

	"Assert"
	self assert: impuestoAlPasajero equals: (gastosDeAerolinea * 1.2).! !

!ImpuestoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:01'!
test01SiLaNacionaliadadNoEsArgentinaEntoncesElImpuestoSeCobraCorrectamenteAlViajarAArgentina
|tramite impuestoAlPasajero gastosDeAerolinea paisDestino nacionalidad|

	"Arrange"
	gastosDeAerolinea := 10000.
	paisDestino := 'Argentina'.
	nacionalidad := 'Peru'.

	"Act"
	tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
	impuestoAlPasajero := tramite aplicarImpuestoA: gastosDeAerolinea.

	"Assert"
	self assert: impuestoAlPasajero equals: (gastosDeAerolinea raisedTo: 1.2).! !

!ImpuestoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:02'!
test04SiLaNacionaliadadNoEsArgentinaEntoncesElImpuestoSeCobraCorrectamenteAlViajarAOtroPais
|tramite impuestoAlPasajero gastosDeAerolinea paisDestino nacionalidad|

	"Arrange"
	gastosDeAerolinea := 10000.
	paisDestino := 'España'.
	nacionalidad := 'Peru'.

	"Act"
	tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
	impuestoAlPasajero := tramite aplicarImpuestoA: gastosDeAerolinea.

	"Assert"
	self assert: impuestoAlPasajero equals: (gastosDeAerolinea raisedTo: 1.2).! !

!ImpuestoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:01'!
test02SiLaNacionaliadadEsArgentinaEntoncesElImpuestoSeCobraCorrectamenteAlViajarAArgentina
|tramite impuestoAlPasajero gastosDeAerolinea paisDestino nacionalidad|

	"Arrange"
	gastosDeAerolinea := 100.
	paisDestino := 'Argentina'.
	nacionalidad := 'Argentina'.

	"Act"
	tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
	impuestoAlPasajero := tramite aplicarImpuestoA: gastosDeAerolinea.

	"Assert"
	self assert: impuestoAlPasajero equals: (gastosDeAerolinea * 1.2).! !

!ImpuestoTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:02'!
test05SiLaNacionaliadadNoSeEncuentraRegistradaEnElSistemaSeCobraElImpuestoExtranjero
|tramite impuestoAlPasajero gastosDeAerolinea paisDestino nacionalidad|

	"Arrange"
	gastosDeAerolinea := 10000.
	paisDestino := 'España'.
	nacionalidad := 'Narnia'.

	"Act"
	tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
	impuestoAlPasajero := tramite aplicarImpuestoA: gastosDeAerolinea.

	"Assert"
	self assert: impuestoAlPasajero equals: (gastosDeAerolinea raisedTo: 1.2).! !


TestCase subclass: #PasajeTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!PasajeTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 14:59'!
test03LasCiudadesSeRegistranCorrectamente
| pasaje pasaje2 destinoEsperado |

	"Arrange"
	pasaje := Pasaje RegistrarPara: 'Pablo' DeNacionalidad: 'Argentina' ConDestinoACiudad: 'Ushuaia' DelPais: 'Argentina' AKms: 5000.
	pasaje2 := Pasaje new.

	"Act"
	destinoEsperado := pasaje2 registrarViajePara: 'Pablo' deNacionalidad: 'Argentina' conDestinoACiudad: 'Ushuaia' delPais: 'Argentina' aKms: 5000. 

	"Assert"
	self assert: (pasaje destino) equals: destinoEsperado destino! !

!PasajeTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:00'!
test01SoloPuedoEnviarDistanciasEnKmConValorPositivo
|distancia distancia2 distancia3|

	"Arrange"
	distancia := -1.
	distancia2 := 0.
	distancia3 := 5000.

	"Act & Assert"
	self shouldnt: [ Pasaje RegistrarPara: 'unNombre' DeNacionalidad: 'unaNacionalidad' 
		ConDestinoACiudad: 'unaCiudad' DelPais: 'unPais' AKms: distancia3 ] raise: DistanciaInexistente.
	self should: [ Pasaje RegistrarPara: 'unNombre' DeNacionalidad: 'unaNacionalidad' 
		ConDestinoACiudad: 'unaCiudad' DelPais: 'unPais' AKms: distancia ] raise: DistanciaInexistente.
	self should: [Pasaje RegistrarPara: 'unNombre' DeNacionalidad: 'unaNacionalidad' 
		ConDestinoACiudad: 'unaCiudad' DelPais: 'unPais' AKms: distancia2 ] raise: DistanciaInexistente.! !

!PasajeTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:01'!
test02ElNombreDelPasajeroSeAsignaCorrectamente
|viaje nombre|

	"Arrange"
	viaje := Pasaje new.
	nombre := 'Rodrigo'.

	"Act"
	viaje registrarViajePara:nombre deNacionalidad: 'unaNacionalidad' 
	conDestinoACiudad: 'unaCiudad' delPais: 'unPais' aKms: 1500.

	"Assert"
	self assert: (viaje contienePasajero:nombre)! !


TestCase subclass: #TasaDeAerolineaTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Casos-De-Prueba'!

!TasaDeAerolineaTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:00'!
test03SiElPaisDestinoEstaFueraDelMercosurTarifaSeAplicaCorrectamente
|tramite impuestoDeLaAerolinea kmRecorridos paisDestino|

	"Arrange"
	kmRecorridos := 100.
	paisDestino := 'Portugal'.

	"Act"
	tramite := TasaDeAerolinea ConDestino: paisDestino.
	impuestoDeLaAerolinea := tramite aplicarTasaDeVueloSegun: kmRecorridos.

	"Assert"
	self assert: impuestoDeLaAerolinea equals: (kmRecorridos log + 3600)! !

!TasaDeAerolineaTest methodsFor: 'tests' stamp: 'IsaiasCabrera 4/17/2023 18:34'!
test04SiElPaisDestinoNoEstaAsociadoALaAerolineaNoSePuedeGenerarLaTasaDelAeropuerto
|paisesAsociados paisInventado|

  "Arrange"
  paisesAsociados := Dictionary new.
  paisInventado := 'Narnia'.

  "Act"
  paisesAsociados := Dictionary new.
  paisesAsociados at: #Argentina put: TasaNacional new.
  paisesAsociados at: #Peru put: TasaMercosur new.
  paisesAsociados at: #Portugal put: TasaInternacional new.
  paisesAsociados at: #EstadosUnidos put: TasaInternacional new.
  
  "Assert"
  self should: [ TasaDeAerolinea ConDestino: paisInventado] raise: PaisInexistente.
  self shouldnt: [ TasaDeAerolinea ConDestino: 'Argentina'] raise: PaisInexistente.! !

!TasaDeAerolineaTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 14:59'!
test02SiElPaisDestinoEsDelMercosurLaTarifaSeAplicaCorrectamente
|tramite impuestoDeLaAerolinea kmRecorridos paisDestino|

	"Arrange"
	kmRecorridos := 100.
	paisDestino := 'Peru'.

	"Act"
	tramite := TasaDeAerolinea ConDestino: paisDestino.
	impuestoDeLaAerolinea := tramite aplicarTasaDeVueloSegun: kmRecorridos.

	"Assert"
	self assert: impuestoDeLaAerolinea equals: (kmRecorridos raisedTo: 1.12)! !

!TasaDeAerolineaTest methodsFor: 'tests' stamp: 'IsaiasCabrera 5/12/2023 15:00'!
test01SiElPaisDestinoEsArgentinaLaTarifaSeAplicaCorrectamente
|tramite impuestoDeLaAerolinea kmRecorridos paisDestino|

	"Arrange"
	kmRecorridos := 100.
	paisDestino := 'Argentina'.

	"Act"
	tramite := TasaDeAerolinea ConDestino: paisDestino.
	impuestoDeLaAerolinea := tramite aplicarTasaDeVueloSegun: kmRecorridos.

	"Assert"
	self assert: impuestoDeLaAerolinea equals: kmRecorridos * 1.28! !

Error subclass: #CriterioInexistente
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Exceptions'!

Error subclass: #DistanciaInexistente
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Exceptions'!

Error subclass: #PaisInexistente
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Exceptions'!

Error subclass: #PasajeroInexistente
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1-Exceptions'!Object subclass: #AlgoViajes
	instanceVariableNames: 'viajes criterioDeViaje'
	classVariableNames: ''
	package: 'TP1'!

!AlgoViajes methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/12/2023 14:08'!
registrarPasajePara: unNombre deNacionalidad: unaNacionalidad conDestinoACiudad:unaCiudad delPais:unPais aKms: unaDistanciaEnKm
|viajeBuscado|
    
    viajeBuscado := Pasaje RegistrarPara: unNombre DeNacionalidad: unaNacionalidad ConDestinoACiudad: unaCiudad DelPais: unPais AKms:unaDistanciaEnKm.

    viajes add: viajeBuscado! !

!AlgoViajes methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/12/2023 14:07'!
establecerCriterio: unCriterio
	criterioDeViaje := Criterio ConCriterio: unCriterio.! !


!AlgoViajes methodsFor: 'initialization' stamp: 'IsaiasCabrera 5/12/2023 14:16'!
viajeIndicadoSegunCriterioPara: unNombre
| viajesRegistrados |

	viajesRegistrados := viajes select: [ :pasaje | pasaje contienePasajero: unNombre ].
	viajesRegistrados ifEmpty: [ PasajeroInexistente signal].
	
	^ criterioDeViaje obtenerViajeEntre: viajesRegistrados.! !

!AlgoViajes methodsFor: 'initialization' stamp: 'IsaiasCabrera 5/10/2023 12:20'!
initialize
	viajes := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

AlgoViajes class
	instanceVariableNames: ''!

!AlgoViajes class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 14:37'!
ConCriterio: unCriterio
|viajeCreado|

	viajeCreado := self new.
	viajeCreado establecerCriterio: unCriterio.
	
	^ viajeCreado! !


Object subclass: #CiudadEsperada
	instanceVariableNames: 'pais nombre'
	classVariableNames: ''
	package: 'TP1'!

!CiudadEsperada methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
establecerNombre: unNombre
	nombre := unNombre.! !

!CiudadEsperada methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
establecerPais: unPais
	pais := unPais! !


!CiudadEsperada methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/12/2023 16:50'!
= other
	^nombre = (other nombre)! !

!CiudadEsperada methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
nombre
	^ nombre! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

CiudadEsperada class
	instanceVariableNames: 'pais nombre'!

!CiudadEsperada class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:49'!
nombre: unNombre en: unPais
| ciudadEsperada |
	ciudadEsperada := self new.
	ciudadEsperada establecerNombre: unNombre. 
	ciudadEsperada establecerPais: unPais.
	^ ciudadEsperada! !


Object subclass: #Criterio
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Criterio methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
obtenerViajeEntre: viajes
	self subclassResponsibility.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Criterio class
	instanceVariableNames: 'criterios'!

!Criterio class methodsFor: 'not defined category' stamp: 'Anonymous 5/5/2023 19:40'!
ConCriterio: unCriterio

  criterios := Dictionary new.
  criterios at: #Minimo put: CriterioMinimo new.
  criterios at: #Maximo put: CriterioMaximo new.
  
  ^(criterios at: unCriterio ifAbsent: [CriterioInexistente signal: unCriterio])

! !


Criterio subclass: #CriterioMaximo
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!CriterioMaximo methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
obtenerViajeEntre: viajes
	^ viajes detectMax: [ :elemento | elemento tarifa ]! !


Criterio subclass: #CriterioMinimo
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!CriterioMinimo methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:50'!
obtenerViajeEntre: viajes
	^ viajes detectMin: [ :elemento | elemento tarifa ]! !


Object subclass: #Descuento
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!Descuento methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/10/2023 12:51'!
aplicarDescuentoA: unImporte
 	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Descuento class
	instanceVariableNames: 'descuentosSegunDestino'!

!Descuento class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 15:24'!
ConDestino: unDestino ConNacionalidad: unaNacionalidad

	descuentosSegunDestino := Dictionary new.
	descuentosSegunDestino at: #Argentina put: (DescuentoArgentina ConNacionalidad: unaNacionalidad).
  
	^ (descuentosSegunDestino at: unDestino ifAbsent: [ SinDescuento new ])! !


Descuento subclass: #DescuentoArgentina
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!DescuentoArgentina methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 5/8/2023 19:22'!
aplicarDescuentoA: unImporte
  self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DescuentoArgentina class
	instanceVariableNames: 'descuentos'!

!DescuentoArgentina class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 15:29'!
ConNacionalidad: unaNacionalidad
| descuento |

	descuentos := Dictionary new.
	descuentos at: #Argentina put: DescuentoParaNacional new.
	descuento := descuentos at: unaNacionalidad ifAbsent: [ DescuentoParaExtranjero new ].

	^ descuento.! !


DescuentoArgentina subclass: #DescuentoParaExtranjero
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!DescuentoParaExtranjero methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:51'!
aplicarDescuentoA: unImporte
	^ (unImporte - 1500)! !


DescuentoArgentina subclass: #DescuentoParaNacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!DescuentoParaNacional methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/10/2023 12:51'!
aplicarDescuentoA: unImporte
	^ (unImporte sqrt)! !


Object subclass: #ImpuestoPasajero
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!ImpuestoPasajero methodsFor: 'not defined category'!
aplicarImpuestoA: unImporte
    self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ImpuestoPasajero class
	instanceVariableNames: 'impuestos'!

!ImpuestoPasajero class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 14:40'!
ConNacionalidad: unaNacionalidad

  impuestos := Dictionary new.
  impuestos at: #Argentina put: ImpuestoNacional new.

  ^(impuestos at: unaNacionalidad ifAbsent: [ImpuestoExtranjero new])! !


ImpuestoPasajero subclass: #ImpuestoExtranjero
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!ImpuestoExtranjero methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 14:41'!
aplicarImpuestoA: unImporte

    ^ unImporte raisedTo: 1.2.! !


ImpuestoPasajero subclass: #ImpuestoNacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!ImpuestoNacional methodsFor: 'not defined category'!
aplicarImpuestoA: unImporte 

    ^ unImporte * 1.2.! !


Object subclass: #Pasaje
	instanceVariableNames: 'paisDestino ciudadDestino kmRecorridos nacionalidad pasajero'
	classVariableNames: ''
	package: 'TP1'!

!Pasaje methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/19/2023 20:16'!
contienePasajero: unNombre
^ unNombre = pasajero! !

!Pasaje methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/8/2023 20:42'!
registrarViajePara: unNombre deNacionalidad: unaNacionalidad conDestinoACiudad: unaCiudad delPais: unPais aKms:unaDistanciaEnKm.

  ciudadDestino := unaCiudad.
  kmRecorridos := unaDistanciaEnKm.
  nacionalidad := unaNacionalidad.
  paisDestino := unPais.
  pasajero := unNombre! !

!Pasaje methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/17/2023 21:11'!
destino
^ (CiudadEsperada nombre: ciudadDestino en: paisDestino)! !


!Pasaje methodsFor: 'accessing' stamp: 'IsaiasCabrera 5/12/2023 15:30'!
tarifa
|tramite descuento descuentoAplicado tasaDeAerolinea costoDeViaje|
    
   tramite := TasaDeAerolinea ConDestino: paisDestino.
   tasaDeAerolinea := tramite aplicarTasaDeVueloSegun: kmRecorridos.

	descuento := Descuento ConDestino: paisDestino  ConNacionalidad: nacionalidad.
	descuentoAplicado := descuento aplicarDescuentoA: tasaDeAerolinea.
	 
   tramite := ImpuestoPasajero ConNacionalidad: nacionalidad.
   costoDeViaje := tramite aplicarImpuestoA: descuentoAplicado.

^ costoDeViaje! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Pasaje class
	instanceVariableNames: ''!

!Pasaje class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 14:40'!
RegistrarPara: unNombre DeNacionalidad: unaNacionalidad ConDestinoACiudad: unaCiudad DelPais: unPais 
                 AKms:unaDistanciaEnKm
	|reserva|
	(unaDistanciaEnKm <= 0) ifTrue: [ DistanciaInexistente signal ].

	reserva := self new.
	^ reserva registrarViajePara: unNombre deNacionalidad: unaNacionalidad conDestinoACiudad: unaCiudad delPais: unPais aKms:unaDistanciaEnKm.! !


Descuento subclass: #SinDescuento
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!SinDescuento methodsFor: 'not defined category' stamp: 'IsaiasCabrera 5/12/2023 15:23'!
aplicarDescuentoA: unImporte
	^ unImporte! !


Object subclass: #TasaDeAerolinea
	instanceVariableNames: 'tasa'
	classVariableNames: ''
	package: 'TP1'!

!TasaDeAerolinea methodsFor: 'as yet unclassified' stamp: 'IsaiasCabrera 4/14/2023 15:31'!
aplicarTasaDeVueloSegun: kmRecorridos
  self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

TasaDeAerolinea class
	instanceVariableNames: 'paisesAsociados'!

!TasaDeAerolinea class methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/17/2023 19:19'!
ConDestino: unPais

 paisesAsociados := Dictionary new.
 paisesAsociados at: #Argentina put: TasaNacional new.
 paisesAsociados at: #Peru put: TasaMercosur new.
 paisesAsociados at: #Portugal put: TasaInternacional new.
 paisesAsociados at: #EstadosUnidos put: TasaInternacional new.

^ (paisesAsociados at: unPais ifAbsent: [PaisInexistente signal: unPais])! !


TasaDeAerolinea subclass: #TasaInternacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!TasaInternacional methodsFor: 'initialization' stamp: 'IsaiasCabrera 4/17/2023 22:34'!
initialize
tasa := 3600! !


!TasaInternacional methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/17/2023 22:34'!
aplicarTasaDeVueloSegun: kmRecorridos
^(kmRecorridos log + tasa)! !


TasaDeAerolinea subclass: #TasaMercosur
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!TasaMercosur methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/17/2023 22:33'!
aplicarTasaDeVueloSegun: kmRecorridos
^(kmRecorridos raisedTo: 1.12)! !


!TasaMercosur methodsFor: 'initialization' stamp: 'IsaiasCabrera 4/17/2023 15:09'!
initialize
tasa := 1.12.! !


TasaDeAerolinea subclass: #TasaNacional
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'TP1'!

!TasaNacional methodsFor: 'not defined category' stamp: 'IsaiasCabrera 4/17/2023 15:09'!
aplicarTasaDeVueloSegun: kmRecorridos
^(kmRecorridos * tasa)! !


!TasaNacional methodsFor: 'initialization' stamp: 'IsaiasCabrera 4/17/2023 15:09'!
initialize
tasa := 1.28.! !

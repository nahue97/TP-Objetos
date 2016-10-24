import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import fuentesDeInformacion.*
class Vim {
	var amigos = []
	var sexo// = masculino, femenino (SE INICIALIZA)
	var edad = 18// = 1,2,3,4,5,6... (SE INICIALIZA)
	var nivelFelicidad
	var personalidad // = interesado, superficial, buenazo, peleadoConLaVida (SE INICIALIZA)
	var trabajo// = Copado,Mercenario,Aburrido,Desocupado (SE INICIALIZA)
	var dinero// = 0-100000 (SE INICIALIZA)
	var conocimiento = #{}
	var estadoDelSim = normal
	var preferencia // SEXO MASCULINO O FEM (SE INICIALIZA)
	var estadoCivil = soltero
	var pareja 
	var conocimientoPerdido = #{}
	var relacion
	
	constructor(unaFelicidad, unaPersonalidad, unTrabajo, unDinero, unaPreferencia,unSexo)
	{
	nivelFelicidad = unaFelicidad
	personalidad = unaPersonalidad
	trabajo = unTrabajo
	dinero = unDinero
	preferencia = unaPreferencia
	sexo = unSexo
	}
	//METODOS GETTER----------------------------------------------------------------------------------------------
	method trabajo(){
		return trabajo
	}
	method nivelFelicidad(){
		return nivelFelicidad
	}
	method conocimiento(){
		return conocimiento
	}
	method amigos(){
		return amigos
	}
	method dinero(){
		return dinero
	}
	method sexo(){
		return sexo
	}
	method estadoCivil(){
		return estadoCivil
	}
	method relacion(){
		return relacion
	}

	method pareja(){
		return pareja
	}
	method personalidad(){
		return personalidad
	}
	
	method edad() {
		return edad
	}

	//OTROS METODOS SECUNDARIOS ---------------------------------------------------
	method estadoDeAnimo(){
		return estadoDelSim
	}
	
	method setPareja(unSim){
		pareja = unSim
	}
	
	method aumentarFelicidad(numero){
		nivelFelicidad += numero
	}
	
	method disminuirFelicidad(numero){
		nivelFelicidad -= numero
	}
	
	method esJoven(){
		return (edad < 29 && edad > 18)
	}

	method estaTriste(){
		return nivelFelicidad < 200	
	}	
	
	method hayAtraccionMutua(otroSim){
		return self.sienteAtraccionPor(otroSim) && otroSim.sienteAtraccionPor(self)
	}
	
	method seVuelveBobo(){
		conocimientoPerdido.addAll(conocimiento)
		self.amnesia()
	}
	method amnesia(){
		conocimiento.clear()
	}

	method recuperarConocimiento(){
		conocimiento.addAll(conocimientoPerdido)
		conocimientoPerdido.clear()
	}
	
	method tieneMenosDinero(unSim){
		return self.dinero() >= unSim.dinero()
	}
	method tieneMenosPopularidad(unSim){
		return self.popularidad() >= unSim.popularidad()
	}	
	method noEsAmigoDeMiPareja(unSim){
		return !(self.pareja().amigos().contains(unSim))
	}
	method ganarDinero(dineroAGanar){
		dinero += dineroAGanar
	}
	method cumplirAnios(){
	}
	
	//AMISTAD y Valoracion----------------------------------------------------------------------------------------------------
	method hacerseAmigoDe(unSim){
		if(not amigos.contains(unSim)){
			amigos.add(unSim)
			nivelFelicidad += self.valoracion(unSim)
		}
	}
	method valoracion(simValorado){
		return personalidad.valorar(self,simValorado)
	}
	
	method esAmigoDe(unSim){
		return amigos.contains(unSim)
	}
	method seHacenAmigos(unSim){
		self.hacerseAmigoDe(unSim)
		unSim.hacerseAmigoDe(self)
	}
	method devolverPrimerosAmigosPorIndice(numero){
		if(numero <= 0){
			return amigos.first()
		}
		else if (self.cantidadDeAmigos() < numero){
			return amigos.last()
		}
			 else return amigos.get(numero)
	}
	method devolverUltimosAmigosPorIndice(numero){
		if(numero <= 0){
			return amigos.last()
		}
		else if (self.cantidadDeAmigos() > numero){
			return amigos.get(self.resta(numero))
		}
			 else 
			 	return amigos.first()
	}
	method cantidadDeAmigos(){
		return amigos.size()
	}
	method resta(numero){
		return (self.cantidadDeAmigos()- numero -1)
	}
	
	//POPULARIDAD-----------------------------------------------------------------------------------------------
	method popularidad(){
		return amigos.sum({amigo => amigo.nivelFelicidad()})
	}
	
	method amigoMasPopular()
	{
		return (amigos.max({amigo => amigo.popularidad()}))

	}

	method esElMasPopularEntreSusAmigos(){
		return self.popularidad() > self.amigoMasPopular().popularidad()
	}
	//ATRACCION------------------------------------------------------------------------------------------------
	method sienteAtraccionPor(otroSim){
		return ((otroSim.sexo() == preferencia) && (personalidad.preferencia(self,otroSim)))
	}
	
	method filtrarSimsAtractivos(lista){
		return lista.filter({sim => self.sienteAtraccionPor(sim)})
	}
	

	//RELACIONES---------------------------------------------------------------------------------------------
		
	method iniciarRelacionCon(otroSim){
		if (self.edad() > 16 && otroSim.edad() > 16){
			estadoCivil.iniciarRelacion(self,otroSim)
		}

		else error.throwWithMessage("El sim es muy joven para tener una relación")
	}
	method setRelacion(unaRelacion) {
		relacion = unaRelacion
	}
	method terminarRelacion(){
		relacion.terminar()
	}
	method cambiarEstadoCivil(unEstadoCivil){
		estadoCivil = unEstadoCivil
	}
	method estaEnPareja(){
		return (estadoCivil == enPareja)
	}

	method relacionFuncionando(){
		return relacion.estaFuncionando()
	}

	method relacionPodrida(){
		return relacion.sePudreTodo()
	}
	method reestablecerRelacionCon(unSim){

			self.terminarRelacion()
			if (unSim.estadoCivil() != soltero)
			{
				unSim.terminarRelacion()
			}
			self.iniciarRelacionCon(unSim)
		}
	
	//Valoracion-----------------------------------------------------------------------------------------------------
	method amigoMasValorado(){
		return (amigos.max({amigo => self.valoracion(amigo)}))
	}
	//Abrazos---------------------------------------------------------------------------------------------------------
	method abrazar(persona,tipoDeAbrazo){
		tipoDeAbrazo.abrazarA(self,persona)		
	}
	
	//Trabajo----------------------------------------------------------------------------------------------------

	method trabajar(){
		trabajo.trabajarUnDia(self)
		}		
	
	method trabajaCon(persona){
		return persona.trabajo() == trabajo
	}
	method trabajaConSusAmigos(){
		return amigos.all({amigo =>self.trabajaCon(amigo)})
	}
	//Estados de animo---------------------------------------------------------------------------------------------
	method cambiarDeAnimo(animo){
		estadoDelSim.volverANormalidad(self)
		estadoDelSim = animo
		animo.efecto(self)
	}
	method estadoNormal(){
		estadoDelSim = normal
	}
	
	// Informacion y conocimiento----------------------------------------------------------------------------------
	method adquirirConocimiento(informacion){
		conocimiento.add(informacion)
	}
	method nivelDeConocimiento(){
		return conocimiento.map({frase => frase.size()}).sum()
	}
	method conoce(informacion){
		return conocimiento.contains(informacion)
	}
	method difundir(informacion){
		if(not self.conoce(informacion)){
			self.adquirirConocimiento(informacion)
			amigos.forEach({amigo =>amigo.difundir(informacion)})
		}
	}
	method secreto(informacion){
		return self.conoce(informacion) && amigos.all({amigo=>not amigo.conoce(informacion)})
	}
	method desparramarChisme(informacion,otroSim){
		if (otroSim.secreto(informacion)){
			self.difundir(informacion)
		}
	}
	method tieneSecreto(){
		return self.conocimiento().any({informacion=>self.secreto(informacion)})
	}
	method secretoRandom(unSim){
	if (unSim.tieneSecreto()){
		return unSim.conocimiento().filter({informacion=> unSim.secreto(informacion)}).random()
	}
	else {
		return null
	}
	}
	method darInformacion(){
		return self.secretoRandom(amigos.random())
	}
	method adquirirConocimientoPorFuente(fuente){
		conocimiento.add(fuente.darInformacion())
	}
	
	// CELOS---------------------------------------------------------------------------------------------------------
	method ponerseCeloso(tipoDeCelo){
		if (tipoDeCelo == celosPorPareja && pareja == soltero){
			error.throwWithMessage("No tiene pareja para ponerse celoso")
		//No es necesaria esta validacion, van a ver que cambia cuando tengan estados civiles como objetos
		}
		else{
		self.disminuirFelicidad(10)
		amigos = amigos.filter({amigo =>tipoDeCelo.filtrarRazon(amigo,self)})
		}
	}
// pretamos--------------------------------------------------

method prestarDinero(cantidadDinero,otroSim){
	if(self.puedePrestar(cantidadDinero,otroSim)){
		dinero -= cantidadDinero
		otroSim.ganarDinero(cantidadDinero)
	}
	else{
		error.throwWithMessage("No puede prestar Dinero")
		}
		
}
method puedePrestar(cantidadDinero,otroSim){
	return (self.dinero() > cantidadDinero && personalidad.prestar(self,otroSim) >= cantidadDinero)
	}	
}
//--------------------------------------------ACA TERMINA LA CLASE VIM---------------------------------------------------

object masculino{
	
}
object femenino{
	
}

//En general, tener clases, objetos vacios sin comportamiento esta mal

//--------------------------------------------SIM---------------------------------------------------
class Sim inherits Vim{
	constructor(unaFelicidad, unaPersonalidad, unTrabajo, unDinero, unaPreferencia,unSexo,unaEdad) = super(unaFelicidad, unaPersonalidad, unTrabajo, unDinero, unaPreferencia,unSexo)
	{
	edad = unaEdad
	}
	override method cumplirAnios(){
		edad +=1
	}
	
	//12) Si se quisiera contemplar la transformacion de un sim a vim, se tendría que generar una clase abstracta Sim con una variable "tipo" que indique si es "Sim" o "Vim" y que sean objetos polimorficos. En estos objetos incluiriamos metodos como morderA() que transforme desde un vim a sim, pero de un sim a otro sim no haga nada. 
}
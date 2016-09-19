import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*

class Sim {
	var amigos = []
	var sexo// = masculino, femenino (SE INICIALIZA)
	var edad// = 1,2,3,4,5,6... (SE INICIALIZA)
	var nivelFelicidad
	var personalidad // = interesado, superficial, buenazo, peleadoConLaVida (SE INICIALIZA)
	var trabajo// = Copado,Mercenario,Aburrido,Desocupado (SE INICIALIZA)
	var dinero// = 0-100000 (SE INICIALIZA)
	var conocimiento = #{}
	var estadoDelSim = normal
	var preferencia // SEXO MAASCULINO O FEM (SE INICIALIZA)
	var pareja = soltero
	var conocimientoPerdido = #{}
	var relacion
	
	constructor(unaFelicidad,unaEdad, unaPersonalidad, unTrabajo, unDinero, unaPreferencia,unSexo)
	{
	nivelFelicidad = unaFelicidad
	edad = unaEdad
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
	method pareja(){
		return pareja
	}
	method relacion(){
		return relacion
	}
	method sePoneDeNovioCon(alguien){
		pareja = alguien
	}
	//OTROS METODOS SECUNDARIOS ---------------------------------------------------
	method estadoDeAnimo(){
		return estadoDelSim
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
	
	method esSim(){
		return true	
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
	
	//RELACIONES----------------------------------------------------------------------------------------------
	
	method ponerseDeNovioCon(otroSim){
		if (otroSim.pareja() == soltero && self.pareja() == soltero){
			otroSim.sePoneDeNovioCon(self)
			self.sePoneDeNovioCon(otroSim)
			self.cambiarRelacion(otroSim)
			otroSim.cambiarRelacion(self)
			
		}
		else error.throwWithMessage("Alguno est� en pareja")
	}
	method cambiarRelacion(otroSim){
		relacion = new Relacion(self,otroSim,self.amigos(),otroSim.amigos())
	}	
	method estaEnPareja(){
		return (pareja != soltero)
	}
	method ponerseSoltero(){
		pareja = soltero
	}
	method estadoDeRelacion(){
		relacion.estadoDeRelacion()
	}
	method reestablecerRelacionCon(unSim){
		if(self.pareja()!=soltero){
			self.relacion().terminar()
			self.ponerseDeNovioCon(unSim)
		}
		else if(unSim.pareja()!= soltero){
			unSim.relacion().terminar()
			self.ponerseDeNovioCon(unSim)
			}
			else 
				self.ponerseDeNovioCon(unSim)
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
		dinero += trabajo.salario(self)
		nivelFelicidad += trabajo.felicidad(self)
		if(personalidad == buenazo && amigos.all({amigo =>self.trabajaCon(amigo)})){
			nivelFelicidad += nivelFelicidad*0.1
		}		
	}
	method trabajaCon(persona){
		return persona.trabajo() == trabajo
	}
	//Estados de animo---------------------------------------------------------------------------------------------
	method volverANormalidad(){
		if(estadoDelSim == incomodo){
			self.aumentarFelicidad(200)
			estadoDelSim = normal
		}
		else if(estadoDelSim == soniador){
			self.disminuirFelicidad(1000)
			self.recuperarConocimiento()
			estadoDelSim = normal
			}
			else
				estadoDelSim = normal
	}
	method cambiarDeAnimo(animo){
		self.volverANormalidad()
		estadoDelSim = animo
		animo.efecto(self)
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
	// CELOS---------------------------------------------------------------------------------------------------------
	method ponerseCeloso(tipoDeCelo){
		if (tipoDeCelo == celosPorPareja && pareja == soltero){
			error.throwWithMessage("No tiene pareja para ponerse celoso")
		}
		else{
		self.disminuirFelicidad(10)
		amigos = self.amigos().filter({amigo =>tipoDeCelo.filtro(amigo,self)})
		}
	}
	
}
//--------------------------------------------ACA TERMINA LA CLASE SIM---------------------------------------------------

object masculino{
	
}
object femenino{
	
}


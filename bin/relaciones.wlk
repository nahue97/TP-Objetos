import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*
import fuentesDeInformacion.*

class Relacion {
	var nuevoCirculoDeAmigos
	var relacion
	var relacionEnCurso
	
	constructor (unSim,otroSim,listaDeAmigos,otraListaDeAmigos){
		nuevoCirculoDeAmigos = [listaDeAmigos,otraListaDeAmigos].flatten().asSet()
		relacion = [unSim,otroSim]
		relacionEnCurso = true
		unSim.setPareja(otroSim)
		otroSim.setPareja(unSim)
		unSim.setRelacion(self)
		otroSim.setRelacion(self)
	}
	method circuloDeAmigos(){
		return nuevoCirculoDeAmigos
	}
	method estaFuncionando(){
		return relacion.first().hayAtraccionMutua(relacion.last())
	}
	method sePudreTodo(){
		return (!self.estaFuncionando()) && self.leAtraeOtroAmigo()
	}
	method leAtraeOtroAmigo(){
		return nuevoCirculoDeAmigos.any({sim => relacion.first().sienteAtraccionPor(sim) || relacion.last().sienteAtraccionPor(sim)})
	}
	method miembros(){
		return relacion
	}
	method relacionEnCurso(){
		return relacionEnCurso
	}
	method terminar(){	
		relacionEnCurso = false	
		relacion.first().estadoCivil().terminarRelacion(relacion.first())
		relacion.last().estadoCivil().terminarRelacion(relacion.last())
	}
}

object soltero{
	var relacion
	method iniciarRelacion(unSim, otroSim){
		if (otroSim.estadoCivil() == self){
			relacion = new Relacion(unSim, otroSim, unSim.amigos(), otroSim.amigos())
			otroSim.cambiarEstadoCivil(enPareja)
			unSim.cambiarEstadoCivil(enPareja)
			}
			else error.throwWithMessage("El otro sim está en pareja")
	}
	method terminarRelacion(unSim){
		error.throwWithMessage("No es posible terminar una relación no empezada")
	}
}

object enPareja{
	method iniciarRelacion(unSim,otroSim){
		error.throwWithMessage("El sim ya está en pareja con otro Sim")
	}
	method terminarRelacion(unSim){
		unSim.cambiarEstadoCivil(soltero)
	}
}

object femenino{
	
}
object masculino{
	
}
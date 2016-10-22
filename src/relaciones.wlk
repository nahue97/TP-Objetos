import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*

class Relacion {
	var nuevoCirculoDeAmigos
	var relacion
	
	constructor (unSim,otroSim,listaDeAmigos,otraListaDeAmigos){
		nuevoCirculoDeAmigos = [listaDeAmigos,otraListaDeAmigos].flatten().asSet()
		relacion = [unSim,otroSim]
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
	method terminar(){		
		relacion.first().estadoCivil().terminarRelacion()
		relacion.last().estadoCivil().terminarRelacion()
	}
}

object soltero{
	var relacion
	var unSim
	var otroSim
	method iniciarRelacion(unSim, otroSim){
		if (otroSim.estadoCivil() == soltero){
			relacion = new Relacion(self,otroSim,self.amigos(),otroSim.amigos())
			otroSim.cambiarEstadoCivil(enPareja)
			unSim.cambiarEstadoCivil(enPareja)
			}
			else error.throwWithMessage("El otro sim está en pareja")
	}
	method terminarRelacion(){
		error.throwWithMessage("No es posible terminar una relación no empezada")
	}
}

object enPareja{
	var relacion
	var unSim
	var otroSim
	method iniciarRelacion(unSim,otroSim){
		error.throwWithMessage("El sim ya está en pareja con otro Sim")
	}
	method terminarRelacion(){
		unSim.cambiarEstadoCivil(soltero)
	}
}

object femenino{
	
}
object masculino{
	
}
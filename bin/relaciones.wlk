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
	var estadoDeRelacion = "En Curso"
	//Validar estados por String no esta bueno!
	
	
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
		estadoDeRelacion = "Terminada" // IDEM
		
		relacion.first().ponerseSoltero()
		relacion.last().ponerseSoltero()
	}
	method estadoDeRelacion(){
		return estadoDeRelacion
	}
}
object soltero {
	
}
object masculino{}
object femenino{}
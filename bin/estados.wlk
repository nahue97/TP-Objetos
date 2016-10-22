import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*

object soniador{
	method efecto(unSim){
		unSim.aumentarFelicidad(1000)
		unSim.seVuelveBobo()		
	}
	method volverANormalidad(persona){
		persona.disminuirFelicidad(1000)
		persona.recuperarConocimiento()
		persona.estadoNormal()
	}
}
object incomodo{
	method efecto(unSim){
		unSim.disminuirFelicidad(200)
	}
		method volverANormalidad(persona){
			persona.aumentarFelicidad(200)
			persona.estadoNormal()
	}
}
object normal{
	method efecto(unSim){
		
	}
	method volverANormalidad(persona){
		
	}
}

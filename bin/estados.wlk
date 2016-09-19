import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

object soniador{
	method efecto(unSim){
		unSim.aumentarFelicidad(1000)
		unSim.seVuelveBobo()		
	}
}
object incomodo{
	method efecto(unSim){
		unSim.disminuirFelicidad(200)
	}
}
object normal{
	method efecto(unSim){
		
	}
}
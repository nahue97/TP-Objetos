import example.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*

object abrazoComun{
	method abrazarA(abrazador,abrazado){
		abrazador.aumentarFelicidad(2)
		abrazado.aumentarFelicidad(4)
	}	
}
object abrazoProlongado{//Falta testear, si se fijan no esta definido atraccion() en clase sim
		method abrazarA(abrazador,abrazado){
		if(abrazado.sienteAtraccionPor(abrazador)){
			abrazado.cambiarDeAnimo(soniador)
		}
		else 
			abrazado.cambiarDeAnimo(incomodo)
	}	
}
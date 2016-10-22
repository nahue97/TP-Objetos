import sim.*
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
object abrazoProlongado{
		method abrazarA(abrazador,abrazado){
		if(abrazado.sienteAtraccionPor(abrazador)){
			abrazado.cambiarDeAnimo(soniador)
		}
		else 
			abrazado.cambiarDeAnimo(incomodo)
	}	
}
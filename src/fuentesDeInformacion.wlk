import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*

class Libro {
	var capitulos 
	constructor (textos) {
		capitulos = textos
	}
	
	method darInformacion(){
		return capitulos.anyOne()
	}
	method capitulos(){
		return capitulos
	}
}

object tinelli {
	method darInformacion(){
		return "toto"
	}
}

object rial {
	method darInformacion(){
		return "escandalo"
	}
}
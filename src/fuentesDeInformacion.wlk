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
	
//No existe esta funcion random así como está, deberia existir esta funcion en wollok que no sabemos como se llama y con esto deberian funcionar bien los test de fuentes de informacion 
	
	
	method darInformacion(){
		return capitulos.random()
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
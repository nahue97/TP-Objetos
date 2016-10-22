class Libro {
	var capitulos 
	constructor (textos) {
		capitulos = textos
	}
	method darInformacion(){
		return capitulos.random()
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
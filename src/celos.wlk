import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*

object celosPorPlata{
	method filtrarRazon(amigo,sim){
		return sim.tieneMenosDinero(amigo)
	}
}

object celosPorPopularidad{
	method filtrarRazon(amigo,sim){
		return sim.tieneMenosPopularidad(amigo)
	}
}

object celosPorPareja{
	method filtrarRazon(amigo,sim){
		return sim.noEsAmigoDeMiPareja(amigo)
	}
}

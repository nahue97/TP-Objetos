import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

object celosPorPlata{
	method filtro(amigo,sim){
		return sim.tieneMenosDinero(amigo)
	}
}

object celosPorPopularidad{
	method filtro(amigo,sim){
		return sim.tieneMenosPopularidad(amigo)
	}
}

object celosPorPareja{
	method filtro(amigo,sim){
		return sim.noEsAmigoDeMiPareja(amigo)
	}
}


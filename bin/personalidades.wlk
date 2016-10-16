import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

object interesado{
	method valorar(simValorador, simValorado){
		return (simValorado.amigos()).sum({unAmigo => unAmigo.dinero()})*0.1
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.dinero() >= simAtraido.dinero() * 2
	}
	method trabajar(persona){}
	method prestar(persona,otroSim){
		return otroSim.dinero()
	}
}
object superficial{
	method valorar(simValorador,simValorado){
		return simValorado.popularidad()*20
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.esJoven() && (simAtraido.amigoMasPopular().popularidad() <= simAtractor.popularidad())
	}
	method trabajar(persona){}
	method prestar(persona,otroSim){
		return 10* self.valorar(persona,otroSim)
	}
}
	
object buenazo{
	method valorar(simValorador,simValorado){
	return simValorador.nivelFelicidad()*0.5
	}
	method preferencia(simAtraido,simAtractor){
		return true
	}
	method trabajar(persona){
		if(persona.trabajaConSusAmigos()){
			persona.aumentarFelicidad(persona.nivelFelicidad()*0.1)
		}
	}
	method prestar(persona,otroSim){
		return 10* self.valorar(persona,otroSim)
	}
}
object peleadoConLaVida{
	method valorar(valorador,simValorado){
		return 0
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.estaTriste()
	}
	method trabajar(persona){}
	method prestar(persona,otroSim){
		return 10* self.valorar(persona,otroSim)
	}
}


import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*
class Personalidad {
	method valorar(simValorador,simValorado){
		return 0
	}
	method prestar(persona,otroSim){
		return 10* self.valorar(persona,otroSim)
	}
	method trabajar(persona){}
}
object interesado inherits Personalidad{
	override method valorar(simValorador, simValorado){
		return (simValorado.amigos()).sum({unAmigo => unAmigo.dinero()})*0.1
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.dinero() >= simAtraido.dinero() * 2
	}
	
	override method prestar(persona,otroSim){
		return otroSim.dinero()
	}
}
object superficial inherits Personalidad{
	override method valorar(simValorador,simValorado){
		return simValorado.popularidad()*20
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.esJoven() && (simAtraido.amigoMasPopular().popularidad() <= simAtractor.popularidad())
	}

}
	
object buenazo inherits Personalidad{
	override method valorar(simValorador,simValorado){
	return simValorador.nivelFelicidad()*0.5
	}
	method preferencia(simAtraido,simAtractor){
		return true
	}
	override method trabajar(persona){
		if(persona.trabajaConSusAmigos()){
			persona.aumentarFelicidad(persona.nivelFelicidad()*0.1)
		}
	}
}
object peleadoConLaVida inherits Personalidad{
	override method valorar(valorador,simValorado){
		return 0
	}
	method preferencia(simAtraido,simAtractor){
		return simAtractor.estaTriste()
	}
}

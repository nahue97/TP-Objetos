import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

class Trabajo {
	var remuneracion = 0
	var felicidadDelTrabajo = 0
	method salario(trabajador){
		return remuneracion
	}
	method felicidad(trabajador){
		return felicidadDelTrabajo	
	}
}
class TrabajosFijos inherits Trabajo {
	constructor(unaRemuneracion,unaFelicidad){
		remuneracion = unaRemuneracion
		felicidadDelTrabajo = unaFelicidad
	}
	method cambiarEstado(sim){
		sim.cambiarDeAnimo(normal)
	}
}
class Aburrido inherits TrabajosFijos {
    constructor(unaRemuneracion,unaFelicidad) = super(unaRemuneracion,unaFelicidad)	
	override method felicidad(trabajador){
		return - felicidadDelTrabajo
	}
}
class Copado inherits TrabajosFijos {
	constructor(unaRemuneracion,unaFelicidad) = super(unaRemuneracion,unaFelicidad)	
}
class Mercenario inherits Trabajo {		
	override method salario(trabajador){
		return trabajador.dinero()*0.02 + 100
	}
	method cambiarEstado(sim){
		sim.cambiarDeAnimo(normal)
	}
}
object desocupado inherits Trabajo {
	method cambiarEstado(sim){
	}
}
class SuperAburrido inherits TrabajosFijos{
	var perdidaDeFelicidad = 3
    constructor(unaRemuneracion,unaFelicidad) = super(unaRemuneracion,unaFelicidad)
    override method felicidad(trabajador){
		return - felicidadDelTrabajo ** perdidaDeFelicidad
		}
}
class MercenarioSocial inherits Trabajo {		
	override method salario(trabajador){
		return trabajador.dinero()*0.02 + 100 + self.comision(trabajador)
	}
	method cambiarEstado(sim){
		sim.cambiarDeAnimo(normal)
	}
	method comision(trabajador){
		return trabajador.amigos().size()
	}
}


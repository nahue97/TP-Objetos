import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

class Trabajo {
	var remuneracion 
	var felicidadDelTrabajo 
	
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
	constructor(){
		remuneracion = 0
	}
	override method salario(trabajador){
		return trabajador.dinero()*0.02 + 100
	}
	method cambiarEstado(sim){
		sim.cambiarDeAnimo(normal)
	}
}
object desocupado inherits Trabajo {
	override method salario(trabajador){
		return 0
	}
	override method felicidad(trabajador){
		return 0	
	}
	method cambiarEstado(sim){
	
	}
}
class SuperAburrido inherits Aburrido{
	var perdidaDeFelicidad = 3
    constructor(unaRemuneracion,unaFelicidad) = super(unaRemuneracion,unaFelicidad)
    override method felicidad(trabajador){
		return super(trabajador) ** perdidaDeFelicidad
		}
}
class MercenarioSocial inherits Mercenario{		
	override method salario(trabajador){
		return super(trabajador) + self.comision(trabajador)
	}
	method comision(trabajador){
		return trabajador.amigos().size()
	}
}


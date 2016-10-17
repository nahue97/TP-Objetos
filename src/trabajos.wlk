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
			//Esto no esta bien, no es bueno tener metodos vacios, es preferible delegar la información del trabajo y que cada tipo de trabajo retorne lo que tenga que retornar a que le pongan atributos a la clase madre en 0.
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

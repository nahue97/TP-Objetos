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
}
object desocupado inherits Trabajo {
	
}

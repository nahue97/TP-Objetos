
import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import sim.*
import fuentesDeInformacion.*


object oficinista inherits Aburrido(1000,5){}
object ladron inherits Mercenario{}
object presidente inherits Copado(1000,100){}


object pepito inherits Sim(5,interesado,oficinista,500,femenino,masculino,20){}
object carla inherits Sim(5,peleadoConLaVida,desocupado,100,masculino,femenino,19){}
object pepo inherits Sim(5,superficial,ladron,1500,femenino,masculino,21){}
object leandro inherits Sim(5,buenazo,presidente,30000,femenino,masculino,32){}
object ricardo inherits Sim(5,interesado,oficinista,1500,femenino,masculino,25){}
object juan inherits Sim(5,interesado,ladron,3500,femenino,masculino,40){}
object martha inherits Sim(20,interesado,desocupado,15000,masculino,femenino,95){}
object pepa inherits Sim(5,superficial,ladron,16500,masculino,femenino,45){}
object simFeliz inherits Sim(500,superficial,presidente,16500,masculino,femenino,45){}



object fixture{
	method pepitoYsusAmigos(){
		ricardo.hacerseAmigoDe(pepito)
		ricardo.hacerseAmigoDe(carla)
		pepito.hacerseAmigoDe(carla)
		pepito.hacerseAmigoDe(pepo)
		pepito.hacerseAmigoDe(leandro)
		pepito.hacerseAmigoDe(ricardo)
		pepito.hacerseAmigoDe(juan)
		leandro.trabajar()
	}
	method contarleConocimientoAPepito(){
		pepito.adquirirConocimiento("holahola")
		pepito.adquirirConocimiento("anchoa")
	}
	method amigosDeCarla(){
		carla.hacerseAmigoDe(martha)
		carla.hacerseAmigoDe(pepa)
	}
	method amigosDeLeandro(){
		leandro.hacerseAmigoDe(pepa)
		leandro.hacerseAmigoDe(pepito)
	}
	method carlaYLeandro(){
		self.amigosDeCarla()
		self.amigosDeLeandro()
		carla.iniciarRelacionCon(leandro)
	}
	method carlaYLeandroTerminan(){
		self.carlaYLeandro()
		carla.relacion().terminar()
	}
	method leandroYPepito(){
		self.amigosDeLeandro()
		self.pepitoYsusAmigos()
		leandro.iniciarRelacionCon(pepito)
	}
}
object masculino{}
object femenino{}
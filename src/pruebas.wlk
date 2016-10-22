
import abrazos.*
import celos.*
import estados.*
import personalidades.*
import trabajos.*
import relaciones.*
import example.*

object oficinista inherits Aburrido(1000,5){}
object ladron inherits Mercenario{}
object presidente inherits Copado(1000,100){}


object pepito inherits Sim(5,20,interesado,oficinista,500,femenino,masculino){}
object carla inherits Sim(5,19,peleadoConLaVida,desocupado,100,masculino,femenino){}
object pepo inherits Sim(5,21,superficial,ladron,1500,femenino,masculino){}
object leandro inherits Sim(5,32,buenazo,presidente,30000,femenino,masculino){}
object ricardo inherits Sim(5,25,interesado,oficinista,1500,femenino,masculino){}
object juan inherits Sim(5,40,interesado,ladron,3500,femenino,masculino){}
object martha inherits Sim(20,95,interesado,desocupado,15000,masculino,femenino){}
object pepa inherits Sim(5,45,superficial,ladron,16500,masculino,femenino){}

object fixture{
	method pepitoYsusAmigos(){
		ricardo.hacerseAmigoDe(pepito)
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
		carla.relacion().terminarRelacion()
	}
	method leandroYPepito(){
		self.amigosDeLeandro()
		self.pepitoYsusAmigos()
		leandro.iniciarRelacionCon(pepito)
	}
}
object masculino{}
object femenino{}
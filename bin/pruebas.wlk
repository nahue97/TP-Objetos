
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
object granadero inherits SuperAburrido(1000, 5, 5){}
object abogadaexitosa inherits MercenarioSocial{}


object pepito inherits Sim(5,interesado,oficinista,500,femenino,masculino,[libroDeLaSelva,tinelli,rial],20){}
object carla inherits Sim(5,peleadoConLaVida,desocupado,100,masculino,femenino,[libroDeLaSelva,tinelli,rial],19){}
object pepo inherits Sim(5,superficial,ladron,1500,femenino,masculino,[libroDeLaSelva,tinelli,rial],21){}
object leandro inherits Sim(5,buenazo,presidente,30000,femenino,masculino,[libroDeLaSelva,tinelli,rial],32){}
object ricardo inherits Sim(5,interesado,oficinista,1500,femenino,masculino,[libroDeLaSelva,tinelli,rial],25){}
object juan inherits Sim(5,interesado,ladron,3500,femenino,masculino,[libroDeLaSelva,tinelli,rial],40){}
object martha inherits Sim(20,interesado,desocupado,15000,masculino,femenino,[libroDeLaSelva,tinelli,rial],95){}
object pepa inherits Sim(5,superficial,ladron,16500,masculino,femenino,[libroDeLaSelva,tinelli,rial],45){}
object simFeliz inherits Sim(500,superficial,presidente,16500,masculino,femenino,[libroDeLaSelva,tinelli,rial],45){}
object airton inherits Sim(5,interesado,granadero,500,femenino,masculino,[libroDeLaSelva,tinelli,rial],20){}
object cristinakirchner inherits Sim(100,interesado,abogadaexitosa,1000000,masculino,femenino,[libroDeLaSelva,tinelli,rial],63){}
object vim inherits Vim(500,superficial,presidente,16500,masculino,femenino,[libroDeLaSelva,tinelli,rial],110){}
object libroDeLaSelva inherits Libro(["cap1","cap2","cap3"]){}
object tomasito inherits Sim(5, buenazo, desocupado, 100,femenino, masculino,[libroDeLaSelva,tinelli,rial], 14){}


object fixture{
	method laKristiYSusKumpas(){
		cristinakirchner.hacerseAmigoDe(pepito)
		cristinakirchner.hacerseAmigoDe(carla)
		cristinakirchner.hacerseAmigoDe(pepa)
		cristinakirchner.hacerseAmigoDe(airton)
		cristinakirchner.hacerseAmigoDe(martha)
		cristinakirchner.hacerseAmigoDe(ricardo)
	}
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
	method airtonYSusAmigos() {
		ricardo.hacerseAmigoDe(airton)
		ricardo.hacerseAmigoDe(carla)
		airton.hacerseAmigoDe(carla)
		airton.hacerseAmigoDe(pepo)
		airton.hacerseAmigoDe(leandro)
		airton.hacerseAmigoDe(ricardo)
		airton.hacerseAmigoDe(juan)
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
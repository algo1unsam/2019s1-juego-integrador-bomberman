import wollok.game.*
import explosion.*

//CONSTRUCTORES DE BOMBAS
object constructorDeBombaNormal {
	method construir(posicion) { new BombaNormal().generar(posicion)}
}

object constructorDeBombaFuerte {
	method construir(posicion) { new BombaFuerte().generar(posicion)}
}

//CLASE BOMBA ABSTRACTA
class Bomba{
	var property position
	
	method radio()
	
	method explotarObjeto(explocion) {}
	
	//PARA QUE SOLO SE ACTIVE EL CHOQUE CUANDO SE MUEVE Y VUELVE A TOCARLA
	method chocoJugador(algo) { if(not(algo.pusoBomba())) algo.volverAlaAnteriorPosicion()  }
	
	//GENERO LA BOMBA Y LA CONFIGURO
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
		self.configurar()
	}
	
	//LA CONFIGURO CON LOS MILISEGUDOS QUE QUIERO PARA QUE EXPLOTE
	method configurar(){
		game.onTick(2000, "explotar", { self.explotar() game.removeTickEvent("explotar")
		})}
		
	//VUELVA LA BOMBA
	method explotar(){
		new Explosion().generar(self.radio(),self.position())
		game.removeVisual(self)
	}
	
	
}

class BombaNormal inherits Bomba{
	method image() = "bomb01.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
	
}

class BombaFuerte inherits Bomba{
	method image() = "bomb01.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 5
}


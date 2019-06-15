import wollok.game.*
import explosion.*
import players.*
import scheduler.*
import tiposDeExplosion.*

//CONSTRUCTORES DE BOMBAS
object constructorDeBombaNormal {
	method construir(jugador) { new BombaNormal().generar(jugador)}
}

object constructorDeBombaFuerte {
	method construir(jugador) { new BombaFuerte().generar(jugador)}
}

object constructorDeBombaSticky {
	method construir(jugador) { new BombaSticky().generar(jugador)}
}

object constructorDeBombaRemota {
	method construir(jugador) { new BombaRemota().generar(jugador)}
}


//CLASE BOMBA ABSTRACTA
class Bomba{
	
	var property position
	
	var property esDuro = true
	
	method radio()
	
	method tipo()
	
	method explotarObjeto(explocion,onda) { }
	
	method mancharObjeto(explosion,sticky) { }
	
	method chocoJugador(jugador) { }
	
	method generar(jugador) {
		self.position(jugador.position())
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurar(jugador)
	}
	
	method configurar(jugador){
		scheduler.schedule(2000,{ self.explotar(jugador) })
	}
		
	method explotar(jugador){
		new Explosion().generar(self.radio(),self.position(),self.tipo())
		jugador.cambiarBombasEnPantalla(1)
		game.removeVisual(self)
	}
}

class BombaNormal inherits Bomba{
	override method tipo() = fuego
	
	method image() = "bomb02.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
}

class BombaFuerte inherits Bomba{
	override method tipo() = fuego
	
	method image() = "bomb03.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 4
}

class BombaSticky inherits Bomba{
	override method tipo() = sticky
	
	method image() = "bomb04.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
}

class BombaRemota inherits Bomba{
	
	override method tipo() = fuego
	
	method image() = "bomb05.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
	
	override method configurar(jugador) { jugador.agregarBombaRemota(self) }
}


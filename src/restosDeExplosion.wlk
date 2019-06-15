import wollok.game.*

object constructorDeCeniza{ method construir(newPosition) = new Ceniza(position = newPosition) }

class Ceniza{
	var property position
	
	method esDuro() = false
	
	method image() = "groundMap1Broken.png"
	
	method generar() { game.addVisual(self) }
	
	method chocoJugador(jugador) { jugador.refresh() }
}

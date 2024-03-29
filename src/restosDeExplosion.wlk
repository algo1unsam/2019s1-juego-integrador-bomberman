import wollok.game.*
import mapa.*

object constructorDeCeniza{ 
	
	method imagen() = "groundMapBroken"+ mapa.numero() +".png"
		
	method construir(newPosition) = new Ceniza(position = newPosition)
}

class Ceniza{
	var property position
	
	method esDuro() = false
	
	method image() = constructorDeCeniza.imagen()
	
	method generar() { /*game.addVisual(self)*/ }
	
	method explotarObjeto(explosion,onda) { }
	
	method chocoJugador(jugador) { }
	
	method mancharObjeto(explosion,sticky) { }
}

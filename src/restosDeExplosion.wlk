import wollok.game.*

object constructorDeCeniza{ 
	
	method imagen() = "groundMap1Broken.png"
		
	method construir(newPosition) = new Ceniza(position = newPosition)
}

class Ceniza{
	var property position
	
	method esDuro() = false
	
	method image() = constructorDeCeniza.imagen()
	
	method generar() { game.addVisual(self) }
	
	method explotarObjeto(explosion,onda) { }
	
	method chocoJugador(jugador) { jugador.refresh }
	
	method mancharObjeto(explosion,sticky) { }
}

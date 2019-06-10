import wollok.game.*
import players.*
import bombas.*

//CONSTRUCTOR DE PowerUPs
object powerUpBombaFuerte{
	method construir(newPosition)  = new PowerUpBombaFuerte(position = newPosition)
}

//CLASES DE PowerUPS
class PowerUpBombaFuerte{
	var property position
	
	method image() = "tomaco_baby.png"
	
	method generar() { game.addVisual(self) }
	
	//SI UN JUGADOR TOCA EL PowerUP LO AGARRA
	method chocoJugador(jugador) {
		jugador.tipoDeBomba(constructorDeBombaFuerte)
		game.removeVisual(self)
	}
	
	method explotarObjeto(explosion,onda) { game.removeVisual(self) }
	
}
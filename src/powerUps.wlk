import wollok.game.*
import players.*
import bombas.*

//CONSTRUCTOR DE PowerUPs
object powerUpBombaFuerte{
	method construir(newPosition)  = new PowerUpBombaFuerte(position = newPosition)
}

object powerUpAumentarVelocidad{
	method construir(newPosition)  = new PowerUpAumentarVelocidad(position = newPosition)
}

object powerUpEscudo{
	method construir(newPosition)  = new PowerUpEscudo(position = newPosition)
}

//CLASES DE PowerUPS

class PowerUP{
	var property position
	
	method generar() { game.addVisual(self) }	
	
	method explotarObjeto(explosion,onda) { game.removeVisual(self) }
	
	method chocoJugador(jugador) { game.removeVisual(self) }
}

class PowerUpBombaFuerte inherits PowerUP{
	
	method image() = "powerup02.png"
	
	//SI UN JUGADOR TOCA EL PowerUP LO AGARRA
	override method chocoJugador(jugador) {
		jugador.cambiarBomba(constructorDeBombaFuerte,0)
		super(jugador)
	}
}

class PowerUpAumentarVelocidad inherits PowerUP{
	
	method image() = "powerup01.png"
	
	override method chocoJugador(jugador) {
		jugador.reductor(0)
		super(jugador)
	}
}

class PowerUpEscudo inherits PowerUP{
	
	method image() = "powerup03.png"
	
	override method chocoJugador(jugador) {
		jugador.ponerEscudo()
		super(jugador)
	}
	
}
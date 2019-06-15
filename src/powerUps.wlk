import wollok.game.*
import players.*
import bombas.*

//CONSTRUCTOR DE PowerUPs
object powerUpBombaFuerte{
	method construir(newPosition)  = new PowerUpBombaFuerte(position = newPosition)
}

object powerUpBombaSticky{
	method construir(newPosition)  = new PowerUpBombaSticky(position = newPosition)
}

object powerUpAumentarVelocidad{
	method construir(newPosition)  = new PowerUpAumentarVelocidad(position = newPosition)
}

object powerUpEscudo{
	method construir(newPosition)  = new PowerUpEscudo(position = newPosition)
}

object powerUpMasBombas{
	method construir(newPosition)  = new PowerUpMasBombas(position = newPosition)
}

//CLASES DE PowerUPS

class PowerUP{
	var property position
	
	method esDuro() = false
	
	method generar() { game.addVisual(self) }
	
	method remover() { game.removeVisual(self) }
	
	method explotarObjeto(explosion,onda) { game.removeVisual(self) }
	
	method mancharObjeto(explosion,sticky) { }
	
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

class PowerUpBombaSticky inherits PowerUP{
	
	method image() = "powerupStickyBomb.png"
	
	//SI UN JUGADOR TOCA EL PowerUP LO AGARRA
	override method chocoJugador(jugador) {
		jugador.activarBombaSticky()
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

class PowerUpMasBombas inherits PowerUP{
	
	method image() = "powerupBombaExtra.png"
	
	override method chocoJugador(jugador) {
		jugador.cambiarBombasEnPantalla(1)
		super(jugador)
	}
}

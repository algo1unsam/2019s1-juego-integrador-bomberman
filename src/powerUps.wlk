import wollok.game.*
import players.*
import bombas.*

//CREADOR DE POWERUP AL AZAR
object powerUPsRandom{
	var property powerUPs = [ 
		powerUpBombaFuerte, powerUpBombaSticky, powerUpAumentarVelocidad,
		powerUpEscudo,powerUpMasBombas, powerUpBombaRemota, powerUpAgregarVida
	]
	
	method obtener() = powerUPs.anyOne()
}

//CONSTRUCTOR DE PowerUPs
object powerUpBombaFuerte{
	method construir(newPosition)  = new PowerUpBombaFuerte(position = newPosition)
}

object powerUpBombaSticky{
	method construir(newPosition)  = new PowerUpBombaSticky(position = newPosition)
}

object powerUpMasBombas{
	method construir(newPosition)  = new PowerUpMasBombas(position = newPosition)
}

object powerUpBombaRemota{
	method construir(newPosition)  = new PowerUpBombaRemota(position = newPosition)
}

object powerUpAumentarVelocidad{
	method construir(newPosition)  = new PowerUpAumentarVelocidad(position = newPosition)
}

object powerUpEscudo{
	method construir(newPosition)  = new PowerUpEscudo(position = newPosition)
}

object powerUpAgregarVida{
	method construir(newPosition)  = new PowerUpAgregarVida(position = newPosition)
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

//TIPO DE POWER UPS

//BOMBA FUERTE
class PowerUpBombaFuerte inherits PowerUP{
	
	method image() = "powerupBombaFuerte2.png"
	
	override method chocoJugador(jugador) {
		jugador.cambiarBomba(constructorDeBombaFuerte,0)
		super(jugador)
	}
}

//BOMBA STICKY
class PowerUpBombaSticky inherits PowerUP{
	
	method image() = "powerupBombaSticky2.png"
	
	//SI UN JUGADOR TOCA EL PowerUP LO AGARRA
	override method chocoJugador(jugador) {
		jugador.activarBombaSticky()
		super(jugador)
	}
}

//BOMBA REMOTA
class PowerUpBombaRemota inherits PowerUP{
	
	method image() = "powerupBombaRemota2.png"
	
	//SI UN JUGADOR TOCA EL PowerUP LO AGARRA
	override method chocoJugador(jugador) {
		jugador.activarBombaRemota()
		super(jugador)
	}
}

//AUMENTAR LA VELOCIDAD
class PowerUpAumentarVelocidad inherits PowerUP{
	
	method image() = "powerupVelocidad2.png"
	
	override method chocoJugador(jugador) {
		jugador.activarBotas()
		super(jugador)
	}
}

//ESCUDO
class PowerUpEscudo inherits PowerUP{
	
	method image() = "powerupEscudo2.png"
	
	override method chocoJugador(jugador) {
		jugador.ponerEscudo()
		super(jugador)
	}
}

//MAS BOMBAS
class PowerUpMasBombas inherits PowerUP{
	
	method image() = "powerupBombaExtra2.png"
	
	override method chocoJugador(jugador) {
		jugador.cambiarBombasEnPantalla(1)
		super(jugador)
	}
}

//AGREGAR VIDA
class PowerUpAgregarVida inherits PowerUP{
	
	method image() = "powerupLife2.png"
	
	override method chocoJugador(jugador) {
		jugador.sumarVida()
		super(jugador)
	}
}

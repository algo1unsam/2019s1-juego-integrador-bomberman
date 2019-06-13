import wollok.game.*

class Lados{
	method comprobarMovimiento(position) = not( self.objetosDeAlLado(position).any { elemento => elemento.esDuro() } )
	
	method objetosDeAlLado(position)
}

object central{
	method imagenExplosionCentral() ="explosionCentral.png"
}

object derecha inherits Lados{
	method imagenJugador1() = "player1right.png"
	
	method imagenJugador2() = "player2right.png"
	
	method imagenExplosionSide() = "explosionSideRight.png"
	
	method imagenExplosionEnd() = "explosionEndRight.png"

	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x()+1,position.y()))
}

object izquierda inherits Lados{
	method imagenJugador1() = "player1left.png"
	
	method imagenJugador2() = "player2left.png"
	
	method imagenExplosionSide() = "explosionSideLeft.png"
	
	method imagenExplosionEnd() = "explosionEndLeft.png"
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x()-1,position.y()))
}

object arriba inherits Lados{
	method imagenJugador1() = "player1up.png"
	
	method imagenJugador2() = "player2up.png"
	
	method imagenExplosionSide() = "explosionSideUp.png"
	
	method imagenExplosionEnd() = "explosionEndUp.png"
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x(),position.y()+1))
}

object abajo inherits Lados{
	method imagenJugador1() = "player1down.png"
	
	method imagenJugador2() = "player2down.png"
	
	method imagenExplosionSide() = "explosionSideDown.png"
	
	method imagenExplosionEnd() = "explosionEndDown.png"
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x(),position.y()-1))
}
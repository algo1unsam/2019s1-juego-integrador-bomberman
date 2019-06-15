import wollok.game.*

class Lados{
	method comprobarMovimiento(position) = not( self.objetosDeAlLado(position).any { elemento => elemento.esDuro() } )
	
	method objetosDeAlLado(position)
}

object central{
	//BOMBAS
	method imagenExplosionCentralFuego() = "explosionCentral.png"
	
	method imagenExplosionCentralSticky () = "slime.png"
}

object derecha inherits Lados{
	//JUGADOR
	method imagenJugador1() = "player1right.png"
	
	method imagenJugador2() = "player2right.png"
	
	//BOMBAS
	method imagenExplosionSideFuego() = "explosionSideRight.png"
	
	method imagenExplosionEndFuego() = "explosionEndRight.png"
	
	method imagenExplosionSideSticky() = "slime.png"
	
	method imagenExplosionEndSticky() = "slime.png"

	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x()+1,position.y()))
}

object izquierda inherits Lados{
	//JUGADOR
	method imagenJugador1() = "player1left.png"
	
	method imagenJugador2() = "player2left.png"
	
	//BOMBAS
	method imagenExplosionSideFuego() = "explosionSideLeft.png"
	
	method imagenExplosionEndFuego() = "explosionEndLeft.png"
	
	method imagenExplosionSideSticky() = "slime.png"
	
	method imagenExplosionEndSticky() = "slime.png"
	
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x()-1,position.y()))
}

object arriba inherits Lados{
	//JUGADOR
	method imagenJugador1() = "player1up.png"
	
	method imagenJugador2() = "player2up.png"
	
	//BOMBAS
	method imagenExplosionSideFuego() = "explosionSideUp.png"
	
	method imagenExplosionEndFuego() = "explosionEndUp.png"
	
	method imagenExplosionSideSticky() = "slime.png"
	
	method imagenExplosionEndSticky() = "slime.png"
	
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x(),position.y()+1))
}

object abajo inherits Lados{
	//JUGADOR
	method imagenJugador1() = "player1down.png"
	
	method imagenJugador2() = "player2down.png"
	
	//BOMBAS
	method imagenExplosionSideFuego() = "explosionSideDown.png"
	
	method imagenExplosionEndFuego() = "explosionEndDown.png"
	
		method imagenExplosionSideSticky() = "slime.png"
	
	method imagenExplosionEndSticky() = "slime.png"
	
	
	override method objetosDeAlLado(position) = game.getObjectsIn(game.at(position.x(),position.y()-1))
}
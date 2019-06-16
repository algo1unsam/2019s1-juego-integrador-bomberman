import wollok.game.*

//DIRECCIONES
class Direccion{
	
	method comprobarSiNoHayObjetoDuro(position) = not( self.objetosEn(position).any { elemento => elemento.esDuro() } )
	
	method objetosEn(position) = game.getObjectsIn(position)
	
	method imagenExplosionSideSticky() = "slime.png"
}

//CENTRAL
object central inherits Direccion{
//BOMBAS
	//FUEGO
	method imagenExplosionCentralFuego() = "explosionCentral.png"
	
	//STCIKY
	method imagenExplosionCentralSticky () = "slime.png"
}

//DERECHA
object derecha inherits Direccion{
//JUGADOR
	method imagenJugador1() = "player1right.png"
	
	method imagenJugador2() = "player2right.png"
	
//BOMBAS
	//FUEGO
	method imagenExplosionSideFuego() = "explosionSideRight.png"
	
	method imagenExplosionEndFuego() = "explosionEndRight.png"
	
	//STICKY

	
	method imagenExplosionEndSticky() = "slimeEndRight.png"
	
//COMPROBAR OBJETOS DE AL LADO
	override method objetosEn(position) = super(game.at(position.x()+1,position.y()))
}

//IZQUIERDA
object izquierda inherits Direccion{
//JUGADOR
	method imagenJugador1() = "player1left.png"
	
	method imagenJugador2() = "player2left.png"
	
//BOMBAS
	//FUEGO
	method imagenExplosionSideFuego() = "explosionSideLeft.png"
	
	method imagenExplosionEndFuego() = "explosionEndLeft.png"
	
	//STICKY"
	method imagenExplosionEndSticky() = "slimeEndLeft.png"
	
//COMPROBAR OBJETOS DE AL LADO
	override method objetosEn(position) = super(game.at(position.x()-1,position.y()))
}

//ARRIBA
object arriba inherits Direccion{
//JUGADOR
	method imagenJugador1() = "player1up.png"
	
	method imagenJugador2() = "player2up.png"
	
//BOMBAS
	//FUEGO
	method imagenExplosionSideFuego() = "explosionSideUp.png"
	
	method imagenExplosionEndFuego() = "explosionEndUp.png"
	
	//STCIKY
	method imagenExplosionEndSticky() = "slimeEndUp.png"
	
//COMPROBAR OBJETOS DE AL LADO
	override method objetosEn(position) = super(game.at(position.x(),position.y()+1))
}

//ABAJO
object abajo inherits Direccion{
//JUGADOR
	method imagenJugador1() = "player1down.png"
	
	method imagenJugador2() = "player2down.png"
	
//BOMBAS
	//FUEGO
	method imagenExplosionSideFuego() = "explosionSideDown.png"
	
	method imagenExplosionEndFuego() = "explosionEndDown.png"
	
	//STCIKY
	method imagenExplosionEndSticky() = "slimeEndDown.png"
	
//COMPROBAR OBJETOS DE AL LADO
	override method objetosEn(position) = super(game.at(position.x(),position.y()-1))
}
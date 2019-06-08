import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position
	
	var property lastPosition = game.at(0, 0)
	
	var property tipoDeBomba = constructorDeBombaNormal
	
	//WOLLOK GAME
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method image() = "player.png"

	//ACCIONES
	method ponerBomba() { tipoDeBomba.generar(position) }
	
	method generar() {game.addVisual(self) }
	
	method morir() { 
		//game.removeVisual(self)
		self.position(game.at(1,1))
		//self.revivir()
	}//Cuando muere vuelve a la posicion X=0 Y=0
	
	//method revivir(){ game.addVisual(self) }
	
	method accion(algo) { algo.volverAlaAnteriorPosicion()}
	
	method moverArriba() {
		self.lastPosition(self.position())
		self.move(self.position().up(1))	
	}
	method moverAbajo() {
		self.lastPosition(self.position())
		self.move(self.position().down(1))	
	}
	method moverIzquierda() {
		self.lastPosition(self.position())
		self.move(self.position().left(1))	
	}
	method moverDerecha() {
		self.lastPosition(self.position())
		self.move(self.position().right(1))	
	}
	
	method volverAlaAnteriorPosicion() { self.position(self.lastPosition()) }
}
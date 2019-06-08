import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position
	
	var property lastPosition = game.at(0, 0)
	
	var property tipoDeBomba = constructorDeBombaNormal
	
	//ABSTRACTOS
	method configurarTeclado()
	
	//MOVIMIENTO
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
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
	
	//ACCIONES
	method generar(x,y) { 
		self.position(game.at(x,y))
		game.addVisual(self)
		self.configurarTeclado()
		self.configurarColiciones()
	}
	
	method ponerBomba() { tipoDeBomba.generar(position) }
	
	method morir() { self.position(game.at(1,1)) } //Cuando muere vuelve a la posicion X=0 Y=0
	
	method accion(algo) { algo.volverAlaAnteriorPosicion()}
	
	method volverAlaAnteriorPosicion() { self.position(self.lastPosition()) }
	
	method configurarColiciones() { game.whenCollideDo(self, { algo => algo.accion(self) }) }
}

object player1 inherits Player{
	method image() = "player.png"

	override method configurarTeclado(){
		keyboard.up().onPressDo { self.moverArriba() }
		keyboard.down().onPressDo { self.moverAbajo() }
		keyboard.left().onPressDo { self.moverIzquierda() }
		keyboard.right().onPressDo { self.moverDerecha() }
	}
}

object player2 inherits Player{
	method image() = "player.png"
	
	override method configurarTeclado(){
		keyboard.w().onPressDo { self.moverArriba() }
		keyboard.s().onPressDo { self.moverAbajo() }
		keyboard.a().onPressDo { self.moverIzquierda() }
		keyboard.d().onPressDo { self.moverDerecha() }
		keyboard.space().onPressDo { player1.ponerBomba() }
	}
	
}
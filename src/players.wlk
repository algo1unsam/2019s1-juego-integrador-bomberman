import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position
	
	var property lastPosition = game.at(0, 0)
	
	var property tipoDeBomba = constructorDeBombaNormal
	
	var property pusoBomba = false //Esto es para choque con la bomba
	
	//ABSTRACTOS
	method configurarTeclado()
	
	//MOVIMIENTO
	method move(nuevaPosicion) { 
		self.position(nuevaPosicion)
		self.pusoBomba(false)
	}
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
	
	//GENERO EL PERSONAJE
	method generar(x,y) { 
		self.position(game.at(x,y))
		game.addVisual(self)
		self.configurarTeclado()
		self.configurarColiciones()
	}
	
	//COLOCO BOMBAS
	method ponerBomba() { 
		tipoDeBomba.construir(position)
		self.pusoBomba(true)
	}
	
	method morir() { self.position(game.at(1,1)) }
	
	method chocoJugador(algo) { algo.volverAlaAnteriorPosicion()}
	
	method volverAlaAnteriorPosicion() { self.position(self.lastPosition()) }
	
	method configurarColiciones() { game.whenCollideDo(self, { algo => algo.chocoJugador(self) }) }
}

//PLAYER 1
object player1 inherits Player{
	
	method image() = "player.png"
	
	//TECLADO (ver si se puede ahorrar codigo)
	override method configurarTeclado(){
		keyboard.up().onPressDo { self.moverArriba() }
		keyboard.down().onPressDo { self.moverAbajo() }
		keyboard.left().onPressDo { self.moverIzquierda() }
		keyboard.right().onPressDo { self.moverDerecha() }
	}
}

//PLAYER 2
object player2 inherits Player{
	
	method image() = "player.png"
	
	//TECLADO (ver si se puede ahorrar codigo)
	override method configurarTeclado(){
		keyboard.w().onPressDo { self.moverArriba() }
		keyboard.s().onPressDo { self.moverAbajo() }
		keyboard.a().onPressDo { self.moverIzquierda() }
		keyboard.d().onPressDo { self.moverDerecha() }
		keyboard.space().onPressDo { player1.ponerBomba() }
	}
	
}
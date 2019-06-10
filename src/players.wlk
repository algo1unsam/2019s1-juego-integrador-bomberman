import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position = self.respawn()
	
	var property lastPosition 
	
	var property tipoDeBomba = constructorDeBombaNormal
	
	var property pusoBomba = false //Esto es para choque con la bomba
	
	var property reductorDeVelocidad = false
	
	var property reductor = 0
	
	var property escudo = false
	
	//ABSTRACTOS
	method configurarTeclado()
	
	method respawn() = game.at(0,0)
	
	method explotarObjeto(explosion,onda) { }
	
	method nombreDelReductor()
	
	//MOVIMIENTO
	method mover(nuevaPosicion) {
		if(not(self.reductorDeVelocidad())){
			self.guardarPosicionAnterior()
			self.position(nuevaPosicion)
			self.pusoBomba(false)
			self.reductorDeVelocidad(true)
			self.desactivarReductor()			}
	}
	
	method desactivarReductor() {
		game.onTick(self.reductor(),self.nombreDelReductor(), { 
			self.reductorDeVelocidad(false)
			game.removeTickEvent(self.nombreDelReductor())
			})
	}
	
	//GENERO EL PERSONAJE
	method generar() { 
		game.addVisual(self)
		self.configurarTeclado()
		self.configurarColiciones()
		self.reductor(100)
	}
	
	//ACCIONES
	method ponerBomba() { 
		self.tipoDeBomba().construir(self.position())
		self.pusoBomba(true)
	}
	
	
	method cambiarBomba(nuevaBomba,tiempo) { self.tipoDeBomba(nuevaBomba) }
	
	method morir() {
		if(not(self.escudo())) self.position(self.respawn())
		else self.configurarSacarEscudo()
	}
	
	method configurarSacarEscudo() { game.onTick(1000, "escudo", { self.sacarEscudo() } ) }	
	
	method ponerEscudo() {
		self.escudo(true)
		//cambiar imagen
		}
	
	method sacarEscudo() { 
		self.escudo(false)
		//cambiar imagen
		 }
	
	
	method refresh() {
		game.removeVisual(self)
		game.addVisual(self)
		self.configurarColiciones()
	}	

	method chocoJugador(algo) { algo.volverAlaAnteriorPosicion()}
	
	method volverAlaAnteriorPosicion() { self.position(self.lastPosition()) }
	
	method guardarPosicionAnterior() { self.lastPosition(self.position())}

	method configurarColiciones() { game.whenCollideDo(self, { algo => algo.chocoJugador(self) }) }
}

//PLAYER 1
object player1 inherits Player{
	
	var picture = "player.png"
	
	method image() = picture
	
	override method respawn() = game.at(1,1)
	
	override method nombreDelReductor() = "reductor1"
	
	//TECLADO
	override method configurarTeclado(){
		keyboard.w().onPressDo { self.mover(self.position().up(1))	 }
		keyboard.s().onPressDo { self.mover(self.position().down(1)) }
		keyboard.a().onPressDo { self.mover(self.position().left(1)) }
		keyboard.d().onPressDo { self.mover(self.position().right(1)) }
		keyboard.space().onPressDo { self.ponerBomba() }
	}
}

//PLAYER 2
object player2 inherits Player{
	
	method image() = "player.png"
	
	override method respawn() = game.at(18,12)
	
	override method nombreDelReductor() = "reductor2"
	
	//TECLADO
	override method configurarTeclado(){
		keyboard.up().onPressDo { self.mover(self.position().up(1))	 }
		keyboard.down().onPressDo { self.mover(self.position().down(1)) }
		keyboard.left().onPressDo { self.mover(self.position().left(1)) }
		keyboard.right().onPressDo { self.mover(self.position().right(1)) }
		keyboard.num1().onPressDo { self.ponerBomba() }
	}
	
}
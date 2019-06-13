import wollok.game.*
import bombas.*
import direcciones.*

class Player{
	
	//ATRIBUTOS
	var property position = self.respawn()
	
	var property direccion = abajo
	
	var property tipoDeBomba = constructorDeBombaNormal
	
	var property pusoBomba = false //Esto es para choque con la bomba
	
	var property reductorDeVelocidad = false
	
	var property reductor = 0
	
	var property bombasEnPantalla = 2
	
	var property escudo = false
	
	var property choco = true
	
	method esDuro() = true
	
	//ABSTRACTOS
	method configurarTeclado()
	
	method respawn() = game.at(0,0)
	
	method explotarObjeto(explosion,onda) { }
	
	method nombreDelReductor()
	
	//MOVIMIENTO
	method mover(nuevaPosicion,direcion) {
		self.direccion(direcion)
		
		if(not(self.reductorDeVelocidad()) && self.movimientoValido(direcion)){
			self.position(nuevaPosicion)
			self.pusoBomba(false)
			self.reductorDeVelocidad(true)
			self.desactivarReductor()
		}
	}
	
	method movimientoValido(direcion) = direccion.comprobarMovimiento(position)
	
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
		self.reductor(0)
	}
	
	//ACCIONES
	method ponerBomba() {
		if(self.bombasEnPantalla ()>0){
			self.tipoDeBomba().construir(self)
			self.pusoBomba(true)
			self.cambiarBombasEnPantalla(-1)
		}
	}
	
	method cambiarBombasEnPantalla(numero) { self.bombasEnPantalla(self.bombasEnPantalla() + numero) }
	
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

	method configurarColiciones() { game.whenCollideDo(self, { algo => algo.chocoJugador(self) }) }
}

//PLAYER 1
object player1 inherits Player{
	
	method image() = direccion.imagenJugador1()
	
	override method respawn() = game.at(1,1)
	
	override method nombreDelReductor() = "reductor1"
	
	//TECLADO
	override method configurarTeclado(){
		keyboard.w().onPressDo { self.mover(self.position().up(1),arriba) }
		keyboard.s().onPressDo { self.mover(self.position().down(1),abajo) }
		keyboard.a().onPressDo { self.mover(self.position().left(1),izquierda) }
		keyboard.d().onPressDo { self.mover(self.position().right(1),derecha) }
		keyboard.space().onPressDo { self.ponerBomba() }
	}
}

//PLAYER 2
object player2 inherits Player{
	
	method image() = direccion.imagenJugador2()
	
	override method respawn() = game.at(19,11)
	
	override method nombreDelReductor() = "reductor2"
	
	//TECLADO
	override method configurarTeclado(){
		keyboard.up().onPressDo { self.mover(self.position().up(1),arriba) }
		keyboard.down().onPressDo { self.mover(self.position().down(1),abajo) }
		keyboard.left().onPressDo { self.mover(self.position().left(1),izquierda) }
		keyboard.right().onPressDo { self.mover(self.position().right(1),derecha) }
		keyboard.num1().onPressDo { self.ponerBomba() }
	}
	
}
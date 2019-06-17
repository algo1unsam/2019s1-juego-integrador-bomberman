import wollok.game.*
import bombas.*
import direcciones.*
import scheduler.*
import gameover.*

class Player{
//ATRIBUTOS
	var property position = self.respawn()
	
	var property direccion = abajo
	
	var property vidas = 3
	
//BOMBAS
	var property tipoDeBomba = constructorDeBombaNormal
	
	var property bombaSticky = false
	
	var property bombaRemota = false
	
	var property bombasEnPantalla = 2
	
	var property bombasRemotas = []
	
//POWERUPS
	var property botas = false
	
	var property reductorDeVelocidad = false
	
	var property reductor = 0
	
	var property escudo = false
	
	var property choco = true
	
	
//ABSTRACTOS
	method configurarTeclado()
	
	method respawn() 
	
	method explotarObjeto(explosion,onda) { }
	
	method mancharObjeto(explosion,sticky) { }
	
//GENERO EL PERSONAJE
	method generar() { 
		game.addVisual(self)
		self.configurarTeclado()
		self.configurarColiciones()
		self.reiniciarJugador()
	}
	
	method reiniciarJugador(){
		self.vidas(3)
		self.tipoDeBomba(constructorDeBombaNormal)
		self.bombaSticky(false)
		self.bombaRemota(false)
		self.bombasEnPantalla(2)
		self.bombasRemotas([])
	}
	
//MOVIMIENTO
	method mover(nuevaPosicion,direcion) {
		self.direccion(direcion)
		if(not(self.reductorDeVelocidad()) && self.movimientoValido(direcion)){
			self.position(nuevaPosicion)
			self.reductorDeVelocidad(true)
			self.desactivarReductor()
			self.reductor(0)
		}
	}
	
	method movimientoValido(direcion) = direccion.comprobarSiNoHayObjetoDuro(position)
	
//ACCIONES CON LAS BOMBAS
	method ponerBomba(bomba) {
		if(self.bombasEnPantalla ()>0){
			bomba.construir(self)
			self.cambiarBombasEnPantalla(-1)
		}
	}
	
	method agregarBombaRemota(bomba) { bombasRemotas.add(bomba) }
	
	method explotarBombasRemotas() { 
		bombasRemotas.forEach({ bomba => bomba.explotar(self) })
		bombasRemotas.clear()
	}
	
	method cambiarBombasEnPantalla(numero) { self.bombasEnPantalla(self.bombasEnPantalla() + numero) }
	
	method cambiarBomba(nuevaBomba,tiempo) { self.tipoDeBomba(nuevaBomba) }
	
	method activarBombaSticky() { self.bombaSticky(true) }
	
	method activarBombaRemota() { self.bombaRemota(true) }
	
//REDUCTOR DE VELOCIAD
	method desactivarReductor() { scheduler.schedule(self.reductor(), { self.reductorDeVelocidad(false) }) }

//BOTAS
	method activarBotas() { self.botas(true) }

//ESCUDO
	method configurarSacarEscudo() {  scheduler.schedule(2000, { self.sacarEscudo() } ) }
	
	method ponerEscudo() {
		self.escudo(true)
		//cambiar imagen
		}
	
	method sacarEscudo() { 
		self.escudo(false)
		//cambiar imagen
		 }
		 
//VIDAS
	method sumarVida() { vidas+=1 } 
	
	method restaVida() { vidas+=-1 }
	
	method morir() {
		if(not(self.escudo())) {
			self.position(self.respawn())
			//self.darInmunidad()
			self.restaVida()
		}
		else self.configurarSacarEscudo()
		gameover.comprobar(vidas)
	}
	
//ACCIONES GENERALES
	method esDuro() = true
	
	method refresh() {
		game.removeVisual(self)
		game.addVisual(self)
		self.configurarColiciones()
	}
	
	method darInmunidad(){
		self.ponerEscudo()
		self.configurarSacarEscudo()
	}
	
//COLICCIONES
		method configurarColiciones() { 
		game.whenCollideDo( self, { algo => algo.chocoJugador(self) } )
	}
}

//PLAYER 1
object player1 inherits Player{
	method image() = direccion.imagenJugador1()
	
	override method respawn() = game.at(1,1)

//TECLADO
	override method configurarTeclado(){
	//MOVIMIENTO
		keyboard.w().onPressDo { self.mover(self.position().up(1),arriba) }
		keyboard.s().onPressDo { self.mover(self.position().down(1),abajo) }
		keyboard.a().onPressDo { self.mover(self.position().left(1),izquierda) }
		keyboard.d().onPressDo { self.mover(self.position().right(1),derecha) }
		
	//BOMBAS
		keyboard.j().onPressDo { self.ponerBomba(tipoDeBomba) }
		keyboard.k().onPressDo { /*if(bombaSticky)*/ self.ponerBomba(constructorDeBombaSticky) }
		keyboard.l().onPressDo { /*if(bombaRemota)*/ self.ponerBomba(constructorDeBombaRemota) }
		keyboard.space().onPressDo { self.explotarBombasRemotas() }
	}
}

//PLAYER 2
object player2 inherits Player{
	method image() = direccion.imagenJugador2()
	
	override method respawn() = game.at(19,11)
	
//TECLADO
	override method configurarTeclado(){
	//MOVIMIENTO
		keyboard.up().onPressDo { self.mover(self.position().up(1),arriba) }
		keyboard.down().onPressDo { self.mover(self.position().down(1),abajo) }
		keyboard.left().onPressDo { self.mover(self.position().left(1),izquierda) }
		keyboard.right().onPressDo { self.mover(self.position().right(1),derecha) }
		
	//BOMBAS
		keyboard.num1().onPressDo { self.ponerBomba(tipoDeBomba) }
		keyboard.num2().onPressDo { self.ponerBomba(constructorDeBombaSticky) }
		keyboard.num3().onPressDo { self.ponerBomba(constructorDeBombaRemota) }
		keyboard.num0().onPressDo { self.explotarBombasRemotas() }
	}
}
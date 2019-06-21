import wollok.game.*
import bombas.*
import direcciones.*
import scheduler.*
import gameover.*
import HUD.*

class Player{
//ATRIBUTOS
	var property position = self.respawn()
	
	var property direccion = abajo
	
	var property vidas = 3
	
	var property parpadeo = apagado
	
//	var property inmune = false
	
//BOMBAS
	var property tipoDeBomba = constructorDeBombaNormal
	
	var property bombaSticky = false
	
	var property bombaRemota = false
	
	var property bombasEnPantalla = 2
	
	var property bombasRemotas = []
	
//POWERUPS
	var property botas = false
	
	var property reductorDeVelocidad = false
	
	var property escudo = false
	
	//var property choco = true
	
	
//ABSTRACTOS
	method jugador()

	method configurarTeclado()
	
	method respawn() 
	
	method explotarObjeto(explosion,onda) { }
	
	method mancharObjeto(explosion,sticky) { }
	
	method chocoJugador(algo) {}
	
	
//GENERO EL PERSONAJE

	method image() = self.jugador() + direccion + self.tieneEscudo() +self.tieneBotas() + ".png"

	method generar() { 
		game.addVisual(self)
		self.configurarJugador()
	}
	
	method configurarJugador(){
		self.configurarTeclado()
		self.configurarColiciones()
		self.vidas(3)
		self.reiniciarJugador()
	}
	
	method reiniciarJugador(){
		self.tipoDeBomba(constructorDeBombaNormal)
		self.bombaSticky(false)
		self.bombaRemota(false)
		self.botas(false)
		self.bombasEnPantalla(2)
		self.explotarBombasRemotas()
		self.sacarEscudo()
	}
	
	method respawear(){
		self.position(self.respawn())
		self.restaVida()
		self.ponerEscudo()
		self.configurarSacarEscudo()
	}
	
//MOVIMIENTO
	method mover(nuevaPosicion,direcion) {
		self.direccion(direcion)
		if(not(self.reductorDeVelocidad()) && self.movimientoValido(direcion)){
			self.position(nuevaPosicion)
			self.refresh()
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

	
	method activarReductor(tiempo) { 
		self.reductorDeVelocidad(true)
		scheduler.schedule(tiempo, { self.reductorDeVelocidad(false) })
	}

//BOTAS
	method activarBotas() { self.botas(true) }
	
	method tieneBotas() {
		if (botas) return "Velocidad"
		else return ""
	}

//ESCUDO
	method configurarSacarEscudo() {
		//const ticket = self.toString()
		game.onTick(100, self.jugador() , { parpadeo.escudo(self) } )
		
		scheduler.schedule(1500, { 
			self.sacarEscudo()
			game.removeTickEvent(self.jugador())
		} )
	}
	
	method ponerEscudo() { 
		self.escudo(true)
		self.parpadeo(prendido)
	}
	
	method sacarEscudo() { 
		self.escudo(false)
		self.parpadeo(prendido)
		parpadeo.escudo(self)
	}
	
	method tieneEscudo(){
		if (parpadeo == prendido) return "Escudo"
		else return ""
	}
		 
//VIDAS
	method sumarVida() { if(self.vidas() < 6) vidas+=1 } 
	
	method restaVida() { vidas+=-1 }
	
	method morir() {
		if ( not( self.escudo() ) ) {
			self.respawear()
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

//COLICCIONES
		method configurarColiciones() { 
			game.whenCollideDo( self, { algo => algo.chocoJugador(self) } )
	}
}

object apagado{
	method escudo(jugador) { jugador.parpadeo(prendido) }
}

object prendido{
	method escudo(jugador) {  jugador.parpadeo(apagado) }
}

//PLAYER 1
object player1 inherits Player{
	
	override method jugador() = "player1"
	
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
		keyboard.k().onPressDo { if(bombaSticky) self.ponerBomba(constructorDeBombaSticky) }
		keyboard.l().onPressDo { if(bombaRemota) self.ponerBomba(constructorDeBombaRemota) }
		keyboard.space().onPressDo { self.explotarBombasRemotas() }
	}
}

//PLAYER 2
object player2 inherits Player{
	
	override method jugador() = "player2"
	
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
		keyboard.num2().onPressDo { if(bombaSticky) self.ponerBomba(constructorDeBombaSticky) }
		keyboard.num3().onPressDo { if(bombaRemota) self.ponerBomba(constructorDeBombaRemota) }
		keyboard.num0().onPressDo { self.explotarBombasRemotas() }
	}
}
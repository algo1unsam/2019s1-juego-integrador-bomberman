import wollok.game.*
import explosion.*
import players.*

//CONSTRUCTORES DE BOMBAS
object constructorDeBombaNormal {
	method construir(jugador) { new BombaNormal().generar(jugador)}
}

object constructorDeBombaFuerte {
	method construir(jugador) { new BombaFuerte().generar(jugador)}
}

object constructorDeBombaSticky {
	method construir(jugador) { new BombaSticky().generar(jugador)}
}

object constructorDeBombaRemota {
	method construir(jugador) { new BombaRemota().generar(jugador)}
}


//CLASE BOMBA ABSTRACTA
class Bomba{
	var cantBombas = 0
	
	var property position
	
	var property esDuro = true
	
	method radio()
	
	method explotarObjeto(explocion,onda) { }
	
	
	//PARA QUE SOLO SE ACTIVE EL CHOQUE CUANDO SE MUEVE Y VUELVE A TOCARLA
	method chocoJugador(jugador) { }
	
	//GENERO LA BOMBA Y LA CONFIGURO
	method generar(jugador) {
		self.position(jugador.position())
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurar(jugador)
	}
	
	//LA CONFIGURO CON LOS MILISEGUDOS QUE QUIERO PARA QUE EXPLOTE
	method configurar(jugador){
		
		cantBombas += 1
		var nombre = "explotar" + cantBombas
		game.onTick(2000, nombre, { 
			self.explotar(jugador)
			game.removeTickEvent(nombre)
		})
	}
		
	//VUELVA LA BOMBA
	method explotar(jugador){
		new Explosion().generar(self.radio(),self.position(),self.tipo())
		jugador.cambiarBombasEnPantalla(1)
		game.removeVisual(self)
	}
	method tipo() 
}

class BombaNormal inherits Bomba{
	override method tipo() = fuego
	
	method image() = "bomb02.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
}

class BombaFuerte inherits Bomba{
	override method tipo() = fuego
	
	method image() = "bomb03.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 4
}

class BombaSticky inherits Bomba{
	override method tipo() = sticky
	
	method image() = "bomb04.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
}

class BombaRemota inherits Bomba{
	
	override method tipo() = fuego
	
	method image() = "bomb05.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
	
	override method configurar(jugador) { cantBombas += 1 jugador.agregarBombaRemota(self) }
}


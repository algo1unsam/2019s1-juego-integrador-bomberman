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

//CLASE BOMBA ABSTRACTA
class Bomba{
	
	var property position

	method radio()
	
	method explotarObjeto(explocion,onda) { }
	
	//PARA QUE SOLO SE ACTIVE EL CHOQUE CUANDO SE MUEVE Y VUELVE A TOCARLA
	method chocoJugador(algo) { if(not(algo.pusoBomba())) algo.volverAlaAnteriorPosicion()  }
	
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
		game.onTick(2000, "explotar", { self.explotar(jugador) })}
		
	//VUELVA LA BOMBA
	method explotar(jugador){
		new Explosion().generar(self.radio(),self.position())
		jugador.cambiarBombasEnPantalla(1)
		game.removeTickEvent("explotar")
		game.removeVisual(self)
	}
}

class BombaNormal inherits Bomba{
	method image() = "bomb02.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 2
}

class BombaFuerte inherits Bomba{
	method image() = "bomb03.png"
	
	//ELIGO EL RADIO DE LA BOMBA
	override method radio() = 5
}


import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position
	
	//WOLLOK GAME
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method image() = "player.png"

	//ACCIONES
	method ponerBomba() { (new Bomba()).generar(position) }
}
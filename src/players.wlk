import wollok.game.*
import bombas.*

class Player{
	
	//ATRIBUTOS
	var property position
	
	var tipoDeBomba = bombaNormal
	
	//WOLLOK GAME
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method image() = "player.png"

	//ACCIONES
	method ponerBomba() { tipoDeBomba.generar(position) }
	
	method morir() { 
		//game.removeVisual(self)
		self.position(game.at(0,0))
		//self.revivir()
	}//Cuando muere vuelve a la posicion X=0 Y=0
	
	//method revivir(){ game.addVisual(self) }
}
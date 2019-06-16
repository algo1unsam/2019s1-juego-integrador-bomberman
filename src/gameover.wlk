import wollok.game.*
import mapa.*

object gameover{
	
	method image() = "gameover.png"
	
	method position() = game.at(0,0)
	
	method comprobar(vidas) { if(vidas == 0) self.cargar() }
	
	method cargar(){ 
		game.clear()
		game.addVisual(self)
		keyboard.enter().onPressDo { mapa1.generar() }
	}
}
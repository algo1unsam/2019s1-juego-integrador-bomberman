import wollok.game.*
import mapa.*
import menu.*

//PANTALLA DE GAME-OVER
object gameover{
	
	method image() = "gameover.png"
	
	method position() = game.at(0,0)
	
	method comprobar(vidas) { if(vidas == 0) self.cargar() }
	
	method cargar(){ 
		game.clear()
		game.addVisual(self)
		keyboard.m().onPressDo {
			game.clear()
			selectorDeMapa.generar(previewMapa1)
		}
			keyboard.enter().onPressDo {
			game.clear()
			mapa.cargado().generar()
		}
	}
}
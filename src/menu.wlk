import wollok.game.*
import mapa.*

object menu{
	
	var picture = "menu_sin_enter.png"
	
	var position = game.at(0,0)
	
	method image() = picture
	
	method generar() { 
		self.cargarImagen()
		keyboard.enter().onPressDo { game.removeVisual(self) game.removeTickEvent("cambio") selectorDeMapa.generar() } 
	}
	
	method cargarImagen(){
		game.addVisual(self)
		game.onTick(500, "cambio", { self.cambiarImagen() } )
	}
	
	method cambiarImagen(){
		if(picture == "menu_sin_enter.png") picture = "menu_con_enter.png"
		else picture = "menu_sin_enter.png"
	}
}

object selectorDeMapa{
	var position = game.at(0,0)
	
	method image() = "menuMapas.png"
	
	method generar() { 
		game.addVisual(self)
		selector.generar()
		keyboard.space().onPressDo { game.clear() mapa1.generar() }
	}
}

object selector{
	
	var x = 2
	var y = 8
	
	var property position = game.at(x,y)
	
	method image() = "selector.png"
	
	method generar() { 
		game.addVisual(self)
		self.mover()
	}
	
	method mover(){
		keyboard.left().onPressDo { self.moverIzquierda() }
		keyboard.right().onPressDo { self.moverDerecha()}
		keyboard.up().onPressDo { self.moverArriba()}
		keyboard.down().onPressDo { self.moverAbajo()}
	}
	
	method moverIzquierda(){
		if((game.width()/2) < x ) {
			x = 2
			self.position(game.at(x,y))
		}
	}
	method moverDerecha(){
		if((game.width()/2) > x ) {
			x = 12
			self.position(game.at(x,y))
		}
	}
	method moverArriba(){
		if((game.height()/2) > y ) {
			y = 8
			self.position(game.at(x,y))
		}
	}
	method moverAbajo(){
		if((game.height()/2) < y ) {
			y = 1
			self.position(game.at(x,y))
		}
	}
}


	
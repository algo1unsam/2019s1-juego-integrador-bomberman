import wollok.game.*
import mapa.*

object pantallaDeInicio{
	
	var picture = "menu_sin_enter.png"
	
	var position = game.at(0,0)
	
	method image() = picture
	
	method generar() { 
		self.cargarImagen()
		keyboard.enter().onPressDo { selector.generar(menuMapa1) } 
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

object fondoSelectorDeMapa{
	var position = game.at(0,0)
	
	method image() = "menuMapas.png"
	
	method generar() { game.addVisual(self) }
}

object selector{	
	var property paradoEn = menuMapa1
	
	var property position = paradoEn.position()
	
	method image() = "selector.png"
	
	method generar(mapaNuevo) {
		game.clear()
		fondoSelectorDeMapa.generar()
		game.addVisual(self)
		self.paradoEn(mapaNuevo)
		self.position(mapaNuevo.position())
		self.paradoEn().configurarSelector(self)
		keyboard.space().onPressDo { self.cargarMapa() }
	}
	
	method cargarMapa(){
		game.clear()
		mapa1.generar()
	}
}

object menuMapa1{
	var property position = game.at(2,8)
	
	method configurarSelector(selector){
		keyboard.right().onPressDo { selector.generar(menuMapa2) }
		keyboard.down().onPressDo { selector.generar(menuMapa3) }
	}
}

object menuMapa2{
	var property position = game.at(12,8)
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(menuMapa1) }
		keyboard.down().onPressDo { selector.generar(menuMapa4) }
	}
}
object menuMapa3{
	var property position = game.at(2,1)
	
	method configurarSelector(selector){
		keyboard.right().onPressDo { selector.generar(menuMapa4) }
		keyboard.up().onPressDo { selector.generar(menuMapa1) }
	}
}
object menuMapa4{
	var property position = game.at(12,1)
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(menuMapa3) }
		keyboard.up().onPressDo { selector.generar(menuMapa2) }
	}
}


	
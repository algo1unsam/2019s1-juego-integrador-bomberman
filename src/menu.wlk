import wollok.game.*
import mapa.*

object pantallaDeInicio{
	
	var picture = "menu_sin_enter.png"
	
	var position = game.at(0,0)
	
	method image() = picture
	
	method generar() { 
		self.cargarImagen()
		keyboard.enter().onPressDo { selectorDeMapa.generar(mapa1) } 
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

object fondoDelMenu{
	var position =game.at(0,0)
	
	method image() = "menuMapas.png" 	 
}

object selectorDeMapa{		
	var property paradoEn = mapa1
	
	var property position = paradoEn.positionEnMenu()
	
	method image() = "selector.png"
	
	method generar(mapaNuevo) {
		game.clear()
		game.addVisual(fondoDelMenu)
		game.addVisual(self)
		self.paradoEn(mapaNuevo)
		self.position(mapaNuevo.positionEnMenu())
		self.paradoEn().configurarSelector(self)
		keyboard.space().onPressDo { paradoEn.generar() }
	}
	
	method cargarMapa(){
		game.clear()
		mapa1.generar()
	}
}





	
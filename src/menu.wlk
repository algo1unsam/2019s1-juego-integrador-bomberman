import wollok.game.*
import mapa.*

object pantallaDeInicio{
	
	var picture = "menu_sin_enter2.png"
	
	var position = game.at(0,0)
	
	method image() = picture
	
	method generar() { 
		self.cargarImagen()
		keyboard.enter().onPressDo { selectorDeMapa.generar(previewMapa1) } 
	}
	
	method cargarImagen(){
		game.addVisual(self)
		game.onTick(500, "cambio", { self.cambiarImagen() } )
	}
	
	method cambiarImagen(){
		if(picture == "menu_sin_enter2.png") picture = "menu_con_enter2.png"
		else picture = "menu_sin_enter2.png"
	}
}

object fondoDelMenu{
	var position =game.at(0,0)
	
	method image() = "menuMapas.png" 	 
}

object selectorDeMapa{		
	var property paradoEn = previewMapa1
	
	var property position = game.at(paradoEn.position().x()-1,paradoEn.position().y()-1)
	
	method image() = "selector2.png"
	
	method generar(nuevaSelecion) {
		game.clear()
		game.addVisual(fondoDelMenu)
		self.cargarPreview()
		game.addVisual(self)
		self.paradoEn(nuevaSelecion)
		self.position(game.at(nuevaSelecion.position().x()-1,nuevaSelecion.position().y()-1))
		self.paradoEn().configurarSelector(self)
		keyboard.space().onPressDo { (paradoEn.mapa()).generar() }
	}
	
	method cargarMapa(){
		game.clear()
		mapa1.generar()
	}
	
	method cargarPreview(){
		game.addVisual(previewMapa1)
		game.addVisual(previewMapa2)
		game.addVisual(previewMapa3)
		game.addVisual(previewMapa4)
	}
}

object previewMapa1{
	var property position =  game.at(3,6)
	
	method image() = "SelectorMapa1.png"
	
	method mapa() = mapa1
	
	method configurarSelector(selector){
		keyboard.right().onPressDo { selector.generar(previewMapa2) }
		keyboard.down().onPressDo { selector.generar(previewMapa3) }
	}
}

object previewMapa2{
	var property position =  game.at(14,6)
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa1) }
		keyboard.down().onPressDo { selector.generar(previewMapa4) }
	}
	
	method image() = "SelectorMapa2.png"
	
	method mapa() = mapa2
}

object previewMapa3{
	var property position =  game.at(3,1)
	
	method configurarSelector(selector){
		keyboard.right().onPressDo { selector.generar(previewMapa4) }
		keyboard.up().onPressDo { selector.generar(previewMapa1) }
	}
	
	method image() = "SelectorMapa3.png"
	
	method mapa() = mapa3
}

object previewMapa4{
	var property position =  game.at(14,1)
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa3) }
		keyboard.up().onPressDo { selector.generar(previewMapa2) }
	}
	
	method image() = "SelectorMapa4.png"
	
	method mapa() = mapa4
}
	
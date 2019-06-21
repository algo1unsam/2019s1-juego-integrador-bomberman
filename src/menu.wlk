import wollok.game.*
import mapa.*

//PANTALLA QUE CARGA AL INICIAR EL JUEGO
object pantallaDeInicio{
	var property estado = imagenMenuSinEnter
	
	var position = game.at(0,0)
	
	method image() =  estado.imagen()
	
	method generar() { 
		self.cargarImagen()
		keyboard.enter().onPressDo { selectorDeMapa.generar(previewMapa1) } 
	}
	
	method cargarImagen(){
		game.addVisual(self)
		game.onTick(500, "cambio", { self.estado(estado.cambio()) } )
	}
}

object imagenMenuConEnter{
	var property imagen ="menu_con_enter2.png"
	
	method cambio() = imagenMenuSinEnter
}

object imagenMenuSinEnter{
	var property imagen ="menu_sin_enter2.png"
	
	method cambio() = imagenMenuConEnter
}

//FONDO DEL MENU DE SELECCION DE MAPA
object fondoDelMenu{
	var position =game.at(0,0)
	
	method image() = "menuMapas.png" 	 
}

//OBJECTO SELECTOR DE MAPAS
object selectorDeMapa{		
	var property paradoEn = previewMapa1
	
	var property position = paradoEn.position().down(1).left(1)
	
	var property paradoEnTutorial = false
	
	method image() = "selector"+ self.tutorial() + ".png"
	
	method generar(nuevaSelecion) {
		game.clear()
		game.addVisual(fondoDelMenu)
		self.cargarPreview()
		game.addVisual(self)
		self.paradoEn(nuevaSelecion)
		self.position(nuevaSelecion.position().down(1).left(1))
		paradoEn.configurarSelector(self)
		keyboard.space().onPressDo { (paradoEn.mapa()).generar() }	
	}
	
	method cargarPreview(){
		game.addVisual(previewMapa1)
		game.addVisual(previewMapa2)
		game.addVisual(previewMapa3)
		game.addVisual(previewMapa4)
	}
	
	method tutorial(){
		if (paradoEnTutorial) return "Tutorial"
		else return ""
	}
}

//MINIAUTAS QUE DAN IMAGEN DEL MAPA
object previewMapa1{
	var property position =  game.at(1,5)
	
	method image() = "SelectorMapa1.png"
	
	method mapa() = mapa1
	
	method configurarSelector(selector){
	
		keyboard.down().onPressDo { selector.generar(previewMapa4) }
		keyboard.right().onPressDo { selector.generar(previewMapa2) }
	}
}

object previewMapa2{
	var property position =  game.at(9,5)
	
	method image() = "SelectorMapa2.png"
	
	method mapa() = mapa2
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa1) }
		keyboard.right().onPressDo { selector.generar(previewMapa3) }
		keyboard.down().onPressDo { selector.generar(previewMapa4) }
	}
}

object previewMapa3{
	var property position =  game.at(17,5)
	
	method image() = "SelectorMapa3.png"
	
	method mapa() = mapa3
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa2) }
		keyboard.down().onPressDo { selector.generar(previewMapa4) }
	}
}

object previewMapa4{
	
	var property position =  game.at(8,2)
		
	method image() = "SelectorMapa4.png"
	
	method mapa() = mapa4
	
	method configurarSelector(selector){
		//selector.paradoEnTutorial(true)
		keyboard.up().onPressDo { 
			selector.generar(previewMapa2)
			selector.paradoEnTutorial(false)
		}
	}
}

	
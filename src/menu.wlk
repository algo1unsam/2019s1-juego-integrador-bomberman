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
	
	method image() = "selector3.png"
	
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
}

//MINIAUTAS QUE DAN IMAGEN DEL MAPA
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
	
	method image() = "SelectorMapa2.png"
	
	method mapa() = mapa2
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa1) }
		keyboard.down().onPressDo { selector.generar(previewMapa4) }
	}
}

object previewMapa3{
	var property position =  game.at(3,1)
	
	method image() = "SelectorMapa3.png"
	
	method mapa() = mapa3
	
	method configurarSelector(selector){
		keyboard.right().onPressDo { selector.generar(previewMapa4) }
		keyboard.up().onPressDo { selector.generar(previewMapa1) }
	}
}

object previewMapa4{
	var property position =  game.at(14,1)
		
	method image() = "SelectorMapa4.png"
	
	method mapa() = mapa4
	
	method configurarSelector(selector){
		keyboard.left().onPressDo { selector.generar(previewMapa3) }
		keyboard.up().onPressDo { selector.generar(previewMapa2) }
	}
}

	
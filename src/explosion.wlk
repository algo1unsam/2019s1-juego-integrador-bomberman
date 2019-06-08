import wollok.game.*

class Explosion{
	//ATRIBUTOS
	var property position
	
	var picture = "explosionCentral.png"
	
	var property apagada = false
	
	//WOLLOK
	method image() = picture 
	
	method cambiarImagen(nuevaImagen) { picture = nuevaImagen }
	
	//EXPLOSION
	method generar(posicionX,posiocionY){ 
		self.position(game.at(posicionX,posiocionY))
		game.addVisual(self) 
		self.configurarRemover()
		} //Genero la explocion y configuro el remove
		
	method configurarRemover() { game.onTick(2000, "remover", { self.remover()}) } //En cuanto tiempo quiero que se remueva la explosion
	
	method remover() { 
		//game.removeTickEvent("remover")
		//game.removeVisual(self)
		self.cambiarImagen("corn_adult.png")
		self.apagada(true)
	} //Cambio la imagen de la explocion por algo (ejemplo: Piso destruido) y digo que ya no sirve
	
	method accion(alguien) { if(not(apagada)) alguien.morir()} //se mueve si toca la explocion
}
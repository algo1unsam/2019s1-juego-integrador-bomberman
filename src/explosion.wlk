import wollok.game.*
import bloques.*

class Explosion{
	
	//PARA PARAR LA EXPLOCION
	var property encontroBloque = false
	
	//GENERO LA EXPLOCION
	method generar(radio,posicion){
		self.explocionDerecha(radio,posicion)
		self.explocionIzquierda(radio,posicion)
		self.explocionArriba(radio,posicion)
		self.explocionAbajo(radio,posicion)
	}
	
	//CREO LA EXPLOCION
	method explosionHorizontal(radio,posicion) {
		(posicion.x().. posicion.x()+radio).forEach { 
			n => if (not(self.encontroBloque()))
					new OndaExpansiva(position = game.at(n,posicion.y())).generar(self)
				}
		self.encontroBloque(false)
	}
	
		method explosionVertical(radio,posicion) {
		(posicion.y().. posicion.y()+radio).forEach { 
			n => if (not(self.encontroBloque()))
				new OndaExpansiva(position = game.at(posicion.x(),n)).generar(self)
		}
		self.encontroBloque(false)
	}
	
	method explocionDerecha(radio,posicion) { self.explosionHorizontal(radio,posicion) }
	
	method explocionIzquierda(radio,posicion) { self.explosionHorizontal(-radio,posicion)}
	
	method explocionArriba(radio,posicion) { self.explosionVertical(radio,posicion) }
	
	method explocionAbajo(radio,posicion) {self.explosionVertical(-radio,posicion)  }
}

//ONDA EXPANSIVA (FUEGO)
class OndaExpansiva{
	
	var property position
	
	var picture = "explosionCentral.png"
	
	//PARA CREAR LA CENIZA
	var property apagada = false
	
	method explotarObjeto(explosion) {}
	
	method image() = picture 
	
	method cambiarImagen(nuevaImagen) { picture = nuevaImagen }
	
	//GENERO LA ONDA
	method generar(explosion){ 
		game.addVisual(self)
		self.configurarRemover()
		self.explotarObjetos(explosion)
		if(explosion.encontroBloque()) game.removeVisual(self)
	}
		
	method configurarRemover() { game.onTick(2000, "remover", { self.remover()}) }
	
	method remover() { 
		self.cambiarImagen("corn_adult.png")
		self.apagada(true)
	}
	
	//EXPLOTO LOS OBJETOS QUE TOCA LA ONDA
	method explotarObjetos(explosion) { (self.objetosConLosQueColiciona()).forEach {
		elemento => elemento.explotarObjeto(explosion)
		} 
	}
	
	method objetosConLosQueColiciona() = game.colliders(self)
	
	//MUERE EL JUGADOR SI TOCA LA ONDA *estaria bueno hacer esto en .explotarObjeto()*
	method chocoJugador(alguien) { if(not(apagada)) alguien.morir()} 
	
	
}
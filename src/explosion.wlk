import wollok.game.*
import bloques.*
import players.*

class Explosion{
	
	//PARA PARAR LA EXPLOCION
	var property encontroBloqueIdestructible = false
	
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
			n => if (not(self.encontroBloqueIdestructible()))
					new OndaExpansiva(position = game.at(n,posicion.y())).generar(self)
				}
		self.encontroBloqueIdestructible(false)
	}
	
		method explosionVertical(radio,posicion) {
		(posicion.y().. posicion.y()+radio).forEach { 
			n => if (not(self.encontroBloqueIdestructible()))
				new OndaExpansiva(position = game.at(posicion.x(),n)).generar(self)
		}
		self.encontroBloqueIdestructible(false)
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
	
	method explotarObjeto(explosion,onda) {}
	
	method image() = picture 
	
	method cambiarImagen(nuevaImagen) { picture = nuevaImagen }
	
	//GENERO LA ONDA
	method generar(explosion){ 
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurarRemover()
		self.explotarObjetos(explosion,self)
		if(explosion.encontroBloqueIdestructible()) self.removerOnda()
	}
	
		
	method configurarRemover() { game.onTick(2000, "remover", { self.remover()}) }
	
	method remover() { 
		self.cambiarImagen("corn_adult.png")
		self.apagada(true)
	}
	
	method removerOnda() { game.removeVisual(self) }
	
	//EXPLOTO LOS OBJETOS QUE TOCA LA ONDA
	method explotarObjetos(explosion,onda) {
		 (self.objetosConLosQueColiciona()).forEach { elemento => elemento.explotarObjeto(explosion,onda) } 
	}
	
	method objetosConLosQueColiciona() = game.colliders(self)
	
	//MUERE EL JUGADOR SI TOCA LA ONDA *estaria bueno hacer esto en .explotarObjeto()*
	method chocoJugador(alguien) { if(not(apagada)) alguien.morir()} 
	
	
}
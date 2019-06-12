import wollok.game.*
import bloques.*
import players.*

class Explosion{
	
	//PARA PARAR LA EXPLOCION
	var property encontroBloqueIdestructible = false
	
	var property lado = central
	
	//GENERO LA EXPLOCION
	method generar(radio,posicion){
		self.explosionCentral(posicion)
		self.explosionDerecha(radio,posicion)
	 	self.explosionIzquierda(radio,posicion)
		self.explosionArriba(radio,posicion)
		self.explosionAbajo(radio,posicion)
		
	}
	
	//CREO LA EXPLOCION
	
	method explosionCentral(posicion) { new OndaExpansiva(position = posicion,imagen = (self.lado()).imagen(0,0)).generar(self) }
	
	method explosionHorizontal(radio,x,y) {
		(x.. x+radio).forEach { 
			n => if (not(self.encontroBloqueIdestructible()) )
				new OndaExpansiva(position = game.at(n,y),imagen = (self.lado()).imagen(n,x+radio)).generar(self)
		}
		self.encontroBloqueIdestructible(false)
	}

	method explosionVertical(radio,x,y) {
		(y.. y+radio).forEach { 
			n => if (not(self.encontroBloqueIdestructible()))
					new OndaExpansiva(position = game.at(x,n),imagen = (self.lado()).imagen(n,y+radio)).generar(self)
		}
		self.encontroBloqueIdestructible(false)
		
		
	}
	
	method explosionDerecha(radio,posicion) {self.lado(derecha) self.explosionHorizontal(radio-1,posicion.x()+1,posicion.y()) }
	
	method explosionIzquierda(radio,posicion) {self.lado(izquierda) self.explosionHorizontal(-radio+1,posicion.x()-1,posicion.y()) }
	
	method explosionArriba(radio,posicion) { self.lado(arriba) self.explosionVertical(radio-1,posicion.x(),posicion.y()+1) }
	
	method explosionAbajo(radio,posicion) {self.lado(abajo) self.explosionVertical(-radio+1,posicion.x(),posicion.y()-1) }
}

//ONDA EXPANSIVA (FUEGO)
class OndaExpansiva{
	
	var property position
	
	var property imagen 
	
	//PARA CREAR LA CENIZA
	var property apagada = false
	
	method explotarObjeto(explosion,onda) {}
	
	method image() = imagen
	
	//method cambiarImagen(nuevaImagen) { picture = nuevaImagen }
	
	//GENERO LA ONDA
	method generar(explosion){
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurarRemover()
		self.explotarObjetos(explosion,self)
		if(explosion.encontroBloqueIdestructible()) self.removerOnda()
	}
	
	//method generar2 {  }
	
	method configurarRemover() { game.onTick(1500, "remover", { self.remover()}) }
	
	method remover() { 
		self.imagen(ceniza.imagen())
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

object ceniza{
	method imagen() = "groundMap3Broken.png"
}

object central{
	method imagen(desde,hasta) ="explosionCentral.png"
}

object derecha{
	method imagen(desde,hasta) { 
		if(desde == hasta) return self.explosionEnd()
		else return self.explosionSide()
	}
	
	method explosionSide() = "explosionSideRight.png"
	
	method explosionEnd() = "explosionEndRight.png"
}

object izquierda{
	method imagen(desde,hasta) { 
		if(desde == hasta) return self.explosionEnd()
		else return self.explosionSide()
	}
	
	method explosionSide() = "explosionSideLeft.png"
	
	method explosionEnd() = "explosionEndLeft.png"
}

object arriba{
	method imagen(desde,hasta) { 
		if(desde == hasta) return self.explosionEnd()
		else return self.explosionSide()
	}
	
	method explosionSide() = "explosionSideUp.png"
	
	method explosionEnd() = "explosionEndUp.png"
	
}
object abajo{
	method imagen(desde,hasta) { 
		if(desde == hasta) return self.explosionEnd()
		else return self.explosionSide()
	}
	
	method explosionSide() = "explosionSideDown.png"
	
	method explosionEnd() = "explosionEndDown.png"
	
}
}
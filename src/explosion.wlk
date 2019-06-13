import wollok.game.*
import bloques.*
import players.*
import direcciones.*

class Explosion{
	
	//PARA PARAR LA EXPLOCION
	var property encontroBloqueIdestructible = false
	
	var property direccion = central
	
	//GENERO LA EXPLOCION
	method generar(radio,posicion){
		self.explosionCentral(posicion)
		self.explosionDerecha(radio,posicion)
	 	self.explosionIzquierda(radio,posicion)
		self.explosionArriba(radio,posicion)
		self.explosionAbajo(radio,posicion)
	}
	
	//CREO LA EXPLOCION
	
	method explosionCentral(posicion) { 
		new OndaExpansiva(position = posicion,imagen = (self.direccion()).imagenExplosionCentral()).generar(self)
	}
	
	method explosionHorizontal(signo,radio,x,y) {
		(x+signo.. (x+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloqueIdestructible()) )
				new OndaExpansiva(position = game.at(n,y),imagen = (self.direccion()).imagenExplosionSide()).generar(self)
		}
		self.crearFinDeExplosion((x+(signo*radio)),y)
		self.encontroBloqueIdestructible(false)
	}

	method explosionVertical(signo,radio,x,y) {
		(y+signo.. (y+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloqueIdestructible()))
					new OndaExpansiva(position = game.at(x,n),imagen = (self.direccion()).imagenExplosionSide()).generar(self)
		}
		self.crearFinDeExplosion(x,y+(signo*radio))
		self.encontroBloqueIdestructible(false)
	}
	
	method crearFinDeExplosion(x,y) { 
		if(not(self.encontroBloqueIdestructible()))new OndaExpansiva(position = game.at(x,y),imagen = (self.direccion()).imagenExplosionEnd()).generar(self)
	} 
	
	method explosionDerecha(radio,posicion) {self.direccion(derecha) self.explosionHorizontal(1,radio,posicion.x(),posicion.y()) }
	
	method explosionIzquierda(radio,posicion) {self.direccion(izquierda) self.explosionHorizontal(-1,radio,posicion.x(),posicion.y()) }
	
	method explosionArriba(radio,posicion) { self.direccion(arriba) self.explosionVertical(1,radio,posicion.x(),posicion.y()) }
	
	method explosionAbajo(radio,posicion) {self.direccion(abajo) self.explosionVertical(-1,radio,posicion.x(),posicion.y()) }
}

//ONDA EXPANSIVA (FUEGO)
class OndaExpansiva{
	
	var property position
	
	var property imagen
	
	//PARA CREAR LA CENIZA
	var property apagada = false
	
	method explotarObjeto(explosion,onda) {}
	
	method image() = imagen
	
	method esDuro() = false
	
	//GENERO LA ONDA
	method generar(explosion){
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurarRemover()
		self.explotarObjetos(explosion,self)
		if(explosion.encontroBloqueIdestructible()) self.removerOnda()
	}
	
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



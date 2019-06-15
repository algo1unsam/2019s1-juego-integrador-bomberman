import wollok.game.*
import bloques.*
import players.*
import direcciones.*

class Explosion{
	
	//PARA PARAR LA EXPLOCION
	var property encontroBloqueIdestructible = false
	
	var property direccion = central
	
	//GENERO LA EXPLOCION
	method generar(radio,posicion,tipo){
		self.explosionCentral(posicion,tipo)
		self.explosionDerecha(radio,posicion,tipo)
	 	self.explosionIzquierda(radio,posicion,tipo)
		self.explosionArriba(radio,posicion,tipo)
		self.explosionAbajo(radio,posicion,tipo)
	}
	
	//CREO LA EXPLOCION
	method explosionCentral(posicion,tipo) { tipo.crearCentro(posicion,self) }
	
	method explosionHorizontal(signo,radio,x,y,tipo) {
		(x+signo.. (x+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloqueIdestructible()) )
				tipo.crearLados(n,y,self)
		}
		self.crearFinDeExplosion((x+(signo*radio)),y,tipo)
		self.encontroBloqueIdestructible(false)
	}

	method explosionVertical(signo,radio,x,y,tipo) {
		(y+signo.. (y+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloqueIdestructible()))
					tipo.crearLados(x,n,self)
		}
		self.crearFinDeExplosion(x,y+(signo*radio),tipo)
		self.encontroBloqueIdestructible(false)
	}
	
	method crearFinDeExplosion(x,y,tipo) { 
		if(not(self.encontroBloqueIdestructible())) tipo.crearFin(x,y,self)
	} 
	
	method explosionDerecha(radio,posicion,tipo) {self.direccion(derecha) self.explosionHorizontal(1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionIzquierda(radio,posicion,tipo) {self.direccion(izquierda) self.explosionHorizontal(-1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionArriba(radio,posicion,tipo) { self.direccion(arriba) self.explosionVertical(1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionAbajo(radio,posicion,tipo) {self.direccion(abajo) self.explosionVertical(-1,radio,posicion.x(),posicion.y(),tipo) }
}

//ONDA EXPANSIVA (FUEGO)

object fuego{
	method crearCentro(nuevaPosicion,explosion) {
		new Fuego(position = nuevaPosicion,imagen = central.imagenExplosionCentralFuego()).generar(explosion)
	}
	method crearLados(x,y,explosion) {
		new Fuego(position = game.at(x,y),imagen = (explosion.direccion()).imagenExplosionSideFuego()).generar(explosion)
	}
	method crearFin(x,y,explosion) {
		new Fuego(position = game.at(x,y),imagen = (explosion.direccion()).imagenExplosionEndFuego()).generar(explosion)
	}
}

object sticky{
	method crearCentro(nuevaPosicion,explosion) {
		new Sticky(position = nuevaPosicion,imagen = central.imagenExplosionCentralSticky()).generar(explosion)
	}
	method crearLados(x,y,explosion) {
		new Sticky(position = game.at(x,y),imagen = (explosion.direccion()).imagenExplosionSideSticky()).generar(explosion)
	}
	method crearFin(x,y,explosion) {
		new Sticky(position = game.at(x,y),imagen = (explosion.direccion()).imagenExplosionEndSticky()).generar(explosion)
	}
}

class OndaExpansiva{
	
	var cant = 0
	
	var property position
	
	var property imagen
	
	var property apagada = false
	
	method image() = imagen
	
	method esDuro() = false
	
	method explotarObjeto(explosion,onda) { }
	
	method accionAlExplotar(explosion)
	
	method generar(explosion){
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.configurarRemover()
		self.accionAlExplotar(explosion)
		if(explosion.encontroBloqueIdestructible()) self.removerOnda()
	}
	
	method configurarRemover() { }
	
	method objetosConLosQueColiciona() = game.colliders(self)
	
	method removerOnda() { game.removeVisual(self) }
}

class Fuego inherits OndaExpansiva{
	
	override method accionAlExplotar(explosion) {
		 (self.objetosConLosQueColiciona()).forEach {
		 	elemento => elemento.explotarObjeto(explosion,self)
		 } 
	}

	override method configurarRemover() { 
		cant += 1
		var nombre = "remover" + cant
		console.println(nombre)
		game.onTick(1500, nombre, { self.remover(nombre)})
	}

	method remover(nombre) {
		self.imagen(ceniza.imagen())
		self.apagada(true)
		game.removeTickEvent(nombre)
		console.println(nombre)
	}
	
	

	method chocoJugador(alguien) { if(not(apagada)) alguien.morir()} 
}

class Sticky inherits OndaExpansiva{
	
	override method accionAlExplotar(explosion) {  }
	
	override method configurarRemover() { 
		self.imagen(moco.imagen())
		self.apagada(true) 
		}
	
	method remover() {
		self.imagen(moco.imagen())
		self.apagada(true)
	}
	//MUERE EL JUGADOR SI TOCA LA ONDA *estaria bueno hacer esto en .explotarObjeto()*
	method chocoJugador(alguien) { alguien.reductor(300) }
}

object ceniza{
	method imagen() = "groundMap1Broken.png"
}

object moco {
	method imagen() = "slime.png"
}
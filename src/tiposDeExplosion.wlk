import wollok.game.*
import players.*
import direcciones.*
import scheduler.*
import restosDeExplosion.*

//CONSTRUCTORES
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

//TIPOS DE EXPLOSION
class OndaExpansiva{

	var property position
	
	var property imagen
	
	method image() = imagen
	
	method esDuro() = false
	
	method explotarObjeto(explosion,onda) { }
	
	method accionAlExplotar(explosion)
	
	method generar(explosion){
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.accionAlExplotar(explosion)
		self.configurarRemover()
	}
	
	method configurarRemover() { }
	
	method objetosConLosQueColiciona() = game.colliders(self)
	
	method removerOnda() { game.removeVisual(self) }
}

//TIPOS
class Fuego inherits OndaExpansiva{
	
	override method accionAlExplotar(explosion) {
		(self.objetosConLosQueColiciona()).forEach {
			elemento => elemento.explotarObjeto(explosion,self)
		} 
	}

	override method configurarRemover() { scheduler.schedule(2000,{ self.remover() }) }

	method remover() {
		game.removeVisual(self)
		(constructorDeCeniza.construir(self.position())).generar()
	}
	
	method chocoJugador(jugador) { jugador.morir()} 
}

class Sticky inherits OndaExpansiva{
	
	override method accionAlExplotar(explosion) {  }
	
	method chocoJugador(jugador) { jugador.reductor(300) }
}

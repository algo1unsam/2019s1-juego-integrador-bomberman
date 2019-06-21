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
	
	method mancharObjeto(explosion,onda) { }
	
	method accionAlExplotar(explosion)
	
	method generar(explosion){
		game.addVisual(self)
		player1.refresh()
		player2.refresh()
		self.accionAlExplotar(explosion)
	}
	
	method objetosConLosQueColiciona() = game.colliders(self)
	
	method remover() { game.removeVisual(self)
	}
}

//TIPOS

//EXLOSION DE FUEGO
class Fuego inherits OndaExpansiva{
	
	var property tiempoDeExplosion = 1000
	
	override method generar(explosion) {
		super(explosion)
		if(not(explosion.encontroBloque())) self.removerYconfigurar()
	}
	
	override method accionAlExplotar(explosion) {
		(self.objetosConLosQueColiciona()).forEach {
			elemento => elemento.explotarObjeto(explosion,self)
		} 
	}
	
	method removerYconfigurar() {
		 scheduler.schedule(tiempoDeExplosion,{
		 	self.remover()
		 })
	}

	method chocoJugador(jugador) { jugador.morir() } 
}

//EXPLOSION STICKY
class Sticky inherits OndaExpansiva{
	
	override method accionAlExplotar(explosion) {
		(self.objetosConLosQueColiciona()).forEach {
			elemento => elemento.mancharObjeto(explosion,self)
		} 
	}
	
	override method explotarObjeto(explosion,onda) { self.remover() }
	
	method chocoJugador(jugador) { 
		if(not(jugador.botas())) 
	jugador.activarReductor(300)
	}
}

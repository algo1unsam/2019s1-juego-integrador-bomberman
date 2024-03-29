import wollok.game.*
import powerUps.*
import scheduler.*
import tiposDeExplosion.*
import restosDeExplosion.*
import mapa.*

//CONSTRUCTOR DE BLOQUES
object bloqueIndestructible { 
	method construir(newPosition) = new BloqueIndestructible(position = newPosition)
} 

object bloqueDestructible { 
	method construir(newPosition) = new BloqueDestructible(position = newPosition)
}

object bloqueDestruido { 
	method construir(newPosition) = new BloqueDestruido(position = newPosition)
} 

//TIPOS DE BLOQUE
class Bloque {
	var property position

	method generar() { game.addVisual(self) }
}

//BLOQUE INDESTRUCCTIBLE
class BloqueIndestructible inherits Bloque {
	
	method esDuro() = true
	
	method image() = "blockMapUnbreakable" +   mapa.numero() + ".png"
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	//SI EXPLOTA
	method explotarObjeto(explosion,onda) { 
		explosion.encontroBloque(true)
		onda.remover()
	}
	
	//SI SE MANCHA
	method mancharObjeto(explosion,sticky) {
		explosion.encontroBloque(true) 
		sticky.remover()
	}
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	

	var property probabilidadDePowerUp = 15

	
	method esDuro() = true
	
	method image() = "blockMapBreakable" +  mapa.numero() + ".png"
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { 
		explosion.encontroBloque(true)
		onda.imagen((explosion.direccion()).imagenExplosionEndFuego())
		game.removeVisual(self)
		self.destruirBloque(onda)
	}
	
	method cambiarFuego(onda,explosion){
		fuego.crearFin((onda.position()).x(),(onda.position()).y(),explosion)
	}
	
	method mancharObjeto(explosion,sticky) { 
		explosion.encontroBloque(true) 
		sticky.remover()
	}
	
	method destruirBloque(onda) {
		scheduler.schedule(onda.tiempoDeExplosion()+50, {
			onda.remover()
			if(self.ponerPowerUp())(powerUPsRandom.obtener()).construir(self.position()).generar()
		})
	}

	method random() = 0.randomUpTo(100).roundUp()
	
	method ponerPowerUp() = self.random() <= self.probabilidadDePowerUp()
}

class BloqueDestruido inherits Bloque {
	
	method esDuro() = false
	
	method image() = "groundMap1Broken.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) {  }
	
	method destruirBloque() {  }
}


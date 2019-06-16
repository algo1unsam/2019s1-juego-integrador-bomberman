import wollok.game.*
import powerUps.*
import scheduler.*
import tiposDeExplosion.*
import restosDeExplosion.*

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
	
	var property imagen = "blockMap1Unbreakable.png"
	
	method esDuro() = true
	
	method image() = imagen
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	//SI EXPLOTA
	method explotarObjeto(explosion,onda) { 
		explosion.encontroBloque(true)
		onda.remover()
	}
	
	//SI SE MANCHA
	method mancharObjeto(explosion,sticky) {
		explosion.encontroBloque(true) 
		self.imagen("blockMap1UnbreakableSticky.png")
		sticky.remover()
	}
}

//BLOQUE DESTRUCCTIBLE
class BloqueDestructible inherits Bloque {
	
	var property probabilidadDePowerUp = 10
	
	var property imagen = "blockMap1Breakable.png"
	
	method esDuro() = true
	
	method image() = imagen
	
//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) { 
		explosion.encontroBloque(true)
		onda.imagen((explosion.direccion()).imagenExplosionEndFuego())
		self.destruirBloque(onda)
	}
	
	method cambiarFuego(onda,explosion){
		fuego.crearFin((onda.position()).x(),(onda.position()).y(),explosion)
	}
	
	method mancharObjeto(explosion,sticky) { 
		explosion.encontroBloque(true)
		sticky.imagen((explosion.direccion()).imagenExplosionEndSticky())
	}
	
	method destruirBloque(onda) {
		scheduler.schedule(onda.tiempoDeExplosion()+50, {
			onda.remover()
			(constructorDeCeniza.construir(onda.position())).generar()
			if(self.ponerPowerUp())(powerUPsRandom.obtener()).construir(self.position()).generar()
			game.removeVisual(self)
		})
	}

	method random() = 0.randomUpTo(10).roundUp()
	
	method ponerPowerUp() = self.random() <= self.probabilidadDePowerUp()
}

class BloqueDestruido inherits Bloque {
	
	method esDuro() = false
	
	method image() = "groundMap1Broken.png"
	
	//ACCIONES QUE SUCEDE CUANDO LA EXPLOCION ALCANZA ESTE BLOQUE
	method explotarObjeto(explosion,onda) {  }
	
	method destruirBloque() {  }
}


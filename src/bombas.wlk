import wollok.game.*
import explosion.*

//CONSTRUCTORES DE BOMBAS
object constructorDeBombaNormal {
	method generar(posicion) { new BombaNormal().generar(posicion)}
}

object constructorDeBombaFuerte {

}

//CLASE BOMBA
class Bomba{
	var property position
	
	method accion(algo) { }
	
	method generar(lugar) {
		self.position(lugar)
		game.addVisual(self)
		self.configurar()
	}
	
	method configurar(){
		game.onTick(2000, "explotar", { self.explotar() game.removeTickEvent("explotar")
		})}
		
	method explotar()
}

class BombaNormal inherits Bomba{
	method image() = "bomb01.png"
	
	override method explotar(){ 
		new Explosion().generar(self.position().x(),self.position().y())
		new Explosion().generar(self.position().x()-1,self.position().y())
		new Explosion().generar(self.position().x()-2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()-1)
		new Explosion().generar(self.position().x(),self.position().y()-2)
		new Explosion().generar(self.position().x()+1,self.position().y())
		new Explosion().generar(self.position().x()+2,self.position().y())
		new Explosion().generar(self.position().x(),self.position().y()+1)
		new Explosion().generar(self.position().x(),self.position().y()+2)
		game.removeVisual(self)
	}
	
}

class BombaFuerte inherits Bomba {
	
}
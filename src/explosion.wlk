import wollok.game.*
import bloques.*
import players.*
import direcciones.*
import scheduler.*

class Explosion{
	
	var property terminoExplosion = false
	
	var property direccion = central
	
//GENERO LA EXPLOCION
	var property encontroBloque = false

	method generar(radio,posicion,tipo){
		self.explosionCentral(posicion,tipo)
		self.explosionDerecha(radio,posicion,tipo)
	 	self.explosionIzquierda(radio,posicion,tipo)
		self.explosionArriba(radio,posicion,tipo)
		self.explosionAbajo(radio,posicion,tipo)
	}
	
//GENERO LOS LADOS Y ASIGNO EL TIPO
	method explosionCentral(posicion,tipo) { tipo.crearCentro(posicion,self) }
	
	method explosionDerecha(radio,posicion,tipo) {self.direccion(derecha) self.explosionHorizontal(1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionIzquierda(radio,posicion,tipo) {self.direccion(izquierda) self.explosionHorizontal(-1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionArriba(radio,posicion,tipo) { self.direccion(arriba) self.explosionVertical(1,radio,posicion.x(),posicion.y(),tipo) }
	
	method explosionAbajo(radio,posicion,tipo) {self.direccion(abajo) self.explosionVertical(-1,radio,posicion.x(),posicion.y(),tipo) }
	
	method crearFinDeExplosion(x,y,tipo) { if(not(self.encontroBloque())) tipo.crearFin(x,y,self) } 
	
//CREO LA EXPLOCION
	
	//HORIZONTAL
	method explosionHorizontal(signo,radio,x,y,tipo) {
		(x+signo.. (x+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloque()) )
				tipo.crearLados(n,y,self)
		}
		self.crearFinDeExplosion((x+(signo*radio)),y,tipo)
		self.encontroBloque(false)
	}

	//VERTICAL
	method explosionVertical(signo,radio,x,y,tipo) {
		(y+signo.. (y+(signo*radio))-signo).forEach { 
			n => if (not(self.encontroBloque()))
					tipo.crearLados(x,n,self)
		}
		self.crearFinDeExplosion(x,y+(signo*radio),tipo)
		self.encontroBloque(false)
	}
	
}
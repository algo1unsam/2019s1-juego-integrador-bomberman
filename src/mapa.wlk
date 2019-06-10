import wollok.game.*
import bloques.*
import powerUps.*

class Mapa {
	
	var elementos = []
	
	//GENERO TODOS LOS ELEMENTOS DE LA LISTA
	method crear() { elementos.forEach{ elemento => elemento.generar() } }
	
	//ANIADO ELEMENTOS A LA LSITA
	method aniadirElemento(tipo,x,y) { elementos.add(self.construirElemento(tipo,x,y)) }
	
	//CONSTRUYO ELEMENTOS
	method construirElemento(tipo,x,y) = tipo.construir(game.at(x,y))
	
	//CREO LINEAS HORIZONTALES
	method aniadirLineaHorizontal(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,n,enDonde) } 
	}
	
	//CREO LINEAS VERTICALES
	method aniadirLineaVertical(tipoDeBloque,enDonde,desde,hasta) {
		(desde .. hasta).forEach{ n => self.aniadirElemento(tipoDeBloque,enDonde,n) } 
	}
}

object mapa1 inherits Mapa{
	
	method construir() {
		//Para crear lineas! (en donde, inicio, fin)
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 19)
		self.aniadirLineaHorizontal(bloqueIndestructible, 13, 0, 19)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 13)
		self.aniadirLineaVertical(bloqueIndestructible, 19, 0, 13)
		
		//Se puede aniadirElementos, (tipo,x,y) los elementos pueden ser power ups o bloques
		self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		self.aniadirElemento(bloqueIndestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		self.aniadirElemento(bloqueDestructible, (0.randomUpTo(18)).roundUp(), (0.randomUpTo(13)).roundUp())
		
		
		self.aniadirElemento(powerUpBombaFuerte, 5, 6)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 10)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		
		
	}
	
	method generar(){
		self.construir()
		self.crear()
	}
	
}
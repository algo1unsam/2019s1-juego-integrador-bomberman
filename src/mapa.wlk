import wollok.game.*
import bloques.*
import powerUps.*
import players.*

class Mapa {
	var elementos = []
	
	method generar(){
		self.construir()
		self.crear()
		player1.generar()
		player2.generar()
	}
	
	method construir() 
	
	//GENERO TODOS LOS ELEMENTOS DE LA LISTA
	method crear() { elementos.forEach{ elemento => elemento.generar() } }
	
	method remover() { elementos.forEach{ elemento => elemento.remover() } }
	
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
	
	//CREDO GRILLA
	method aniadirGrilla(tipoDeBloque) {
		(2 .. game.width()-2).forEach{ 
			i => (2 .. game.height()-2).forEach{ 
				j => if( j%2==0 && i%2==0 )self.aniadirElemento(tipoDeBloque,i,j) 
			}
		} 
	}
}

object mapa1 inherits Mapa{
	
	override method construir() {
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo grilla
		self.aniadirGrilla(bloqueIndestructible)
		
		//Aniado elementos
		self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 9)
	}
}

object mapa2 inherits Mapa{
	
	override method construir() {
		//Para crear lineas! (en donde, inicio, fin)
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		//self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		self.aniadirElemento(powerUpBombaFuerte, 5, 7)
		self.aniadirElemento(powerUpAumentarVelocidad, 7, 11)
		self.aniadirElemento(powerUpEscudo, 11, 7)
		self.aniadirElemento(powerUpMasBombas, 13, 1)
		self.aniadirElemento(powerUpMasBombas, 13, 3)
		self.aniadirElemento(powerUpMasBombas, 11, 5)
		self.aniadirElemento(powerUpMasBombas, 11, 7)
		
		//Esto hace el grid del mapa 1. A lo mejor se puede acortar.
		self.aniadirElemento(bloqueIndestructible, 2,2)
		self.aniadirElemento(bloqueIndestructible, 2, 4)
		self.aniadirElemento(bloqueIndestructible, 2, 6)
		self.aniadirElemento(bloqueIndestructible, 2, 8)
	}
}
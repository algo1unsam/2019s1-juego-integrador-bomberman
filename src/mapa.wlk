import wollok.game.*
import bloques.*
import powerUps.*
import players.*
import HUD.*
import menu.*

class Mapa {
	var elementos = []
	
	var position = game.at(0, 0)
	
	method image() = "backgroundmap" + mapa.numero() + ".png"
	
	method generar(){
		elementos.clear()
		game.clear()
		self.construir()
		game.addVisual(self)
		self.crear()
		
		player1.generar()
		player2.generar()
		
		(new HudJugador()).generar(player1,0)
		(new HudJugador()).generar(player2,6)
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
		(2 .. game.width()-6).forEach{ 
			i => (2 .. game.height()-2).forEach{ 
				j => if( j%2==0 && i%2==0 )self.aniadirElemento(tipoDeBloque,i,j) 
			}
		} 
	}
}


//MAPAS

//OBJETO PARA CAMBIAR LOS ASSETS SEGUEN EL MAPA
object mapa { 
	var property cargado
	var property numero 
	
	method set(nuevoMapa,nuevoNumero){
		cargado = nuevoMapa
		numero = nuevoNumero
	}
}

//MAPA 1

object mapa1 inherits Mapa{

	override method construir() {
		mapa.set(self,1)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		

		//Creo grilla
		self.aniadirGrilla(bloqueIndestructible)

		//Creo destructibles
	 	self.aniadirLineaHorizontal(bloqueDestructible, 1, 3, 9)
		self.aniadirLineaHorizontal(bloqueDestructible, 1, 11, 17)
		self.aniadirLineaHorizontal(bloqueDestructible, 3, 1, 6)
		self.aniadirLineaHorizontal(bloqueDestructible, 3, 8, 12)
		self.aniadirLineaHorizontal(bloqueDestructible, 3, 14, 19)
		self.aniadirLineaHorizontal(bloqueDestructible, 5, 1, 8)
		self.aniadirLineaHorizontal(bloqueDestructible, 5, 12, 19)
		self.aniadirLineaHorizontal(bloqueDestructible, 7, 1, 8)
		self.aniadirLineaHorizontal(bloqueDestructible, 7, 12, 19)
		self.aniadirLineaHorizontal(bloqueDestructible, 9, 1, 6)
		self.aniadirLineaHorizontal(bloqueDestructible, 9, 8, 12)
		self.aniadirLineaHorizontal(bloqueDestructible, 9, 14, 19)
		self.aniadirLineaHorizontal(bloqueDestructible, 11, 3, 9)
		self.aniadirLineaHorizontal(bloqueDestructible, 11, 11, 17)
		
		self.aniadirElemento(bloqueDestructible, 3, 2)
		self.aniadirElemento(bloqueDestructible, 5, 2)
		self.aniadirElemento(bloqueDestructible, 7, 2)
		self.aniadirElemento(bloqueDestructible, 9, 2)
		self.aniadirElemento(bloqueDestructible, 11, 2)
		self.aniadirElemento(bloqueDestructible, 13, 2)
		self.aniadirElemento(bloqueDestructible, 15, 2)
		self.aniadirElemento(bloqueDestructible, 17, 2)
		self.aniadirElemento(bloqueDestructible, 1, 4)
		self.aniadirElemento(bloqueDestructible, 3, 4)
		self.aniadirElemento(bloqueDestructible, 5, 4)
		self.aniadirElemento(bloqueDestructible, 7, 4)
		self.aniadirElemento(bloqueDestructible, 9, 4)
		self.aniadirElemento(bloqueDestructible, 11, 4)
		self.aniadirElemento(bloqueDestructible, 13, 4)
		self.aniadirElemento(bloqueDestructible, 15, 4)
		self.aniadirElemento(bloqueDestructible, 17, 4)
		self.aniadirElemento(bloqueDestructible, 19, 4)
		self.aniadirElemento(bloqueDestructible, 3, 6)
		self.aniadirElemento(bloqueDestructible, 7, 6)
		self.aniadirElemento(bloqueDestructible, 13, 6)
		self.aniadirElemento(bloqueDestructible, 17, 6)
		self.aniadirElemento(bloqueDestructible, 1, 8)
		self.aniadirElemento(bloqueDestructible, 3, 8)
		self.aniadirElemento(bloqueDestructible, 5, 8)
		self.aniadirElemento(bloqueDestructible, 7, 8)
		self.aniadirElemento(bloqueDestructible, 9, 8)
		self.aniadirElemento(bloqueDestructible, 11, 8)
		self.aniadirElemento(bloqueDestructible, 13, 8)
		self.aniadirElemento(bloqueDestructible, 15, 8)
		self.aniadirElemento(bloqueDestructible, 17, 8)
		self.aniadirElemento(bloqueDestructible, 19, 8)
		self.aniadirElemento(bloqueDestructible, 3, 10)
		self.aniadirElemento(bloqueDestructible, 5, 10)
		self.aniadirElemento(bloqueDestructible, 7, 10)
		self.aniadirElemento(bloqueDestructible, 9, 10)
		self.aniadirElemento(bloqueDestructible, 11, 10)
		self.aniadirElemento(bloqueDestructible, 13, 10)
		self.aniadirElemento(bloqueDestructible, 15, 10)
		self.aniadirElemento(bloqueDestructible, 17, 10)
	}
}


//MAPA 2
object mapa2 inherits Mapa{
	
	override method construir() {
		mapa.set(self,2)
		self.aniadirGrilla(bloqueDestructible)
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		/* 
		//Creo indestructibles
		self.aniadirElemento(bloqueIndestructible, 2, 2)
		self.aniadirElemento(bloqueIndestructible, 3, 2)
		self.aniadirElemento(bloqueIndestructible, 5, 2)
		self.aniadirElemento(bloqueIndestructible, 7, 2)
		self.aniadirElemento(bloqueIndestructible, 9, 2)
		self.aniadirElemento(bloqueIndestructible, 11, 2)
		self.aniadirElemento(bloqueIndestructible, 13, 2)
		self.aniadirElemento(bloqueIndestructible, 17, 2)
		self.aniadirElemento(bloqueIndestructible, 18, 2)
		self.aniadirElemento(bloqueIndestructible, 2, 3)
		self.aniadirElemento(bloqueIndestructible, 18, 3)
		self.aniadirElemento(bloqueIndestructible, 5, 4)
		self.aniadirElemento(bloqueIndestructible, 7, 4)
		self.aniadirElemento(bloqueIndestructible, 8, 4)
		self.aniadirElemento(bloqueIndestructible, 9, 4)
		self.aniadirElemento(bloqueIndestructible, 11, 4)
		self.aniadirElemento(bloqueIndestructible, 12, 4)
		self.aniadirElemento(bloqueIndestructible, 13, 4)
		self.aniadirElemento(bloqueIndestructible, 15, 4)
		self.aniadirElemento(bloqueIndestructible, 2, 5)
		self.aniadirElemento(bloqueIndestructible, 3, 5)
		self.aniadirElemento(bloqueIndestructible, 7, 5)
		self.aniadirElemento(bloqueIndestructible, 13, 5)
		self.aniadirElemento(bloqueIndestructible, 17, 5)
		self.aniadirElemento(bloqueIndestructible, 18, 5)
		self.aniadirElemento(bloqueIndestructible, 5, 6)
		self.aniadirElemento(bloqueIndestructible, 9, 6)
		self.aniadirElemento(bloqueIndestructible, 11, 6)
		self.aniadirElemento(bloqueIndestructible, 15, 6)
		self.aniadirElemento(bloqueIndestructible, 2, 7)
		self.aniadirElemento(bloqueIndestructible, 3, 7)
		self.aniadirElemento(bloqueIndestructible, 7, 7)
		self.aniadirElemento(bloqueIndestructible, 13, 7)
		self.aniadirElemento(bloqueIndestructible, 17, 7)
		self.aniadirElemento(bloqueIndestructible, 18, 7)
		self.aniadirElemento(bloqueIndestructible, 5, 8)
		self.aniadirElemento(bloqueIndestructible, 7, 8)
		self.aniadirElemento(bloqueIndestructible, 8, 8)
		self.aniadirElemento(bloqueIndestructible, 9, 8)
		self.aniadirElemento(bloqueIndestructible, 11, 8)
		self.aniadirElemento(bloqueIndestructible, 12, 8)
		self.aniadirElemento(bloqueIndestructible, 13, 8)
		self.aniadirElemento(bloqueIndestructible, 15, 8)
		self.aniadirElemento(bloqueIndestructible, 2, 9)
		self.aniadirElemento(bloqueIndestructible, 18, 9)
		self.aniadirElemento(bloqueIndestructible, 2, 10)
		self.aniadirElemento(bloqueIndestructible, 3, 10)
		self.aniadirElemento(bloqueIndestructible, 5, 10)
		self.aniadirElemento(bloqueIndestructible, 7, 10)
		self.aniadirElemento(bloqueIndestructible, 9, 10)
		self.aniadirElemento(bloqueIndestructible, 11, 10)
		self.aniadirElemento(bloqueIndestructible, 13, 10)
		self.aniadirElemento(bloqueIndestructible, 17, 10)
		self.aniadirElemento(bloqueIndestructible, 18, 10)
		
		//creo destructibles
		self.aniadirLineaHorizontal(bloqueDestructible, 1, 3, 17)
		self.aniadirElemento(bloqueDestructible, 4, 2)
		self.aniadirElemento(bloqueDestructible, 6, 2)
		self.aniadirElemento(bloqueDestructible, 8, 2)
		self.aniadirElemento(bloqueDestructible, 10, 2)
		self.aniadirElemento(bloqueDestructible, 12, 2)
		self.aniadirElemento(bloqueDestructible, 14, 2)
		self.aniadirElemento(bloqueDestructible, 16, 2)
		
		self.aniadirElemento(bloqueDestructible, 1, 3)
		self.aniadirElemento(bloqueDestructible, 4, 3)
		self.aniadirElemento(bloqueDestructible, 6, 3)
		self.aniadirElemento(bloqueDestructible, 8, 3)
		self.aniadirElemento(bloqueDestructible, 10, 3)
		self.aniadirElemento(bloqueDestructible, 12, 3)
		self.aniadirElemento(bloqueDestructible, 14, 3)
		self.aniadirElemento(bloqueDestructible, 16, 3)
		self.aniadirElemento(bloqueDestructible, 19, 3)
		
		self.aniadirElemento(bloqueDestructible, 1, 4)
		self.aniadirElemento(bloqueDestructible, 2, 4)
		self.aniadirElemento(bloqueDestructible, 3, 4)
		self.aniadirElemento(bloqueDestructible, 4, 4)
		self.aniadirElemento(bloqueDestructible, 6, 4)
		self.aniadirElemento(bloqueDestructible, 10, 4)
		self.aniadirElemento(bloqueDestructible, 14, 4)
		self.aniadirElemento(bloqueDestructible, 16, 4)
		self.aniadirElemento(bloqueDestructible, 17, 4)
		self.aniadirElemento(bloqueDestructible, 18, 4)
		self.aniadirElemento(bloqueDestructible, 19, 4)
		
		self.aniadirElemento(bloqueDestructible, 1, 5)
		self.aniadirElemento(bloqueDestructible, 4, 5)
		self.aniadirElemento(bloqueDestructible, 6, 5)
		self.aniadirElemento(bloqueDestructible, 14, 5)
		self.aniadirElemento(bloqueDestructible, 16, 5)
		self.aniadirElemento(bloqueDestructible, 19, 5)
		
		self.aniadirElemento(bloqueDestructible, 1, 6)
		self.aniadirElemento(bloqueDestructible, 2, 6)
		self.aniadirElemento(bloqueDestructible, 3, 6)
		self.aniadirElemento(bloqueDestructible, 4, 6)
		self.aniadirElemento(bloqueDestructible, 6, 6)
		self.aniadirElemento(bloqueDestructible, 7, 6)
		self.aniadirElemento(bloqueDestructible, 13, 6)
		self.aniadirElemento(bloqueDestructible, 14, 6)
		self.aniadirElemento(bloqueDestructible, 16, 6)
		self.aniadirElemento(bloqueDestructible, 17, 6)
		self.aniadirElemento(bloqueDestructible, 18, 6)
		self.aniadirElemento(bloqueDestructible, 19, 6)
		
		self.aniadirElemento(bloqueDestructible, 1, 7)
		self.aniadirElemento(bloqueDestructible, 4, 7)
		self.aniadirElemento(bloqueDestructible, 6, 7)
		self.aniadirElemento(bloqueDestructible, 14, 7)
		self.aniadirElemento(bloqueDestructible, 16, 7)
		self.aniadirElemento(bloqueDestructible, 19, 7)
		
		self.aniadirElemento(bloqueDestructible, 1, 8)
		self.aniadirElemento(bloqueDestructible, 2, 8)
		self.aniadirElemento(bloqueDestructible, 3, 8)
		self.aniadirElemento(bloqueDestructible, 4, 8)
		self.aniadirElemento(bloqueDestructible, 6, 8)
		self.aniadirElemento(bloqueDestructible, 10, 8)
		self.aniadirElemento(bloqueDestructible, 14, 8)
		self.aniadirElemento(bloqueDestructible, 16, 8)
		self.aniadirElemento(bloqueDestructible, 17, 8)
		self.aniadirElemento(bloqueDestructible, 18, 8)
		self.aniadirElemento(bloqueDestructible, 19, 8)
		
		self.aniadirElemento(bloqueDestructible, 1, 9)
		self.aniadirElemento(bloqueDestructible, 4, 9)
		self.aniadirElemento(bloqueDestructible, 6, 9)
		self.aniadirElemento(bloqueDestructible, 8, 9)
		self.aniadirElemento(bloqueDestructible, 10, 9)
		self.aniadirElemento(bloqueDestructible, 12, 9)
		self.aniadirElemento(bloqueDestructible, 14, 9)
		self.aniadirElemento(bloqueDestructible, 16, 9)
		self.aniadirElemento(bloqueDestructible, 19, 9)
		
		self.aniadirElemento(bloqueDestructible, 4, 10)
		self.aniadirElemento(bloqueDestructible, 6, 10)
		self.aniadirElemento(bloqueDestructible, 8, 10)
		self.aniadirElemento(bloqueDestructible, 10, 10)
		self.aniadirElemento(bloqueDestructible, 12, 10)
		self.aniadirElemento(bloqueDestructible, 14, 10)
		self.aniadirElemento(bloqueDestructible, 16, 10)
		
		self.aniadirLineaHorizontal(bloqueDestructible, 11, 3, 17)*/
			
	}
}

//MAPA 3

object mapa3 inherits Mapa{
	
	override method construir() {
		mapa.set(self,3)
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//Creo indestructibles
		self.aniadirElemento(bloqueIndestructible, 2, 2)
		self.aniadirElemento(bloqueIndestructible, 3, 2)
		self.aniadirElemento(bloqueIndestructible, 5, 2)
		self.aniadirElemento(bloqueIndestructible, 6, 2)
		self.aniadirElemento(bloqueIndestructible, 8, 2)
		self.aniadirElemento(bloqueIndestructible, 9, 2)
		self.aniadirElemento(bloqueIndestructible, 11, 2)
		self.aniadirElemento(bloqueIndestructible, 12, 2)
		self.aniadirElemento(bloqueIndestructible, 14, 2)
		self.aniadirElemento(bloqueIndestructible, 15, 2)
		self.aniadirElemento(bloqueIndestructible, 17, 2)
		self.aniadirElemento(bloqueIndestructible, 18, 2)
		
		self.aniadirElemento(bloqueIndestructible, 2, 3)
		self.aniadirElemento(bloqueIndestructible, 3, 3)
		self.aniadirElemento(bloqueIndestructible, 5, 3)
		self.aniadirElemento(bloqueIndestructible, 6, 3)
		self.aniadirElemento(bloqueIndestructible, 8, 3)
		self.aniadirElemento(bloqueIndestructible, 9, 3)
		self.aniadirElemento(bloqueIndestructible, 11, 3)
		self.aniadirElemento(bloqueIndestructible, 12, 3)
		self.aniadirElemento(bloqueIndestructible, 14, 3)
		self.aniadirElemento(bloqueIndestructible, 15, 3)
		self.aniadirElemento(bloqueIndestructible, 17, 3)
		self.aniadirElemento(bloqueIndestructible, 18, 3)
		
		self.aniadirElemento(bloqueIndestructible, 2, 5)
		self.aniadirElemento(bloqueIndestructible, 3, 5)
		self.aniadirElemento(bloqueIndestructible, 5, 5)
		self.aniadirElemento(bloqueIndestructible, 6, 5)
		self.aniadirElemento(bloqueIndestructible, 9, 5)
		self.aniadirElemento(bloqueIndestructible, 10, 5)
		self.aniadirElemento(bloqueIndestructible, 11, 5)
		self.aniadirElemento(bloqueIndestructible, 14, 5)
		self.aniadirElemento(bloqueIndestructible, 15, 5)
		self.aniadirElemento(bloqueIndestructible, 17, 5)
		self.aniadirElemento(bloqueIndestructible, 18, 5)
		
		self.aniadirElemento(bloqueIndestructible, 2, 6)
		self.aniadirElemento(bloqueIndestructible, 3, 6)
		self.aniadirElemento(bloqueIndestructible, 5, 6)
		self.aniadirElemento(bloqueIndestructible, 6, 6)
		self.aniadirElemento(bloqueIndestructible, 9, 6)
		self.aniadirElemento(bloqueIndestructible, 10, 6)
		self.aniadirElemento(bloqueIndestructible, 11, 6)
		self.aniadirElemento(bloqueIndestructible, 14, 6)
		self.aniadirElemento(bloqueIndestructible, 15, 6)
		self.aniadirElemento(bloqueIndestructible, 17, 6)
		self.aniadirElemento(bloqueIndestructible, 18, 6)
		
		self.aniadirElemento(bloqueIndestructible, 2, 7)
		self.aniadirElemento(bloqueIndestructible, 3, 7)
		self.aniadirElemento(bloqueIndestructible, 5, 7)
		self.aniadirElemento(bloqueIndestructible, 6, 7)
		self.aniadirElemento(bloqueIndestructible, 9, 7)
		self.aniadirElemento(bloqueIndestructible, 10, 7)
		self.aniadirElemento(bloqueIndestructible, 11, 7)
		self.aniadirElemento(bloqueIndestructible, 14, 7)
		self.aniadirElemento(bloqueIndestructible, 15, 7)
		self.aniadirElemento(bloqueIndestructible, 17, 7)
		self.aniadirElemento(bloqueIndestructible, 18, 7)
		
		self.aniadirElemento(bloqueIndestructible, 2, 9)
		self.aniadirElemento(bloqueIndestructible, 3, 9)
		self.aniadirElemento(bloqueIndestructible, 5, 9)
		self.aniadirElemento(bloqueIndestructible, 6, 9)
		self.aniadirElemento(bloqueIndestructible, 8, 9)
		self.aniadirElemento(bloqueIndestructible, 9, 9)
		self.aniadirElemento(bloqueIndestructible, 11, 9)
		self.aniadirElemento(bloqueIndestructible, 12, 9)
		self.aniadirElemento(bloqueIndestructible, 14, 9)
		self.aniadirElemento(bloqueIndestructible, 15, 9)
		self.aniadirElemento(bloqueIndestructible, 17, 9)
		self.aniadirElemento(bloqueIndestructible, 18, 9)
		
		self.aniadirElemento(bloqueIndestructible, 2, 10)
		self.aniadirElemento(bloqueIndestructible, 3, 10)
		self.aniadirElemento(bloqueIndestructible, 5, 10)
		self.aniadirElemento(bloqueIndestructible, 6, 10)
		self.aniadirElemento(bloqueIndestructible, 8, 10)
		self.aniadirElemento(bloqueIndestructible, 9, 10)
		self.aniadirElemento(bloqueIndestructible, 11, 10)
		self.aniadirElemento(bloqueIndestructible, 12, 10)
		self.aniadirElemento(bloqueIndestructible, 14, 10)
		self.aniadirElemento(bloqueIndestructible, 15, 10)
		self.aniadirElemento(bloqueIndestructible, 17, 10)
		self.aniadirElemento(bloqueIndestructible, 18, 10)
		
		
		//creo destructibles
		self.aniadirLineaHorizontal(bloqueDestructible, 1, 3, 17)
		
		self.aniadirLineaVertical(bloqueDestructible, 4, 2, 3)
		self.aniadirLineaVertical(bloqueDestructible, 7, 2, 3)
		self.aniadirLineaVertical(bloqueDestructible, 10, 2, 3)
		self.aniadirLineaVertical(bloqueDestructible, 13, 2, 3)
		self.aniadirLineaVertical(bloqueDestructible, 16, 2, 3)
		
		self.aniadirLineaHorizontal(bloqueDestructible, 4, 2, 7)
		self.aniadirLineaHorizontal(bloqueDestructible, 4, 13, 18)
		
		self.aniadirLineaVertical(bloqueDestructible, 1, 3, 9)
		self.aniadirLineaVertical(bloqueDestructible, 19, 3, 9)
		
		self.aniadirLineaVertical(bloqueDestructible, 7, 5, 7)
		self.aniadirLineaVertical(bloqueDestructible, 13, 5, 7)
		
		self.aniadirLineaHorizontal(bloqueDestructible, 8, 2, 7)
		self.aniadirLineaHorizontal(bloqueDestructible, 8, 13, 18)
		
		self.aniadirLineaVertical(bloqueDestructible, 4, 9, 10)
		self.aniadirLineaVertical(bloqueDestructible, 7, 9, 10)
		self.aniadirLineaVertical(bloqueDestructible, 10, 9, 10)
		self.aniadirLineaVertical(bloqueDestructible, 13, 9, 10)
		self.aniadirLineaVertical(bloqueDestructible, 16, 9, 10)
		
		self.aniadirLineaHorizontal(bloqueDestructible, 11, 3, 17)
		
		
	}
}

//MAPA TUTORIAL

object mapa4 inherits Mapa{
	
	override method construir() {
		mapa.set(self,4)
		
		keyboard.t().onPressDo { 
			selectorDeMapa.generar(previewMapa1)
			selectorDeMapa.paradoEnTutorial(false)
		}
		
		//Creo contorno
		self.aniadirLineaHorizontal(bloqueIndestructible, 0, 0, 20)
		self.aniadirLineaHorizontal(bloqueIndestructible, 12, 0, 20)
		self.aniadirLineaVertical(bloqueIndestructible, 0, 0, 12)
		self.aniadirLineaVertical(bloqueIndestructible, 20, 0, 12)
		
		//resto
		
		self.aniadirLineaVertical(bloqueIndestructible, 10, 1, 2)
		self.aniadirLineaVertical(bloqueDestructible, 10, 3, 4)
		self.aniadirLineaVertical(bloqueIndestructible, 10, 5, 7)
		self.aniadirLineaVertical(bloqueDestructible, 10, 8, 9)
		self.aniadirLineaVertical(bloqueIndestructible, 10, 10, 11)
		
		self.aniadirElemento(powerUpBombaFuerte, 2, 6)
		self.aniadirElemento(powerUpBombaSticky, 4, 6)
		self.aniadirElemento(powerUpBombaRemota, 2, 9)
		self.aniadirElemento(powerUpAumentarVelocidad, 6, 6)
		self.aniadirElemento(powerUpEscudo, 8, 6)
		
		self.aniadirElemento(powerUpBombaFuerte, 16, 5)
		self.aniadirElemento(powerUpBombaSticky, 18, 5)
		self.aniadirElemento(powerUpBombaRemota, 16, 2)
		self.aniadirElemento(powerUpAumentarVelocidad, 14, 5)
		self.aniadirElemento(powerUpEscudo, 12, 5)
	}
}

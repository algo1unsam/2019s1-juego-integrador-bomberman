import wollok.game.*
import powerUps.*
import players.*

object hudJugador1{
	
	method generar(){ game.onTick(1000, "hudJugador1", { self.mostrarHUD() } ) }
	
	method mostrarHUD(){
		
		self.mostrarCorazones()
		self.mostrarPowerUPs()
	}
	
	method mostrarCorazones(){
		(1..player1.vidas()).forEach{ 
			n => (powerUpAgregarVida.construir(self.calcularDondeColocarCorazon(n))).generar()
		}
	}
	
	method calcularDondeColocarCorazon(n) = game.at( 21+(n-1)%3,(33-n)/3) 
	
	method mostrarPowerUPs(){
		if (player1.bombaSticky()) self.mostrarBombaSticky()
		if (player1.bombaRemota()) self.mostrarBombaRemota()
	}
	
	method mostrarBombaSticky(){
		(powerUpBombaSticky.construir(game.at(21,8))).generar()
	}
	
		method mostrarBombaRemota(){
		(powerUpBombaRemota.construir(game.at(22,8))).generar()
	}
	
	
	
}



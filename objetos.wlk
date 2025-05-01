/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property bocha = pelota 
	var property camiseta = "lionel-suplente.png"


	
	method image() {
		return camiseta
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method patear() {
	  self.validarPatear()
	  bocha.mover()
	}

	method validarPatear() {
	  if(self.position() != bocha.position()){
		self.error("no puedo patear")
	  }
	}

	
	method cambiarCamiseta() {
	  self.validarCamiseta()
	  self.cambiarACamisetaAdecuada()
	}

	method validarCamiseta() {
		if(not self.puedeCambiarCamiseta() ){
			self.error("No esta en posicion de cambiar Camiseta")
		}
	}
	method puedeCambiarCamiseta(){
		return position == game.at(0,5)
	} 

	method cambiarACamisetaAdecuada() {
	  if(self.camisetaEsTitular()){
		self.camiseta("lionel-suplente.png")
	  }else{
		self.camiseta("lionel-titular.png")
	  }
	}

	method camisetaEsTitular(){
		return camiseta == "lionel-titular.png"
	} 
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method mover() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}
}

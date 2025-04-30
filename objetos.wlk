/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property bocha = pelota
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method taquito(){
		bocha.validarMismaPosicion()
		bocha.position(bocha.position().left(2))
		//bocha.position(game.at(0.max(bocha.position().x()-2), self.position().y()))
	}

	method validarMismaPosicion(){
		if(self.position().x()!=bocha.position().x() || self.position().y()!=bocha.position().y()){
			self.error("no encuentro el fulbo")
		}
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)
}

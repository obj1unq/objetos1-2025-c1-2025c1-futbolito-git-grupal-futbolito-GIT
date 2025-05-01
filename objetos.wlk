/** First Wollok example */
import wollok.game.*

object lionel {
	var property balon = pelota
	var property camiseta = camisetaTitular
	var property position = game.at(3,5)
	
	method image() = camiseta.image()


	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y())
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y())
	}

	method cambiarCamiseta() {
		self.validarPosicion()
		camiseta.cambiar(self)
	}
	
	method validarPosicion() {
		if (not self.posicionParaCambiarCamiseta()) self.error(
				"No esta en el borde izquierdo"
			)
	}

	method posicionParaCambiarCamiseta() = self.position().x() == 0

	method levantarla() {
		balon.subir()
		balon.bajar()
	}

	method taquito(){
		self.validarMismaPosicion()
		//bocha.position(bocha.position().left(2))
		balon.position(game.at(0.max(balon.position().x()-2), self.position().y()))
	}

	method validarMismaPosicion(){
		if(self.position().x()!=balon.position().x() || self.position().y()!=balon.position().y()){
			self.error("no encuentro el fulbo")
		}
	}
}

object pelota {
	const property image = "pelota.png"
	var property position = game.at(5, 5)
	
	method subir() {
		position = game.at(position.x(), position.y() + 1)
	}
	
	method bajar() {
		game.schedule(2000, { position = game.at(position.x(), position.y() - 1) })
	}


}

object camisetaSuplente {
	method image() = "lionel-suplente.png"
	
	method cambiar(personaje) {
		personaje.camiseta(camisetaTitular)
	}
}

object camisetaTitular {
	method image() = "lionel-titular.png"
	
	method cambiar(personaje) {
		personaje.camiseta(camisetaSuplente)
	}
}

/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var camiseta = titular

	method image() {
		return "lionel-" + camiseta.image() + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	()
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method cambiarCamiseta() {
		self.validarCambioDeCamiseta()
		if (self.esTitular()) {
			camiseta = suplente
		} else {
			camiseta = titular
		}
	}

	method esTitular() {
		return camiseta.image() == "titular"
	}

	method estadoCamiseta() {
		return camiseta.image()
	}

	method validarCambioDeCamiseta() {
		if (!self.estaEnBordeDeLaCancha()) {
			self.error("tengo que ir hasta el banco de suplentes")
		}
	}

	method estaEnBordeDeLaCancha() {
		return position.x() == self.posicionParaCambioDeCasmiseta()
	}

	method posicionParaCambioDeCasmiseta() {
		return 0
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}

object titular { 
	method image() { 
		return "titular"
	}
}

object suplente { 
	method image() { 
		return "titular"
	}
}
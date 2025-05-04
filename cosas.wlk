object electrodomestico{
	method esDeCategoria(categoria) {
		return self == categoria
	}
}

object mueble {
	method esDeCategoria(categoria) {
		return self == categoria
	}
}

object comida {
	method esDeCategoria(categoria) {
		return self == categoria
	}

}

object heladera {
	method precio() { return 20000 }
	method categoria() { return electrodomestico }
	method esDeLaCategoria(categoria) {
		return self.categoria() == categoria
	}
}

object cama {
	method precio() { return 8000 }
	method categoria() { return mueble }
	method esDeLaCategoria(categoria) {
		return self.categoria() == categoria
	}
}

object tiraDeAsado {
	method precio() { return 350 }
	method categoria() { return comida }
	method esDeLaCategoria(categoria) {
		return self.categoria() == categoria
	}
}

object paqueteDeFideos {
	method precio() { return 50 }
	method categoria() { return comida }
	method esDeLaCategoria(categoria) {
		return self.categoria() == categoria
	}
}

object plancha {
	method precio() { return 1200 }
	method categoria() { return electrodomestico }
	method esDeLaCategoria(categoria) {
		return self.categoria() == categoria
	}
}

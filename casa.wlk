import cosas.* 

object casaDePepeYJulian {
    const cosas = []
    var property cuentaActual = cuentaCorriente

    method asignarCuenta(cuenta) {
        cuentaActual = cuenta
    }

    method depositar(_depositar) {
        cuentaActual.depositar(_depositar)
    }

    method extraer(_depositar) {
        cuentaActual.extraer(_depositar)
    }

    method comprar(cosa) {
        cosas.add(cosa)
    }

    method cosas() {
        return cosas
    }

    method cantidadDeCosasCompradas() {
        return cosas.size() 
    }

    method tieneAlgun(categoria) {
        return cosas.any ( {cosa => cosa.categoria() == categoria} )
    }

    method vieneDeComprar(categoria) {
        return cosas.first().categoria() == categoria
    }

    method esDerrochona() {
        return cosas.sum ( {cosa => cosa.precio()} )  >= 9000
    }

    method compraMasCara() {
        return cosas.max ( {cosa => cosa.precio()} )
    }
    
    method comprados(categoria) {
        return cosas.filter ( { cosa => cosa.categoria() == categoria } )
    }

    method malaEpoca() {
        return cosas.all ( { cosa => cosa.categoria().esComida() } )
    }

    method queFaltaComprar(lista) {
        return lista.filter ( { cosaL => not cosas.contains(cosaL) } )
    }

    method faltaComida() {
      const comidas = cosas.filter ({ cosa => cosa.categoria().esComida()})
      return comidas.size() <= 2
    }
    
    method categoriasCompradas() {    
        return cosas.map ({ cosa => cosa.categoria()}).asSet()
    }

}

object cuentaCorriente {
    var property saldo = 20

    method depositar(_depositar) {
        self.validarMontoPositivo(_depositar)
	    saldo = saldo + _depositar
    }

    method validarMontoPositivo(monto) {
        if (monto < 0) {
		self.error ("La cantidad debe ser positiva")
        }
    }

    method extraer(_extraer) {
        self.validarMontoPositivo(_extraer)
        self.validarSiSePuedeExtraer(_extraer)
        saldo = saldo - _extraer
    }

    method validarSiSePuedeExtraer(monto) {
        if (monto > saldo) {
            self.error ("No hay suficiente saldo")
        }
    }
}

object cuentaConGastos {
    var property saldo = 500
    const costoOperacion = 20

    method depositar(_depositar) {
        self.validarMontoPositivo(_depositar)
        self.validarLimiteDeposito(_depositar)
        saldo = saldo + _depositar - costoOperacion
    }

    method validarLimiteDeposito(monto) {
        if (monto > 1000) {
            self.error ("Excediste el limite de deposito")
        }
    }

    method validarMontoPositivo(monto) {
        if (monto < 0) {
		self.error ("La cantidad debe ser positiva")
        }
    }

    method extraer(_extraer) {
        self.validarMontoPositivo(_extraer)
        saldo = saldo - _extraer
    }
}

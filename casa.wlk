import cosas.* 

object casaDePepeYJulian {
    const cosas = []
    var cuentaActual = cuentaCorriente


    method asignarCuenta(cuenta) {
        cuentaActual = cuenta
    }

    method comprar(cosa) {
        cuentaActual.extraer(cosa.precio())  
        cosas.add(cosa)
    }

    method cosas() {
        return cosas
    }

    method cantidadDeCosasCompradas() {
        return cosas.size() 
    }

    method tieneAlgun(categoria) {
        return cosas.any ({cosa => cosa.esDeLaCategoria(categoria)}) 
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
        return cosas.filter ( { cosa => cosa.esDeLaCategoria(categoria)}) 
    }

    method malaEpoca() {
        return cosas.all ( { cosa => cosa.esDeLaCategoria(comida) } )
    }

    method queFaltaComprar(lista) {
        return lista.filter ( { cosaL => not cosas.contains(cosaL) } )
    }

    method faltaComida() {
      const comidas = cosas.filter ({ cosa => cosa.esDeLaCategoria(comida)})
      return comidas.size() <= 2
    }
    
    method categoriasCompradas() {    
        return cosas.map ({ cosa => cosa.categoria()}).asSet()
    }

}

object cuentaCorriente {
    var saldo = 20

    method saldo() {
        return saldo
    }
    method depositar(monto) {
	    saldo = saldo + monto
    }

    method extraer(_extraer) {
        self.validarSiSePuedeExtraer(_extraer)
        saldo = saldo - _extraer
    }

    method validarSiSePuedeExtraer(monto) {
        if (not self.puedeExtraer(monto)) {
            self.error ("No hay suficiente saldo")
        }
    }

    method puedeExtraer(monto) {
        return monto <= saldo
    }
}

object cuentaConGastos {
    var saldo = 500
    const costoOperacion = 20

    method saldo() {
        return saldo
    }

    method depositar(_depositar) {
        self.validarLimiteDeposito(_depositar)
        saldo = saldo + _depositar - costoOperacion
    }

    method validarLimiteDeposito(monto) {
        if (not self.puedeDepositar(monto)) {
            self.error ("Excediste el limite de deposito")
        }
    }

    method puedeDepositar(monto) {
        return monto <= 1000 
    }

    method extraer(_extraer) {
        saldo = saldo - _extraer
    }
}

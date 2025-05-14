import cosas.*
object camion {
    const cosasCargadas = []

    method cargar(unaCosa){cosasCargadas.add(unaCosa)}
    method descargar(unaCosa){cosasCargadas.remove(unaCosa)}

    method peso() = self.pesoCosasCargadas() + 1000//tara
    method pesoCosasCargadas()= cosasCargadas.sum({c => c.peso()})
    method pesoCosasCargadasEsPar() = self.pesoCosasCargadas().even()

    method cosasCargadas() = cosasCargadas
    method hayCosaDePeso(unPeso) = cosasCargadas.any({c => c.peso() == unPeso})
    method primerCosaConPeligrosidad(unaPeligrosidad) = cosasCargadas.find({c => c.peligrosidad() == unaPeligrosidad})
    method cosasDePeligrosidadMayorA(unaPeligrosidad) = cosasCargadas.filter({c => c.peligrosidad() > unaPeligrosidad})
    method cosasDePeligrosidadMayorQue(unaCosa) = cosasCargadas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    
    method estaExcedidoDePeso() = self.peso() > 2500
    method puedeCircular(unaPeligrosidad) = !self.estaExcedidoDePeso() && self.cosasDePeligrosidadMayorA(unaPeligrosidad).isEmpty()  
    
    method hayCosaDePesoEntre(unPeso, otroPeso) = cosasCargadas.any({c => c.peso().between(unPeso, otroPeso)})
    method cosaMasPesada() = cosasCargadas.max({c => c.peso()})
}
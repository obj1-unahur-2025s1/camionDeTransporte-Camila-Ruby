import camion.*
object knightRider {
    method peso() = 500
    method peligrosidad()= 10
}

object bumblebee {
    var esRobot = true
    method peso() = 8000
    method peligrosidad()= if (esRobot){ return 30}else{return 15}
    method transformarse(){esRobot = !esRobot}
    method estaTransformadoARobot()= esRobot
}

object paqueteDeLadrillos {
    var property cantLadrillos = 5
    method peso() = ladrillo.peso() * cantLadrillos
    method peligrosidad()= 2
}
object ladrillo {
  method peso()= 2
}

object arena {
    var property peso = 10
    method peligrosidad()= 1
}

object bateria {
    var estaConMisiles = true
    method peso() = if(estaConMisiles){return 300}else{return 200}
    method peligrosidad()= if(estaConMisiles){return 100}else{return 0}
    method estaConMisiles()= estaConMisiles
    method cargarMisiles(){estaConMisiles = true}
    method descargarMisiles(){estaConMisiles = false}
}

object contenedor {
    const cosasDentro = []
    method peso() = 100 + cosasDentro.sum({c => c.peso()})
    method peligrosidad()= if (!cosasDentro.isEmpty()){return cosasDentro.sum({c => c.peligrosidad()})} else{ return 0}
    method guardarCosa(unaCosa){cosasDentro.add(unaCosa)}
    method sacarCosa(unaCosa){cosasDentro.remove(unaCosa)}
}

object residuosRadioactivos {
    var property peso = 5
    method peligrosidad()= 200
}

object embalaje {
    var property cosaEmbalada = bateria
    method peso() = cosaEmbalada.peso()
    method peligrosidad()= cosaEmbalada.peligrosidad() * 0.5

}
1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

Basandonos en las heuristicas de diseño vistas en clase, entendemos que el conjunto de mensajes de un objeto debe ser minimal, y uno de estos dos mensajes es inncesario, por lo tanto rompe con esa determinada heuristica.

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

Consideramos que los tests deberian ser agnosticos a la implementacion de los objetos, por lo tanto no deberian saber que la implementacion de cada uno de esos objetos es la misma y esta bien que se testeen cada uno de esos objetos por separado.

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

Al resultado elegimos moderlarlo como un objeto. Consideramos la opcion de utilizar los colaboradores internos del `OrquestadorDeCombate`, pero terminamos descartando esta opcion ya que miramos el resultado como una tabla de puntajes que no esta relacionada al transcurso del combate en si, y por lo tanto, estariamos agregando mas comportamiento al orquestador del que deberia tener.

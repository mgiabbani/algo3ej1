# Respuestas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?


- Para resolver los ejercicios 01 y 02, nos dimos cuenta que se podria simplificar modelando un nuevo objeto que represente un cronómetro. Pero, buscando entre los mensajes que pueden responder las subclases de `TestCase`, nos dimos cuenta que ya habia un mensaje que hacia lo que queriamos representar. Por lo tanto decidimos que usarlo era la mejor opcion ya que nos simplificaba codigo y usabamos implementaciones hechas por el equipo de Smalltalk.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?


- Dentro del lenguaje Smalltalk se pueden usar objetos, a los que se les definen un protocolo de mensajes que sabe responder y asi representar el dominio de ese ente.


## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

- La relación entre sacar código repetido y la teoróa del paper de Naur es que cuando se crean abstracciones, estamos aumentando el marco teorico detras de esa teoria, por lo tanto complejizandola. Por otro lado, para sacar código repetido hay que tener un conocimiento del sistema, o al menos de la porción del sistema a afectar, para poder entender cuál es el código repetido a modificar y asi poder hacer cambios consistentes que extiendan la teoría del programa.

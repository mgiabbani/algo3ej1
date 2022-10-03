# Preguntas teóricas

## Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

La información de la primera llamada aporta, como colaborador externo, un objeto polimórfico al cual le enviaremos un determinado mensaje dependiendo la clase del `receptor`, y la segunda llamada aporta la clase a la que pertenece el objeto `remitente`.


## Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Nos parece que el mejor lugar para instanciar un objeto es usando los métodos de clase del mismo, ya que no tiene mucho sentido necesitar un objeto ya instanciado para poder instanciar otro. Lo resolvimos llamando al metodo de la clase que queriamos instanciar. 

## Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

El criterio que estamos utilizando para categorizar métodos es segun el conjunto de operación que van a realizar. Por ejemplo, la suma y la resta las pusimos dentro de la categoria de operadores aritméticos. Tambien tuvimos en cuenta si el mensaje es público, privado, o utilizado internamente para Double Dispatch, y explicitandolo en el nombre de la categoria.

## Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Por mas que todas las subclases existentes lo tengan ya implementado, se implementa igual ese mensaje en la clase para cuando haya que agregar una subclase nueva saber que métodos hay que implementarle.

## No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Romper el encapsulamiento esta mal porque va a dificultar la refactorización. 
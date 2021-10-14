- Investigando en internet encontramos el mensaje should:raise:withExceptionDo:. Nos dimos cuenta de que es muy útil porque evalúa que un bloque de código lance una excepcion esperada (Sergio nos dio el OK). Para los tests 3,4,7 y 8 decidimos usarlo para evitar "reinventar la rueda".

- En los tests 5 y 6 encapsulamos en un método privado de CustomerBookTest los assertions correspondientes a las cantidades de customers de cada tipo y totales (ver assertAmountOfActiveCustomers:assertAmountOfSuspendedCustomers:assertTotalAmountOfCustomers:). En cada test simplemente varían las cantidades recibidas como parámetros.

Eso es todo.

Enzo y Frank =)
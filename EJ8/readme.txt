Sobre la parte extra:

* hicimos el método reportProcedureForEachAccount de Portfolio para evitar romper el encapsulamiento pidiendole las accounts y haciendo un do sobre las mismas

* con respecto a PortfolioDetailedTreePrinter, el balance se imprime al mismo nivel de indentación que las demas transacciones para cada cuenta, dado que al momento de reportar una ReceptiveAccount se reutiliza Summary, el cual no tiene indentaciones (nos resulto muy complicada la idea de chequear si llegamos al balance para ahi mismo bajar un nivel de indentación). Tampoco pusimos el balance de cada Portfolio ya que tendriamos que omitir todas las transacciones hechas dentro del Portfolio (dado que reutilizamos Summary).

Puede ser media rara la explicación pero espero que se haya comprendido XD.

Frank y Enzo.
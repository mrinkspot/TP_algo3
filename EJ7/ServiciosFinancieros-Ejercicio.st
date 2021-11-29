!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
add: anAccount
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
anyAccountRegisteredTransaction
	^ accounts anySatisfy: [ :a | (a transactions isEmpty) not ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
balance
	^ accounts sum: [ :a | a balance ] ifEmpty: [ 0*peso ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
transactions
	| allTransactions |
	allTransactions := OrderedCollection new.
	1 to: (accounts size) do: [:a | 
		allTransactions addAllLast: ((accounts at: a) transactions).
		].
	^ allTransactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
transactionsOf: anAccount
	(accounts includes: anAccount) ifTrue: [
			^ anAccount transactions
		].
	self error: self class accountNotFoundErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:41:27'!
accountNotFoundErrorDescription
	^ 'La cuenta no existe en el portfolio'! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:26:21'!
test01UnPortfolioSinCuentasTieneBalance0
	"un portfolio sin cuentas tiene balance 0"

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:26:50'!
test02ElBalanceDelPortfolioEsLaSumaDeLosBalancesDeSusCuentas
	"el balance del portfolio es la suma de los balances de sus cuentas"
	| portfolio anAccount initialAmount anotherAccount totalAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.
	
	totalAmount := anAccount balance + anotherAccount balance.
	
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	
	self assert: portfolio balance equals: totalAmount.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:29:07'!
test03ElPortfolioSabeSiSusCuentasNoTienenTransacciones
	"También se espera poder preguntarle a un portfolio por medio de un mensaje si alguna de sus cuentas registró una transacción"
	"el portfolio sabe si sus cuenta registraron alguna transaccion"
	| portfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self assert: anAccount transactions isEmpty.
	self assert: anotherAccount transactions isEmpty.
	
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	
	self deny: portfolio anyAccountRegisteredTransaction.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:29:20'!
test04ElPortfolioSabeSiSusCuentasTienenTransacciones
	"También se espera poder preguntarle a un portfolio por medio de un mensaje si alguna de sus cuentas registró una transacción"
	"el portfolio sabe si sus cuenta registraron alguna transaccion"
	| portfolio anAccount anotherAccount initialAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.
	
	"ambas cuentas registraron un deposito"
	
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	
	self assert: portfolio anyAccountRegisteredTransaction.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:29:49'!
test05SePuedeConsultarLasTransaccionesDeUnaCuentaDelPortfolioSiEsQueLaMismaExisteEnEl
	"se pueden consultar las transacciones de una cuenta del portfolio si es que la misma existe en el "
	| portfolio anAccount initialAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	
	portfolio add: anAccount.
		
	self assert: (portfolio transactionsOf: anAccount) equals: anAccount transactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:30:13'!
test06NoSePuedeConsultarLasTransaccionesDeUnaCuentaQueNoEstaEnElPortfolio
	"no se puede consultar las transacciones de una cuenta que no esta en el portfolio"
	| portfolio anAccount initialAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	self should: [portfolio transactionsOf: anAccount] raise: Error withExceptionDo: [ :e |
			self assert: e messageText equals: 'La cuenta no existe en el portfolio'
		]! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:30:43'!
test07ElBalanceDeUnPortfolioEsLaSumaDeLosBalancesDeLosPortfoliosYCuentasQueContiene
	"el balance de un portfolio es la suma de los balances de los portfolios y cuentas que contiene"
	| portfolio anAccount anAmount anotherAmount anotherPortfolio anotherAccount totalAmount |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	anAmount  := 1000*peso.
	anotherAmount := 2000*peso.
	
	totalAmount := anAmount + anotherAmount.
	
	Deposit register: anAmount on: anAccount.
	Deposit register: anotherAmount on: anotherAccount.
	
	portfolio add: anAccount.
	anotherPortfolio add: anotherAccount.
	portfolio add: anotherPortfolio.
		
	self assert: (portfolio balance) equals: totalAmount.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:31:19'!
test08AlPedirLasTransaccionesDeUnPortfolioSeObtieneLasTransaccionesDeSusCuentasyPortfolios
	" aPortfolio transactionsOf: anotherPortfolio
	al pedir las transacciones de un portfolio se obtienen las transacciones  de sus cuentas y/o portfolios  
	"
	| portfolio anAccount anAmount anotherPortfolio anotherAccount allTransactions |
	
	portfolio := Portfolio new.
	anotherPortfolio := Portfolio new.
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	anAmount := 1000*peso.
	
	Deposit register: anAmount on: anAccount. 
	Deposit register: anAmount on: anotherAccount.
	
	portfolio add: anotherPortfolio.
	anotherPortfolio add: anAccount.
	anotherPortfolio add: anotherAccount.
	
	allTransactions := OrderedCollection new.
	
	allTransactions addAllLast: (anAccount transactions).
	allTransactions addAllLast: (anotherAccount transactions).	
	
	self assert: (portfolio transactionsOf: anotherPortfolio) equals: allTransactions.
	
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'Frank 11/27/2021 20:14:53'!
test03WithdrawDecreasesBalanceOnTransactionValue 
	| account |
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:53'!
test01HacerUnaTranferenciaModificaLosBalancesDeLasCuentas

	| aTransfer anAccount anotherAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.
	transferAmount := 100*peso.
	
	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.
	
	aTransfer := Transfer from: anAccount to: anotherAccount by: transferAmount. 
	
	self assert: anAccount balance equals: (initialAmount - transferAmount). 
	self assert: anotherAccount balance equals: (initialAmount + transferAmount). ! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:44'!
test02HacerUnaTranferenciaInvalidaNoSeRealizanMovimientosEnLasCuentas
	
	| anAccount anotherAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.
	transferAmount := 0*peso.
	
	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.
	
	self should: [ 
		Transfer from: anAccount to: anotherAccount by: transferAmount ]  
		raise: Error
		withExceptionDo: [ :e |
				self assert: anAccount balance equals: initialAmount.
				self assert: anotherAccount balance equals: initialAmount.
				self assert: e messageText = 'Valor de transferencia inválido'
			].! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:37'!
test03HacerUnaTransferenciaNoSeEfectuaSiNoTieneSaldoSuficiente
	
	| anAccount anotherAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 100*peso.
	transferAmount := 200*peso.
	
	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.
	
	self should: [ 
		Transfer from: anAccount to: anotherAccount by: transferAmount ]  
		raise: Error
		withExceptionDo: [ :e |
				self assert: anAccount balance equals: initialAmount.
				self assert: anotherAccount balance equals: initialAmount.
				e messageText = 'Saldo insuficiente para realizar la transferencia'
			].! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:32'!
test04NoSePuedeRealizarUnaTransferenciaALaMismaCuenta
	
	| anAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	
	initialAmount  := 100*peso.
	transferAmount := 100*peso.
	
	Deposit register: initialAmount on: anAccount.
	
	self should: [ 
		Transfer from: anAccount to: anAccount by: transferAmount ]  
		raise: Error
		withExceptionDo: [ :e |
				self assert: anAccount balance equals: initialAmount.
				self assert: (e messageText = Transfer selfTransferErrorDescription)
			].! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:26'!
test05LaTransferenciaConoceElMontoDelMovimientoEntreCuentas

	| aTransfer anAccount anotherAccount amount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	amount := 100*peso.
	Deposit register: amount on: anAccount.
	Deposit register: amount on: anotherAccount.
	aTransfer := Transfer from: anAccount to: anotherAccount by: amount. 
	
	self assert: aTransfer amount equals: amount. ! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:11'!
test06AlPreguntarALaPataDeExtraccionCualEsSuContraparteDevuelvePataDeDeposito

	| aTransfer anAccount anotherAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.
	transferAmount := 100*peso.
	
	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.

	aTransfer := Transfer from: anAccount to: anotherAccount by: transferAmount.
	
	self assert: aTransfer depositFoot equals: (aTransfer withdrawFoot) counterpart.! !

!TransferTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/29/2021 11:25:06'!
test07AlPreguntarleALaPataDeDepositoCualEsSuContraparteDevuelvePataDeExtraccion

	| aTransfer anAccount anotherAccount initialAmount transferAmount |
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	initialAmount  := 1000*peso.
	transferAmount := 100*peso.
	
	Deposit register: initialAmount on: anAccount.
	Deposit register: initialAmount on: anotherAccount.

	aTransfer := Transfer from: anAccount to: anotherAccount by: transferAmount.

	self assert: aTransfer withdrawFoot equals: (aTransfer depositFoot) counterpart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AlgebraDeBoole 11/29/2021 12:27:00'!
value 
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:50:55'!
updateBalance: anAccount
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'e 11/29/2021 17:09:20'!
register: aValue on: account
	| transaction |
	transaction := self for: aValue. 
	account register: transaction.
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'e 11/29/2021 16:59:54'!
registerFor: aTransfer on: account
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'e 11/29/2021 16:43:03'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:52:08'!
updateBalance: anAccount
	^ anAccount + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'Frank 11/28/2021 15:48:03'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #TransferFoot category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferFoot
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferFoot methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/28/2021 21:13:05'!
counterpart
	self subclassResponsibility.! !

!TransferFoot methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:11:45'!
initializeFor: aTransfer
	transfer := aTransfer! !

!TransferFoot methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:26:22'!
value 
	^ (transfer amount)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferFoot class' category: 'ServiciosFinancieros-Ejercicio'!
TransferFoot class
	instanceVariableNames: 'transfer'!

!TransferFoot class methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:12:59'!
for: aTransfer
	^ self new initializeFor: aTransfer ! !

!TransferFoot class methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:13:30'!
registerFor: aTransfer on: anAccount
| transaction |
	transaction := self for: aTransfer. 
	anAccount register: transaction.
	^ transaction! !


!classDefinition: #DepositFoot category: 'ServiciosFinancieros-Ejercicio'!
TransferFoot subclass: #DepositFoot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositFoot methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/28/2021 21:13:25'!
counterpart
	^ transfer withdrawFoot.! !

!DepositFoot methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:16:27'!
updateBalance: anAccount
	^ anAccount + self value.! !


!classDefinition: #WithdrawFoot category: 'ServiciosFinancieros-Ejercicio'!
TransferFoot subclass: #WithdrawFoot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawFoot methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/28/2021 21:43:14'!
counterpart
	^ transfer depositFoot.! !

!WithdrawFoot methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:27:21'!
updateBalance: amount
	^ amount - self value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'Frank 11/27/2021 20:24:12'!
initializeFor: aValue

	value := aValue! !


!Withdraw methodsFor: 'value' stamp: 'Frank 11/27/2021 20:28:44'!
value
	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:52:55'!
updateBalance: anAccount
	^ anAccount - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'Frank 11/28/2021 15:48:11'!
for: aValue
	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AlgebraDeBoole 11/29/2021 11:45:47'!
initialize
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'e 11/29/2021 17:23:25'!
balance
	| total |
	total := 0 * peso.
	transactions do:[:a|
		total := a updateBalance: total .
		].
	^ total.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'Frank 11/27/2021 20:34:01'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'Frank 11/27/2021 20:35:17'!
register: aTransaction
	transactions add: aTransaction.
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'Frank 11/28/2021 19:03:54'!
transactions 
	^ transactions copy! !



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transmitterAccount receptiveAccount amount depositFoot withdrawFoot pata1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 16:44:56'!
amount
	^ amount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 19:08:23'!
depositFoot
	^ depositFoot. ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:20:48'!
withTransmitterAccount: anAccount andReceptiveAccount: anotherAccount by: aValue
	(aValue < (1*peso)) ifTrue: [
			self error: Transfer invalidTransferErrorDescription
		].
	(aValue > anAccount balance) ifTrue: [
			self error: Transfer insufficientBalanceErrorDescription
		].
	(anAccount = anotherAccount) ifTrue: [
			self error: Transfer selfTransferErrorDescription
		].
	amount := aValue.
	withdrawFoot := WithdrawFoot registerFor: self on: anAccount .
	depositFoot := DepositFoot registerFor: self on: anotherAccount .

	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/28/2021 20:34:41'!
withdrawFoot
		^withdrawFoot! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 16:21:07'!
from: anAccount to: anotherAccount by: aValue
	^ self new withTransmitterAccount: anAccount andReceptiveAccount: anotherAccount by: aValue.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 18:08:50'!
insufficientBalanceErrorDescription
	^ 'Saldo insuficiente para realizar la transferencia'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 18:39:18'!
invalidTransferErrorDescription
	^ 'Valor de transferencia inválido'.! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 18:47:17'!
selfTransferErrorDescription
	^ 'La cuenta no puede transferirse a sí misma'! !

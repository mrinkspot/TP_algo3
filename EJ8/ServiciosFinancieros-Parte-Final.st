!classDefinition: #AccountReportTest category: 'ServiciosFinancieros-Parte-Final'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: 'anAccount anotherAccount aPortfolio anotherPortfolio report anAccountSummary aTransferNet aPortfolioTreePrinter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:24:52'!
test01IfAccountIsEmptyTheReportOnlyShowsBalanceOfZero

	anAccountSummary := Summary for: anAccount.
	report add: 'Balance = 0 pesos'.

	self assert: (anAccountSummary generate) equals: report.! !

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:24:52'!
test02IfAccountHasRegisteredDepositTheReportWillShowTheNameAndAmountOfTransactionAndFinallyTheTotalBalance

	Deposit register: 100 * peso  on: anAccount .
	anAccountSummary := Summary for: anAccount.
	report add: 'Deposito por 100 pesos'; add: 'Balance = 100 pesos'.
	self assert: (anAccountSummary generate) equals: report.! !

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:24:52'!
test03IfAccountHasRegisteredWithdrawTheReportWillShowTheNameAndAmountOfTransactionAndFinallyTheTotalBalance

	Withdraw register: 100 * peso  on: anAccount .
	anAccountSummary := Summary for: anAccount.
	report add: 'Extraccion por 100 pesos'; add: 'Balance = -100 pesos'.
	self assert: (anAccountSummary generate) equals: report.! !

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:25:30'!
test04IfAccountHasRegisteredAnOutgoingTransferWillShowTheNameAndAmountOfTheTransactionAndFinallyTheTotalBalance

	Transfer amount: 100 * peso from: anAccount  to: anotherAccount.
	anAccountSummary := Summary for: anAccount.
	report add: 'Salida por transferencia de 100 pesos'; add: 'Balance = -100 pesos'.
	self assert: (anAccountSummary generate) equals: report.
! !

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:25:34'!
test05IfAccountHasRegisteredAnIncomingTransferWillShowTheNameAndAmountOfTheTransactionAndTotalBalance

	Transfer amount: 100 * peso from: anAccount  to: anotherAccount.
	anAccountSummary := Summary for: anotherAccount.
	report add: 'Entrada por transferencia de 100 pesos'; add: 'Balance = 100 pesos'.
	self assert: (anAccountSummary generate) equals: report.! !

!AccountReportTest methodsFor: 'summary-test' stamp: 'e 12/6/2021 11:25:37'!
test06IfPortfolioIsEmptyTheReportOnlyShowsBalanceOfZero


	aPortfolio add: anAccount.
	anAccountSummary := Summary for: aPortfolio.
	report add: 'Balance = 0 pesos'.
	self assert: (anAccountSummary generate) equals: report.
	
	! !


!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:58'!
test07IfAccountIsEmptyTransferNetIsZero


	aTransferNet := TransferNet for: anAccount.

	self assert: aTransferNet generate equals: 0 * peso.! !

!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:59'!
test08IfAccountHasRegisteredOnlyADepositTransferNetIsZero

	Deposit register: 100*peso on: anAccount .
	aTransferNet := TransferNet for: anAccount.

	self assert: aTransferNet generate equals: 0 * peso.! !

!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:58'!
test09IfAccountHasRegisteredOnlyAWithdrawTransferNetIsZero

	Withdraw register: 100*peso on: anAccount .
	aTransferNet := TransferNet for: anAccount.

	self assert: aTransferNet generate equals: 0 * peso.! !

!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:59'!
test10IfAccountHasRegisteredAnIncomingTransferThenTransferNetIsTheAmountForThatTransfer

	
	Transfer amount: 100* peso from: anAccount  to: anotherAccount. 
	aTransferNet := TransferNet for: anotherAccount.

	self assert: aTransferNet generate equals: 100 * peso.! !

!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:58'!
test11IfAccountHasRegisteredOnlyAnOutgoingTransferThenTransferNetWillBeNegative

	
	Transfer amount: 100* peso from: anAccount  to: anotherAccount. 
	aTransferNet := TransferNet for: anAccount.

	self assert: aTransferNet generate equals: -100 * peso.! !

!AccountReportTest methodsFor: 'transfernet-test' stamp: 'e 12/6/2021 11:24:59'!
test12IfPortfolioHasRegisteredOutgoingTransferThenTransferNetIsNegative

    aPortfolio := Portfolio with: anAccount.
    Transfer amount: 100* peso from: anAccount  to: anotherAccount. 
    aTransferNet := TransferNet for: aPortfolio.

    self assert: aTransferNet generate equals: -100 * peso.! !


!AccountReportTest methodsFor: 'portfolio-detailed-tree-printer' stamp: 'e 12/6/2021 11:24:23'!
test16ifPortfolioHasAccountsWithTransactionsPortfolioDetailedTreePrinterPrintsPortfolioNameAndAccountsNamesWithHisSummaries
    | familyPortfolio myAccount aPortfolioDetailedTreePrinter |
    
    myAccount := ReceptiveAccount named: 'Cuenta mia'. 
    familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
    
    aPortfolioDetailedTreePrinter := PortfolioDetailedTreePrinter for: familyPortfolio.
    
    Deposit register: 100 * peso  on: myAccount.
    Withdraw register: 50 * peso  on: myAccount.
    

    report add: 'Portfolio de la familia'.
    report add: '    Cuenta mia'.
    report add: '        Deposito por 100 pesos'.
    report add: '        Extraccion por 50 pesos'.
    report add: '        Balance = 50 pesos'.
    
    self assert: (aPortfolioDetailedTreePrinter generate) equals: report.! !


!AccountReportTest methodsFor: 'portfolio-tree-printer-test' stamp: 'e 12/6/2021 11:25:05'!
test13IfAccountHasRegisteredeEmptyPortolioThenPortfolioTreePrinterWillShowOnlyPortfoliosName

   	aPortfolio := Portfolio named: 'Portfolio familiar'.
    	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
    	report add: 'Portfolio familiar'.
    	self assert: (aPortfolioTreePrinter generate) equals: report.! !

!AccountReportTest methodsFor: 'portfolio-tree-printer-test' stamp: 'e 12/6/2021 11:25:05'!
test14IfAccountHasRegisteredeEmptyPortolioThenPortfolioTreePrinterWillShowOnlyPortfoliosName

    	anAccount := ReceptiveAccount named: 'Cuenta Franco'.
    	aPortfolio := Portfolio named: 'Portafolio familiar' with: anAccount.
    	aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
    	report add: 'Portafolio familiar'; add: '    Cuenta Franco'.
    	self assert: (aPortfolioTreePrinter generate) equals: report.! !

!AccountReportTest methodsFor: 'portfolio-tree-printer-test' stamp: 'e 12/6/2021 11:25:05'!
test15IfThePortfolioHasPortfolioNotEmptyThePortfolioTreePrinterPrintsPortfolioNameAndSubPortfolioNameIndentedAndHisAccountsIndentedToo

    anAccount := ReceptiveAccount named: 'Cuenta Franco'.
    anotherPortfolio := Portfolio named: 'Portfolio hijos' with: anAccount.
    aPortfolio := Portfolio named: 'Portfolio familiar' with: anotherPortfolio.
    aPortfolioTreePrinter := PortfolioTreePrinter for: aPortfolio.
    report add: 'Portfolio familiar' ; add:'    Portfolio hijos' ;add:  '        Cuenta Franco'.
    self assert: (aPortfolioTreePrinter generate) equals: report.! !


!AccountReportTest methodsFor: 'as yet unclassified' stamp: 'e 12/6/2021 11:23:45'!
setUp
	anAccount := ReceptiveAccount named: 'Cuenta Franco'.
	anotherAccount := ReceptiveAccount named: 'Cuenta Enzo'.
	aPortfolio := Portfolio named: 'Portafolio Familia'.
	anotherPortfolio := Portfolio named: 'Portafolio Hijos'.
	
	report := OrderedCollection new.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Parte-Final'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:51:03'!
test01
	"un portfolio sin cuentas tiene balance 0"

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/29/2021 11:26:21'!
test01UnPortfolioSinCuentasTieneBalance0
	"un portfolio sin cuentas tiene balance 0"

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0*peso.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:51:13'!
test02
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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:21:23'!
test03
	"También se espera poder preguntarle a un portfolio por medio de un mensaje si alguna de sus cuentas registró una transacción"
	"el portfolio sabe si sus cuenta registraron alguna transaccion"
	| portfolio anAccount anotherAccount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	self assert: anAccount transactions isEmpty.
	self assert: anotherAccount transactions isEmpty.
	
	"las cuentas no tienen transacciones registradas"
	
	portfolio add: anAccount.
	portfolio add: anotherAccount.
	
	self deny: portfolio anyAccountRegisteredTransaction.! !

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:21:08'!
test04
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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:32:47'!
test05
	"se pueden consultar las transacciones de una cuenta del portfolio si es que la misma existe en el "
	| portfolio anAccount initialAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	
	portfolio add: anAccount.
		
	self assert: (portfolio transactionsOf: anAccount) equals: anAccount transactions.! !

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:40:31'!
test06
	"no se puede consultar las transacciones de una cuenta que no esta en el portfolio"
	| portfolio anAccount initialAmount |
	
	portfolio := Portfolio new.
	anAccount := ReceptiveAccount new.
	initialAmount  := 1000*peso.

	Deposit register: initialAmount on: anAccount.
	self should: [portfolio transactionsOf: anAccount] raise: Error withExceptionDo: [ :e |
			self assert: e messageText equals: 'La cuenta no existe en el portfolio'
		]! !

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:50:26'!
test07
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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 23:20:06'!
test08
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


!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Parte-Final'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Parte-Final'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/28/2021 21:00:39'!
test03
	"al realizar una transferencia invalida no se efectua ningun movimiento en los saldos de las cuentas"
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 18:00:56'!
test04
	"al realizar una transferencia si la cuenta que la efectua no tiene suficiente saldo no se efectua ningun movimiento en los saldos de las cuentas"
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 18:50:33'!
test05
	"la cuenta no puede transferirse a sí misma"
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


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


!classDefinition: #Account category: 'ServiciosFinancieros-Parte-Final'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialize' stamp: 'Frank 12/5/2021 18:51:01'!
initializeNamed: aName
	name := aName.! !


!Account methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 19:11:29'!
name
^name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Parte-Final'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 18:50:36'!
named: aName
	^ self new initializeNamed: aName! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Parte-Final'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
anyAccountRegisteredTransaction
	^ accounts anySatisfy: [ :a | (a transactions isEmpty) not ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 23:43:43'!
generateForEachAccount: aClosure withReporter: aReporter
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 23:49:01'!
reportProcedureForEachAccount: aClosure
	accounts do: aClosure.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 17:29:09'!
transactionsOf: anAccount
	(accounts includes: anAccount) ifTrue: [
			^ anAccount transactions
		].
	self error: self class accountNotFoundErrorDescription.! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'e 12/6/2021 10:47:21'!
beReportedBy: aReport

	aReport reportPortfolio: self.! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Parte-Final'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 22:41:27'!
accountNotFoundErrorDescription
	^ 'La cuenta no existe en el portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 18:49:10'!
named: aName with: anAccount

	^self new 
		initializeNamed: aName;
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 18:49:32'!
named: aName with: anAccount with: anotherAccount

	^self new 
		initializeNamed: aName;
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Parte-Final'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Frank 12/5/2021 21:52:12'!
beReportedBy: aReport
	aReport reportReceptiveAccount: self.! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Parte-Final'!
Object subclass: #AccountReport
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!AccountReport methodsFor: 'initialization' stamp: 'Frank 12/4/2021 14:43:34'!
initializeFor: anAccount
	account := anAccount.! !


!AccountReport methodsFor: 'operation' stamp: 'e 12/1/2021 16:03:18'!
generate
	self subclassResponsibility! !


!AccountReport methodsFor: 'private' stamp: 'Frank 12/4/2021 16:43:43'!
reportDeposit: aDeposit
	self subclassResponsibility.! !

!AccountReport methodsFor: 'private' stamp: 'Frank 12/4/2021 16:44:40'!
reportTransferDepositleg: aTransferDepositleg
	self subclassResponsibility.! !

!AccountReport methodsFor: 'private' stamp: 'Frank 12/4/2021 16:44:27'!
reportTransferWithdrawleg: aTransferWithdrawleg
	self subclassResponsibility.! !

!AccountReport methodsFor: 'private' stamp: 'Frank 12/4/2021 16:44:03'!
reportWithdraw: aWithdraw
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Parte-Final'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'initialization' stamp: 'Frank 12/4/2021 16:46:46'!
for: anAccount
	^ self new initializeFor: anAccount.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Parte-Final'!
AccountReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'report indentationLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 21:55:26'!
decreaseIndentationLevel
	indentationLevel := indentationLevel - 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:28:57'!
generateDetailFor: anAccount
	| detail |
	detail := (Summary for: anAccount) generate.
	detail do: [ :transactionDetail |
		report add: (self indentations, transactionDetail)
		].! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:28:57'!
generateLineWith: anAccount

	^ report add: ((self indentations), anAccount name)! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 21:55:26'!
increaseIndentationLevel
	indentationLevel := indentationLevel + 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:28:57'!
indentations
	| indentations |
	indentations := ''.
	1 to: indentationLevel do: [ :i | indentations := indentations append: '    ' ].
	^ indentations! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:49:01'!
reportPortfolio: aPortfolio
	self generateLineWith: aPortfolio.
	self increaseIndentationLevel.
	aPortfolio reportProcedureForEachAccount: [ :acc |
		acc beReportedBy: self ].
	self decreaseIndentationLevel.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:28:40'!
reportReceptiveAccount: anAccount
	self generateLineWith: anAccount.
	self increaseIndentationLevel.
	self generateDetailFor: anAccount.
	self decreaseIndentationLevel.
	! !


!PortfolioDetailedTreePrinter methodsFor: 'operations' stamp: 'e 12/6/2021 10:47:04'!
generate
	
	report := OrderedCollection new.
	indentationLevel := 0.
	account beReportedBy: self.
	^ report.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Parte-Final'!
AccountReport subclass: #PortfolioTreePrinter
	instanceVariableNames: 'report indentationLevel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!PortfolioTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 21:34:45'!
decreaseIndentationLevel
	indentationLevel := indentationLevel - 1.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'e 12/6/2021 10:57:35'!
generateLineWith: anAccount

	^ report add: (self indentations, anAccount name)! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 19:59:08'!
increaseIndentationLevel
	indentationLevel := indentationLevel + 1.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'e 12/6/2021 10:57:35'!
indentations
	| indentations |
	indentations := ''.
	1 to: indentationLevel do: [ :i | indentations := (indentations, '    ') ].
	^ indentations! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 23:49:01'!
reportPortfolio: aPortfolio
	self generateLineWith: aPortfolio.
	self increaseIndentationLevel.
	aPortfolio reportProcedureForEachAccount: [ :acc |
		acc beReportedBy: self.
		].
	self decreaseIndentationLevel.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'Frank 12/5/2021 20:56:27'!
reportReceptiveAccount: anAccount
	self generateLineWith: anAccount.! !


!PortfolioTreePrinter methodsFor: 'operations' stamp: 'e 12/6/2021 11:26:42'!
generate
	
	report := OrderedCollection new.
	indentationLevel := 0.
	account beReportedBy: self.
	^ report.! !


!classDefinition: #Summary category: 'ServiciosFinancieros-Parte-Final'!
AccountReport subclass: #Summary
	instanceVariableNames: 'report balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 17:34:59'!
generateBalanceLine
	report add: 'Balance = ', balance asString.! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 17:34:21'!
generateLineFor: aTransaction
	report add: (aTransaction beReportedBy: self)! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 15:26:46'!
reportDeposit: aDeposit
	^ 'Deposito por ' , aDeposit value asString.! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 15:29:17'!
reportTransferDepositLeg: aTransferDepositLeg
	^ 'Entrada por transferencia de ' , aTransferDepositLeg value asString.! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 15:28:52'!
reportTransferWithdrawLeg: aTransferWithdrawLeg
	^ 'Salida por transferencia de ' , aTransferWithdrawLeg value asString.! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 15:29:43'!
reportWithdraw: aWithdraw
	^ 'Extraccion por ' , aWithdraw value asString.! !

!Summary methodsFor: 'private' stamp: 'Frank 12/4/2021 17:37:28'!
updateBalanceWith: aTransaction
	balance := aTransaction affectBalance: balance.! !


!Summary methodsFor: 'operation' stamp: 'Frank 12/4/2021 17:37:36'!
generate
	report := OrderedCollection new.
	balance := 0 * peso.
	(account transactions) do:[ :transaction |
		self generateLineFor: transaction.
		self updateBalanceWith: transaction.
		].
	self generateBalanceLine.
	^ report.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Parte-Final'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'balance2 balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransferNet methodsFor: 'private' stamp: 'Frank 12/4/2021 15:31:17'!
reportDeposit: aDeposit
	^ 0*peso.! !

!TransferNet methodsFor: 'private' stamp: 'Frank 12/4/2021 15:30:40'!
reportTransferDepositLeg: aTransferDepositLeg
	^ aTransferDepositLeg value.! !

!TransferNet methodsFor: 'private' stamp: 'Frank 12/4/2021 15:30:52'!
reportTransferWithdrawLeg: aTransferDepositLeg
	^ aTransferDepositLeg value * (-1).! !

!TransferNet methodsFor: 'private' stamp: 'Frank 12/4/2021 15:31:28'!
reportWithdraw: aWithdraw
	^ 0*peso.! !

!TransferNet methodsFor: 'private' stamp: 'Frank 12/4/2021 17:41:20'!
updateBalanceWith: aTransaction
	balance := balance + (aTransaction  beReportedBy: self).! !


!TransferNet methodsFor: 'operation' stamp: 'Frank 12/4/2021 17:40:19'!
generate
	balance := 0 * peso.
	(account transactions) do:[ :transaction |
		self updateBalanceWith: transaction.
		].
	^ balance.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Parte-Final'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:50:55'!
updateBalance: anAccount
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Parte-Final'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'e 11/29/2021 17:09:20'!
register: aValue on: account
	| transaction |
	transaction := self for: aValue. 
	account register: transaction.
	^ transaction! !


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'Frank 11/28/2021 15:56:31'!
from: anAccount to: anotherAccount
	! !


!AccountTransaction class methodsFor: 'nil' stamp: 'e 11/29/2021 16:59:54'!
registerFor: aTransfer on: account
	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Parte-Final'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:26:46'!
beReportedBy: aReport
	^ aReport reportDeposit: self.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:04:14'!
calculateTransferBalanceBy: aTransferNet
	^ 0*peso.! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:52:08'!
updateBalance: anAccount
	^ anAccount + self value.! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Parte-Final'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Parte-Final'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'balance' stamp: 'Frank 12/4/2021 15:09:50'!
affectBalance: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Parte-Final'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Parte-Final'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:29:17'!
beReportedBy: aReport
	^ aReport reportTransferDepositLeg: self.! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:30:40'!
calculateTransferBalanceBy: aTransferNet
	^ aTransferNet reportTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Parte-Final'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:28:52'!
beReportedBy: aReport
	^ aReport reportTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Parte-Final'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!Withdraw methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 13:27:40'!
beCalculatedBy: aCalculateTransactionPartialBalance
	^ aCalculateTransactionPartialBalance calculateWithdrawBalance: self.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:29:43'!
beReportedBy: aPrinter
	^ aPrinter reportWithdraw: self.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:04:33'!
calculateTransferBalanceBy: aTransferNet
	^ 0*peso.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'e 11/29/2021 16:52:55'!
updateBalance: anAccount
	^ anAccount - self value.! !


!Withdraw methodsFor: 'balance' stamp: 'Frank 12/4/2021 13:35:21'!
affectBalance: aBalance

	^ aBalance - value! !


!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Parte-Final'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransactionPrinter category: 'ServiciosFinancieros-Parte-Final'!
Object subclass: #TransactionPrinter
	instanceVariableNames: 'transaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 12:50:08'!
for: aTransaction
	transaction := aTransaction ! !

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:24:52'!
print
	^ transaction beReportedBy: self.! !

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:26:46'!
reportDeposit: aDeposit
	^ 'Deposito por ' , aDeposit value asString.! !

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:29:17'!
reportTransferDepositLeg: aTransferDepositLeg
	^ 'Entrada por transferencia de ' , aTransferDepositLeg value asString.! !

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:28:52'!
reportTransferWithdrawLeg: aTransferWithdrawLeg
	^ 'Salida por transferencia de ' , aTransferWithdrawLeg value asString.! !

!TransactionPrinter methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 15:29:42'!
reportWithdraw: aWithdraw
	^ 'Extraccion por ' , aWithdraw value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionPrinter class' category: 'ServiciosFinancieros-Parte-Final'!
TransactionPrinter class
	instanceVariableNames: ''!

!TransactionPrinter class methodsFor: 'as yet unclassified' stamp: 'Frank 12/4/2021 12:50:39'!
for: aTransaction
	^ self new for: aTransaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Parte-Final'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte-Final'!

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


!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Parte-Final'!
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


!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !

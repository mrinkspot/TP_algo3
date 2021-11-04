!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'Frank 10/31/2021 17:14:55'!
test01StackShouldBeEmptyWhenCreated
	| stack |
	stack := OOStack new.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'Frank 10/31/2021 17:15:07'!
test02PushAddElementsToTheStack
	| stack |
	stack := OOStack new.
	stack push: 'something'.
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'Frank 10/31/2021 17:15:18'!
test03PopRemovesElementsFromTheStack
	| stack |
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 15:39:17'!
test04PopReturnsLastPushedObject
	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 15:40:02'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'Frank 10/31/2021 19:42:05'!
test08CanNotPopWhenThereAreNoObjectsInTheStack
	| stack  |
	
	stack := OOStack new.
	
	self
		should: [ stack pop ]
		
		raise: Error - MessageNotUnderstood
		
		withExceptionDo: [ :anError |
			
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/3/2021 18:38:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder firstWord secondWord thirdWord firstWordUpper emptySentencee matchingSentencess sentences anotherSentences anotherStack sentenceWithfirstWord prefixWithSpaces emptyStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:40:07'!
setUp
	stack := OOStack new.
	anotherStack := OOStack new.
	emptyStack := OOStack new.
		
	sentenceFinder := SentenceFinderByPrefix new.
	sentences := OrderedCollection new.
	
	anotherSentences := OrderedCollection new.

	firstWord := 'one'.
	sentenceWithfirstWord := 'oneWord'.
	secondWord := 'two'.
	thirdWord := 'three'.
	
	firstWordUpper := 'One'.
	emptySentencee := ''.
	
	prefixWithSpaces := 'a a'.
	
	sentences addLast: firstWord.
	
	anotherSentences addLast: sentenceWithfirstWord.
	anotherSentences addLast: firstWord.

	anotherStack push: firstWord.
	anotherStack push: secondWord.
	anotherStack push: thirdWord.
	
	stack push: firstWord.
	stack push: secondWord.
	stack push: thirdWord.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:08:21'!
test01PrefixIsEmpty

	self
		should: [ sentenceFinder find: emptySentencee in: stack. ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:34:19'!
test02SentenceFinderFindAPrefixInAStack
	
	self assert: (sentenceFinder find: firstWord in: stack) equals: sentences.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 15:51:50'!
test03FindIsCaseSensitive
	
	self deny: ((sentenceFinder find: firstWordUpper in: stack ) = sentences)! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:31:52'!
test04FindDoesntModifyStack

	sentenceFinder find: firstWord in: stack.
	
	self assert: (self is: stack theSameAs: anotherStack) .! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:11:44'!
test05PrefixContainsSpaces

	self
		should: [ sentenceFinder find: prefixWithSpaces in: stack. ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixContainSpaceErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:36:32'!
test06PrefixNotFoundInAStack
	self assert: (sentenceFinder find: firstWordUpper in: stack) equals: OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'AlgebraDeBoole 11/4/2021 18:44:08'!
test07SentenceFinderFindInAnEmptyStackDoesNotFindAnything

	self assert: (sentenceFinder find: firstWord in: emptyStack) equals: OrderedCollection new.! !


!SentenceFinderByPrefixTest methodsFor: 'validations' stamp: 'AlgebraDeBoole 11/4/2021 18:29:44'!
is: aStack theSameAs: aSecondStack
	(aStack size = aSecondStack size) ifFalse: [^false].
	[aStack isEmpty not] whileTrue:[
		(aStack pop = aSecondStack pop) ifFalse: [^ false]. 
		].
	^true.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'AlgebraDeBoole 11/4/2021 15:18:23'!
top

	^self state top.! !


!OOStack methodsFor: 'testing' stamp: 'AlgebraDeBoole 11/4/2021 16:01:37'!
isEmpty

	^ self state isEmpty.! !

!OOStack methodsFor: 'testing' stamp: 'AlgebraDeBoole 11/3/2021 23:35:05'!
size

	^ elements size.! !


!OOStack methodsFor: 'initialization' stamp: 'AlgebraDeBoole 11/3/2021 23:46:58'!
initialize

	elements := OrderedCollection new.
! !


!OOStack methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/4/2021 16:10:10'!
pop
	
	^ (self state) pop.! !

!OOStack methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/4/2021 16:02:42'!
push: aData
	
	elements addLast: aData.
	! !


!OOStack methodsFor: 'private' stamp: 'AlgebraDeBoole 11/3/2021 23:36:35'!
errorEmptyStack
	self error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'AlgebraDeBoole 11/3/2021 23:39:30'!
popWhenStackIsNotEmpty
	^ elements removeLast.! !

!OOStack methodsFor: 'private' stamp: 'AlgebraDeBoole 11/3/2021 23:47:41'!
state
	^ (StackState with:self) ! !

!OOStack methodsFor: 'private' stamp: 'AlgebraDeBoole 11/3/2021 23:39:11'!
topWhenStackIsNotEmpty
	^ elements at: self size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'Frank 10/31/2021 17:47:05'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackData matchingSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AlgebraDeBoole 11/3/2021 21:55:15'!
initialize
	stackData := OOStack new.
	matchingSentences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'AlgebraDeBoole 11/4/2021 18:11:07'!
find: aPrefix in: aStack

	self checkPrefix: aPrefix.
	self getData: aStack.
	^ self matchesWith: aPrefix saveData: aStack.! !


!SentenceFinderByPrefix methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/4/2021 18:13:56'!
checkPrefix: aPrefix
	aPrefix isEmpty ifTrue: [ self error: SentenceFinderByPrefix emptyPrefixErrorDescription].
	(aPrefix findString: ' ') > 0 ifTrue: [ self error: SentenceFinderByPrefix prefixContainSpaceErrorDescription].
	! !

!SentenceFinderByPrefix methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/4/2021 16:14:48'!
getData: aStack

	[ aStack isEmpty not ] whileTrue: [
		stackData push: (aStack pop) .
		].! !

!SentenceFinderByPrefix methodsFor: 'operations-private' stamp: 'AlgebraDeBoole 11/4/2021 14:51:02'!
matchesWith: aPrefix saveData: aStack
		
	[ stackData isEmpty not ] whileTrue:[
			(stackData top includesSubstring: aPrefix caseSensitive: true) ifTrue: [ matchingSentences add: stackData top ].
			aStack push: stackData pop.
		].
	
	^matchingSentences ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AlgebraDeBoole 11/4/2021 18:08:42'!
emptyPrefixErrorDescription
	^ 'Prefix is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AlgebraDeBoole 11/4/2021 18:07:51'!
prefixContainSpaceErrorDescription
	^ 'Prefix contain spaces!!'.! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:51:06'!
isEmpty
	self subclassResponsibility.! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:16:29'!
pop
	self subclassResponsibility .! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:56:47'!
setStack: aStack
	
	stack := aStack.! !

!StackState methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:50:53'!
top
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:43:26'!
canInstantianteWith: aStack
	self subclassResponsibility ! !

!StackState class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 18:42:28'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !

!StackState class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:53:46'!
with: aStack

	|selectedSubclass |	
	selectedSubclass := StackState subclasses detect: [:subclass | (subclass canInstantianteWith: aStack)].
	^selectedSubclass with: aStack.! !


!classDefinition: #Empty category: 'Stack-Exercise'!
StackState subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 18:47:37'!
isEmpty
	^true.! !

!Empty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:49:16'!
pop
	stack errorEmptyStack.! !

!Empty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:49:19'!
top
	stack errorEmptyStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: 'stack'!

!Empty class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:52:55'!
canInstantianteWith: aStack

	^ aStack size = 0.! !

!Empty class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:55:36'!
with: aStack
	
	^ (Empty new) setStack: aStack.! !


!classDefinition: #NoEmpty category: 'Stack-Exercise'!
StackState subclass: #NoEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoEmpty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 18:47:46'!
isEmpty
	^false.! !

!NoEmpty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:42:07'!
pop
	^stack popWhenStackIsNotEmpty.! !

!NoEmpty methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:41:52'!
top
	^stack topWhenStackIsNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoEmpty class' category: 'Stack-Exercise'!
NoEmpty class
	instanceVariableNames: 'stack'!

!NoEmpty class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:53:10'!
canInstantianteWith: aStack

	^ aStack size > 0.! !

!NoEmpty class methodsFor: 'as yet unclassified' stamp: 'AlgebraDeBoole 11/3/2021 23:55:54'!
with: aStack
	
	^ (NoEmpty new) setStack: aStack.! !

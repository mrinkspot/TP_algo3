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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 18:13:06'!
test01SentenceFinderShouldBeEmptyWhenCreated
	| aSentenceFinder |
	aSentenceFinder := SentenceFinderByPrefix new.
	self assert: aSentenceFinder isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 18:28:55'!
test02SentenceReceivedShouldNotBeEmpty
	| aSentenceFinder emptySentence |
	aSentenceFinder := SentenceFinderByPrefix new.
	emptySentence := ''.
	self
		should: [ aSentenceFinder push: emptySentence. ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptySentenceErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 19:16:51'!
test03FindingTheSentencesHelloInSentenceFinderThatContainsSentencesHelloAndWorldShouldReturnHello
	| aSentenceFinder matchingSentences |
	
	matchingSentences := OrderedCollection new.
	matchingSentences add: 'Hello'.
	aSentenceFinder := SentenceFinderByPrefix new.
	aSentenceFinder push: 'Hello'.
	aSentenceFinder push: 'World'.
	
	self assert: (aSentenceFinder find: 'Hello') equals: matchingSentences.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 19:21:50'!
test04FindIsCaseSensitive
	| aSentenceFinder matchingSentences |
	
	matchingSentences := OrderedCollection new.
	aSentenceFinder := SentenceFinderByPrefix new.
	matchingSentences add: 'hello'.
	aSentenceFinder push: 'Hello'.
	aSentenceFinder push: 'World'.
	
	self deny: ((aSentenceFinder find: 'Hello') = matchingSentences).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 19:51:39'!
test05ASentenceShouldBeAString
	| aSentenceFinder anInvalidSentence |
	aSentenceFinder := SentenceFinderByPrefix new.
	anInvalidSentence := Object new.
	
	self
		should: [ aSentenceFinder push: anInvalidSentence. ]
		
		raise: Error - MessageNotUnderstood 
		
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidSentenceErrorDescription ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'Frank 10/31/2021 20:27:57'!
test06FindDoesntModifySentenceFinder
	| aSentenceFinder anotherSentenceFinder sentence sentence1 sentence2 |
	aSentenceFinder := SentenceFinderByPrefix new.
	anotherSentenceFinder := SentenceFinderByPrefix new.
	sentence := 'sentence'.
	sentence1 := 'sentence 1'.
	sentence2 := 'sentence 2'.
	
	aSentenceFinder push: sentence1.
	anotherSentenceFinder push: sentence1.
	
	aSentenceFinder push: sentence2.
	anotherSentenceFinder push: sentence2.

	aSentenceFinder find: sentence.
	
	self assert: aSentenceFinder equals: anotherSentenceFinder.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'Frank 10/31/2021 18:02:24'!
top
	[ ^ elements at: (elements size) ] on: Error do: [ self error: OOStack stackEmptyErrorDescription ].! !


!OOStack methodsFor: 'testing' stamp: 'Frank 10/31/2021 17:22:07'!
isEmpty
	^ elements size = 0.! !

!OOStack methodsFor: 'testing' stamp: 'Frank 10/31/2021 17:33:55'!
size
	^ elements size.! !


!OOStack methodsFor: 'initialization' stamp: 'Frank 10/31/2021 17:22:19'!
initialize
	elements := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'Frank 10/31/2021 19:29:17'!
pop
	[ ^ elements removeLast ] on: Error do: [ self error: OOStack stackEmptyErrorDescription ].! !

!OOStack methodsFor: 'operations' stamp: 'Frank 10/31/2021 17:28:18'!
push: aData
	elements addLast: aData.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'Frank 10/31/2021 17:47:05'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentenceStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Frank 10/31/2021 18:14:39'!
initialize
	sentenceStack := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'Frank 10/31/2021 20:27:41'!
= aSentenceFinder
	^ (self getAllInOrder) = (aSentenceFinder getAllInOrder)! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'Frank 10/31/2021 18:15:23'!
isEmpty
	^ sentenceStack isEmpty.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'Frank 10/31/2021 19:46:53'!
push: aSentence
	(aSentence isKindOf: String) ifFalse: [ self error: SentenceFinderByPrefix invalidSentenceErrorDescription ].
	aSentence isEmpty ifTrue: [ self error: SentenceFinderByPrefix emptySentenceErrorDescription ].
	sentenceStack push: aSentence.! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'Frank 10/31/2021 19:02:53'!
find: aSentence
	| auxStack matchingSentences |
	sentenceStack isEmpty ifTrue: [ self error: SentenceFinderByPrefix emptySentenceFinderErrorDescription ].
	auxStack := OOStack new.
	matchingSentences := OrderedCollection new.
	[ sentenceStack isEmpty not ] whileTrue: [
		auxStack push: sentenceStack pop.
		(auxStack top includesSubstring: aSentence caseSensitive: true ) ifTrue: [ matchingSentences add: auxStack top ].
		].
	[ auxStack isEmpty not ] whileTrue: [
		sentenceStack push: auxStack pop.
		].
	^ matchingSentences.! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'Frank 10/31/2021 20:26:46'!
getAllInOrder
	| sentences auxStack |
	auxStack := OOStack new.
	sentences := OrderedCollection new.
	[ sentenceStack isEmpty not ] whileTrue: [
		auxStack push: sentenceStack pop.
		sentences add: auxStack top ].
	[ auxStack isEmpty not ] whileTrue: [
		sentenceStack push: auxStack pop.
		].
	^ (sentences reversed).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Frank 10/31/2021 18:23:57'!
emptySentenceErrorDescription
	^ 'Sentence is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Frank 10/31/2021 18:32:08'!
emptySentenceFinderErrorDescription
	^ 'SentenceFinder is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'Frank 10/31/2021 19:46:31'!
invalidSentenceErrorDescription
	^ 'The sentence is invalid'.! !

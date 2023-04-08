(define (domain freecell)
  (:requirements :strips :typing)
  (:types
    card num suit
  )
  (:predicates
    (value ?card - card ?value - num)
    (suit ?card - card ?st - suit)
    (successor ?n1 - num ?n2 - num)
    (canstack ?card1 - card ?card2 - card)
    (on ?card1 - card ?card2 - card)
    (incell ?card - card)
    (clear ?card - card)
    (cellspace ?n - num)
    (colspace ?n - num)
    (home ?card - card)
    (bottomcol ?card - card)
  )

  ;; Move a card from a column with at least 2 cards to another one with at least one card
  (:action MoveFromColumnToColumn
    :parameters (?cardToBeMoved - card ?cardBelow - card ?targetCard - card)
    :precondition (and
      (clear ?cardToBeMoved)
      (clear ?targetCard)
      (canstack ?cardToBeMoved ?targetCard)
      (on ?cardToBeMoved ?cardBelow)
    )
    :effect (and
        (clear ?cardBelow)
        (on ?cardToBeMoved ?targetCard)
        (not (clear ?targetCard))
        (not (on ?cardToBeMoved ?cardBelow))
    )
  )

  ;;Move a card from a column with at least 2 cards to another column that is empty
  (:action MoveFromColumnToEmptyColumn
    :parameters (?cardToBeMoved - card ?cardBelow - card ?numOfFreeColumn - num ?predecessor - num)
    :precondition (and
      (clear ?cardToBeMoved)
      (on ?cardToBeMoved ?cardBelow)
      (colspace ?numOfFreeColumn)
      (successor ?numOfFreeColumn ?predecessor)
    )
    :effect (and
        (clear ?cardBelow)
        (bottomcol ?cardToBeMoved)
        (colspace ?predecessor)
        (not (colspace ?numOfFreeColumn))
        (not (on ?cardToBeMoved ?cardBelow))
    )
  )
  (:action SendACardToHomeFromColumn
      :parameters (?cardToBeMoved - card ?targetCard - card ?cardBelow - card ?cardToMoveValue - num ?targetValue - num ?cardSuit - suit)
      :precondition (and 
        (clear ?cardToBeMoved)
        (on ?cardToBeMoved ?cardBelow)
        (suit ?cardToBeMoved ?cardSuit)
        (suit ?targetCard ?cardSuit)
        (home ?targetCard)
        (value ?targetCard ?targetValue)
        (value ?cardToBeMoved ?cardToMoveValue)
        (successor ?cardToMoveValue ?targetValue)
      )
      :effect (and 
        (home ?cardToBeMoved)
        (clear ?cardBelow)
        (not (home ?targetCard))
        (not (clear ?targetCard))
        (not (on ?cardToBeMoved ?cardBelow))
        (not (clear ?cardToBeMoved))
      )
  )
  (:action SendACardToHomeFromColumnWithOneCard
      :parameters (?cardToBeMoved - card ?targetCard - card ?cardToMoveValue - num ?targetValue - num ?cardSuit - suit ?numOfFreeColumn - num ?succ - num)
      :precondition (and 
        (bottomcol ?cardToBeMoved)
        (colspace ?numOfFreeColumn)
        (successor ?succ ?numOfFreeColumn)
        (clear ?cardToBeMoved)
        (suit ?cardToBeMoved ?cardSuit)
        (suit ?targetCard ?cardSuit)
        (home ?targetCard)
        (value ?targetCard ?targetValue)
        (value ?cardToBeMoved ?cardToMoveValue)
        (successor ?cardToMoveValue ?targetValue)
      )
      :effect (and 
        (home ?cardToBeMoved)
        (not (home ?targetCard))
        (not (clear ?targetCard))
        (not (clear ?cardToBeMoved))
        (not (bottomcol ?cardToBeMoved))
        (colspace ?succ)
        (not(colspace ?numOfFreeColumn))
      )
  )
  (:action SendACardToFreeCellFromColumn
      :parameters (?cardToBeMoved - card ?cardBelow - card ?numOfFreeCells - num ?predecessor - num)
      :precondition (and 
        (clear ?cardToBeMoved)
        (on ?cardToBeMoved ?cardBelow)
        (cellspace ?numOfFreeCells)
        (successor ?numOfFreeCells ?predecessor)
      
      )
      :effect (and 
        (incell ?cardToBeMoved)
        (clear ?cardBelow)
        (cellspace ?predecessor)
        (not (clear ?cardToBeMoved))
        (not (on ?cardToBeMoved ?cardBelow))
        (not (cellspace ?numOfFreeCells))
      )
  )
  ;; Move a card from a freecell to home
  (:action SendFromFreecellToHome
      :parameters (?cardToBeMoved - card ?targetCard - card ?cardToMoveValue - num ?targetValue - num ?cardSuit - suit ?numOfFreeCells - num ?succ - num)
      :precondition (and
        (incell ?cardToBeMoved)
        (home ?targetCard)
        (suit ?cardToBeMoved ?cardSuit)
        (suit ?targetCard ?cardSuit)
        (cellspace ?numOfFreeCells)
        (successor ?succ ?numOfFreeCells)
        (value ?targetCard ?targetValue)
        (value ?cardToBeMoved ?cardToMoveValue)
        (successor ?cardToMoveValue ?targetValue)      
      )
      :effect (and 
        (home ?cardToBeMoved)
        (cellspace ?succ)
        (not (incell ?cardToBeMoved))
        (not (home ?targetCard))
        (not(cellspace ?numOfFreeCells))
      )
  )
  ;; Move a card from a freecell to a column with at least 1 cards
  (:action SendToColumnFromFreecell
      :parameters (?cardToBeMoved - card ?targetCard - card ?numOfFreeCells - num ?succ - num)
      :precondition (and 
        (incell ?cardToBeMoved)
        (clear ?targetCard)
        (cellspace ?numOfFreeCells)
        (canstack ?cardToBeMoved ?targetCard)
        (successor ?succ ?numOfFreeCells)
      )
      :effect (and 
        (on ?cardToBeMoved ?targetCard)
        (cellspace ?succ)
        (clear ?cardToBeMoved)
        (not (cellspace ?numOfFreeCells))
        (not (incell ?cardToBeMoved))
        (not (clear ?targetCard))
      )
  )
)
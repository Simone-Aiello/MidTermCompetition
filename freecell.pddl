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
  (:action SendACardToFreeCellFromColumnWithOneCard
      :parameters (?cardToBeMoved - card ?numOfFreeCells - num ?predecessorFreeCell - num ?numOfFreeColumn - num ?columnSucc - num)
      :precondition (and 
        (bottomcol ?cardToBeMoved)
        (clear ?cardToBeMoved)
        (cellspace ?numOfFreeCells)
        (colspace ?numOfFreeColumn)
        (successor ?numOfFreeCells ?predecessorFreeCell)
        (successor ?columnSucc ?numOfFreeColumn)
      
      )
      :effect (and 
        (incell ?cardToBeMoved)
        (cellspace ?predecessorFreeCell)
        (colspace ?columnSucc)
        (not (colspace ?numOfFreeColumn))
        (not (clear ?cardToBeMoved))
        (not (cellspace ?numOfFreeCells))
        (not (bottomcol ?cardToBeMoved))
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
  (:action SendACardFToColumnWithOneCardFromFreecell
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
;;; FreeCellWorld
;;; Free cell game playing domain
;;;
;;; Originally written by Nolan Andres and Robert HillHouse (CS
;;; 486/686 Final Project) 
;;;
;;; Adapted from TLPLAN to STRIPS. In particular removed all functions
;;; and arithmetic. 
;;;
;;; Description
;;; ------------
;;; Freecell is a solitaire game that comes with Windows.
;;; If you haven't seen it before:
;;;  One has 8 columns of cards, 4 freecells and 4 homecells. The
;;;  cards start in "random" (random according to MS's brain damaged RNG)
;;;  piles in the 8 columns. We can move a card in the following ways: 
;;;  1. we can move any card that is on top of a column to an empty free
;;;     cell. The free cells only take one card each.
;;;  2. we can move any card from a free cell or from top of a column to
;;;  a home cell if that home cell contains a card of the same suit
;;;  and is one lower in value (aces have value 1, Jacks 11, Queens
;;;  12, Kings 13, and to make things more symmetric we start the
;;;  homecells off containing "phone" cards with value 0.
;;;  3. we can move any card from the  top of a column or from a
;;;  freecell to the top of another column if that column currently holds
;;;  a card with an opposite colour suit that has one higher
;;;  value. 
;;;  4. we can move any card from a free cell or on top of a column to a
;;;  new column if there are less than 8 columns.
;;; The aim is to get all of the card home. 
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Cards are represented by the symbols 
;;;		ca, c2, ..., cj, cq, ck. - clubs
;;;		da, d2, ..., dj, dq, dk. - diamonds
;;;		ha, h2, ..., hj, hq, gk. - hearts
;;;		sa, s2, ..., sj, sq, sk. - spaces
;;;		(c0, d0, h0, s0 indicate an empty card of a certain suit).
;;; 
;;; Where:
;;;		c = clubs, d = diamonds, h = hearts, s = spades.
;;;		a = ace, j = jack, q = queen, k = king.
;;;
;;; Predicates (In Tlplan these were functions)
;;; 
;;; (value card val)       --- the face value of the card. (1, ..., 13)
;;; (suit card st)         --- the suit of the card. (c, d, h, s)
;;;   e.g., (value ca 1) (suit ca c)
;;; (successor n' n)       --- n' = n+1, for n=0,...,12, n'=1,...,13
;;;                        a cheap and dirty way to avoid using
;;;                        numbers. 
;;;                        Note 0 does not have a predecessor. This
;;;                        serves act as > 0 precondition
;;; (canstack card1 card2) --- card2 can be moved on a column having
;;;    	      	    	   card1 on top (point 3. above)
;;; (on card1 card2)	   --- card1 is on card2
;;; (incell card)	   --- card is in a freecell.
;;; (clear card)	   --- card is clear (i.e., on top of a column).
;;; (cellspace n)	   --- there are n free freecells.
;;;                                n = 0, 1, 2, 3, or 4
;;; (colspace n)	   --- there are n free columns. n=0,..,8
;;; (home card)		   --- card is a top card in a home stack.
;;;			    we use the special (home c0),
;;;			    (home d0), (home h0), (home s0).
;;;			    to indicate that home is empty for a
;;;			    particular suit.
;;; (bottomcol card)	   ---  card is at the bottom of a stack.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

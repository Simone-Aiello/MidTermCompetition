(define (problem freecell-2-1)
(:domain freecell)

    ;; D3 D4
    ;; DA S3 D2 SA
(:objects
    C0
    D0
    D3
    D4
    DA
    S3
    D2
    SA
 - card
    N8
    N7
    N6
    N5
    N4
    N3
    N13
    N12
    N11
    N9
    N10
    N1
    N2
    N0
 - num
    S
    H
    D
    C
 - suit
)
(:init
    (SUCCESSOR N1 N0)
    (SUCCESSOR N10 N9)
    (SUCCESSOR N11 N10)
    (SUCCESSOR N12 N11)
    (SUCCESSOR N13 N12)
    (SUCCESSOR N2 N1)
    (SUCCESSOR N3 N2)
    (SUCCESSOR N4 N3)
    (SUCCESSOR N5 N4)
    (SUCCESSOR N6 N5)
    (SUCCESSOR N7 N6)
    (SUCCESSOR N8 N7)
    (SUCCESSOR N9 N8)
    (CANSTACK D2 S3)
    (CANSTACK S3 D4)
    (CANSTACK D2 S3)
    (CANSTACK SA D2)
    (HOME C0)
    (HOME D0)
    (VALUE D0 N0)
    (VALUE D3 N3)
    (VALUE D4 N4)
    (VALUE DA N1)
    (VALUE D2 N2)
    (VALUE S3 N3)
    (VALUE SA N1)
    (SUIT D0 D)
    (SUIT D3 D)
    (SUIT D4 D)
    (SUIT DA D)
    (SUIT D2 D)
    (SUIT S3 S)
    (SUIT SA S)

    ;; D3 D4
    ;; DA S3 D2 SA
    (CELLSPACE N4)
    (COLSPACE N6)
    (ON D4 D3)
    (ON S3 DA)
    (ON D2 S3)
    (ON SA D2)
    (CLEAR D4)
    (CLEAR SA)
    (BOTTOMCOL D3)
    (BOTTOMCOL DA)
)
(:goal (and
    (HOME DA)
)))
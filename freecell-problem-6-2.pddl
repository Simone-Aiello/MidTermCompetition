(define (problem freecell-6-2)
(:domain freecell)
(:objects
    S6
    H6
    D6
    C6
    S5
    H5
    D5
    C5
    S4
    H4
    D4
    C4
    S3
    H3
    D3
    C3
    SA
    S2
    S0
    HA
    H2
    H0
    DA
    D2
    D0
    CA
    C2
    C0
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
    (VALUE C0 N0)
    (VALUE C2 N2)
    (VALUE C3 N3)
    (VALUE C4 N4)
    (VALUE C5 N5)
    (VALUE C6 N6)
    (VALUE CA N1)
    (VALUE D0 N0)
    (VALUE D2 N2)
    (VALUE D3 N3)
    (VALUE D4 N4)
    (VALUE D5 N5)
    (VALUE D6 N6)
    (VALUE DA N1)
    (VALUE H0 N0)
    (VALUE H2 N2)
    (VALUE H3 N3)
    (VALUE H4 N4)
    (VALUE H5 N5)
    (VALUE H6 N6)
    (VALUE HA N1)
    (VALUE S0 N0)
    (VALUE S2 N2)
    (VALUE S3 N3)
    (VALUE S4 N4)
    (VALUE S5 N5)
    (VALUE S6 N6)
    (VALUE SA N1)
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
    (SUIT C0 C)
    (SUIT C2 C)
    (SUIT C3 C)
    (SUIT C4 C)
    (SUIT C5 C)
    (SUIT C6 C)
    (SUIT CA C)
    (SUIT D0 D)
    (SUIT D2 D)
    (SUIT D3 D)
    (SUIT D4 D)
    (SUIT D5 D)
    (SUIT D6 D)
    (SUIT DA D)
    (SUIT H0 H)
    (SUIT H2 H)
    (SUIT H3 H)
    (SUIT H4 H)
    (SUIT H5 H)
    (SUIT H6 H)
    (SUIT HA H)
    (SUIT S0 S)
    (SUIT S2 S)
    (SUIT S3 S)
    (SUIT S4 S)
    (SUIT S5 S)
    (SUIT S6 S)
    (SUIT SA S)
    (CANSTACK C2 D3)
    (CANSTACK C2 H3)
    (CANSTACK C3 D4)
    (CANSTACK C3 H4)
    (CANSTACK C4 D5)
    (CANSTACK C4 H5)
    (CANSTACK C5 D6)
    (CANSTACK C5 H6)
    (CANSTACK CA D2)
    (CANSTACK CA H2)
    (CANSTACK D2 C3)
    (CANSTACK D2 S3)
    (CANSTACK D3 C4)
    (CANSTACK D3 S4)
    (CANSTACK D4 C5)
    (CANSTACK D4 S5)
    (CANSTACK D5 C6)
    (CANSTACK D5 S6)
    (CANSTACK DA C2)
    (CANSTACK DA S2)
    (CANSTACK H2 C3)
    (CANSTACK H2 S3)
    (CANSTACK H3 C4)
    (CANSTACK H3 S4)
    (CANSTACK H4 C5)
    (CANSTACK H4 S5)
    (CANSTACK H5 C6)
    (CANSTACK H5 S6)
    (CANSTACK HA C2)
    (CANSTACK HA S2)
    (CANSTACK S2 D3)
    (CANSTACK S2 H3)
    (CANSTACK S3 D4)
    (CANSTACK S3 H4)
    (CANSTACK S4 D5)
    (CANSTACK S4 H5)
    (CANSTACK S5 D6)
    (CANSTACK S5 H6)
    (CANSTACK SA D2)
    (CANSTACK SA H2)
    (HOME C0)
    (HOME D0)
    (HOME H0)
    (HOME S0)
    (CELLSPACE N4)
    (COLSPACE N1)
    (ON C6 H6)
    (ON CA D5)
    (ON D3 S2)
    (ON D5 D2)
    (ON D6 C2)
    (ON H2 C5)
    (ON H3 HA)
    (ON H4 S4)
    (ON H5 S3)
    (ON H6 C3)
    (ON HA D4)
    (ON S2 C6)
    (ON S3 S6)
    (ON S4 D6)
    (ON S5 DA)
    (ON S6 C4)
    (ON SA H3)
    (CLEAR CA)
    (CLEAR D3)
    (CLEAR H2)
    (CLEAR H4)
    (CLEAR H5)
    (CLEAR S5)
    (CLEAR SA)
    (BOTTOMCOL C2)
    (BOTTOMCOL C3)
    (BOTTOMCOL C4)
    (BOTTOMCOL C5)
    (BOTTOMCOL D2)
    (BOTTOMCOL D4)
    (BOTTOMCOL DA)
)
(:goal (and
    (HOME C6)
    (HOME D6)
    (HOME H6)
    (HOME S6)
)))
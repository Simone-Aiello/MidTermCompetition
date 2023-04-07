(define (problem freecell-3-1)
(:domain freecell)
(:objects
    C0
    CA
    C2
    C3
    C4
    C5
    C6
    C7
    C8
    C9
    C10
    C11
    C12
    C13
    S0
    SA
    S2
    S3
    S4
    S5
    S6
    S7
    S8
    S9
    S10
    S11
    S12
    S13
    H0
    HA
    H2
    H3
    H4
    H5
    H6
    H7
    H8
    H9
    H10
    H11
    H12
    H13
    D0
    DA
    D2
    D3
    D4
    D5
    D6
    D7
    D8
    D9
    D10
    D11
    D12
    D13
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
    (VALUE CA N1)
    (VALUE C2 N2)
    (VALUE C3 N3)
    (VALUE C4 N4)
    (VALUE C5 N5)
    (VALUE C6 N6)
    (VALUE C7 N7)
    (VALUE C8 N8)
    (VALUE C9 N9)
    (VALUE C10 N10)
    (VALUE C11 N11)
    (VALUE C12 N12)
    (VALUE C13 N13)
    (VALUE D0 N0)
    (VALUE DA N1)
    (VALUE D2 N2)
    (VALUE D3 N3)
    (VALUE D4 N4)
    (VALUE D5 N5)
    (VALUE D6 N6)
    (VALUE D7 N7)
    (VALUE D8 N8)
    (VALUE D9 N9)
    (VALUE D10 N10)
    (VALUE D11 N11)
    (VALUE D12 N12)
    (VALUE D13 N13)
    (VALUE H0 N0)
    (VALUE HA N1)
    (VALUE H2 N2)
    (VALUE H3 N3)
    (VALUE H4 N4)
    (VALUE H5 N5)
    (VALUE H6 N6)
    (VALUE H7 N7)
    (VALUE H8 N8)
    (VALUE H9 N9)
    (VALUE H10 N10)
    (VALUE H11 N11)
    (VALUE H12 N12)
    (VALUE H13 N13)
    (VALUE S0 N0)
    (VALUE SA N1)
    (VALUE S2 N2)
    (VALUE S3 N3)
    (VALUE S4 N4)
    (VALUE S5 N5)
    (VALUE S6 N6)
    (VALUE S7 N7)
    (VALUE S8 N8)
    (VALUE S9 N9)
    (VALUE S10 N10)
    (VALUE S11 N11)
    (VALUE S12 N12)
    (VALUE S13 N13)
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
    (SUIT CA C)
    (SUIT C2 C)
    (SUIT C3 C)
    (SUIT C4 C)
    (SUIT C5 C)
    (SUIT C6 C)
    (SUIT C7 C)
    (SUIT C8 C)
    (SUIT C9 C)
    (SUIT C10 C)
    (SUIT C11 C)
    (SUIT C12 C)
    (SUIT C13 C)
    (SUIT D0 D)
    (SUIT DA D)
    (SUIT D2 D)
    (SUIT D3 D)
    (SUIT D4 D)
    (SUIT D5 D)
    (SUIT D6 D)
    (SUIT D7 D)
    (SUIT D8 D)
    (SUIT D9 D)
    (SUIT D10 D)
    (SUIT D11 D)
    (SUIT D12 D)
    (SUIT D13 D)
    (SUIT S0 S)
    (SUIT SA S)
    (SUIT S2 S)
    (SUIT S3 S)
    (SUIT S4 S)
    (SUIT S5 S)
    (SUIT S6 S)
    (SUIT S7 S)
    (SUIT S8 S)
    (SUIT S9 S)
    (SUIT S10 S)
    (SUIT S11 S)
    (SUIT S12 S)
    (SUIT S13 S)
    (SUIT H0 H)
    (SUIT HA H)
    (SUIT H2 H)
    (SUIT H3 H)
    (SUIT H4 H)
    (SUIT H5 H)
    (SUIT H6 H)
    (SUIT H7 H)
    (SUIT H8 H)
    (SUIT H9 H)
    (SUIT H10 H)
    (SUIT H11 H)
    (SUIT H12 H)
    (SUIT H13 H)
    (CANSTACK CA D2)
    (CANSTACK CA H2)
    (CANSTACK C2 D3)
    (CANSTACK C2 H3)
    (CANSTACK C3 D4)
    (CANSTACK C3 H4)
    (CANSTACK C4 D5)
    (CANSTACK C4 H5)
    (CANSTACK C5 D6)
    (CANSTACK C5 H6)
    (CANSTACK C6 D7)
    (CANSTACK C6 H7)
    (CANSTACK C7 D8)
    (CANSTACK C7 H8)
    (CANSTACK C8 D9)
    (CANSTACK C8 H9)
    (CANSTACK C9 D10)
    (CANSTACK C9 H10)
    (CANSTACK C10 D11)
    (CANSTACK C10 H11)
    (CANSTACK C11 D12)
    (CANSTACK C11 H12)
    (CANSTACK C12 D13)
    (CANSTACK C12 H13)
    (CANSTACK SA D2)
    (CANSTACK SA H2)
    (CANSTACK S2 D3)
    (CANSTACK S2 H3)
    (CANSTACK S3 D4)
    (CANSTACK S3 H4)
    (CANSTACK S4 D5)
    (CANSTACK S4 H5)
    (CANSTACK S5 D6)
    (CANSTACK S5 H6)
    (CANSTACK S6 D7)
    (CANSTACK S6 H7)
    (CANSTACK S7 D8)
    (CANSTACK S7 H8)
    (CANSTACK S8 D9)
    (CANSTACK S8 H9)
    (CANSTACK S9 D10)
    (CANSTACK S9 H10)
    (CANSTACK S10 D11)
    (CANSTACK S10 H11)
    (CANSTACK S11 D12)
    (CANSTACK S11 H12)
    (CANSTACK S12 D13)
    (CANSTACK S12 H13)
    (CANSTACK DA C2)
    (CANSTACK DA S2)
    (CANSTACK D2 C3)
    (CANSTACK D2 S3)
    (CANSTACK D3 C4)
    (CANSTACK D3 S4)
    (CANSTACK D4 C5)
    (CANSTACK D4 S5)
    (CANSTACK D5 C6)
    (CANSTACK D5 S6)
    (CANSTACK D6 C7)
    (CANSTACK D6 S7)
    (CANSTACK D7 C8)
    (CANSTACK D7 S8)
    (CANSTACK D8 C9)
    (CANSTACK D8 S9)
    (CANSTACK D9 C10)
    (CANSTACK D9 S10)
    (CANSTACK D10 C11)
    (CANSTACK D10 S11)
    (CANSTACK D11 C12)
    (CANSTACK D11 S12)
    (CANSTACK D12 C13)
    (CANSTACK D12 S13)
    (CANSTACK HA C2)
    (CANSTACK HA S2)
    (CANSTACK H2 C3)
    (CANSTACK H2 S3)
    (CANSTACK H3 C4)
    (CANSTACK H3 S4)
    (CANSTACK H4 C5)
    (CANSTACK H4 S5)
    (CANSTACK H5 C6)
    (CANSTACK H5 S6)
    (CANSTACK H6 C7)
    (CANSTACK H6 S7)
    (CANSTACK H7 C8)
    (CANSTACK H7 S8)
    (CANSTACK H8 C9)
    (CANSTACK H8 S9)
    (CANSTACK H9 C10)
    (CANSTACK H9 S10)
    (CANSTACK H10 C11)
    (CANSTACK H10 S11)
    (CANSTACK H11 C12)
    (CANSTACK H11 S12)
    (CANSTACK H12 C13)
    (CANSTACK H12 S13)
    (HOME C0)
    (HOME D0)
    (HOME H0)
    (HOME S0)
    (CELLSPACE N4)
    (COLSPACE N0)
    (ON HA S10)
    (ON D5 HA)
    (ON S3 D5)
    (ON C11 S3)
    (ON D9 C11)
    (ON S4 D9)


    (ON SA D6)
    (ON S12 SA)
    (ON S8 S12)
    (ON C12 S8)
    (ON D10 C12)
    (ON DA D10)

    (ON S6 D2)
    (ON D3 S6)
    (ON H9 D3)
    (ON CA H9)
    (ON S5 CA)
    (ON S2 S5)


    (ON S9 C4)
    (ON S7 S9)
    (ON C8 S7)
    (ON H7 C8)
    (ON H6 H7)
    (ON H11 H6)


    (ON D13 C13)
    (ON C6 D13)
    (ON C2 C6)
    (ON S13 C2)
    (ON C7 S13)

    
    (ON H3 C10)
    (ON H13 H3)
    (ON H8 H13)
    (ON D11 H8)
    (ON C3 D11)

    (ON H10 H4)
    (ON C5 H10)
    (ON H2 C5)
    (ON D4 H2)
    (ON D12 D4)
    (ON S11 D12)


    (ON H5 D7)
    (ON C9 H5)
    (ON D8 C9)
    (ON H12 D8)

    (CLEAR H12)
    (CLEAR S11)
    (CLEAR C3)
    (CLEAR C7)
    (CLEAR H11)
    (CLEAR S2)
    (CLEAR DA)
    (CLEAR S4)

    (BOTTOMCOL S10)
    (BOTTOMCOL D6)
    (BOTTOMCOL D2)
    (BOTTOMCOL C4)
    (BOTTOMCOL C13)
    (BOTTOMCOL C10)
    (BOTTOMCOL H4)
    (BOTTOMCOL D7)
)
(:goal (and
    (HOME C13)
    (HOME D13)
    (HOME H13)
    (HOME S13)
)))
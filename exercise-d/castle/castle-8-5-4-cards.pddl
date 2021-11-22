(define (problem castle-8-5-4-cards)
(:domain beleaguered-castle)
; Pile 0: spade2 spade6 heart2 spade8 heart7 spade5
; Pile 1: club8 club2 diamond7 diamond2 club6 heart4
; Pile 2: spade3 diamond5 spade7 club5 club4 heart8
; Pile 3: club7 diamond6 club3 heart6 diamond3
; Pile 4: diamond4 diamond8 spade4 heart3 heart5
(:objects
    pile0
    pile1
    pile2
    pile3
    pile4
    clubA
    club2
    club3
    club4
    club5
    club6
    club7
    club8
    heartA
    heart2
    heart3
    heart4
    heart5
    heart6
    heart7
    heart8
    diamondA
    diamond2
    diamond3
    diamond4
    diamond5
    diamond6
    diamond7
    diamond8
    spadeA
    spade2
    spade3
    spade4
    spade5
    spade6
    spade7
    spade8
)
(:init
    (on spade2 pile0)
    (on spade6 spade2)
    (on heart2 spade6)
    (on spade8 heart2)
    (on heart7 spade8)
    (on spade5 heart7)
    (on club8 pile1)
    (on club2 club8)
    (on diamond7 club2)
    (on diamond2 diamond7)
    (on club6 diamond2)
    (on heart4 club6)
    (on spade3 pile2)
    (on diamond5 spade3)
    (on spade7 diamond5)
    (on club5 spade7)
    (on club4 club5)
    (on heart8 club4)
    (on club7 pile3)
    (on diamond6 club7)
    (on club3 diamond6)
    (on heart6 club3)
    (on diamond3 heart6)
    (on diamond4 pile4)
    (on diamond8 diamond4)
    (on spade4 diamond8)
    (on heart3 spade4)
    (on heart5 heart3)
    (clear spade5)
    (clear heart4)
    (clear heart8)
    (clear diamond3)
    (clear heart5)
    (clear clubA)
    (discarded clubA)
    (clear heartA)
    (discarded heartA)
    (clear diamondA)
    (discarded diamondA)
    (clear spadeA)
    (discarded spadeA)
    (has-consecutive-value clubA club2)
    (has-consecutive-value clubA heart2)
    (has-consecutive-value clubA diamond2)
    (has-consecutive-value clubA spade2)
    (has-consecutive-value club2 club3)
    (has-consecutive-value club2 heart3)
    (has-consecutive-value club2 diamond3)
    (has-consecutive-value club2 spade3)
    (has-consecutive-value club3 club4)
    (has-consecutive-value club3 heart4)
    (has-consecutive-value club3 diamond4)
    (has-consecutive-value club3 spade4)
    (has-consecutive-value club4 club5)
    (has-consecutive-value club4 heart5)
    (has-consecutive-value club4 diamond5)
    (has-consecutive-value club4 spade5)
    (has-consecutive-value club5 club6)
    (has-consecutive-value club5 heart6)
    (has-consecutive-value club5 diamond6)
    (has-consecutive-value club5 spade6)
    (has-consecutive-value club6 club7)
    (has-consecutive-value club6 heart7)
    (has-consecutive-value club6 diamond7)
    (has-consecutive-value club6 spade7)
    (has-consecutive-value club7 club8)
    (has-consecutive-value club7 heart8)
    (has-consecutive-value club7 diamond8)
    (has-consecutive-value club7 spade8)
    (has-consecutive-value heartA club2)
    (has-consecutive-value heartA heart2)
    (has-consecutive-value heartA diamond2)
    (has-consecutive-value heartA spade2)
    (has-consecutive-value heart2 club3)
    (has-consecutive-value heart2 heart3)
    (has-consecutive-value heart2 diamond3)
    (has-consecutive-value heart2 spade3)
    (has-consecutive-value heart3 club4)
    (has-consecutive-value heart3 heart4)
    (has-consecutive-value heart3 diamond4)
    (has-consecutive-value heart3 spade4)
    (has-consecutive-value heart4 club5)
    (has-consecutive-value heart4 heart5)
    (has-consecutive-value heart4 diamond5)
    (has-consecutive-value heart4 spade5)
    (has-consecutive-value heart5 club6)
    (has-consecutive-value heart5 heart6)
    (has-consecutive-value heart5 diamond6)
    (has-consecutive-value heart5 spade6)
    (has-consecutive-value heart6 club7)
    (has-consecutive-value heart6 heart7)
    (has-consecutive-value heart6 diamond7)
    (has-consecutive-value heart6 spade7)
    (has-consecutive-value heart7 club8)
    (has-consecutive-value heart7 heart8)
    (has-consecutive-value heart7 diamond8)
    (has-consecutive-value heart7 spade8)
    (has-consecutive-value diamondA club2)
    (has-consecutive-value diamondA heart2)
    (has-consecutive-value diamondA diamond2)
    (has-consecutive-value diamondA spade2)
    (has-consecutive-value diamond2 club3)
    (has-consecutive-value diamond2 heart3)
    (has-consecutive-value diamond2 diamond3)
    (has-consecutive-value diamond2 spade3)
    (has-consecutive-value diamond3 club4)
    (has-consecutive-value diamond3 heart4)
    (has-consecutive-value diamond3 diamond4)
    (has-consecutive-value diamond3 spade4)
    (has-consecutive-value diamond4 club5)
    (has-consecutive-value diamond4 heart5)
    (has-consecutive-value diamond4 diamond5)
    (has-consecutive-value diamond4 spade5)
    (has-consecutive-value diamond5 club6)
    (has-consecutive-value diamond5 heart6)
    (has-consecutive-value diamond5 diamond6)
    (has-consecutive-value diamond5 spade6)
    (has-consecutive-value diamond6 club7)
    (has-consecutive-value diamond6 heart7)
    (has-consecutive-value diamond6 diamond7)
    (has-consecutive-value diamond6 spade7)
    (has-consecutive-value diamond7 club8)
    (has-consecutive-value diamond7 heart8)
    (has-consecutive-value diamond7 diamond8)
    (has-consecutive-value diamond7 spade8)
    (has-consecutive-value spadeA club2)
    (has-consecutive-value spadeA heart2)
    (has-consecutive-value spadeA diamond2)
    (has-consecutive-value spadeA spade2)
    (has-consecutive-value spade2 club3)
    (has-consecutive-value spade2 heart3)
    (has-consecutive-value spade2 diamond3)
    (has-consecutive-value spade2 spade3)
    (has-consecutive-value spade3 club4)
    (has-consecutive-value spade3 heart4)
    (has-consecutive-value spade3 diamond4)
    (has-consecutive-value spade3 spade4)
    (has-consecutive-value spade4 club5)
    (has-consecutive-value spade4 heart5)
    (has-consecutive-value spade4 diamond5)
    (has-consecutive-value spade4 spade5)
    (has-consecutive-value spade5 club6)
    (has-consecutive-value spade5 heart6)
    (has-consecutive-value spade5 diamond6)
    (has-consecutive-value spade5 spade6)
    (has-consecutive-value spade6 club7)
    (has-consecutive-value spade6 heart7)
    (has-consecutive-value spade6 diamond7)
    (has-consecutive-value spade6 spade7)
    (has-consecutive-value spade7 club8)
    (has-consecutive-value spade7 heart8)
    (has-consecutive-value spade7 diamond8)
    (has-consecutive-value spade7 spade8)
    (has-consecutive-value clubA pile0)
    (has-consecutive-value club2 pile0)
    (has-consecutive-value club3 pile0)
    (has-consecutive-value club4 pile0)
    (has-consecutive-value club5 pile0)
    (has-consecutive-value club6 pile0)
    (has-consecutive-value club7 pile0)
    (has-consecutive-value club8 pile0)
    (has-consecutive-value heartA pile0)
    (has-consecutive-value heart2 pile0)
    (has-consecutive-value heart3 pile0)
    (has-consecutive-value heart4 pile0)
    (has-consecutive-value heart5 pile0)
    (has-consecutive-value heart6 pile0)
    (has-consecutive-value heart7 pile0)
    (has-consecutive-value heart8 pile0)
    (has-consecutive-value diamondA pile0)
    (has-consecutive-value diamond2 pile0)
    (has-consecutive-value diamond3 pile0)
    (has-consecutive-value diamond4 pile0)
    (has-consecutive-value diamond5 pile0)
    (has-consecutive-value diamond6 pile0)
    (has-consecutive-value diamond7 pile0)
    (has-consecutive-value diamond8 pile0)
    (has-consecutive-value spadeA pile0)
    (has-consecutive-value spade2 pile0)
    (has-consecutive-value spade3 pile0)
    (has-consecutive-value spade4 pile0)
    (has-consecutive-value spade5 pile0)
    (has-consecutive-value spade6 pile0)
    (has-consecutive-value spade7 pile0)
    (has-consecutive-value spade8 pile0)
    (has-consecutive-value clubA pile1)
    (has-consecutive-value club2 pile1)
    (has-consecutive-value club3 pile1)
    (has-consecutive-value club4 pile1)
    (has-consecutive-value club5 pile1)
    (has-consecutive-value club6 pile1)
    (has-consecutive-value club7 pile1)
    (has-consecutive-value club8 pile1)
    (has-consecutive-value heartA pile1)
    (has-consecutive-value heart2 pile1)
    (has-consecutive-value heart3 pile1)
    (has-consecutive-value heart4 pile1)
    (has-consecutive-value heart5 pile1)
    (has-consecutive-value heart6 pile1)
    (has-consecutive-value heart7 pile1)
    (has-consecutive-value heart8 pile1)
    (has-consecutive-value diamondA pile1)
    (has-consecutive-value diamond2 pile1)
    (has-consecutive-value diamond3 pile1)
    (has-consecutive-value diamond4 pile1)
    (has-consecutive-value diamond5 pile1)
    (has-consecutive-value diamond6 pile1)
    (has-consecutive-value diamond7 pile1)
    (has-consecutive-value diamond8 pile1)
    (has-consecutive-value spadeA pile1)
    (has-consecutive-value spade2 pile1)
    (has-consecutive-value spade3 pile1)
    (has-consecutive-value spade4 pile1)
    (has-consecutive-value spade5 pile1)
    (has-consecutive-value spade6 pile1)
    (has-consecutive-value spade7 pile1)
    (has-consecutive-value spade8 pile1)
    (has-consecutive-value clubA pile2)
    (has-consecutive-value club2 pile2)
    (has-consecutive-value club3 pile2)
    (has-consecutive-value club4 pile2)
    (has-consecutive-value club5 pile2)
    (has-consecutive-value club6 pile2)
    (has-consecutive-value club7 pile2)
    (has-consecutive-value club8 pile2)
    (has-consecutive-value heartA pile2)
    (has-consecutive-value heart2 pile2)
    (has-consecutive-value heart3 pile2)
    (has-consecutive-value heart4 pile2)
    (has-consecutive-value heart5 pile2)
    (has-consecutive-value heart6 pile2)
    (has-consecutive-value heart7 pile2)
    (has-consecutive-value heart8 pile2)
    (has-consecutive-value diamondA pile2)
    (has-consecutive-value diamond2 pile2)
    (has-consecutive-value diamond3 pile2)
    (has-consecutive-value diamond4 pile2)
    (has-consecutive-value diamond5 pile2)
    (has-consecutive-value diamond6 pile2)
    (has-consecutive-value diamond7 pile2)
    (has-consecutive-value diamond8 pile2)
    (has-consecutive-value spadeA pile2)
    (has-consecutive-value spade2 pile2)
    (has-consecutive-value spade3 pile2)
    (has-consecutive-value spade4 pile2)
    (has-consecutive-value spade5 pile2)
    (has-consecutive-value spade6 pile2)
    (has-consecutive-value spade7 pile2)
    (has-consecutive-value spade8 pile2)
    (has-consecutive-value clubA pile3)
    (has-consecutive-value club2 pile3)
    (has-consecutive-value club3 pile3)
    (has-consecutive-value club4 pile3)
    (has-consecutive-value club5 pile3)
    (has-consecutive-value club6 pile3)
    (has-consecutive-value club7 pile3)
    (has-consecutive-value club8 pile3)
    (has-consecutive-value heartA pile3)
    (has-consecutive-value heart2 pile3)
    (has-consecutive-value heart3 pile3)
    (has-consecutive-value heart4 pile3)
    (has-consecutive-value heart5 pile3)
    (has-consecutive-value heart6 pile3)
    (has-consecutive-value heart7 pile3)
    (has-consecutive-value heart8 pile3)
    (has-consecutive-value diamondA pile3)
    (has-consecutive-value diamond2 pile3)
    (has-consecutive-value diamond3 pile3)
    (has-consecutive-value diamond4 pile3)
    (has-consecutive-value diamond5 pile3)
    (has-consecutive-value diamond6 pile3)
    (has-consecutive-value diamond7 pile3)
    (has-consecutive-value diamond8 pile3)
    (has-consecutive-value spadeA pile3)
    (has-consecutive-value spade2 pile3)
    (has-consecutive-value spade3 pile3)
    (has-consecutive-value spade4 pile3)
    (has-consecutive-value spade5 pile3)
    (has-consecutive-value spade6 pile3)
    (has-consecutive-value spade7 pile3)
    (has-consecutive-value spade8 pile3)
    (has-consecutive-value clubA pile4)
    (has-consecutive-value club2 pile4)
    (has-consecutive-value club3 pile4)
    (has-consecutive-value club4 pile4)
    (has-consecutive-value club5 pile4)
    (has-consecutive-value club6 pile4)
    (has-consecutive-value club7 pile4)
    (has-consecutive-value club8 pile4)
    (has-consecutive-value heartA pile4)
    (has-consecutive-value heart2 pile4)
    (has-consecutive-value heart3 pile4)
    (has-consecutive-value heart4 pile4)
    (has-consecutive-value heart5 pile4)
    (has-consecutive-value heart6 pile4)
    (has-consecutive-value heart7 pile4)
    (has-consecutive-value heart8 pile4)
    (has-consecutive-value diamondA pile4)
    (has-consecutive-value diamond2 pile4)
    (has-consecutive-value diamond3 pile4)
    (has-consecutive-value diamond4 pile4)
    (has-consecutive-value diamond5 pile4)
    (has-consecutive-value diamond6 pile4)
    (has-consecutive-value diamond7 pile4)
    (has-consecutive-value diamond8 pile4)
    (has-consecutive-value spadeA pile4)
    (has-consecutive-value spade2 pile4)
    (has-consecutive-value spade3 pile4)
    (has-consecutive-value spade4 pile4)
    (has-consecutive-value spade5 pile4)
    (has-consecutive-value spade6 pile4)
    (has-consecutive-value spade7 pile4)
    (has-consecutive-value spade8 pile4)
    (has-same-suit clubA clubA)
    (has-same-suit clubA club2)
    (has-same-suit clubA club3)
    (has-same-suit clubA club4)
    (has-same-suit clubA club5)
    (has-same-suit clubA club6)
    (has-same-suit clubA club7)
    (has-same-suit clubA club8)
    (has-same-suit club2 clubA)
    (has-same-suit club2 club2)
    (has-same-suit club2 club3)
    (has-same-suit club2 club4)
    (has-same-suit club2 club5)
    (has-same-suit club2 club6)
    (has-same-suit club2 club7)
    (has-same-suit club2 club8)
    (has-same-suit club3 clubA)
    (has-same-suit club3 club2)
    (has-same-suit club3 club3)
    (has-same-suit club3 club4)
    (has-same-suit club3 club5)
    (has-same-suit club3 club6)
    (has-same-suit club3 club7)
    (has-same-suit club3 club8)
    (has-same-suit club4 clubA)
    (has-same-suit club4 club2)
    (has-same-suit club4 club3)
    (has-same-suit club4 club4)
    (has-same-suit club4 club5)
    (has-same-suit club4 club6)
    (has-same-suit club4 club7)
    (has-same-suit club4 club8)
    (has-same-suit club5 clubA)
    (has-same-suit club5 club2)
    (has-same-suit club5 club3)
    (has-same-suit club5 club4)
    (has-same-suit club5 club5)
    (has-same-suit club5 club6)
    (has-same-suit club5 club7)
    (has-same-suit club5 club8)
    (has-same-suit club6 clubA)
    (has-same-suit club6 club2)
    (has-same-suit club6 club3)
    (has-same-suit club6 club4)
    (has-same-suit club6 club5)
    (has-same-suit club6 club6)
    (has-same-suit club6 club7)
    (has-same-suit club6 club8)
    (has-same-suit club7 clubA)
    (has-same-suit club7 club2)
    (has-same-suit club7 club3)
    (has-same-suit club7 club4)
    (has-same-suit club7 club5)
    (has-same-suit club7 club6)
    (has-same-suit club7 club7)
    (has-same-suit club7 club8)
    (has-same-suit club8 clubA)
    (has-same-suit club8 club2)
    (has-same-suit club8 club3)
    (has-same-suit club8 club4)
    (has-same-suit club8 club5)
    (has-same-suit club8 club6)
    (has-same-suit club8 club7)
    (has-same-suit club8 club8)
    (has-same-suit heartA heartA)
    (has-same-suit heartA heart2)
    (has-same-suit heartA heart3)
    (has-same-suit heartA heart4)
    (has-same-suit heartA heart5)
    (has-same-suit heartA heart6)
    (has-same-suit heartA heart7)
    (has-same-suit heartA heart8)
    (has-same-suit heart2 heartA)
    (has-same-suit heart2 heart2)
    (has-same-suit heart2 heart3)
    (has-same-suit heart2 heart4)
    (has-same-suit heart2 heart5)
    (has-same-suit heart2 heart6)
    (has-same-suit heart2 heart7)
    (has-same-suit heart2 heart8)
    (has-same-suit heart3 heartA)
    (has-same-suit heart3 heart2)
    (has-same-suit heart3 heart3)
    (has-same-suit heart3 heart4)
    (has-same-suit heart3 heart5)
    (has-same-suit heart3 heart6)
    (has-same-suit heart3 heart7)
    (has-same-suit heart3 heart8)
    (has-same-suit heart4 heartA)
    (has-same-suit heart4 heart2)
    (has-same-suit heart4 heart3)
    (has-same-suit heart4 heart4)
    (has-same-suit heart4 heart5)
    (has-same-suit heart4 heart6)
    (has-same-suit heart4 heart7)
    (has-same-suit heart4 heart8)
    (has-same-suit heart5 heartA)
    (has-same-suit heart5 heart2)
    (has-same-suit heart5 heart3)
    (has-same-suit heart5 heart4)
    (has-same-suit heart5 heart5)
    (has-same-suit heart5 heart6)
    (has-same-suit heart5 heart7)
    (has-same-suit heart5 heart8)
    (has-same-suit heart6 heartA)
    (has-same-suit heart6 heart2)
    (has-same-suit heart6 heart3)
    (has-same-suit heart6 heart4)
    (has-same-suit heart6 heart5)
    (has-same-suit heart6 heart6)
    (has-same-suit heart6 heart7)
    (has-same-suit heart6 heart8)
    (has-same-suit heart7 heartA)
    (has-same-suit heart7 heart2)
    (has-same-suit heart7 heart3)
    (has-same-suit heart7 heart4)
    (has-same-suit heart7 heart5)
    (has-same-suit heart7 heart6)
    (has-same-suit heart7 heart7)
    (has-same-suit heart7 heart8)
    (has-same-suit heart8 heartA)
    (has-same-suit heart8 heart2)
    (has-same-suit heart8 heart3)
    (has-same-suit heart8 heart4)
    (has-same-suit heart8 heart5)
    (has-same-suit heart8 heart6)
    (has-same-suit heart8 heart7)
    (has-same-suit heart8 heart8)
    (has-same-suit diamondA diamondA)
    (has-same-suit diamondA diamond2)
    (has-same-suit diamondA diamond3)
    (has-same-suit diamondA diamond4)
    (has-same-suit diamondA diamond5)
    (has-same-suit diamondA diamond6)
    (has-same-suit diamondA diamond7)
    (has-same-suit diamondA diamond8)
    (has-same-suit diamond2 diamondA)
    (has-same-suit diamond2 diamond2)
    (has-same-suit diamond2 diamond3)
    (has-same-suit diamond2 diamond4)
    (has-same-suit diamond2 diamond5)
    (has-same-suit diamond2 diamond6)
    (has-same-suit diamond2 diamond7)
    (has-same-suit diamond2 diamond8)
    (has-same-suit diamond3 diamondA)
    (has-same-suit diamond3 diamond2)
    (has-same-suit diamond3 diamond3)
    (has-same-suit diamond3 diamond4)
    (has-same-suit diamond3 diamond5)
    (has-same-suit diamond3 diamond6)
    (has-same-suit diamond3 diamond7)
    (has-same-suit diamond3 diamond8)
    (has-same-suit diamond4 diamondA)
    (has-same-suit diamond4 diamond2)
    (has-same-suit diamond4 diamond3)
    (has-same-suit diamond4 diamond4)
    (has-same-suit diamond4 diamond5)
    (has-same-suit diamond4 diamond6)
    (has-same-suit diamond4 diamond7)
    (has-same-suit diamond4 diamond8)
    (has-same-suit diamond5 diamondA)
    (has-same-suit diamond5 diamond2)
    (has-same-suit diamond5 diamond3)
    (has-same-suit diamond5 diamond4)
    (has-same-suit diamond5 diamond5)
    (has-same-suit diamond5 diamond6)
    (has-same-suit diamond5 diamond7)
    (has-same-suit diamond5 diamond8)
    (has-same-suit diamond6 diamondA)
    (has-same-suit diamond6 diamond2)
    (has-same-suit diamond6 diamond3)
    (has-same-suit diamond6 diamond4)
    (has-same-suit diamond6 diamond5)
    (has-same-suit diamond6 diamond6)
    (has-same-suit diamond6 diamond7)
    (has-same-suit diamond6 diamond8)
    (has-same-suit diamond7 diamondA)
    (has-same-suit diamond7 diamond2)
    (has-same-suit diamond7 diamond3)
    (has-same-suit diamond7 diamond4)
    (has-same-suit diamond7 diamond5)
    (has-same-suit diamond7 diamond6)
    (has-same-suit diamond7 diamond7)
    (has-same-suit diamond7 diamond8)
    (has-same-suit diamond8 diamondA)
    (has-same-suit diamond8 diamond2)
    (has-same-suit diamond8 diamond3)
    (has-same-suit diamond8 diamond4)
    (has-same-suit diamond8 diamond5)
    (has-same-suit diamond8 diamond6)
    (has-same-suit diamond8 diamond7)
    (has-same-suit diamond8 diamond8)
    (has-same-suit spadeA spadeA)
    (has-same-suit spadeA spade2)
    (has-same-suit spadeA spade3)
    (has-same-suit spadeA spade4)
    (has-same-suit spadeA spade5)
    (has-same-suit spadeA spade6)
    (has-same-suit spadeA spade7)
    (has-same-suit spadeA spade8)
    (has-same-suit spade2 spadeA)
    (has-same-suit spade2 spade2)
    (has-same-suit spade2 spade3)
    (has-same-suit spade2 spade4)
    (has-same-suit spade2 spade5)
    (has-same-suit spade2 spade6)
    (has-same-suit spade2 spade7)
    (has-same-suit spade2 spade8)
    (has-same-suit spade3 spadeA)
    (has-same-suit spade3 spade2)
    (has-same-suit spade3 spade3)
    (has-same-suit spade3 spade4)
    (has-same-suit spade3 spade5)
    (has-same-suit spade3 spade6)
    (has-same-suit spade3 spade7)
    (has-same-suit spade3 spade8)
    (has-same-suit spade4 spadeA)
    (has-same-suit spade4 spade2)
    (has-same-suit spade4 spade3)
    (has-same-suit spade4 spade4)
    (has-same-suit spade4 spade5)
    (has-same-suit spade4 spade6)
    (has-same-suit spade4 spade7)
    (has-same-suit spade4 spade8)
    (has-same-suit spade5 spadeA)
    (has-same-suit spade5 spade2)
    (has-same-suit spade5 spade3)
    (has-same-suit spade5 spade4)
    (has-same-suit spade5 spade5)
    (has-same-suit spade5 spade6)
    (has-same-suit spade5 spade7)
    (has-same-suit spade5 spade8)
    (has-same-suit spade6 spadeA)
    (has-same-suit spade6 spade2)
    (has-same-suit spade6 spade3)
    (has-same-suit spade6 spade4)
    (has-same-suit spade6 spade5)
    (has-same-suit spade6 spade6)
    (has-same-suit spade6 spade7)
    (has-same-suit spade6 spade8)
    (has-same-suit spade7 spadeA)
    (has-same-suit spade7 spade2)
    (has-same-suit spade7 spade3)
    (has-same-suit spade7 spade4)
    (has-same-suit spade7 spade5)
    (has-same-suit spade7 spade6)
    (has-same-suit spade7 spade7)
    (has-same-suit spade7 spade8)
    (has-same-suit spade8 spadeA)
    (has-same-suit spade8 spade2)
    (has-same-suit spade8 spade3)
    (has-same-suit spade8 spade4)
    (has-same-suit spade8 spade5)
    (has-same-suit spade8 spade6)
    (has-same-suit spade8 spade7)
    (has-same-suit spade8 spade8)
)
(:goal (and
    (discarded clubA)
    (discarded club2)
    (discarded club3)
    (discarded club4)
    (discarded club5)
    (discarded club6)
    (discarded club7)
    (discarded club8)
    (discarded heartA)
    (discarded heart2)
    (discarded heart3)
    (discarded heart4)
    (discarded heart5)
    (discarded heart6)
    (discarded heart7)
    (discarded heart8)
    (discarded diamondA)
    (discarded diamond2)
    (discarded diamond3)
    (discarded diamond4)
    (discarded diamond5)
    (discarded diamond6)
    (discarded diamond7)
    (discarded diamond8)
    (discarded spadeA)
    (discarded spade2)
    (discarded spade3)
    (discarded spade4)
    (discarded spade5)
    (discarded spade6)
    (discarded spade7)
    (discarded spade8)
)))

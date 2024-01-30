prtNum macro num
    ; limit 0-65535(2^16 -1)
           mov  bx, num
           mov  prtNumber, bx
           call prtNumP
endm
pow macro num,power
    ; Calculate power of number upto 65535
             mov   powOut, num
             cmp   power,1
             je    powEnd
             cmp   power,0
             je    powCase0
             mov   cx,power
             sub   cx,1
    powsec1: 
    powLoop: 
             mul16 powOut,num
             mov   bx, mul16Out    ; mult16out to powOut
             mov   powOut, bx
             loop  powLoop
             jmp   powEnd
    powCase0:
             mov   powOut,1
    powEnd:  
endm
mul16 macro num1,num2
    ; multiply two 16 bits number
    ; limit (1-65532 output answer)
    ; give output in mul16Out variable
          mov ax, num1
          mov bx, num2
          mul bx
          mov mul16Out, ax
endm
div16 macro dividend, divisor
    ; divide two 16 bit numbers
    ; give output in div16Qou and div16Rem variables
          mov ax,dividend
          mov dx,0
          mov bx,divisor
          div bx
          mov div16Quo,ax
          mov div16Rem,dx
endm
prtDgt macro digit
    ; print a digit
           mov dx, digit
           add dx, 48
           mov ah,2
           int 21h
endm
prtChar macro char
    ;print a character
            mov dl, char
            mov ah,2
            int 21h
endm
prtStr macro str
    ; print string
           mov dx,offset str
           mov ah,9
           int 21h
endm
prtStrAdr macro strAdr
    ; print string whose address given
              mov dx, strAdr
              mov ah,9
              int 21h
endm
prtlnStr macro str
    ;print string and with a newline
             mov  dx,offset str
             mov  ah,9
             int  21h
             call enterkey
endm
inputStr macro strVar
    ;Take a string input store it in give variable
             mov  inputStrAdd, offset strVar
             call inputStrP
endm
divnFltPrt macro dividend, divisor
    ; take two numbers in input divide them and print there output
               mov  divnFltPrtDividend, dividend
               mov  divnFltPrtDivisor, divisor
               call divnFltPrtP

endm
prtTab macro count
    ; print tabs in given count
           mov  prtTabCount, count
           call prtTabP
endm
.model small
.stack 100h
.data
    ; intro variables for intro page
    introStr1          db 10,13,"       @                               _                                  ,,  $"
    introStr2          db "    \\   _   @'                    ( )_                       .      _  \\    $"
    introStr3          db "     \\_( )_//                    / Y |                   .      /--( )_//    $"
    introStr4          db "       | Y/--                    /\   /               .        '//  \~ \      $"
    introStr5          db "       |_/       _ / o '         ( _\ /            .                   - \     $"
    introStr6          db "     _ //\      | | |    .       \_\\\        .                     //  \\--, $"
    introStr7          db "    /_// /      | | |      .    / \ \\\ .                           \\        $"
    introStr8          db "   / // /_______|_|_|__________/_/_\ \_______________________________\\______ $"
    introStr9          db 9,"   ___   __   _____  ___        __    ___   ___  __    __  __  $"
    introStr10         db 9,"  / __\ /__\  \_   \/ __\ /\ /\/ _\  / __\ /___\/__\  /__\/__\ $"
    introStr11         db 9," / /   / \//   / /\/ /   / //_/\ \  / /   //  // \// /_\ / \// $"
    introStr12         db 9,"/ /___/ _  \/\/ /_/ /___/ __ \ _\ \/ /___/ \_// _  \//__/ _  \ $"
    introStr13         db 9,"\____/\/ \_/\____/\____/\/  \/ \__/\____/\___/\/ \_/\__/\/ \_/ $"
    introStr14         db 9,"       +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+ +-+$"
    introStr15         db 9,"       |D| |E| |V| |E| |L| |O| |P| |E| |D|   |B| |Y| |:|$"
    introStr16         db 9,"       +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+ +-+$"
    introStr17         db 9,"       | S A R F A R A Z   A H M E D                   |$"
    introStr18         db 9,"       | A H M E D   I B R A H I M                     |$"
    introStr19         db 9,"       | U M A I R   U S M A N I                       |$"
    introStr20         db 9,"       | M U H A M M A D   E H S A N   A L I           |$"
    introStr21         db 9,"       | M U H A M M A D   Y O U S U F                 |$"
    introStr22         db 9,"       | A S S A D   A S H I Q   S H A R I F           |$"
    introStr23         db 9,"       | S Y E D   M U H A M M A D   M E H D I         |$"
    introStr24         db 9,"       +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+ +-+$"

    ; game heading str
    gameHeadStr1       db 9,"   ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ $"
    gameHeadStr2       db 9,"  ||C |||R |||I |||C |||K |||S |||C |||O |||R |||E |||R ||$"
    gameHeadStr3       db 9,"  ||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__||$"
    ; inputNum Variables
    inputNumOut        dw ?
    inputNumCount      dw ?
    ; mul16 variables
    mul16Out           dw ?
    ; pow variables
    powOut             dw ?
    ; div16 macro variables
    div16Quo           dw ?
    div16Rem           dw ?
    ; prtnumber macro variables
    prtNumber          dw ?
    ; inputStr macro variables
    inputStrAdd        dw ?
    ; divnFltPrt macro variables
    divnFltPrtDividend dw ?
    divnFltPrtDivisor  dw ?
    ; PrtTab macro variables
    prtTabCount        dw ?
    ; inpChar variables
    inpCharOut         db ?
    ; runOutProc variables
    runOutExtra        dw 0
    runOutRun          dw ?
    ;StumpProc variables
    stumpWide          dw 0

    ; Strings
    line               db "_____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ $"
    vsStr              db "  VS  $"
    fisrtIng           db "1st Inning: $"
    secIng             db "2nd Inning: $"
    runLine            db "run-wkt",9,9, "overs",9,9,"extras",9,9,"CRR$"
    oversStr           db "Overs$"
    ExtrasStr          db "Extras$"
    crrStr             db "CRR$"
    rrrStr             db "Req. RR$"
    PartnershipStr     db "Partnership $"
    targetStr          db "Target - $"
    need               db "Need $"
    runsoff            db " Runs off $"
    ballStr            db " balls $"
    drawStat           db "The game is a draw.$"
    ingEndStat         db "The first inning has ended." ,10,13, "Press any key to start the second inning: $"
    winByStr           db " won by $"
    runsStr            db " run/s.$"
    wicketsStr         db " wicket/es.$"

    ;String Variable
    team1Enter         db "Enter the name of the first team: $"
    team2Enter         db "Enter the name of the second team: $"
    totalOverInpStr    db "Enter the total number of overs to be played: $"
    tossChooseStr      db "Select the team that won the toss[1-2]:$"
    batBowlChooseStr   db 10, 13,"1- Bat",10,13, "2- Bowl",10,13, "The team has chosen to bat/bowl[1-2]:$"
    mainInput1         db "0", 9,9,"1", 9,9, "2", 9,9, "3", 9,9, "4", 9,9,"5",9,9,"6",9,9, "7", 9,9,"8",9,9,"9 $"
    mainInput2         db "l(leg bye)",9, "b(bye)",9,9, "w(wide)",9,9,"n(no ball)",9,"o(out)",10,13, "r(run out)",9,"s(stumped) $"
    legByeInputStr     db "1(1lb)",9,9, "2(2lb)",9,9,"3(3lb)",9,9,"4(4lb)",9,9,"5(5lb)",9,9,"6(6lb)",9,9,"7(7lb) $"
    byeInputStr        db "1(1b)",9,9, "2(2b)",9,9,"3(3b)",9,9,"4(4b)",9,9,"5(5b)",9,9,"6(6b)",9,9,"7(7b) $"
    wideInputStr       db "1(Wd)",9,9, "2(wd+1)",9,9,"3(wd+2)",9,9,"4(wd+3)",9,9,"5(wd+4)",9,9,"6(wd+5)",9,9,"7(7wd+6)",9,"8(wd+7) $"
    noballInputStr     db "1(Nb)",9,9, "2(2Nb)",9,9,"3(3Nb)",9,9,"4(4Nb)",9,9,"5(5Nb)",9,9,"6(6Nb)",9,9,"7(7Nb)",9,9,"8(8Nb) $"
    runOutInpStr1      db "Ball was a no ball or wide (y/n): $"
    runOutInpStr2      db "Runs(0-9): $"
    stumpInpStr        db "Ball was a wide (y/n): $"
    InputOptSel        db "Choose an option from above (one character only)(lower case): $"
    WrongInp           db "Wrong input, please choose again.$"
    WrongInp2          db "Wrong input. Press any key to re-enter. $"
    
    ; Strings
    team1              db 100 dup("$")
    team2              db 100 dup("$")
    ; game Variables
    Inning             dw 1
    runs               dw 0
    wickets            dw 0
    extras             dw 0
    ball               dw 0
    over               dw 0
    totalOvers         dw ?
    prtShipBall        dw 0
    prtShipRun         dw 0
    target             dw ?
    gameStatus         dw 0                                                                                                              ; 0 running, 1 ended
    drawStatus         dw 0                                                                                                              ; 0 running, 1 ended
    winningCond        dw ?                                                                                                              ; 1 for batting team and 2 for bowling team
    battingTeam        dw ?
    bowlingTeam        dw ?
    tossWonBy          dw ?

.code
Main Proc
                             mov        ax, @data
                             mov        ds,ax
                             call       intro
    ; Input Team names
                             call       clrScr
                             prtStr     team1Enter
                             inputStr   team1
                             prtStr     team2Enter
                             inputStr   team2
    ; Input TotalOvers
                             prtStr     totalOverInpStr
                             call       inputNum
                             mov        ax, inputNumOut
                             mov        totalOvers,ax

    ; input toss and decide batting and bowling tea
    TossChooseSec1:          
                             call       enterkey
                             prtChar    '1'
                             prtChar    '-'
                             prtChar    ' '
                             prtStr     team1
                             call       enterkey
                             prtChar    '2'
                             prtChar    '-'
                             prtChar    ' '
                             prtStr     team2
                             call       enterkey
                             prtStr     tossChooseStr
                             call       inpChar
    ; checking for correct input for toss
                             cmp        inpCharOut,'1'
                             je         TossChooseSec2
                             cmp        inpCharOut,'2'
                             je         TossChooseSec2
    ; Throw error if wrong input
                             call       enterkey
                             prtStr     WrongInp
                             call       enterkey
                             jmp        TossChooseSec1
    TossChooseSec2:          
                             mov        al, inpCharOut
                             mov        ah,0
                             sub        ax,48
                             mov        tossWonBy,ax
    TossChooseSec3:          
                             call       enterkey
                             prtStr     batBowlChooseStr
                             call       inpChar
    ; checking input for bat/bowl
                             cmp        inpCharOut,'1'
                             je         TossChooseSec4

                             cmp        inpCharOut,'2'
                             je         TossChooseSec4
    ;throw error for wrong input
                             call       enterkey
                             prtStr     WrongInp
                             call       enterkey
                             jmp        TossChooseSec3
    TossChooseSec4:          
                             cmp        tossWonBy,1
                             je         tossTeam1Sec
                             jmp        tossTeam2Sec
    ;if teamone win the toss
    tossTeam1Sec:            
                             cmp        inpCharOut, '1'
                             je         SelTeam1BatSec
                             jmp        SelTeam2BatSec


    ;if teamTwo win the toss
    tossTeam2Sec:            
                             cmp        inpCharOut, '1'
                             je         SelTeam2BatSec
                             jmp        SelTeam1BatSec

    ; Select Team one Batting team and team Two bowling team
    SelTeam1BatSec:          
                             mov        ax, offset team1
                             mov        battingTeam, ax
                             mov        ax, offset team2
                             mov        bowlingTeam, ax
                             jmp        gameStartSec

    ; Select Team one Batting team and team Two bowling team
    SelTeam2BatSec:          
                             mov        ax, offset team2
                             mov        battingTeam, ax
                             mov        ax, offset team1
                             mov        bowlingTeam, ax

    gameStartSec:            
                             call       updateScreen
                             cmp        gameStatus,1
                             je         programEnd2
                             call       inputNextBall
                             jmp        gameInputSec
    programEnd2:             
                             mov        ah,4ch
                             int        21h
    gameInputSec:            
                             call       inpChar
    ; 0-9 runs conditions if match
                             cmp        inpCharOut,'0'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'1'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'2'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'3'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'4'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'5'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'6'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'7'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'8'
                             je         zeroToNineHandler
                             cmp        inpCharOut,'9'
                             je         zeroToNineHandler
                             jmp        inputSec1
    ; Handle Zero to nine scores
    zeroToNineHandler:       
                             call       zeroToNineProc
                             jmp        gameStartSec
    inputSec1:               
    ; Leg bye condition
                             cmp        inpCharOut, 'l'
                             je         legByeHandler
                             jmp        inputsec2
    ; Handle leg bye situation
    legByeHandler:           
                             call       enterkey
                             prtStr     legByeInputStr
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     InputOptSel
                             call       inpChar
    ; checking for correct input
                             cmp        inpCharOut,'1'
                             je         callLegProcSec
                             cmp        inpCharOut,'2'
                             je         callLegProcSec
                             cmp        inpCharOut,'3'
                             je         callLegProcSec
                             cmp        inpCharOut,'4'
                             je         callLegProcSec
                             cmp        inpCharOut,'5'
                             je         callLegProcSec
                             cmp        inpCharOut,'6'
                             je         callLegProcSec
                             cmp        inpCharOut,'7'
                             je         callLegProcSec
    ; throw error for wrong input and star over input
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
    callLegProcSec:          
                             call       legByeProc
                             jmp        gameStartSec

    inputsec2:               
    ; bye condition
                             cmp        inpCharOut, 'b'
                             je         byeHandler
                             jmp        inputsec3
    ; handles bye condition
    byeHandler:              
                             call       enterkey
                             prtStr     byeInputStr
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     InputOptSel
                             call       inpChar
    ; checking for correct input
                             cmp        inpCharOut,'1'
                             je         callbyeProcSec
                             cmp        inpCharOut,'2'
                             je         callbyeProcSec
                             cmp        inpCharOut,'3'
                             je         callbyeProcSec
                             cmp        inpCharOut,'4'
                             je         callbyeProcSec
                             cmp        inpCharOut,'5'
                             je         callbyeProcSec
                             cmp        inpCharOut,'6'
                             je         callbyeProcSec
                             cmp        inpCharOut,'7'
                             je         callbyeProcSec
    ;Throw error for wrong input
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
                          
    callbyeProcSec:          
                             call       byeProc
                             jmp        gameStartSec

    inputsec3:               
    ; wide condition
                             cmp        inpCharOut, 'w'
                             je         wideHandler
                             jmp        inputsec4
    ;handles if input is wide
    wideHandler:             
                             call       enterkey
                             prtStr     wideInputStr
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     InputOptSel
                             call       inpChar
    ; checking for  correct input
                             cmp        inpCharOut,'1'
                             je         callwideProcSec
                             cmp        inpCharOut,'2'
                             je         callwideProcSec
                             cmp        inpCharOut,'3'
                             je         callwideProcSec
                             cmp        inpCharOut,'4'
                             je         callwideProcSec
                             cmp        inpCharOut,'5'
                             je         callwideProcSec
                             cmp        inpCharOut,'6'
                             je         callwideProcSec
                             cmp        inpCharOut,'7'
                             je         callwideProcSec
                             cmp        inpCharOut,'8'
                             je         callwideProcSec
    ; throw error for wrong input
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
    callwideProcSec:         
                             call       wideProc
                             jmp        gameStartSec

    inputSec4:               
    ; no ball condition
                             cmp        inpCharOut, 'n'
                             je         noballHandler
                             jmp        inputSec5
    ; handles if condition is no ball
    noballHandler:           
                             call       enterkey
                             prtStr     noballInputStr
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     InputOptSel
                             call       inpChar
    ; checking for correct input
                             cmp        inpCharOut,'1'
                             je         callnoballProcSec
                             cmp        inpCharOut,'2'
                             je         callnoballProcSec
                             cmp        inpCharOut,'3'
                             je         callnoballProcSec
                             cmp        inpCharOut,'4'
                             je         callnoballProcSec
                             cmp        inpCharOut,'5'
                             je         callnoballProcSec
                             cmp        inpCharOut,'6'
                             je         callnoballProcSec
                             cmp        inpCharOut,'7'
                             je         callnoballProcSec
                             cmp        inpCharOut,'8'
                             je         callnoballProcSec
    ;throw erorrs for input
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
    callnoballProcSec:       
                             call       noballProc
                             jmp        gameStartSec
    inputSec5:               
                             cmp        inpCharOut, 'o'                          ; out condition
                             je         outHandler
                             cmp        inpCharOut, 'r'                          ; run out condition
                             je         runOutHandler
                             cmp        inpCharOut, 's'                          ; stump out condition
                             je         stumpHandler
    ; throw erorr input character doesn't match to any desire input and try to take input again
                             call       enterkey
                             prtStr     WrongInp
                             call       enterkey
                             prtStr     InputOptSel
                             jmp        gameInputSec

    ; handles if inputs is out
    outHandler:              
                             call       outProc
                             jmp        gameStartSec
    ; handles of input in run out
    runOutHandler:           
                             call       enterkey
                             prtStr     runOutInpStr1
                             call       inpChar
    ; chekinng if ball was extra (noball/wide)
    ; if yes change change variable runOutExtra for handling it in procedure
                             cmp        inpCharOut, 'y'
                             je         runOutExtraSec
                             mov        runOutExtra,0
                             cmp        inpCharOut, 'n'
                             je         runOutHandlerSec1
    ;otherwise throw and take input again
                             jmp        runOutThrowErrorSec

    runOutHandlerSec1:       
    ; now take runs input
                             call       enterkey
                             prtstr     runOutInpStr2
                             call       inpChar
                             cmp        inpCharOut,'0'
                             jge        runOutHandlerSec2                        ; Jump if greater 0
    runOutHandlerSec2:       
                             cmp        inpCharOut,'9'                           ; checking for correct input in different method from above
                             jg         runOutThrowErrorSec                      ; if input doesn't match the desire input throw error
                             call       runOutProc
                             jmp        gameStartSec
    runOutExtraSec:          
                             mov        runOutExtra,1
                             jmp        runOutHandlerSec1
    ; throwing error and taking input again
    runOutThrowErrorSec:     
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
    ; handles stump condition
    stumpHandler:            
                             call       enterkey
                             prtStr     stumpInpStr
                             call       inpChar
    ; checking if ball is a wide or not and storing it in stumpwide variable for handling it in procedureS
                             cmp        inpCharOut, 'y'
                             je         stumpWideSec
                             cmp        inpCharOut, 'n'
                             mov        stumpWide,0
                             je         stumpHandlerSec1
    ;otherwise throw error and take input again
                             jmp        stumpThrowErrorSec
    stumpWideSec:            
                             mov        stumpWide,1                              ; if ball was a wide
    stumpHandlerSec1:        
                             call       stumpProc
                             jmp        gameStartSec
    ; Throw error and take input again
    stumpThrowErrorSec:      
                             call       enterkey
                             prtStr     WrongInp2
                             call       inpChar
                             jmp        gameStartSec
    ; Program end section it execute only game is draw or win by someone
    programEnd:              
                             mov        ah,4ch
                             int        21h

Main endp
intro proc
    ; print intro in a intersting manner
                             prtlnStr   introStr1
                             prtlnStr   introStr2
                             prtlnStr   introStr3
                             prtlnStr   introStr4
                             prtlnStr   introStr5
                             prtlnstr   introStr6
                             prtlnstr   introStr7
                             prtlnstr   introStr8
                             prtlnstr   introStr9
                             prtlnstr   introStr10
                             prtlnstr   introStr11
                             prtlnstr   introStr12
                             prtlnstr   introStr13
                             prtlnstr   introStr14
                             prtlnstr   introStr15
                             prtlnstr   introStr16
                             prtlnstr   introStr17
                             prtlnstr   introStr18
                             prtlnstr   introStr19
                             prtlnstr   introStr20
                             prtlnstr   introStr21
                             prtlnstr   introStr22
                             prtlnstr   introStr23
                             prtstr     introStr24
                             call       inpChar
                             ret
intro endp
inputNum proc
    ; take a number in input and give output in inputNumOut variable
    ; limit (0-65535)
    ; limitations - Don't recognize any other characters other 0-9 which leads to runtime error
                             mov        bx, '!'                                  ; using custom to identify end while poping
                             push       bx
    inputNumSec1:            
                             mov        ah,1
                             int        21h                                      ; taking Input the digit
                             cmp        al,13
                             je         inputNumSec2                             ; terminate when ennter
                             mov        ah,0
                             sub        ax,48
                             push       ax
                             jmp        inputNumSec1
                 

    inputNumSec2:            
                             mov        inputNumOut, 0
                             mov        inputNumCount, 0                         ; Count the digit value to give it that digit face value
    inputNumSec3:            
                             pow        10,inputNumCount                         ; Taking power to calculate the digit face value
                             pop        bx
                             cmp        bx,"!"
                             je         inputNumEnd                              ; end when reaches to terminator
                             mul16      bx,powOut                                ; multiply to digit and add inputNumOut for exact digit face vlaue
                             mov        bx, mul16Out
                             add        inputNumOut, bx
                             inc        inputNumCount                            ; increment the number for next digit and its face value
                             jmp        inputNumSec3
    inputNumEnd:             
                             ret
inputNum endp
enterkey proc
                             mov        dx,10
                             mov        ah,2
                             int        21h
                             mov        dx,13
                             mov        ah,2
                             int        21h
                             ret
enterkey endp
clrScr proc
    ; clearing screen by setting it to text mdoe
                             mov        al, 03h
                             mov        ah, 0
                             int        10h
                             ret
clrScr endp
inputStrP proc
    ; inputStr macro procedure
                             mov        si, inputStrAdd
    inputStrSec1:            
                             mov        ah,1
                             int        21h
                             cmp        al,13
                             je         inputStrEnd
                             mov        [si], al
                             inc        si
                             jmp        inputStrSec1
    inputStrEnd:             
                             ret
inputStrP endp
divnFltPrtP proc
    ;divnFltPrt macro procedure
                             div16      divnFltPrtDividend, divnFltPrtDivisor
                             mov        ax, div16Rem                             ; Push for that prtNum to not disturb
                             push       ax
                             prtNum     div16Quo
                             pop        ax
                             mov        div16Rem,ax
                             cmp        div16Rem,0
                             je         divnFltPrtEnd
                             prtChar    "."
                             mov        cx, 2
    divnFltPrtLoop:          
                             cmp        div16Rem,0
                             je         divnFltPrtEnd
                             mul16      div16Rem,10
                             div16      mul16Out, divnFltPrtDivisor
                             prtDgt     div16Quo
                             loop       divnFltPrtLoop

    divnFltPrtEnd:           
                             ret
divnFltPrtP endp
prtNumP proc
    ; prtNum macro procedure
    ; print multiple digit value by dividing it 10 and printing the reamaining part
                             mov        bx, '!'                                  ; using custom terminator to identify the last digit while poping
                             push       bx

    prtNumSec1:              
                             div16      prtNumber,10
                             add        div16Rem, 48
                             mov        bx, div16Rem
                             push       bx
                             cmp        div16Quo,0
                             je         prtNumSec2
                             mov        bx, div16Quo
                             mov        prtNumber,bx
                             jmp        prtNumSec1

    prtNumSec2:              
                             pop        dx
                             cmp        dx,'!'
                             je         prtNumEnd
                             mov        ah,2
                             int        21h
                             jmp        prtNumSec2
    prtNumEnd:               

                             ret
prtNumP endp
updateScreen proc
    ; updateScreen when variables changes during live match
                             call       clrScr
    ; printing app name
                             prtlnStr   gameHeadStr1
                             prtlnStr   gameHeadStr2
                             prtlnStr   gameHeadStr3
    ; print team one vs team two
                             call       enterkey
                             prtTab     3
                             prtStr     team1
                             prtStr     vsStr
                             prtStr     team2
                             call       enterkey
                             prtStr     line
                             call       enterkey
    ; checking whether it is first inning or second to print it
                             cmp        Inning,1
                             je         fisrtIngSec
                             prtStr     secIng
                             jmp        afterIngSec
    fisrtIngSec:             
                             prtStr     fisrtIng
    afterIngSec:             
    ; printing batting team after inning
                             prtStrAdr  battingTeam
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     runLine                                  ; line for run-wkt, extras, crr
    ; if inning = 2 print RRR (Required Run Rate)
                             cmp        Inning,2
                             jne        afterPrtRrrSec
                             prtTab     2
                             prtStr     rrrStr

    afterPrtRrrSec:          
    ;printing live run,wickets, ball,over,extras, crr
                             call       enterkey
                             prtnum     Runs
                             prtChar    '-'
                             prtNum     wickets
                             prtTab     2
                             prtNum     over
                             prtChar    '.'
                             prtnum     ball
                             prtChar    '/'
                             prtNum     totalOvers
                             prtTab     2
                             prtNum     extras
                             prtTab     2
                             call       prtCrr
    ; if inning = 2 print RRR Num (Required Run Rate)
                             cmp        Inning,2
                             jne        afterPrtNumRrrSec
                             prtTab     2
                             call       prtRrr

    afterPrtNumRrrSec:       
    ; print partnership runs and balls
                             call       enterkey
                             prtStr     PartnershipStr
                             prtNum     prtShipRun
                             prtChar    '('
                             prtNum     prtShipBall
                             prtChar    ')'
                             call       enterkey
                             cmp        Inning,1
                             je         updateScreenAftSecIng2
    ; If its second inning print target
                             prtStr     targetStr
                             prtNum     target
    ; checking if game ended or not
                             cmp        gameStatus,1
                             je         gameEndSec
    ; if game is not ended and its 2nd inning
    ; then printing ____ runs needs in ________ balls.
                             prtTab     2
                             call       prtNeedRun
                             call       enterkey
                             jmp        updateScreenAftSecIng
    ; if game ended
    gameEndSec:              
                             cmp        drawStatus,1                             ; checking for draw
                             je         gameDrawSec
                             cmp        winningCond,1                            ; 1 for batting team win
                             je         battingTeamWinSec
    ;else bowling team win
                             jmp        bowlingTeamWinSec
    ; if batting team win printing battingTeam win by _____ wickets.
    battingTeamWinSec:       
                             call       enterkey
                             prtStrAdr  battingTeam
                             prtStr     winByStr
                             mov        ax, 10
                             sub        ax, wickets
                             prtNum     ax
                             prtStr     wicketsStr
                             call       enterkey
    updateScreenAftSecIng2:                                                      ; for continue jumping to avoid out of range jump error
                             jmp        updateScreenAftSecIng
    ; if bowling team win then printing bowling team win by _______ runs.
    bowlingTeamWinSec:       
                             call       enterkey
                             prtStrAdr  bowlingTeam
                             prtStr     winByStr
                             mov        ax, target
                             sub        ax,runs
                             sub        ax,1
                             prtNum     ax
                             prtStr     runsStr
                             call       enterkey
                             jmp        updateScreenAftSecIng
    ; if it is draw then printing the game is draw.
    gameDrawSec:             
                             call       enterkey
                             prtStr     drawStat
                             call       enterkey

    updateScreenAftSecIng:   
                             prtStr     line
                             call       enterkey
                             ret
updateScreen endp
prtCrr proc
    ; print current run rate CRR
    ; Formula = (runs/balls)x6
                             cmp        over,0                                   ; if over and ball = 0 then run rate is over avoid divide by 0 condition
                             je         checkBallSec

    CalcSec:                 

                             mul16      runs, 6
                             mov        ax, mul16Out
                             push       ax
                             mul16      over, 6
                             mov        ax, mul16Out
                             add        ax,ball
                             pop        bx
                             divnFltPrt bx,ax
                             jmp        PrtCrrEnd

    checkBallSec:            
                             cmp        ball,0
                             jne        CalcSec
                             prtNum     0
    PrtCrrEnd:               
                             ret
prtCrr endp
prtRrr proc
    ; print required run rate RRR
    ; Formula = (reamaining runs/ reamaining balls)x6
                             mov        ax,over                                  ; if game ended by completing the over then RRR = 0
                             cmp        ax,totalOvers
                             je         PrtRrrEnd

    rrrCalcSec:              
    ; required runs x 6
                             mov        ax, target
                             sub        ax,runs
                             mul16      ax, 6
                             mov        ax, mul16Out
                             push       ax
    ; left balls
                             mov        ax, totalOvers
                             sub        ax, over
                             mul16      ax, 6
                             mov        ax, mul16Out
                             sub        ax, ball
    ; ( required runs x 6)/left balls
                             pop        bx
                             divnFltPrt bx,ax

    PrtRrrEnd:               
                             ret
prtRrr endp
prtTabP proc
    ; prtTab macro procedure
                             mov        cx, prtTabCount
    l1:                      
                             prtChar    9
                             loop       l1
                             ret
prtTabP endp
prtNeedRun proc
    ; calculate and print "_____ runs need for ______ balls" for second inning
    ; reamining run = target - runs
    ; remaining balls = (totalOVers - over)x6 - ball
                             prtStr     need
                             mov        ax, target
                             sub        ax, runs
                             prtNum     ax
                             prtStr     runsoff
                             mov        ax, totalOvers
                             sub        ax, over
                             mul16      ax, 6
                             mov        ax, mul16Out
                             sub        ax, ball
                             prtNum     ax
                             prtStr     ballStr

                             ret
prtNeedRun endp
inputNextBall proc
    ; print Next ball strings and options
                             prtStr     mainInput1
                             call       enterkey
                             prtStr     mainInput2
                             call       enterkey
                             prtStr     line
                             call       enterkey
                             prtStr     InputOptSel
                             ret
inputNextBall endp
inpChar proc
    ; input a character and give its output in inpCharOut variable
                             mov        ah,1
                             int        21h
                             mov        inpCharOut, al
                             ret
inpChar endp
checkGameStatus proc
    ; check game when first inning ended second inning started
                             cmp        Inning, 2
                             je         checkGameStatus2ndInnMid
    ; condition checks for First inning
    ; wickets = 10 - change to second inning
                             cmp        wickets,10
                             je         fstInnOverSec
    ; over = totalOver - change to second inning
                             mov        ax, totalOvers
                             cmp        over,ax
                             je         fstInnOverSec
                             jmp        checkGameStatusEnd
    checkGameStatus2ndInnMid:
                             jmp        checkGameStatus2ndInn
    ; Reset varibles for second second inning
    ; interchange batting and bowling team by checking current bowling and batting teams
    fstInnOverSec:           
                             mov        Inning,2
                             mov        ax, runs
                             mov        target,ax
                             add        target,1
                             mov        runs,0
                             mov        wickets,0
                             mov        ball,0
                             mov        over,0
                             mov        prtShipBall,0
                             mov        prtShipRun,0
                             mov        extras,0
                             cmp        battingTeam, offset team1
                             je         team2BatSec
    ; selecting team1 batting team and team2 bowling team for 2nd inning
                             mov        battingTeam, offset team1
                             mov        bowlingTeam, offset team2
    ;inputting a character to start second inning
                             call       clrScr
                             prtstr     ingEndStat
                             call       inpChar
                             jmp        checkGameStatusEnd
    team2BatSec:             
    ;selecting team2 batting team and team1 bowling team for 2nd inning
                             mov        battingTeam, offset team2
                             mov        bowlingTeam, offset team1
                             jmp        checkGameStatusEnd

    ; if its 2nd inning then cheking game status whether is draw or won by someone
    checkGameStatus2ndInn:   
    ; if targer => runs then game ended
                             mov        ax, target
                             cmp        runs,ax
                             jge        winByRunSec
    ; if wickets = 10 then game ended
                             cmp        wickets, 10
                             je         totalWktSec
    ; over = totalOver then game ended
                             mov        ax, totalOvers
                             cmp        over, ax
                             je         totalOverSec
                          

                             jmp        checkGameStatusEnd
    ; win by chasing run and winningCond = 1 means batting team won
    winByRunSec:             
                             mov        gameStatus,1
                             mov        winningCond,1
                             jmp        checkGameStatusEnd
    ; checking for draw in case if runs = target - 1
    ; if it is not draw then winningCond = 2 means bowling team won by all out case
    totalWktSec:             
                             mov        gameStatus,1
                             mov        ax,target
                             sub        ax,1
                             cmp        ax, runs
                             je         drawSec
                             mov        winningCond,2
                             jmp        checkGameStatusEnd
    ; checking for draw in case if runs = target -1
    ; if it is not draw the winningCod = 2 means bowlin team own stoping runs to be chased
    totalOverSec:            
                             mov        gameStatus,1
                             mov        ax,target
                             sub        ax,1
                             cmp        ax, runs
                             je         drawSec
                             mov        winningCond,2
                             jmp        checkGameStatusEnd
    ; if it is draw then drawStatus = 1 to handle it in other
    drawSec:                 
                             mov        drawStatus,1

    checkGameStatusEnd:      
                             ret
checkGameStatus endp
incBall proc
    ; increment balls and its over then increment over and initiliaze ball = 0
                             cmp        ball, 5
                             je         incOver
                             inc        ball
                             jmp        incBallEnd

    incOver:                 
                             mov        ball,0
                             inc        over
                  
    incBallEnd:              
                             ret

incBall endp
zeroToNineProc proc
    ; handle zero to nine run condition
    ; current runs + run
    ; ball + 1
    ; prtShipRun + run
    ; prtShipBall + 1
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             call       incBall
                             add        runs, ax
                             add        prtShipRun, ax
                             inc        prtShipBall
                             call       checkGameStatus
                             ret
zeroToNineProc endp
legByeProc proc
    ; handles leg bye condition
    ; current runs + runs
    ; ball + 1
    ; partShipRun + run
    ; partshipBall + 1
    ; extras + runs
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             call       incBall
                             add        runs, ax
                             add        prtShipRun, ax
                             inc        prtShipBall
                             add        extras, ax
                             call       checkGameStatus
                             ret
legByeProc endp
byeProc proc
    ; handlee bye condition
    ; current runs + runs
    ; ball + 1
    ; partShipRun + run
    ; partshipBall + 1
    ; extras + runs
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             call       incBall
                             add        runs, ax
                             add        prtShipRun, ax
                             inc        prtShipBall
                             add        extras, ax
                             call       checkGameStatus
                             ret
byeProc endp
noballProc proc
    ; handle no ball condition
    ; current run + runs
    ; prtshipBall + 1
    ; prtshiprun + runs
    ; extras + runs
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             add        runs, ax
                             add        prtShipRun, ax
                             inc        prtShipBall
                             add        extras, ax
                             call       checkGameStatus
                             ret
noballProc endp
wideProc proc
    ; handles wide condition
    ; current runs + runs
    ; prtshiprun + runs
    ; prtshipball + runs
    ; extras + runs
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             add        runs, ax
                             add        prtShipRun, ax
                             add        extras, ax
                             call       checkGameStatus
                             ret
wideProc endp
outProc proc
    ; handle out condition
    ; wickets + 1
    ; ball + 1
    ; prtshipBall = 0
    ; prtShipRun = 0
                             inc        wickets
                             call       incBall
                             mov        prtShipRun,0
                             mov        prtShipBall,0
                             call       checkGameStatus
                             ret
outProc endp
runOutProc proc
    ; handle runout condition
    ; extras + runs (only if runOutExtra = 1)
    ; ball  + 1 (only if runOutExtra = 0)
    ; current runs + runs
    ; prtshipBall = 0
    ;prtShipRun = 0
    ; wickets + 1
                             mov        al,inpCharOut
                             sub        al,48
                             mov        ah,0
                             cmp        runOutExtra,1                            ; if it is not a wide or no ball
                             je         runOutProcExtraSec
                             call       incBall
                             jmp        runOutProcEndSec
                          
    runOutProcExtraSec:      
                             add        extras,ax
    runOutProcEndSec:        
                             add        runs,ax
                             mov        prtShipBall,0
                             mov        prtShipRun,0
                             inc        wickets
                             call       checkGameStatus
                             ret
runOutProc endp
stumpProc proc
    ; handle stump condition
    ; extar + 1 (if stumpWide = 1)
    ; current runs + 1 ( if stumpWide =1)
    ; ball + 1 (if stumpWide = 0)
    ; prtshipBall = 0
    ; prtShipRun = 0
    ; wickets + 1
                             cmp        stumpWide,1                              ; if it is a wide
                             je         stumpProcWideSec
                             call       incBall
                             jmp        stumpProcEndSec
                          
    stumpProcWideSec:        
                             add        extras,1
                             add        runs,1
    stumpProcEndSec:         
                             mov        prtShipBall,0
                             mov        prtShipRun,0
                             inc        wickets
                             call       checkGameStatus
                             ret
stumpProc endp
End Main
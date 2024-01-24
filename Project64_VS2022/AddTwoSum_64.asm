ExitProcess proto
WriteString proto
ReadInt64 proto
ReadString proto
WriteInt64 proto
Crlf proto

.data
UserNamePrompt db "                 Enter User Name: ",0
PasswordPrompt db "                 Enter password for Login: ", 0
    InvalidPasswordPrompt db "Invalid password. Exiting.", 0
    SuccessPrompt db "Login successful.", 0
    String1 db "******************   'Welcome to BISTRO'   *****************", 0
    String2 db "1. Press to order food.", 0
    String3 db "2. Press to cancel.", 0
    StringInvalid db "Please Enter Correct Choice ",0
    String6 db "What would you like to order?", 0
    String7 db "1) Pizzas", 0
    String8 db "2) Burgers", 0
    String9 db "3) Sandwiches", 0
    String10 db "4) Biryani", 0

    PizzaFlavorPrompt db "Select Pizza Flavor:", 0
    String12 db "1) Margherita", 0
    String13 db "2) Pepperoni", 0
    String14 db "3) Veggie Supreme", 0

    PizzaSizePrompt db "Select Pizza Size:", 0
    String15 db "1) Small", 0
    String16 db "2) Medium", 0
    String17 db "3) Large", 0

    StringFlavorBPrompt db "Select flavor:", 0
    Stringc db "1) Cheese", 0
    Stringb db "2) BBQ", 0
    StringSizeBPrompt db "Select size:", 0
    Stringreg db "1) Regular", 0
    Stringlar db "2) Large", 0

    StringFlavorBRPrompt db "Select flavor:", 0
    Stringch db "1) Chicken", 0
    Stringsi db "2) Simple", 0
    StringSizeBRPrompt db "Select size:", 0
    Stringsin db "1) Single", 0
    Stringdou db "2) Double", 0

     StringSandwichFlavors db "1) Veggie Delight", 0
    StringSandwichSizes db "Select size for Sandwich:", 0
    StringSandwichSmall db "1) Small", 0
     StringSandwichMedium db "2) Medium", 0
     StringSandwichLarge   db "3) Large", 0
    StringSandwichInvalidSize db "Invalid size selection. Please try again.", 0

    StringQuantity db "Enter quantity:", 0
    String27 db "--------Your Order is Verified---------", 0
    StringBill db "Your Total Bill is: ", 0
    StringTime db "Your Order Will be delivered in 25 Minutes", 0
    Thanks db "Thank you For Ordering From Bistro", 0

    StringRecalculate db "   Press 1 to Recalculate.   ", 0
StringExit db "   Press 2 to EXIT.   ", 0
    pass dq ?
    name dq ?
    num dq ?
    quan dq ?
    res dq ?
.code
main proc
call crlf 
call crlf
mov rdx, offset UserNamePrompt
    call WriteString
    mov rcx, 10
    call readstring
; Ask for password
    mov rdx, offset PasswordPrompt
    call WriteString
    mov rax, 0
    call ReadInt64
    mov pass, rax

    cmp rax, 12345
    je Successful
    jmp invalid_login

    Successful:

     call crlf
     mov rdx, offset SuccessPrompt
    call WriteString
     call crlf
     main1:
     call crlf
     mov rdx, offset String1
    call WriteString
    call crlf
    mov rdx, offset String2
    call WriteString
    call crlf
    mov rdx, offset String3
    call WriteString
    call crlf

    mov rax, 0
    call ReadInt64
    mov num, rax

    cmp rax, 1
    je main2
    cmp rax, 2
    je exit_program
      cmp rax, num
    je Invalid

    Invalid:
     mov rdx, offset StringInvalid
    call WriteString
    call crlf
    jmp main1
    
    main2:
     mov rdx, offset String6
    call WriteString
    call crlf
    mov rdx, offset String7
    call WriteString
    call crlf
    mov rdx, offset String8
    call WriteString
    call crlf
    mov rdx, offset String9
    call WriteString
    call crlf
    mov rdx, offset String10
    call WriteString
    call crlf
  

    mov rax, 0
    call ReadInt64

    cmp rax, 1
    je Pizzas
    cmp rax, 2
    je Burgers
    cmp rax, 3
    je Sandwiches
    cmp rax, 4
    je Biryani

    Pizzas:
    mov rax, 0
    mov rdx, offset PizzaFlavorPrompt
    call WriteString
    call crlf
    mov rdx, offset String12
    call WriteString
    call crlf
    mov rdx, offset String13
    call WriteString
    call crlf
    mov rdx, offset String14
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    cmp rax, 1
    je Margherita
    cmp rax, 2
    je Pepperoni
    cmp rax, 3
    je VeggieSupreme

Margherita:
    ; Calculate the cost of Margherita
    mov rax, 600 ; Base cost
    jmp PizzaSizeSelection

Pepperoni:
    ; Calculate the cost of Pepperoni
    mov rax, 600 ; Base cost
    jmp PizzaSizeSelection

VeggieSupreme:
    ; Calculate the cost of Veggie Supreme
    mov rax, 600 ; Base cost
    jmp PizzaSizeSelection

PizzaSizeSelection:
    mov rdx, offset PizzaSizePrompt
    call WriteString
    call crlf
    mov rdx, offset String15
    call WriteString
    call crlf
    mov rdx, offset String16
    call WriteString
    call crlf
    mov rdx, offset String17
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    cmp rax, 1
    je Small
    cmp rax, 2
    je Medium
    cmp rax, 3
    je Large

Small:
    ; Calculate the cost for a Small pizza
    ; (you can adjust the cost accordingly)
    add rax, 600
    jmp CalculateBill

Medium:
    ; Calculate the cost for a Medium pizza
    ; (you can adjust the cost accordingly)
    add rax, 1000
    jmp CalculateBill

Large:
    ; Calculate the cost for a Large pizza
    ; (you can adjust the cost accordingly)
    add rax, 1600
    jmp CalculateBill

CalculateBill:
    mov quan, rax
    mov rdx, offset StringQuantity
    call WriteString
    call crlf
    call readint64
    mov rbx, rax

    mov rax, quan
    imul rax, rbx ; Multiply quantity with flavor and size cost
    mov res, rax

    jmp Bill


    Burgers:

     mov rax, 150
    
    ; Prompt for flavor
    mov rdx, offset StringFlavorBPrompt
    call WriteString
    call crlf
    mov rdx, offset Stringc
    call WriteString
    call crlf
    mov rdx, offset Stringb
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    ; Process flavor choice (you can add more flavors)
    cmp rax, 1
    je CheeseBurger
    cmp rax, 2
    je ZingerBurger
    ; add more flavor comparisons as needed

CheeseBurger:
    add rax, 250   ; add cost for CheeseBurger
    jmp SizeSelection

ZingerBurger:
    add rax, 350   ; add cost for ZingerBurger
    jmp SizeSelection

; Add more flavors with corresponding cost adjustments

SizeSelection:
    ; Prompt for size
    mov rdx, offset StringSizeBPrompt
    call WriteString
    call crlf
    mov rdx, offset Stringreg
    call WriteString
    call crlf
    mov rdx, offset Stringlar
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    ; Process size choice
    cmp rax, 1
    je RegularSize
    cmp rax, 2
    je LargeSize

RegularSize:
    ; No cost adjustment for regular size
    jmp CalculateBillB

LargeSize:
    add rax, 100   ; add cost for Large size

CalculateBillB:
    mov quan, rax
    mov rdx, offset StringQuantity
    call WriteString
    call crlf
    call readint64
    mov rbx, rax

    mov rax, quan
    imul rax, rbx ; Multiply quantity with flavor and size cost
    mov res, rax
    jmp Bill

    Sandwiches:
    mov rdx, offset StringSandwichFlavors
    call WriteString
    call crlf

    ; Display flavor options
    ; Add more flavors as needed
  

    mov rax, 0
    call ReadInt64
    cmp rax, 1
    je SandwichSizeSelection
    ; Add more flavor handling logic as needed

    jmp Bill

    SandwichSizeSelection:
    mov rdx, offset StringSandwichSizes
    call WriteString
    call crlf
    ; Display size options
    mov rdx, offset StringSandwichSmall
    call WriteString
    call crlf
    mov rdx, offset StringSandwichMedium
    call WriteString
    call crlf
    mov rdx, offset StringSandwichLarge
    call WriteString
    call crlf

    mov rax, 0
    call ReadInt64
    cmp rax, 1
    je SmallSandwich
    cmp rax, 2
    je MediumSandwich
    cmp rax, 3
    je LargeSandwich
    jmp SandwichSizeInvalid

    SmallSandwich:
    mov rax, 120  ; Price for small sandwich
    jmp CalculateBillS

MediumSandwich:
    mov rax, 150  ; Price for medium sandwich
    jmp CalculateBillS

LargeSandwich:
    mov rax, 180  ; Price for large sandwich
    jmp CalculateBillS

    SandwichSizeInvalid:
    mov rdx, offset StringSandwichInvalidSize
    call WriteString
    call crlf
    jmp SandwichSizeSelection

    CalculateBillS:
    mov quan, rax
    mov rdx, offset StringQuantity
    call WriteString
    call crlf
    call readint64
    mov rbx, rax

    mov rax, quan
    imul rax, rbx ; Multiply quantity with flavor and size cost
    mov res, rax
    jmp Bill


   
    Biryani:
    mov rax, 350
    
    ; Prompt for flavor
    mov rdx, offset StringFlavorBRPrompt
    call WriteString
    call crlf
    mov rdx, offset Stringch
    call WriteString
    call crlf
    mov rdx, offset Stringsi
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    ; Process flavor choice (you can add more flavors)
    cmp rax, 1
    je Chicken
    cmp rax, 2
    je Simple
    ; add more flavor comparisons as needed

Chicken:
    add rax, 400   ; add cost for CheeseBurger
    jmp SizeSelectionB

Simple:
    add rax, 300   ; add cost for BBQBurger
    jmp SizeSelectionB

; Add more flavors with corresponding cost adjustments

SizeSelectionB:
    ; Prompt for size
    mov rdx, offset StringSizeBRPrompt
    call WriteString
    call crlf
    mov rdx, offset Stringsin
    call WriteString
    call crlf
    mov rdx, offset Stringdou
    call WriteString
    call crlf
    mov rax, 0
    call ReadInt64

    ; Process size choice
    cmp rax, 1
    je singleSize
    cmp rax, 2
    je doubleSize

singleSize:
    ; No cost adjustment for regular size
    jmp CalculateBillBR

doubleSize:
    add rax, 50   ; add cost for Large size

CalculateBillBR:
    mov quan, rax
    mov rdx, offset StringQuantity
    call WriteString
    call crlf
    call readint64
    mov rbx, rax

    mov rax, quan
    imul rax, rbx ; Multiply quantity with flavor and size cost
    mov res, rax
    jmp Bill


    Bill:
    call crlf
    mov rdx, offset String27
    call WriteString
    call crlf
    mov rdx, offset StringBill
    call WriteString
    mov rax, res
    call WriteInt64
    call crlf
    mov rdx, offset StringTime
    call WriteString
    call crlf


    jmp optionsloop

    optionsloop:
                                  ; Display Thirty-Three String
    call crlf
    mov rdx, offset StringRecalculate           ;
    call WriteString
    ; Display Thirty-Three String
    call crlf
    mov rdx, offset StringExit
    call WriteString

    ; Read user's choice
    MOV RAX, 0
    call ReadInt64
    mov num, rax
    ; Process user's choice
    cmp rax, 1
    je recalculate
    cmp rax, 2
    je exit_program
    cmp rax,num
    je invalid1

    invalid1:
    mov rdx, offset StringInvalid
    call WriteString
    call crlf
    jmp optionsloop
recalculate:
    jmp main2

    invalid_login:
    mov rdx, offset InvalidPasswordPrompt
    call WriteString
    call crlf
    jmp Quit
    exit_program:
    mov rdx, offset Thanks
    call WriteString
    call crlf
    jmp Quit
    Quit:
    call ExitProcess
main endp
end
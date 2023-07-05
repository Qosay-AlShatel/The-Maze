; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
mov ax,@data
mov ds,ax

hrz db 205    

ver db 186 

c1 db 201  

c2 db 187

c3 db 188

c4 db 200

m1 db 204

m2 db 185

m3 db 202

m4 db 203

s db 000

c db 0

q db 206

welcome dw 'Welcome to the MAZE$'

f_maze dw 'Level one (EASY)$'

s_maze dw 'Level two (MEDIUM)$'

t_maze dw 'Level three (HARD)$'
  
break dw '------------------------------------------------$'  
  
counter dw 'You have finished this maze with $'

moves dw ' moves$'

alldone dw 'Congrats, You Have finished all three levels !!$'
  
.code

mov si,offset welcome 

l1:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l1

call nl
call nl

mov si, offset f_maze

l2:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l2

call nl
call nl


;First maze 

;Row 1
 
call c11
call h14
call p 
call c11
call h
call c22

call nl   
   
;Row 2

call v
mov cx,15
q1:
call sp
loop q1
call v
call sp
call v

call nl

;Row 3

call v
call sp
call c11
call h13
call c33
call sp
call v

call nl

;Row 4

call v
call sp
call v
mov cx,15
q2:
call sp
loop q2
call v

call nl

;Row 5

call v
call sp
call v
call sp
call h14
call m22

call nl

;Row 6

call v
mov cx,17
q3:
call sp
loop q3
call v

call nl

;Row 7

call v
call sp
call h12
call c22
call sp
call h
call h
call m22

call nl

;Row 8

call v
mov cx,13
q4:
call sp
loop q4
call v
call sp
call sp
call sp
call v

call nl

;Row 9

call v
call sp
call c11
call h10
call sp
call v
call sp
call v
call sp
call v

call nl

;Row 10

call v
call sp
call v
mov cx,11
q5:
call sp
loop q5
call v
call sp
call v
call sp
call v

call nl

;Row 11

call c44
call h
call c33
call sp
call h10
call m33
call h
call m33
call h
call c33


;Putting the curser at the beginning of the maze 

mov dh,4
mov dl,15
mov bh,0
mov ah,2
int 10h


read: 

mov ah,2
mov bh,0
int 10h

cmp dl,3
jne r1
cmp dh,14
je maze2

r1:
mov ah,00h
int 16h

cmp ah,48h
je up

cmp ah,50h
je down

cmp ah,4Dh
je right

cmp ah,4Bh
je left



down:
push dx
mov ah,2
add dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear
jmp nothing


clear: 
mov bx,dx
pop dx
push bx
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,0
mov bh,0
mov cx,1
int 10h
pop bx
mov dx,bx
jmp something


nothing:
pop dx
jmp read


something:
add c,1
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,1
mov bh,0
mov cx,1
int 10h

jmp read


up:
push dx
mov ah,2
sub dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear
jmp nothing


right:
push dx
mov ah,2
add dl,1
int 10h
mov ah,3
mov bh,0
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear
jmp nothing


left:
push dx
mov ah,2
sub dl,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear
jmp nothing

;-------------------------------------------------------------------------


maze2:




call nl
call nl
call nl

mov si,offset counter

l5:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l5

push dx






cmp c,99
ja q11

cmp c,9
ja q222

mov ah,2        
mov dl,c
add dl,30h      
int 21h

jmp done

q111:

mov al,c
mov ah,0

mov cl,100

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov al,bl
mov ah,0
   
mov cl,10
   
div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done1

q222:

mov al,c
mov ah,0

mov cl,10

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done1

;--------------------------------------------


done1:


mov si,offset moves

la:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne la

pop dx





mov c,0
call nl
call nl

mov si,offset break

l3:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l3

call nl
call nl

mov si,offset s_maze

l4:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l4

call nl 
call nl


;Row 1

call c11
call h
call h
call h
call h
call h
call h
call h
call m44
call h
call h
call h
call h
call h
call c22

call nl

;Row 2

call v
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v

call nl

;Row 3

call v
call sp
call h
call h
call c22
call sp
call v
call sp
call v
call sp
call v
call sp
call h
call h
call m22

call nl

;Row 4

call p1
call sp
call sp
call sp
call v
call sp
call v
call sp
call v
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 5

call c11
call h
call h
call h
call c33
call sp

call c44
call h
call c33
call sp
call m11
call h
call h
call sp
call v

call nl

;Row 6

call v
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 7

call v
call sp
call v
call sp
call v
call sp
call h
call h
call c22
call sp
call v
call sp
call h
call h
call m22

call nl

;Row 8

call v
call sp
call v
call sp
call v
call sp
call sp
call sp
call v 
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 9
call v
call sp
call v
call sp
call c44
call h
call c22
call sp
call v
call sp
call m11
call h
call c22
call sp
call v

call nl

;Row 10

call v
call sp
call v
call sp
call sp
call sp
call v
call sp
call v
call sp
call v
call sp
call v
call sp
call v

call nl

;Row 11

call v
call sp
call c44
call h
call c22
call sp
call c44
call h
call m22
call sp
call v
call sp
call v
call sp
call v 

call nl

;Row 12

call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp

call nl

;Row 13

call c44
call h
call h
call h
call m33
call h
call h
call h
call m33
call h
call h
call h
call m33
call h
call h




;Putting the curser at the beginning of the maze 

mov dh,14
mov dl,0
mov bh,0
mov ah,2
int 10h


read1: 

mov ah,2
mov bh,0
int 10h

cmp dl,14
jne r11
cmp dh,22
je maze3

r11:
mov ah,00h
int 16h

cmp ah,48h
je up1

cmp ah,50h
je down1

cmp ah,4Dh
je right1

cmp ah,4Bh
je left1


down1:
push dx
mov ah,2
add dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear1
jmp nothing1


clear1: 
mov bx,dx
pop dx
push bx
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,0
mov bh,0
mov cx,1
int 10h
pop bx
mov dx,bx
jmp something1


nothing1:
pop dx
jmp read1


something1:
add c,1
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,2
mov bh,0
mov cx,1
int 10h

jmp read1


up1:
push dx
mov ah,2
sub dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear1
jmp nothing1


right1:
push dx
mov ah,2
add dl,1
int 10h
mov ah,3
mov bh,0
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear1
jmp nothing1


left1:
push dx
mov ah,2
sub dl,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear1
jmp nothing1


;-------------------------------------------------------------------------------------------------------


maze3:

call nl
call nl
call nl

mov si,offset counter

lt:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne lt

push dx






cmp c,99
ja q11

cmp c,9
ja q22

mov ah,2        
mov dl,c
add dl,30h      
int 21h

jmp done

q11:

mov al,c
mov ah,0

mov cl,100

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov al,bl
mov ah,0
   
mov cl,10
   
div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done

q22:

mov al,c
mov ah,0

mov cl,10

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done

;--------------------------------------------









done:


mov si,offset moves

l8:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l8

pop dx


call nl
call nl

mov si,offset break

mov c,0

l6:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l6

call nl
call nl

mov si,offset t_maze

l7:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l7

call nl 
call nl

mov c,0


;Row 1

call c11
call h
call h
call h
call h
call h
call m44
call h
call h
call p2
call h
call h
call m44
call h
call h
call h
call m44
call h
call h
call h
call c22

call nl

;Row 2

call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 3

call v
call sp
call c11
call h
call h
call sp
call v
call sp
call h
call h
call c22
call sp
call c44
call h
call h
call sp
call v
call sp
call v
call sp
call v

call nl

;Row 4

call v
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call v
call sp
call v

call nl

;Row 5

call v
call sp
call c44
call h
call h
call h
call m33
call h
call h
call sp
call m11
call h
call h
call h
call h
call sp
call m11
call h
call c33
call sp
call v

call nl

;Row 6

call v
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 7

call m11
call h
call m44
call h
call h
call sp
call v
call sp
call v
call sp
call v
call sp
call h
call h
call h
call h
call c33
call sp
call c11
call h
call m22

call nl

;Row 8

call v
call sp
call v
call sp
call sp
call sp
call v
call sp
call v
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call v
call sp
call v

call nl

;Row 9

call v
call sp
call v
call sp

call c11
call h
call c33
call sp
call c44
call h
call m44
call h
call h
call h
call h
call h
call c22
call sp
call v
call sp
call v 

call nl

;Row 10

call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v

call nl

;Row 11

call m11
call h
call h
call h
call m22
call sp
call h
call h
call c22
call sp
call c44
call h
call m44
call h
call h
call sp
call m11
call h
call c22
call sp
call v

call nl

;Row 12

call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call v
call sp
call v

call nl

;Row 13

call v
call sp
call v
call sp
call c44
call h
call h
call sp
call m11
call h
call c22
call sp
call v
call sp
call c11
call h
call c33
call sp
call v
call sp
call v

call nl 

;Row 14

call v
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v

call nl

;Row 15

call v
call sp
call c44
call h
call m44
call h
call h
call h
call c33
call sp
call m11
call h
call h
call h
call m22
call sp
call h
call h
call h
call h
call m22

call nl

;Row 16

call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v

call nl

;Row 17 

call m11
call h
call h
call sp
call v
call sp
call h
call h
call m44
call h
call m33
call h
call c22
call sp
call c44
call h
call h
call h
call c22
call sp
call v

call nl

;Row 18

call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v
call sp
call v

call nl

;Row 19

call v
call sp
call h
call h
call c33
call sp
call h
call h
call c33
call sp
call v
call sp
call v
call sp
call v
call sp
call h
call h
call c33
call sp
call v

call nl

;Row 20

call v
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call sp
call v
call sp
call sp
call sp
call v
call sp
call sp
call sp
call sp
call sp
call v

call nl

;Row 21

call c44
call h
call h
call h
call h
call h
call h
call h
call h
call h
call c33
call sp
call h
call h
call m33
call h
call h
call h
call h
call h
call c33





;Putting the curser at the beginning of the maze 

mov dh,3
mov dl,9
mov bh,0
mov ah,2
int 10h


read2: 

mov ah,2
mov bh,0
int 10h

cmp dl,11
jne r111
cmp dh,23
je exit

r111:
mov ah,00h
int 16h

cmp ah,48h
je up2

cmp ah,50h
je down2

cmp ah,4Dh
je right2

cmp ah,4Bh
je left2


down2:
push dx
mov ah,2
add dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear2
jmp nothing2


clear2: 
mov bx,dx
pop dx
push bx
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,0
mov bh,0
mov cx,1
int 10h
pop bx
mov dx,bx
jmp something2


nothing2:
pop dx
jmp read2


something2:
add c,1
mov ah,2
mov bh,0
int 10h
mov ah,0Ah
mov al,12
mov bh,0
mov cx,1
int 10h

jmp read2


up2:
push dx
mov ah,2
sub dh,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear2
jmp nothing2


right2:
push dx
mov ah,2
add dl,1
int 10h
mov ah,3
mov bh,0
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear2
jmp nothing2


left2:
push dx
mov ah,2
sub dl,1
int 10h
mov ah,8
mov bh,0
int 10h
cmp al,0
je clear2
jmp nothing2


exit:

call nl
call nl

mov si,offset counter

ls:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne ls



push dx


cmp c,99
ja q1111

cmp c,9
ja q2222

mov ah,2        
mov dl,c
add dl,30h      
int 21h

jmp done2

q1111:

mov al,c
mov ah,0

mov cl,100

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov al,bl
mov ah,0
   
mov cl,10
   
div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done2

q2222:

mov al,c
mov ah,0

mov cl,10

div cl

mov bl,ah
mov ah,2
mov dl,al

add dl,30h

int 21h

mov dl,bl

add dl,30h

int 21h

jmp done2

;--------------------------------------------


done2:

mov si,offset moves

l0:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne l0

pop dx

call nl
call nl


mov si,offset alldone

lo:
mov ah,2
mov dl,[si]
int 21h
add si,1
cmp [si],'$'
jne lo

ret

;-------------------------------------------------------------------------





  
 
  
  
;Procedure for horizental line

proc h
mov ah,2
mov dl,hrz
int 21h
ret
endp

      
      
;Procedure for vertical line

proc v
mov ah,2
mov dl,ver
int 21h
ret
endp



;Procedure for the first corner

proc c11
mov ah,2
mov dl,c1
int 21h
ret
endp



;Procedure for the second corner

proc c22
mov ah,2
mov dl,c2
int 21h
ret
endp



;Procedure for the third corner

proc c33
mov ah,2
mov dl,c3
int 21h
ret
endp



;Procedure for the fourth corner

proc c44
mov ah,2
mov dl,c4
int 21h
ret
endp



;Procedure for m1

proc m11
mov ah,2
mov dl,m1
int 21h
ret
endp


;Procedure for m2

proc m22
mov ah,2
mov dl,m2
int 21h
ret
endp



;Procedure for m3

proc m33
mov ah,2
mov dl,m3
int 21h
ret
endp



;Procedure for m4

proc m44
mov ah,2
mov dl,m4
int 21h
ret
endp



;Procedure for the space

proc sp
mov ah,2
mov dl,s
int 21h
ret
endp    


;Procedure for 14 horizental lines

proc h14
mov cx,14
a1:
mov ah,2
mov dl,hrz
int 21h
loop a1
ret
endp



;Procedure for 13 horizental lines

proc h13
mov cx,13
a2:
mov ah,2
mov dl,hrz
int 21h
loop a1
ret
endp



;Procedure for 12 horizental lines

proc h12
mov cx,12
a3:
mov ah,2
mov dl,hrz
int 21h
loop a1
ret
endp



;Procedure for 10 horizental lines

proc h10
mov cx,10
a4:
mov ah,2
mov dl,hrz
int 21h
loop a1
ret
endp



;Procedure for a new line from the beginning

proc nl
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
ret
endp 

;Procedure for printing out the smiley face

proc p
mov ah,2
mov dl,1
int 21h
ret
endp 

;Procedure to print ou the q symbol

proc qq
mov ah,2
mov dl,q
int 21h
ret
endp

;Procedure to print the other smiley face

proc p1
mov ah,2
mov dl,2
int 21h
ret
endp  

;Procedure to print the last player's character

proc p2
mov ah,2
mov dl,12
int 21h
ret
endp    
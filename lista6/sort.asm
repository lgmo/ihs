section .text
    global sort

sort:
    push ebp
    mov ebp, esp
    pusha

    mov edi, [ebp + 8]  ; edi -> 0
    mov ecx, [ebp + 12] ; ecx = n
    
.loop1:
    cmp ecx, 0
    je .end
    mov esi, edi        ; edi -> 0
    lodsd               ; eax = v[0], esi -> 1
    mov ebx, eax        ; ebx = v[0]
    mov edx, ecx        ; edx = 2
    dec edx             ; edx = 1
    .loop2:
        cmp edx, 0      
        je .end1
        dec edx         ; edx = 0
        lodsd           ; eax = v1, esi -> 2
        cmp eax, ebx    
        jge .loop2
        stosd           ; v[0] = v1, edi -> 1 
        sub edi, 4         ; edi -> 0
        sub esi, 4         ; esi -> 1
        xchg edi, esi   ; edi -> 1, esi -> 0
        xchg eax, ebx   ; eax = v0, ebx = v1 
        stosd           ; v[1] = v0, edi -> 2
        xchg edi, esi   ; edi -> 0, esi -> 2
        jmp .loop2      
    .end1:
        dec ecx         ; ecx = n-1
        add edi, 4         ; edi -> 1
        jmp .loop1
.end:
    popa
    mov esp, ebp
    pop ebp
    ret

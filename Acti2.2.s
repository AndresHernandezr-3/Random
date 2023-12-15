#----------------------------------------------------
# suma los elementos de un arreglo, y coloca el resultado final en
# el registro 10
#
# En C:
#
#   int resultado = 0;
#   int size = 8
#
#   for(i = 0; i < size, i++
#       A[i] = i;
#
#   for(i = 0; i < size; i += 2){
#       resultado += A[i] + A[i + 1]
#   }
#
#   El resultado para un arreglo de 8 elementos es 28 (0x1C)
#----------------------------------------------------

            .set noreorder
            .set noat
#----------------------------------------------------
# Memoria de programa.
#----------------------------------------------------
            .text
            .globl  start
            .ent    start

start:
            #----------------------------------------------------
            # cargar el apuntador de inicio del arreglo en la posicion 0x80020100
            #----------------------------------------------------
            lui     $8, 0x8002
             
             

            addi    $9, $0, 20                  # cargar el tama�o del arreglo

            add     $10, $0, $0                 # resultado (r10) = 0
            
            addi    $8, $8, 0x100               # cargar el inicio de la memoria (OJO)
            nop
            
            #----------------------------------------------------
            # inicializar el arreglo
            #----------------------------------------------------
            add     $11, $0, $0                 # i = 0
             
             
            add     $1,  $8, $0                 # copiar la direccion temporalmente en r1
            nop
            
loop:       beq     $11, $9, end_loop
  			
            sw      $11, ($1)                   # A[i] = i
            
            addi    $11, $11, 1                 # i++
           
            addi    $1, $1, 4                   # incrementar el apuntador 
            b loop
            nop
            nop
            nop
            
            
               
             
end_loop:
            #----------------------------------------------------
            # for (i = 0; i < size; i += 2)
            #----------------------------------------------------
            add     $11, $0, $0                 # i = 0
for:        beq     $11, $9, end_for

            #----------------------------------------------------
            # resultado += A[i] + A[i + 1]
            #----------------------------------------------------
            lw      $1, ($8)
            addi    $8, $8, 4                   # incrementar el apuntador
            nop
            add     $10, $10, $1
            nop
            lw      $1, ($8)
            
           
            
            addi    $8, $8, 4                   # incrementar el apuntador 
            nop
            
            add     $10, $10, $1
            b for
			addi    $11, $11, 2                 # i += 2
            nop 
            nop   
             
end_for:    j       $31
            .end    start
             
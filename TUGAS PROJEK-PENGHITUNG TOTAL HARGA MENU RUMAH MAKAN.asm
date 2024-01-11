INCLUDE 'emu8086.inc' ;memanggil file headeer emu 8086 ke dalam program

.org 100h

JMP MULAI:
           msg_simbol1 DB 0Dh,0Ah,'+------------------------------------+ $'
           msg_nama    DB 0Dh,0Ah,'|   NAMA : NAUFAL RAFID RAHMAWAN      |$' 
           msg_nim     DB 0Dh,0Ah,'|   NIM  : 2300018021                 |$'
           msg_simbol2 DB 0Dh,0Ah,'+------------------------------------+',0Dh,0Ah, '$'           
           msg_simbol3 DB 0Dh,0Ah,'+------------------------------------+',0Dh,0Ah,' $' 
           msg_menu    DB 0Dh,0Ah,'|          MENU RUMAH MAKAN          |',0Dh,0Ah,' $' 
           msg_simbol4 DB 0Dh,0Ah,'+------------------------------------+',0Dh,0Ah,'$'
           msg_menu1   DB 0Dh,0Ah,' 1. MIE AYAM       = Rp. 10000       ',0Dh,0Ah,'$' 
           msg_menu2   DB 0Dh,0Ah,' 2. BAKSO          = Rp. 9000        ',0Dh,0Ah,'$' 
           msg_menu3   DB 0Dh,0Ah,' 3. SOTO           = Rp. 12000       ',0Dh,0Ah,'$'
           msg_menu4   DB 0Dh,0Ah,' 4. SOP            = Rp. 8000       ',0Dh,0Ah,'$'           
           msg_keluar  DB 0Dh,0Ah,' 0. KELUAR                      ',0Dh,0Ah,'$' 
           msg_pilihan DB 0Dh,0Ah,' MAU BELI LAGI? (1 :YA / 0 :TIDAK ) :  $'
           msg_invalid DB 0Dh,0Ah,' MOHON MASUKAN PILIHAN BENARNYA',0Dh,0Ah,'$'
           msg_pilih   DB 0Dh,0Ah,' PILIH MENU (1-4) : $'  
           msg_beli    DB 0Dh,0Ah,' JUMLAH MENU YANG DIBELI  : $'  
           msg_total   DB 0Dh,0Ah,' TOTAL HARGA : $'
           harga_menu1 DW 10000 ; Harga MIE AYAM
           harga_menu2 DW 9000  ; Harga BAKSO
           harga_menu3 DW 12000 ; Harga SOTO 
           harga_menu4 DW 8000  ; Harga SOP   
           hrg DW ?;untuk menyimpan data atau hasil inputan dari harga yang di masukkan
           jml DW ?;unntuk menyimppan data atau hasil inputan dari jumlah yang di beli
           are DW ?;untuk menampung hasil dari jumlah masukkan dan harga masukkann

MULAI: 
    MOV AH, 09h
    LEA DX, msg_simbol1
    INT 21h
      
    MOV AH, 09h
    LEA DX, msg_nama
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_nim  
    INT 21h 
    
    MOV AH, 09h
    LEA DX, msg_simbol2
    INT 21h         
       
MENU:   
    MOV AH, 09h
    LEA DX, msg_simbol3
    INT 21h  
    
    MOV AH, 09h
    LEA DX, msg_menu 
    INT 21h   
    
    MOV AH, 09h
    LEA DX, msg_simbol4
    INT 21h
    MOV AH, 09h
    LEA DX, msg_menu1
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_menu2
    INT 21h 
    
    MOV AH, 09h
    LEA DX, msg_menu3
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_menu4
    INT 21h
    
    MOV AH, 09h
    LEA DX, msg_keluar
    INT 21h  
    
    MOV AH, 09h
    LEA DX, msg_pilih
    INT 21h
    MOV AH, 01h
    INT 21h  
    
    CMP AL, '1'
    JE MENU1
    CMP AL, '2'
    JE MENU2
    CMP AL, '3'
    JE MENU3
    CMP AL, '4'
    JE MENU4
    CMP AL, '0'
    JE KELUAR
    
    JMP INVALID 
    
MENU1:
    MOV AH, 9h
    LEA DX, msg_menu1
    INT 21h 
    MOV CX, harga_menu1 ; Ambil harga dari variabel harga_menu1
    MOV hrg, CX
  
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    CALL scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    MOV jml,cx
    
     
    MOV  AX,jml
    MOV  BX,hrg
    IMUL BX
    PUSH AX 
     
    LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    POP AX
    MOV are ,AX
    CALL print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
    
    MOV AH, 09h
    LEA DX, msg_pilihan
    INT 21h
    MOV AH, 01h
    INT 21h
    
    CMP AL, '1'
    JE menu
    CMP AL, '0'
    JE KELUAR

MENU2:
    MOV AH, 09h
    LEA DX, msg_menu2
    INT 21h
    MOV CX, harga_menu2 ; Ambil harga dari variabel harga_menu2
    MOV hrg,CX
    
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    CALL scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    MOV jml,cx
    
     
    MOV  AX,jml
    MOV  BX,hrg
    IMUL BX
    PUSH AX 
     
    LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    POP AX
    MOV are ,AX
    CALL print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
    
    MOV AH, 09h
    LEA DX, msg_pilihan
    INT 21h
    MOV AH, 01h
    INT 21h
    
    CMP AL, '1'
    JE menu
    CMP AL, '0'
    JE KELUAR

MENU3:
    MOV AH, 09h
    LEA DX, msg_menu3
    INT 21h
    MOV CX, harga_menu3 ; Ambil harga dari variabel harga_menu3
    MOV hrg,CX
    
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    CALL scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    MOV jml,cx
    
     
    MOV  AX,jml
    MOV  BX,hrg
    IMUL BX
    PUSH AX 
     
    LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    POP AX
    MOV are ,AX
    CALL print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
   
    MOV AH, 09h
    LEA DX, msg_pilihan
    INT 21h
    MOV AH, 01h
    INT 21h
    
    CMP AL, '1'
    JE menu
    CMP AL, '0'
    JE KELUAR 
   
MENU4:
    MOV AH, 09h
    LEA DX, msg_menu4
    INT 21h
    MOV CX, harga_menu4 ; Ambil harga dari variabel harga_menu4
    MOV hrg,CX
    
    LEA DX, msg_beli
    MOV AH, 09h
    INT 21h    
    
    CALL scan_num ;untuk memanggil inputan berasal dari header 'emu8086.inc'
    MOV jml,cx
    
     
    MOV  AX,jml
    MOV  BX,hrg
    IMUL BX
    PUSH AX 
     
    LEA DX, msg_total
    MOV AH, 09h
    INT 21h
    POP AX
    MOV are ,AX
    CALL print_num ;untuk mempritn atau mencetak hasil dari harga dan jumllah berasal dari header 'emu8086.inc'
     
     
    MOV AH, 09h
    LEA DX, msg_pilihan
    INT 21h
    MOV AH, 01h
    INT 21h
    
    CMP AL, '1'
    JE menu
    CMP AL, '0'
    JE KELUAR     
   
    ret ;intruksi untuk mengembalikkan kendali program ke alamat pemanggil
    define_scan_num ;untuk membaca hasil inputan angka dari masukkan pengguna 
    define_print_num ;untuk membaca hasil pencetakkan dari call print_num
    define_print_num_uns ;untuk mencetak angkka tak bertanda di layar

KELUAR:  
    LEA DX, msg_keluar
    MOV AH, 09h
    INT 21h
    MOV AH, 4Ch
    INT 21h
INVALID:
    LEA DX, msg_invalid
    MOV AH, 09h
    INT 21h
    JMP MENU

    
END main

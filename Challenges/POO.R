


board <- function(v){
       matrix(v,nrow = 8,ncol = 8,byrow = TRUE)
}

butterfly <- function(restricted){
        
        pos <- sample(1:64,1)
        while(pos %in% restricted){
                pos <- sample(1:64,1)
        }
        if(!("M1" %in% vector)){
                vector[pos] <<- "M1"
        } else if("M2" %in% vector){
                vector[pos] <<- "M3"
        }else{
                vector[pos] <<- "M2"
        }
        
        mensajes <<- append(mensajes,pos)
        pos
}

girl <- function(){
        vector[girl_pos] <<- " " ##quitar la niña de la posicion actual para cambiarla
        rojo <- c(19:22,27:30,35:38,43:46)
        azul <- 11:14
        naranja <- 3:6
        verde <- seq(23,47,8)
        violeta <- seq(24,48,8)
        morado <- seq(18,42,8)
        salmon <- seq(17,41,8)
        esparrago <- 51:54
        
        
        if(girl_pos == 0){
                girl_pos <<- sample(1:64,1)
                while(girl_pos %in% mensajes){
                        girl_pos <<- sample(1:64,1)
                        dado <<- girl_pos
                }
        }else if(girl_pos %in% rojo){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos-15),
                        dado == 2 ~ (girl_pos-6),
                        dado == 3 ~ (girl_pos+10),
                        dado == 4 ~ (girl_pos+17),
                        dado == 5 ~ (girl_pos+15),
                        dado == 6 ~ (girl_pos+6),
                        dado == 7 ~ (girl_pos-10),
                        dado == 8 ~ (girl_pos-17)
                )
        }else if(girl_pos %in% azul){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos-6),
                        dado == 2 ~ (girl_pos-6),
                        dado == 3 ~ (girl_pos+10),
                        dado == 4 ~ (girl_pos+17),
                        dado == 5 ~ (girl_pos+15),
                        dado == 6 ~ (girl_pos+6),
                        dado == 7 ~ (girl_pos-10),
                        dado == 8 ~ (girl_pos-6)
                )
        }else if(girl_pos %in% naranja){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos+10),
                        dado == 2 ~ (girl_pos+10),
                        dado == 3 ~ (girl_pos+10),
                        dado == 4 ~ (girl_pos+17),
                        dado == 5 ~ (girl_pos+15),
                        dado == 6 ~ (girl_pos+6),
                        dado == 7 ~ (girl_pos+10),
                        dado == 8 ~ (girl_pos+10)
                )
        }else if(girl_pos %in% verde){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos-15),
                        dado == 2 ~ (girl_pos+17),
                        dado == 3 ~ (girl_pos+17),
                        dado == 4 ~ (girl_pos+17),
                        dado == 5 ~ (girl_pos+15),
                        dado == 6 ~ (girl_pos+6),
                        dado == 7 ~ (girl_pos-10),
                        dado == 8 ~ (girl_pos-17)
                )
        }else if(girl_pos %in% violeta){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos+15),
                        dado == 2 ~ (girl_pos+15),
                        dado == 3 ~ (girl_pos+15),
                        dado == 4 ~ (girl_pos+15),
                        dado == 5 ~ (girl_pos+15),
                        dado == 6 ~ (girl_pos-17),
                        dado == 7 ~ (girl_pos-17),
                        dado == 8 ~ (girl_pos-17)
                )
        }else if(girl_pos %in% salmon){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos-15),
                        dado == 2 ~ (girl_pos-6),
                        dado == 3 ~ (girl_pos+10),
                        dado == 4 ~ (girl_pos+17),
                        dado == 5 ~ (girl_pos-15),
                        dado == 6 ~ (girl_pos-15),
                        dado == 7 ~ (girl_pos-15),
                        dado == 8 ~ (girl_pos-15)
                )
        }else if(girl_pos %in% esparrago){
                dado <<- sample(1:8,1)
                girl_pos <<- case_when(
                        dado == 1 ~ (girl_pos-15),
                        dado == 2 ~ (girl_pos-6),
                        dado == 3 ~ (girl_pos+10),
                        dado == 4 ~ (girl_pos+6),
                        dado == 5 ~ (girl_pos+6),
                        dado == 6 ~ (girl_pos+6),
                        dado == 7 ~ (girl_pos-10),
                        dado == 8 ~ (girl_pos-17)
                )
        }
        turno <<- turno+1
        vector[girl_pos] <<- "N" 
        dado
}

goblin <- function(){
        if(goblin_pos == 0){
                goblin_pos <<- sample(1:64,1)
                while(goblin_pos %in% mensajes){
                        goblin_pos <<- sample(1:64,1)
                }
                vector[goblin_pos] <<- "D"
        }
        goblin_pos
}

##Ejecutar linea por linea para jugar
        ##Inicialización de variables
        vector <- rep(" ",64) ##Tablero de juego
        mensajes <- integer(0) ##posiciòn de los mensajes
        girl_pos <- 0 ##posiciòn de la niña
        goblin_pos <- 0 ##posiciòn del duende
        dado <- integer(0) ## resuldado del dado
        turno <- 0
        
        board(vector)
        butterfly(mensajes)
        board(vector)
        butterfly(mensajes)
        board(vector)
        butterfly(mensajes)
        board(vector)
        girl()
        board(vector)
        goblin()
        board(vector)
        



board <- function(v){
       matrix(v,nrow = 8,ncol = 8,byrow = TRUE)
}

butterfly <- function(restricted){
        
        pos <- sample(1:64,1)
        while(pos %in% restricted){
                pos <- sample(1:64,1)
        }
        vector[pos] <<- "M"
        mensajes <<- append(mensajes,pos)
        pos
}

girl <- function(){
        if(girl_pos == 0){
                girl_pos <<- sample(1:64,1)
                while(girl_pos %in% mensajes){
                        girl_pos <<- sample(1:64,1)
                }
                vector[girl_pos] <<- "N"
        }
        girl_pos
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
        
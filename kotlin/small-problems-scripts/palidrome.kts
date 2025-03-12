// Bored out of my mind

fun isPalidrome( str : String) : Boolean {
    var rString = ""

   
    for ( i in str.length -1 downTo 0) {
	rString = rString + str[i]
    }

    println(rString)
    
    if (rString == str){
	return true
    }

    
    return false

    
}

println(isPalidrome("racecar"))

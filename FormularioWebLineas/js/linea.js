// funcion del boton Add de telefonos muestra en un listado li los telefonos

function newTelf() {
    var li = document.createElement("li");
    var inputValue = document.getElementById("idTelf").value;
    var t = document.createTextNode(inputValue);
    li.appendChild(t);
    if (inputValue === '') {
        alert("Escribe un numero de telefono!");
        return false;
    } else if (inputValue.length > 8 || inputValue.length < 7) {
        return false;
    } else {
        document.getElementById("TelfList").appendChild(li);
    }
    document.getElementById("idTelf").value = "";

    var span = document.createElement("span");
    var txt = document.createTextNode("\u00D7");
    span.className = "close";
    span.appendChild(txt);
    li.appendChild(span);

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }
}

// funcion del boton Add de Calles muestra en un listado li las calles
function newZona() {
    var li = document.createElement("li");
    var inputValue = document.getElementById("idZona").value;
    var t = document.createTextNode(inputValue);
    li.appendChild(t);
    if (inputValue === '') {
        alert("Escribe una zona!");
    } else {
        document.getElementById("ZonaList").appendChild(li);
    }
    document.getElementById("idZona").value = "";

    var span = document.createElement("SPAN");
    var txt = document.createTextNode("\u00D7");
    span.className = "close";
    span.appendChild(txt);
    li.appendChild(span);

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }
}

// funcion del boton Add de Zonas muestra en un listado li los zonas
function newCalle() {
    var li = document.createElement("li");
    var inputValue = document.getElementById("idCalle").value;
    var t = document.createTextNode(inputValue);
    li.appendChild(t);
    if (inputValue === '') {
        alert("Escribe una calle!");
    } else {
        document.getElementById("CalleList").appendChild(li);
    }
    document.getElementById("idCalle").value = "";

    var span = document.createElement("SPAN");
    var txt = document.createTextNode("\u00D7");
    span.className = "close";
    span.appendChild(txt);
    li.appendChild(span);

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }
}

// Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
        var div = this.parentElement;
        div.style.display = "none";
    }
}

// Validaciones
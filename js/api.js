 // Skrypt do pobrania i wstawienia zawartości z Flask na istniejącej stronie
const flaskContent = document.getElementById('flask-content');
fetch('/')
    .then(response => response.text())
    .then(data => {
        flaskContent.innerHTML = data;
    });
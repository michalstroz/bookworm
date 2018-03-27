function setRate(event){
  var elementId = event.target.id;
  var elementNumber = elementId.match(/\d/g).join('');
  elementNumber = parseInt(elementNumber);
  putRateIntoField(elementNumber);
  document.getElementById('rating-form').submit();
}

function putRateIntoField(elNum){
  var hideField = document.getElementById('rate')
  hideField.setAttribute('value', elNum);
}

window.addEventListener('load', function(){
  var stars = document.querySelectorAll('.star');
  for(var i = 0; i < stars.length; i++){
    stars[i].addEventListener('click', setRate);
  }
});

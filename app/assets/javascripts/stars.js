window.addEventListener('load', function(){
  var stars = document.querySelectorAll('.fa.fa-star');
  for(var i = 0; i < stars.length; i++){
    stars[i].addEventListener('click', setRate);
  }
  setStarsRating();
});

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

function setStarsRating(){
  if (document.getElementById('average-rating')) {
    var averageRating = document.getElementById('average-rating').innerHTML;
    averageRating = parseFloat(averageRating);
    var percentage = averageRating * 10.0;
    var highlightedStars = document.getElementById('highlighted-stars');
    highlightedStars.style.width = percentage + '%';
  }
}

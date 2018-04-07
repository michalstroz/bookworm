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
  var starsRate = document.getElementById('stars_rate');
  // starsRate.className = starsRate.className.replace('stars', 'stars-none');
  var averageRate = document.getElementById('average-rate');
  // averageRate.className = averageRate.className.replace('stars-none', 'stars-rating');
}

function putRateIntoField(elNum){
  var hideField = document.getElementById('rate')
  hideField.setAttribute('value', elNum);
}

function setStarsRating(){
  var averageRating = document.getElementById('average-rating').innerHTML;
    averageRating = parseFloat(averageRating);
    var percentage = averageRating * 10.0;
    var highlightedStars = document.getElementById('highlighted-stars');
    highlightedStars.style.width = percentage + '%';
}

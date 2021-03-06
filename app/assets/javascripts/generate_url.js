window.onload = function(){
  var form = document.getElementById('js--form')
  var calID = document.getElementsByClassName('js--lib-values')
  var error = document.getElementById('js--on-msg')
  var sublinkMsg = document.getElementsByClassName('sublink-msg')[0]
  var copyLink = document.getElementsByClassName('copy')[0]



  form.addEventListener('submit', function(form){
    var subscriptionLink = window.location.protocol + "//" + window.location.host + "/my_calendar/events.ics?calendar_ids="
    var idArr = []


    for(var i = 0; i < calID.length; i++ ) {
      if(calID[i].checked == true) {
        idArr.push(calID[i].defaultValue);
      }
    }

    subscriptionLink += idArr.join()
    //check if no libraries were selected
    //and display and error message

    if(idArr.length == 0) {
      error.textContent = "Please Select a Library";
      error.classList.add('error');
      sublinkMsg.style.display = "block";
      sublinkMsg.style.color = "white";
      sublinkMsg.style.backgroundColor = "red"
      return false;
      //on successful submit display div with linked
      //
    } else {
      copyLink.style.display = 'block';
      error.classList.remove('error')
      sublinkMsg.style.backgroundColor = "#1273c2";
      sublinkMsg.style.overflowX = "scroll";
      error.style.color = "white";
      error.textContent = subscriptionLink;
      sublinkMsg.style.display = "block";
    };
    return true;
  }, true)

  //Copy link to clipboard
  copyLink.addEventListener('click', function(){
    var clipBoardNode = document.createElement('input');
    document.body.appendChild(clipBoardNode);
    clipBoardNode.setAttribute('value', error.innerText);
    clipBoardNode.select()
    document.execCommand('copy')
    document.body.removeChild(clipBoardNode)
    copyLink.style.color = "white"
  }, false)

}

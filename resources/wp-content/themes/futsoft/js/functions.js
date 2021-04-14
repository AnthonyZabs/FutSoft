// GetElementById
function el(el)
{
  return document.getElementById(el);
}

// GetElementByName
function eln(eln)
{
  return document.getElementsByName(eln);
}

// getElementsByClassName
function elc(elc)
{
  return document.getElementsByClassName(elc);
}

function SendAjax(func, fid = null)
{
  var data = null;
  switch(func) {
    case 'Login':
      {
        var login_user = el("login_user").value;
        var login_pass = el("login_pass").value;

        data = "login_user=" + login_user + "&login_pass=" + login_pass;
      }
    break;
    case 'Register':
      {
        var reg_user = el("reg_user").value;
        var reg_name = el("reg_name").value;
        var reg_pass = el("reg_pass").value;
        var reg_pas2 = el("reg_pas2").value;
        var reg_emal = el("reg_emal").value;
        var reg_clv = el("reg_clv").value;

        data = "reg_user=" + reg_user + "&reg_name=" + reg_name + "&reg_pass=" + reg_pass + "&reg_pas2=" + reg_pas2 + "&reg_emal=" + reg_emal + "&reg_clv=" + reg_clv;
      }
    break;
    
    default:
    break;
  }
  
  // Enviamos a PHP mediante AJAX
  $.ajax({
    type:'post',
    url:'../../../../init.php',
    data:data,
    success: function(data) {
      el("response_ajax").innerHTML = data;
    }
  });
  return false;
}
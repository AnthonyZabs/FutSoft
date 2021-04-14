<?php

	function IsCode($c){
		if(strlen($c) != 6)
			return false;

        $c = strtoupper($c);
		$Q = MYSQL_::Bits("SELECT null FROM access_u_code WHERE code = '" . $c . "' AND used = '0' LIMIT 1");

		if(mysqli_num_rows($Q) != 1):
			return false;
		else:
			return true;
		endif;
	}

    function CreateBCodes($u) {
	  $ICode = GRandomS(); 
	  $Q = MYSQL_::Bits("INSERT INTO access_u_code (code,used,usedby,genby) VALUES ('". $ICode ."', '0', null,'". $u ."')");
	  return ($Q)? true : false;
	}

	function UpdateBCodes($c,$u) {
	  $Q = MYSQL_::Bits("UPDATE access_u_code SET used = '1', usedby = '" . $u . "' WHERE code = '" . $c . "'");
	  return ($Q)? true : false;
	}

    function GRandomS() {
      $charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      $base = strlen($charset);
      $result = '';
    
      $now = explode(' ', microtime())[1];
      while ($now >= $base){
        $i = $now % $base;
        $result = $charset[$i] . $result;
        $now /= $base;
      }
      $RNumber = rand(10, 99);
      return substr($result, -4)."".$RNumber;
	}

	if(isset($_POST["user_logout"])){
		session_destroy();
		echo '<meta http-equiv="Refresh" content="0;url=/inicio">';
	}
?>
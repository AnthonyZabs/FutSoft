<?php 
	
	#Total de objetos
	function xlObject($object)
	{
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM $object ");
		$xlS 	=	mysqli_num_rows($xlSQ);
		return $xlS;
	}

	function xlObjectCond($object, $cond, $res)
	{
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM $object WHERE $cond = '$res'");
		$xlS 	=	mysqli_num_rows($xlSQ);
		return $xlS;
	}

	#Total de usuarios administradores
	function fsTotalUs()
	{
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM users WHERE rank >= 2 ");
		$xlS 	=	mysqli_num_rows($xlSQ);
		return $xlS;
	}

	function CreateBCodes($u) {
	  $ICode = GRandomS(); 
	  $Q = MYSQL_::Bits("INSERT INTO access_u_code (code,used,usedby,genby) VALUES ('". $ICode ."', '0', null,'". $u ."')");
	  return ($Q)? $ICode : false;
	}
    function AllCodes() {     

      $Q = MYSQL_::Bits('SELECT * FROM access_u_code');

      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<center><b style="color:red;">No hay c&oacute;digos Generados a&uacute;n.</b></center><br>';
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>ID</th><th>CODIGO</th><th>USADO</th><th>USADO POR</th><th>GENERADO POR</th><th>ELIMINAR</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
       $UB = ($CInfo['used'] == '1')? "SI" : "NO";
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['id'] ."</td>";
       $TCodes .= "<td>". $CInfo['code'] ."</td>";
       $TCodes .= "<td>". $UB ."</td>";
       $TCodes .= "<td>". $CInfo['usedby'] ."</td>";
       $TCodes .= "<td>". $CInfo['genby'] ."</td>";
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idcode" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_code" value="">
       </form></td>';
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}
	# Función para extraer información de un campo de la tabla especificada
    function Get($table, $idname, $idcontent, $Busq)
    {
        $Busqueda = MYSQL_::Bits("SELECT * FROM  `$table` WHERE `$idname` = '". $idcontent ."'");
        $Bitsnews = mysqli_fetch_assoc($Busqueda);
        $BNs      = $Bitsnews[$Busq];
        return $BNs;
    }
	if(isset($_POST['del_code']))
	{
		#Post variables
		$tempid 		=	($_POST['idcode']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM access_u_code WHERE id = '$tempid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else
		{
			MYSQL_::Bits("DELETE FROM `access_u_code` WHERE `id` = '$tempid'");

			xlSuccess('El C&oacute;digo ha sido borrado correctamente');
		}
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
	function AllTemps() {     

      $Q = MYSQL_::Bits('SELECT * FROM temporadas');
      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<center><b style="color:red;">No hay temporadas registradas a&uacute;n.</b></center><br>';
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>ID</th><th>Nombre</th><th>Creada por</th><th>Eliminar</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['id'] ."</td>";
       $TCodes .= "<td>". $CInfo['name'] ."</td>";
       $TCodes .= "<td>". $CInfo['genby'] ."</td>";
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idtemp" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_temp" value="">
       </form></td>';
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}
	#Agregando una nueva temporada
	if(isset($_POST['add_temp']))
	{
		#Post variables
		$name 		=	"Temporada ".date('Y')." ".SLS3($_POST['class']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM temporadas WHERE name = '$name'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS > 0)
		{
			xlAlert('Lo sentimos pero ya existe una Temporada con ese nombre.');
		}
		else
		{
			$addSQ 		=	MYSQL_::Bits("INSERT INTO temporadas (name,genby) VALUES ('$name','$usName') ");
			xlSuccess('La Temporada ha sido creada correctamente');
		}
	}
	#Eliminando una temporada
	if(isset($_POST['del_temp']))
	{
		#Post variables
		$tempid 		=	($_POST['idtemp']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM temporadas WHERE id = '$tempid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else
		{
			$xlSQ1 	=	MYSQL_::Bits("SELECT * FROM jornadas WHERE id = '$tempid'");
			while($Infs1 = mysqli_fetch_assoc($xlSQ1)){
				MYSQL_::Bits("DELETE FROM `juegos` WHERE `fkjornid` = '$Infs1[id]'");
			}

			$Infs = mysqli_fetch_assoc($xlSQ);
			MYSQL_::Bits("DELETE FROM `temporadas` WHERE `id` = '$tempid'");
			MYSQL_::Bits("DELETE FROM `jornadas` WHERE `temporada` = '$Infs[name]'");

			xlSuccess('La Temporada ha sido borrada correctamente');
		}
	}

	function AllJorns() {     

      $Q = MYSQL_::Bits('SELECT * FROM jornadas');

      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<center><b style="color:red;">No hay jornadas generadas a&uacute;n.</b></center><br>';
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>Temporada</th><th>N&uacute;mero de Jornada</th><th>Eliminar</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['temporada'] ."</td>";
       $TCodes .= "<td>". $CInfo['num'] ."</td>";
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idjorn" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_jorn" value="">
       </form></td>';
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}
	if(isset($_POST['add_jorn']))
	{
		#Post variables
		$numj 		=	SLS3($_POST['numj']);
		$name 		=	SLS3($_POST['class']);
		$date1 		=	SLS3($_POST['datepicker1']);
		$hora1 		=	SLS3($_POST['hora1']);
		$date2 		=	SLS3($_POST['datepicker2']);
		$hora2 		=	SLS3($_POST['hora2']);
		$date3 		=	SLS3($_POST['datepicker3']);
		$hora3 		=	SLS3($_POST['hora3']);
		$date4 		=	SLS3($_POST['datepicker4']);
		$hora4 		=	SLS3($_POST['hora4']);
		$date5 		=	SLS3($_POST['datepicker5']);
		$hora5 		=	SLS3($_POST['hora5']);
		$date6 		=	SLS3($_POST['datepicker6']);
		$hora6 		=	SLS3($_POST['hora6']);
		$date7 		=	SLS3($_POST['datepicker7']);
		$hora7 		=	SLS3($_POST['hora7']);
		$date8 		=	SLS3($_POST['datepicker8']);
		$hora8 		=	SLS3($_POST['hora8']);
		$usName 	=	userD($USERID,'user');
		$ctn = 0;
		foreach ($_POST['team'] as $indice => $valor){ 
			$ctn++;
			$teams .= $valor.';';

			// Validamos que el equipo cuente con los jugadores aprobados suficientes
			$xSQ = MYSQL_::Bits("SELECT * FROM jugadores WHERE `equip_id` = '". $valor ."' AND `tar_r` < 5");
			$xlS =	mysqli_num_rows($xSQ);
			if($xlS < 5){
				xlAlert('El equipo ' . Get('equipos', 'id', $valor, 'name') . 'no cuenta con al menos 5 jugadores para participar en esta jornada.');
				return;
			}
		} 

		$val=split("[;]",$teams);
		$rn = rand(0,100);
		
		if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null || $date3 == null || $hora3 == null || $date4 == null || $hora4 == null || $date5 == null || $hora5 == null || $date6 == null || $hora6 == null || $date7 == null || $hora7 == null || $date8 == null || $hora8 == null || $name == "no"){
			xlAlert('Debe rellenar todos los campos.');
			return;
		}
		if($numj != 1){
			xlAlert('Solo es posible Crear la primera Jornada. A partir de la Segunda Jornada debe <b>Generarlas</b> en <a href="/bmpanel/genjorn.php">esta Secci&oacute;n</a>');
			return;
		}
		if($ctn < 16){
			xlAlert('Debe seleccionar 16 Equipos para crear una Jornada.');
			return;
		}
		$xSQ = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$numj' AND temporada = '$name'");
		$xlS 	=	mysqli_num_rows($xSQ);
		if($xlS > 0){
			xlAlert('Ya existen la Jornada 1 para la '.$name.'. Dirijase a "Generar Jornadas" para darle Seguimiento a la Temporada.');
			return;
		}
		#Random Matches
		if($rn <= 20){
			$eq1 = $val[0];
			$eq2 = $val[1];
			$eq3 = $val[2];
			$eq4 = $val[3];
			$eq5 = $val[4];
			$eq6 = $val[5];
			$eq7 = $val[6];
			$eq8 = $val[7];
			$eq9 = $val[8];
			$eq10 = $val[9];
			$eq11 = $val[10];
			$eq12 = $val[11];
			$eq13 = $val[12];
			$eq14 = $val[13];
			$eq15 = $val[14];
			$eq16 = $val[15];
		}
		else if($rn > 20 && $rn <= 40){
			$eq1 = $val[1];
			$eq2 = $val[2];
			$eq3 = $val[3];
			$eq4 = $val[4];
			$eq5 = $val[5];
			$eq6 = $val[6];
			$eq7 = $val[7];
			$eq8 = $val[8];
			$eq9 = $val[9];
			$eq10 = $val[10];
			$eq11 = $val[11];
			$eq12 = $val[12];
			$eq13 = $val[13];
			$eq14 = $val[14];
			$eq15 = $val[15];
			$eq16 = $val[0];
		}
		else if($rn > 40 && $rn <= 60){
			$eq1 = $val[2];
			$eq2 = $val[4];
			$eq3 = $val[6];
			$eq4 = $val[8];
			$eq5 = $val[10];
			$eq6 = $val[12];
			$eq7 = $val[14];
			$eq8 = $val[0];
			$eq9 = $val[1];
			$eq10 = $val[3];
			$eq11 = $val[5];
			$eq12 = $val[7];
			$eq13 = $val[9];
			$eq14 = $val[11];
			$eq15 = $val[13];
			$eq16 = $val[15];
		}
		else if($rn > 60 && $rn <= 80){
			$eq1 = $val[1];
			$eq2 = $val[3];
			$eq3 = $val[5];
			$eq4 = $val[7];
			$eq5 = $val[9];
			$eq6 = $val[11];
			$eq7 = $val[13];
			$eq8 = $val[15];
			$eq9 = $val[2];
			$eq10 = $val[4];
			$eq11 = $val[6];
			$eq12 = $val[8];
			$eq13 = $val[10];
			$eq14 = $val[12];
			$eq15 = $val[14];
			$eq16 = $val[0];
		}
		else{
			$eq1 = $val[15];
			$eq2 = $val[14];
			$eq3 = $val[13];
			$eq4 = $val[12];
			$eq5 = $val[11];
			$eq6 = $val[10];
			$eq7 = $val[9];
			$eq8 = $val[8];
			$eq9 = $val[7];
			$eq10 = $val[6];
			$eq11 = $val[5];
			$eq12 = $val[4];
			$eq13 = $val[3];
			$eq14 = $val[2];
			$eq15 = $val[1];
			$eq16 = $val[0];
		}
		#end Random Matches

		$addSQ 	=	MYSQL_::Bits("INSERT INTO jornadas (num,temporada) VALUES ('$numj','$name') ");
		$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$numj' AND temporada = '$name'");
		$usR = mysqli_fetch_assoc($usRN);
		$addSQ2 =	MYSQL_::Bits("INSERT INTO juegos (fkjornid,jornid,fech,hour,equip1,equip2) VALUES 
			('$usR[id]', '$numj', '$date1', '$hora1', '$eq1', '$eq2'),
			('$usR[id]', '$numj', '$date2', '$hora2', '$eq3', '$eq4'),
			('$usR[id]', '$numj', '$date3', '$hora3', '$eq5', '$eq6'),
			('$usR[id]', '$numj', '$date4', '$hora4', '$eq7', '$eq8'),
			('$usR[id]', '$numj', '$date5', '$hora5', '$eq9', '$eq10'),
			('$usR[id]', '$numj', '$date6', '$hora6', '$eq11', '$eq12'),
			('$usR[id]', '$numj', '$date7', '$hora7', '$eq13', '$eq14'),
			('$usR[id]', '$numj', '$date8', '$hora8', '$eq15', '$eq16')");
		xlSuccess('La Jornada ha sido creada correctamente');
	}
	if(isset($_POST['del_jorn']))
	{
		#Post variables
		$tempid 		=	($_POST['idjorn']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM jornadas WHERE id = '$tempid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else
		{
			$addSQ 	=	MYSQL_::Bits("DELETE FROM `jornadas` WHERE `id` = '$tempid'");
			$addSQ2	=	MYSQL_::Bits("DELETE FROM `juegos` WHERE `fkjornid` = '$tempid'");
			xlSuccess('La Jornada ha sido borrada correctamente');
		}
	}
	if(isset($_POST['gen_jorn']))
	{
		#Post variables
		$numj 		=	SLS3($_POST['numj']);
		$name 		=	SLS3($_POST['class']);

		$xSQ = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$numj' AND temporada = '$name'");
		$xlS 	=	mysqli_num_rows($xSQ);
		if($xlS > 0){
			xlAlert('Ya existe la Jornada '.$numj.' para la '.$name);
			return;
		}
		if($numj <= 2){
			$date1 		=	SLS3($_POST['datepicker1']);
			$hora1 		=	SLS3($_POST['hora1']);
			$date2 		=	SLS3($_POST['datepicker2']);
			$hora2 		=	SLS3($_POST['hora2']);
			$date3 		=	SLS3($_POST['datepicker3']);
			$hora3 		=	SLS3($_POST['hora3']);
			$date4 		=	SLS3($_POST['datepicker4']);
			$hora4 		=	SLS3($_POST['hora4']);
			$date5 		=	SLS3($_POST['datepicker5']);
			$hora5 		=	SLS3($_POST['hora5']);
			$date6 		=	SLS3($_POST['datepicker6']);
			$hora6 		=	SLS3($_POST['hora6']);
			$date7 		=	SLS3($_POST['datepicker7']);
			$hora7 		=	SLS3($_POST['hora7']);
			$date8 		=	SLS3($_POST['datepicker8']);
			$hora8 		=	SLS3($_POST['hora8']);

			if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null || $date3 == null || $hora3 == null || $date4 == null || $hora4 == null || $date5 == null || $hora5 == null || $date6 == null || $hora6 == null || $date7 == null || $hora7 == null || $date8 == null || $hora8 == null || $name == "no"){
				xlAlert('Debe rellenar todos los campos.');
				return;
			}
		}
		else if($numj >= 3 && $numj <= 4){
			$date1 		=	SLS3($_POST['datepicker1']);
			$hora1 		=	SLS3($_POST['hora1']);
			$date2 		=	SLS3($_POST['datepicker2']);
			$hora2 		=	SLS3($_POST['hora2']);
			$date3 		=	SLS3($_POST['datepicker3']);
			$hora3 		=	SLS3($_POST['hora3']);
			$date4 		=	SLS3($_POST['datepicker4']);
			$hora4 		=	SLS3($_POST['hora4']);
			if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null || $date3 == null || $hora3 == null || $date4 == null || $hora4 == null || $name == "no"){
				xlAlert('Debe rellenar todos los campos.');
				return;
			}
		}
		else if($numj >= 5 && $numj <= 6){
			$date1 		=	SLS3($_POST['datepicker1']);
			$hora1 		=	SLS3($_POST['hora1']);
			$date2 		=	SLS3($_POST['datepicker2']);
			$hora2 		=	SLS3($_POST['hora2']);
			if($date1 == null || $hora1 == null || $date2 == null || $name == "no"){
				xlAlert('Debe rellenar todos los campos.');
				return;
			}
		}
		else{
			$date1 		=	SLS3($_POST['datepicker1']);
			$hora1 		=	SLS3($_POST['hora1']);
			if($date1 == null || $hora1 == null || $name == "no"){
				xlAlert('Debe rellenar todos los campos.');
				return;
			}
		}

		$usName 	=	userD($USERID,'user');

		if($numj < 2 || $numj > 8){
			xlAlert('Solo es posible Generar de la Jornada 2 a la 8.');
			return;
		}

		$Max =	MYSQL_::Bits("SELECT MAX(num) as num FROM jornadas WHERE temporada = '".$name."'");
		$CurrentJorn = mysqli_fetch_assoc($Max);
		$mustJorn = $CurrentJorn["num"] + 1;
		$lastJorn = $numj - 1;
		if($numj != $mustJorn){
			xlAlert('Lo sentimos pero la Jornada pr&oacute;xima a Generar para esta Temporada es la N&uacute;mero '.$mustJorn);
			return;
		}

		$usRN1 = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$lastJorn' AND temporada = '$name'");
		$usR1 = mysqli_fetch_assoc($usRN1);	

		$Match1 = MYSQL_::Bits("SELECT MIN(played) as played FROM juegos WHERE jornid = '$lastJorn' AND fkjornid = '$usR1[id]'");
		$Plays = mysqli_fetch_assoc($Match1);

		if($Plays["played"] == '0'){
			xlAlert('Lo sentimos, pero a&uacute;n faltan partidos por disputarse para continuar con la siguiente Jornada.');
			return;
		}

		$addSQ 	=	MYSQL_::Bits("INSERT INTO jornadas (num,temporada) VALUES ('$numj','$name') ");

		$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$lastJorn' AND temporada = '$name'");
		$usR = mysqli_fetch_assoc($usRN);	

		// Si es Jornada Par, hace Nueva
		if($mustJorn % 2 == 0){
			$usRN2 = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$numj' AND temporada = '$name'");
			$usR2 = mysqli_fetch_assoc($usRN2);
			$count = 1;
			$date = $date1;
			$hora = $hora1;
			if($count == 2){
				$date = $date2;
				$hora = $hora2;
			}
			else if($count == 3){
				$date = $date3;
				$hora = $hora3;
			}
			else if($count == 4){
				$date = $date4;
				$hora = $hora4;
			}
			else if($count == 5){
				$date = $date5;
				$hora = $hora5;
			}
			else if($count == 6){
				$date = $date6;
				$hora = $hora6;
			}
			else if($count == 7){
				$date = $date7;
				$hora = $hora7;
			}
			else if($count == 8){
				$date = $date8;
				$hora = $hora8;
			}
			$Match = MYSQL_::Bits("SELECT * FROM juegos WHERE jornid = '$lastJorn' AND fkjornid = '$usR[id]' ORDER BY id ASC");
			while($InfM = mysqli_fetch_assoc($Match)){
				MYSQL_::Bits("INSERT INTO juegos (fkjornid,jornid,fech,hour,equip1,equip2) VALUES ('$usR2[id]','$mustJorn', '$date', '$hora', '$InfM[equip2]', '$InfM[equip1]')");
				$count++;
			}
		}
		else{
			// Si es impar Busca Ganadores y empareja
			if($mustJorn == 3){
				$count = 1;
				$Match = MYSQL_::Bits("SELECT * FROM juegos WHERE jornid = '2' AND fkjornid = '$usR[id]' ORDER BY id ASC");
				while($InfM = mysqli_fetch_assoc($Match)){
					if($count == 1){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq1 = $InfM["equip1"]; 
						else
							$eq1 = $InfM["equip2"];						
					}
					else if($count == 2){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq2 = $InfM["equip1"]; 
						else
							$eq2 = $InfM["equip2"];
					}
					else if($count == 3){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq3 = $InfM["equip1"]; 
						else 
							$eq3 = $InfM["equip2"];
					}
					else if($count == 4){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq4 = $InfM["equip1"]; 
						else 
							$eq4 = $InfM["equip2"];
					}
					else if($count == 5){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq5 = $InfM["equip1"]; 
						else 
							$eq5 = $InfM["equip2"];
					}
					else if($count == 6){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq6 = $InfM["equip1"]; 
						else 
							$eq6 = $InfM["equip2"];
					}
					else if($count == 7){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq7 = $InfM["equip1"]; 
						else 
							$eq7 = $InfM["equip2"];
					}
					else if($count == 8){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq8 = $InfM["equip1"]; 
						else 
							$eq8 = $InfM["equip2"];
					}
					$count++;
				}

				$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$mustJorn' AND temporada = '$name'");
				$usR = mysqli_fetch_assoc($usRN);
				$addSQ2 =	MYSQL_::Bits("INSERT INTO juegos (fkjornid,jornid,fech,hour,equip1,equip2) VALUES 
					('$usR[id]', '$mustJorn', '$date1', '$hora1', '$eq1', '$eq2'),
					('$usR[id]', '$mustJorn', '$date2', '$hora2', '$eq3', '$eq4'),
					('$usR[id]', '$mustJorn', '$date3', '$hora3', '$eq5', '$eq6'),
					('$usR[id]', '$mustJorn', '$date4', '$hora4', '$eq7', '$eq8')");
			}
			else if($mustJorn == 5){
				$count = 1;
				$Match = MYSQL_::Bits("SELECT * FROM juegos WHERE jornid = '4' AND fkjornid = '$usR[id]' ORDER BY id ASC");
				while($InfM = mysqli_fetch_assoc($Match)){
					if($count == 1){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq1 = $InfM["equip1"]; 
						else
							$eq1 = $InfM["equip2"];
					}
					else if($count == 2){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq2 = $InfM["equip1"]; 
						else
							$eq2 = $InfM["equip2"];
					}
					else if($count == 3){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq3 = $InfM["equip1"]; 
						else 
							$eq3 = $InfM["equip2"];
					}
					else if($count == 4){
						if($InfM["goals1"] > $InfM["goals2"]) 
							$eq4 = $InfM["equip1"]; 
						else 
							$eq4 = $InfM["equip2"];
					}
					$count++;
				}

				$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$mustJorn' AND temporada = '$name'");
				$usR = mysqli_fetch_assoc($usRN);
				$addSQ2 =	MYSQL_::Bits("INSERT INTO juegos (fkjornid,jornid,fech,hour,equip1,equip2) VALUES 
					('$usR[id]', '$mustJorn', '$date1', '$hora1', '$eq1', '$eq2'),
					('$usR[id]', '$mustJorn', '$date2', '$hora2', '$eq3', '$eq4')");
			}
			else if($mustJorn == 7){
				$count = 1;
				$Match = MYSQL_::Bits("SELECT * FROM juegos WHERE jornid = '6' AND fkjornid = '$usR[id]' ORDER BY id ASC");
				while($InfM = mysqli_fetch_assoc($Match)){
					if($count == 1){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq1 = $InfM["equip1"]; 
						else
							$eq1 = $InfM["equip2"];
					}
					else if($count == 2){
						if($InfM["goals1"] > $InfM["goals2"])
							$eq2 = $InfM["equip1"]; 
						else
							$eq2 = $InfM["equip2"];
					}
					$count++;
				}

				$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE num = '$mustJorn' AND temporada = '$name'");
				$usR = mysqli_fetch_assoc($usRN);
				$addSQ2 =	MYSQL_::Bits("INSERT INTO juegos (fkjornid,jornid,fech,hour,equip1,equip2) VALUES 
					('$usR[id]', '$mustJorn', '$date1', '$hora1', '$eq1', '$eq2')");
			}
		}
		xlSuccess('La Jornada ha sido creada correctamente');
	}

	function AllTeams() {     

      $Q = MYSQL_::Bits('SELECT * FROM equipos');

      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<center><b style="color:red;">No hay equipos registrados a&uacute;n.</b></center><br>';
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>ID</th><th>Escudo</th><th>Nombre</th><th>Uniforme Color 1</th><th>Uniforme Color 2</th><th>Vacantes</th><th>Representante</th><th>Domicilio</th><th>Tel&eacute;fono</th><th>Email</th><th>Eliminar</th><th>Editar</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['id'] ."</td>";
       $TCodes .= "<td><img src='". $CInfo['escudo'] ."' width='20' height='20'/></td>";
       $TCodes .= "<td>". $CInfo['name'] ."</td>";
       $TCodes .= "<td><div style='background-color:".$CInfo['uni_color1'].";border: solid 1px;height:5px;border-radius:50px;'></div></td>";
       $TCodes .= "<td><div style='background-color:".$CInfo['uni_color2'].";border: solid 1px;height:5px;border-radius:50px;'></div></td>";
       $TCodes .= "<td>". $CInfo['vacantes'] ."</td>";
       $TCodes .= "<td>". $CInfo['representante'] ."</td>";
       $TCodes .= "<td>". $CInfo['domic'] ."</td>";
       $TCodes .= "<td>". $CInfo['tel'] ."</td>";
       $TCodes .= "<td>". $CInfo['email'] ."</td>";
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idequip" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_equip" value="">
       </form></td>';
       $TCodes .= '<td><a href="/bmpanel/newequip.php?eq='.$CInfo['id'].'"><input style="background-image:url(/bmpanel/images/icn_edit_article.png);background-position:1px 1px;" type="submit" name="goto" value=""></a></td>';
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}
	if(isset($_POST['add_equip']))
	{
		#Post variables
		$id 		=	SLS3($_POST['id']);
		$name 		=	SLS3($_POST['name']);
		$escudo 	=	SLS3($_POST['escudo']);
		$color1 	=	SLS3($_POST['color1']);
		$color2 	=	SLS3($_POST['color2']);
		$rep 		=	SLS3($_POST['rep']);
		$dom 		=	SLS3($_POST['dom']);
		$tel 		=	SLS3($_POST['tel']);
		$email 		=	SLS3($_POST['email']);
		$usName 	=	userD($USERID,'user');

		if($id == null || $name == null || $color1 == null || $color2 == null || $rep == null || $dom == null || $escudo == null){
			xlAlert('Debe rellenar los campos obligatorios indicados con un (*).');
			return;
		}
		if(strlen($id) <= 2 || strlen($id) >= 6){
			xlAlert('El ID debe ser mayor a 2 y menor a 5 Caracteres.');
			return;
		}
		if(strlen($name) <= 3){
			xlAlert('El nombre del Equipo debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		if(strlen($rep) <= 3){
			xlAlert('Nombre del Representante inválido.');
			return;
		}
		if(strlen($dom) <= 3){
			xlAlert('El domicilio es inválido.');
			return;
		}
		/*
		if(strlen($tel) <= 9 || strlen($tel) > 10 || !is_numeric($tel)){
			xlAlert('El tel&eacute;fono es inválido.');
			return;
		}
		*/

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$id'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		$xlSQ2 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE name = '$name'");
		$xlS2 	=	mysqli_num_rows($xlSQ2);

		if($xlS > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Equipo con la misma ID.');
		}
		else if($xlS2 > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Equipo con el mismo nombre.');
		}
		else
		{
			$addSQ 		=	MYSQL_::Bits("INSERT INTO equipos (id,name,uni_color1,uni_color2,representante,domic,tel,email,escudo) VALUES ('$id','$name','$color1','$color2','$rep','$dom','$tel','$email', '$escudo') ");
			xlSuccess('El Equipo ha sido registrado correctamente');
		}
	}
	if(isset($_POST['edit_equip']))
	{
		#Post variables
		$lastid 	=	SLS3($_POST['lastid']);
		$lastname 	=	SLS3($_POST['lastname']);
		$id 		=	SLS3($_POST['id']);
		$name 		=	SLS3($_POST['name']);
		$escudo 	=	SLS3($_POST['escudo']);
		$color1 	=	SLS3($_POST['color1']);
		$color2 	=	SLS3($_POST['color2']);
		$rep 		=	SLS3($_POST['rep']);
		$dom 		=	SLS3($_POST['dom']);
		$tel 		=	SLS3($_POST['tel']);
		$email 		=	SLS3($_POST['email']);
		$usName 	=	userD($USERID,'user');

		if($id == null || $name == null || $color1 == null || $color2 == null || $rep == null || $dom == null || $escudo == null){
			xlAlert('Debe rellenar los campos obligatorios indicados con un (*).');
			return;
		}
		if(strlen($id) <= 2){
			xlAlert('El ID debe ser mayor a 2 y menor a 5 Caracteres.');
			return;
		}
		if(strlen($name) <= 3){
			xlAlert('El nombre del Equipo debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		if(strlen($rep) <= 3){
			xlAlert('Nombre del Representante inválido.');
			return;
		}
		if(strlen($dom) <= 3){
			xlAlert('El domicilio es inválido.');
			return;
		}
		/*
		if(strlen($tel) <= 9 || strlen($tel) > 10 || !is_numeric($tel)){
			xlAlert('El tel&eacute;fono es inválido.');
			return;
		}
		*/

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$id' && id != '$lastid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		$xlSQ2 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE name = '$name' && name != '$name'");
		$xlS2 	=	mysqli_num_rows($xlSQ2);

		if($xlS > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Equipo con la misma ID.');
		}
		else if($xlS2 > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Equipo con el mismo nombre.');
		}
		else
		{
			$addSQ 		=	MYSQL_::Bits("UPDATE equipos SET id ='$id', name = '$name', uni_color1 = '$color1', uni_color2 = '$color2', representante = '$rep', domic = '$dom', tel = '$tel', email = '$email', escudo = '$escudo' WHERE id = '$lastid'");
			xlSuccess('El Equipo ha sido Actualizado correctamente');
		}
	}
	if(isset($_POST['del_equip']))
	{
		#Post variables
		$teamid 		=	($_POST['idequip']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$teamid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else
		{
			$addSQ 	=	MYSQL_::Bits("DELETE FROM `equipos` WHERE `id` = '$teamid'");
			xlSuccess('El Equipo ha sido borrado correctamente');
		}
	}

	if(isset($_POST['search_match']))
	{
		#Post variables
		$tempname		=	($_POST['idtemp']);
		$numj 		=	($_POST['numj']);
		$usName 		=	userD($USERID,'user');

		if($tempname == "no" || $numj <= 0 || $numj > 8){
			xlAlert('Debe seleccionar una Temporada y una Jornada para Buscar sus juegos.');
			return;
		}

		$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE temporada = '$tempname' AND num = '$numj'");
		$usR = mysqli_fetch_assoc($usRN);

		$xlSQ3 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE fkjornid = '$usR[id]' AND jornid = '$numj'");
		$xlS2 	=	mysqli_num_rows($xlSQ3);
		if($xlS2 > 0){
			echo '<script language="javascript">window.location="juegos.php?t='.$usR[id].'&j='.$numj.'"</script>';
		}
		else{
			xlAlert('No se encontraron juegos para la Jornada seleccionada.');
		}
	}

	if(isset($_POST['search_match_r']))
	{
		#Post variables
		$tempname		=	($_POST['idtemp']);
		$numj 		=	($_POST['numj']);
		$usName 		=	userD($USERID,'user');

		if($tempname == "no" || $numj <= 0 || $numj > 8){
			xlAlert('Debe seleccionar una Temporada y una Jornada para Buscar sus juegos.');
			return;
		}

		$usRN = MYSQL_::Bits("SELECT * FROM jornadas WHERE temporada = '$tempname' AND num = '$numj'");
		$usR = mysqli_fetch_assoc($usRN);

		$xlSQ3 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE fkjornid = '$usR[id]' AND jornid = '$numj'");
		$xlS2 	=	mysqli_num_rows($xlSQ3);
		if($xlS2 > 0){
			echo '<script language="javascript">window.location="reports.php?t='.$usR[id].'&j='.$numj.'"</script>';
		}
		else{
			xlAlert('No se encontraron juegos para la Jornada seleccionada.');
		}
	}
	if(isset($_POST['goto_match']))
	{
		#Post variables
		$totcount	=	($_POST['totalcount']);
		$temp		=	($_POST['temp']);
		$jorn		=	($_POST['jorn']);
		$idgamex 	=	'idgame'.$totcount;
		$idgame 	= ($_POST[$idgamex]);
		$usName 	=	userD($USERID,'user');

		$xlSQ3 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame'");
		$xlS2 	=	mysqli_num_rows($xlSQ3);

		if($xlS2 > 0){
			echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'"</script>';
		}
		else{
			xlAlert('No se encontraron juegos para la Jornada seleccionada.'.$idgame);
		}
	}

	if(isset($_POST['save_plays']))
	{
		#Post variables
		$ctn 	=	SLS3($_POST['totalcount']);
		$usName  =	userD($USERID,'user');

		if($ctn = 8){
			$id1 = SLS3($_POST['idgame1']);
			$id2 = SLS3($_POST['idgame2']);
			$id3 = SLS3($_POST['idgame3']);
			$id4 = SLS3($_POST['idgame4']);
			$id5 = SLS3($_POST['idgame5']);
			$id6 = SLS3($_POST['idgame6']);
			$id7 = SLS3($_POST['idgame7']);
			$id8 = SLS3($_POST['idgame8']);

			$date1 = SLS3($_POST['datepicker1']);
			$date2 = SLS3($_POST['datepicker2']);
			$date3 = SLS3($_POST['datepicker3']);
			$date4 = SLS3($_POST['datepicker4']);
			$date5 = SLS3($_POST['datepicker5']);
			$date6 = SLS3($_POST['datepicker6']);
			$date7 = SLS3($_POST['datepicker7']);
			$date8 = SLS3($_POST['datepicker8']);

			$hora1 = SLS3($_POST['hora1']);
			$hora2 = SLS3($_POST['hora2']);
			$hora3 = SLS3($_POST['hora3']);
			$hora4 = SLS3($_POST['hora4']);
			$hora5 = SLS3($_POST['hora5']);
			$hora6 = SLS3($_POST['hora6']);
			$hora7 = SLS3($_POST['hora7']);
			$hora8 = SLS3($_POST['hora8']);

			$arb1 = SLS3($_POST['arb1']);
			$arb2 = SLS3($_POST['arb2']);
			$arb3 = SLS3($_POST['arb3']);
			$arb4 = SLS3($_POST['arb4']);
			$arb5 = SLS3($_POST['arb5']);
			$arb6 = SLS3($_POST['arb6']);
			$arb7 = SLS3($_POST['arb7']);
			$arb8 = SLS3($_POST['arb8']);

			if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null || $date3 == null || $hora3 == null || $date4 == null || $hora4 == null || $date5 == null || $hora5 == null || $date6 == null || $hora6 == null || $date7 == null || $hora7 == null || $date8 == null || $hora8 == null){
				xlAlert('No debe dejar vac&iacute;os los campos de Fecha y Hora.');
				return;
			}

			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date1', hour = '$hora1', arb = '$arb1' WHERE id = '$id1'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date2', hour = '$hora2', arb = '$arb2' WHERE id = '$id2'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date3', hour = '$hora3', arb = '$arb3' WHERE id = '$id3'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date4', hour = '$hora4', arb = '$arb4' WHERE id = '$id4'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date5', hour = '$hora5', arb = '$arb5' WHERE id = '$id5'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date6', hour = '$hora6', arb = '$arb6' WHERE id = '$id6'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date7', hour = '$hora7', arb = '$arb7' WHERE id = '$id7'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date8', hour = '$hora8', arb = '$arb8' WHERE id = '$id8'");

			xlSuccess('Información de Juegos guardada correctamente');
		}
		else if($ctn = 4){
			$id1 = SLS3($_POST['idgame1']);
			$id2 = SLS3($_POST['idgame2']);
			$id3 = SLS3($_POST['idgame3']);
			$id4 = SLS3($_POST['idgame4']);

			$date1 = SLS3($_POST['datepicker1']);
			$date2 = SLS3($_POST['datepicker2']);
			$date3 = SLS3($_POST['datepicker3']);
			$date4 = SLS3($_POST['datepicker4']);

			$hora1 = SLS3($_POST['hora1']);
			$hora2 = SLS3($_POST['hora2']);
			$hora3 = SLS3($_POST['hora3']);
			$hora4 = SLS3($_POST['hora4']);

			$arb1 = SLS3($_POST['arb1']);
			$arb2 = SLS3($_POST['arb2']);
			$arb3 = SLS3($_POST['arb3']);
			$arb4 = SLS3($_POST['arb4']);

			if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null || $date3 == null || $hora3 == null || $date4 == null || $hora4 == null){
				xlAlert('No debe dejar vac&iacute;os los campos de Fecha y Hora.');
				return;
			}

			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date1', hour = '$hora1', arb = '$arb1' WHERE id = '$id1'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date2', hour = '$hora2', arb = '$arb2' WHERE id = '$id2'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date3', hour = '$hora3', arb = '$arb3' WHERE id = '$id3'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date4', hour = '$hora4', arb = '$arb4' WHERE id = '$id4'");
			
			xlSuccess('Información de Juegos guardada correctamente');
		}
		else if($ctn = 2){
			$id1 = SLS3($_POST['idgame1']);
			$id2 = SLS3($_POST['idgame2']);

			$date1 = SLS3($_POST['datepicker1']);
			$date2 = SLS3($_POST['datepicker2']);

			$hora1 = SLS3($_POST['hora1']);
			$hora2 = SLS3($_POST['hora2']);

			$arb1 = SLS3($_POST['arb1']);
			$arb2 = SLS3($_POST['arb2']);

			if($date1 == null || $hora1 == null || $date2 == null || $hora2 == null){
				xlAlert('No debe dejar vac&iacute;os los campos de Fecha y Hora.');
				return;
			}

			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date1', hour = '$hora1', arb = '$arb1' WHERE id = '$id1'");
			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date2', hour = '$hora2', arb = '$arb2' WHERE id = '$id2'");
			
			xlSuccess('Información de Juegos guardada correctamente');
		}
		else{
			$id1 = SLS3($_POST['idgame1']);

			$date1 = SLS3($_POST['datepicker1']);

			$hora1 = SLS3($_POST['hora1']);

			$arb1 = SLS3($_POST['arb1']);

			if($date1 == null || $hora1 == null){
				xlAlert('No debe dejar vac&iacute;os los campos de Fecha y Hora.');
				return;
			}

			MYSQL_::Bits("UPDATE `juegos` SET fech = '$date1', hour = '$hora1', arb = '$arb1' WHERE id = '$id1'");
			
			xlSuccess('Información de Juegos guardada correctamente');
		}
	}
	function AllAdm($search) {     

      $Q = MYSQL_::Bits("SELECT * FROM users WHERE name LIKE '".$search."%' ");

      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<br><center><b style="color:red;">No se encontraron Usuarios con ese nombre.</b></center><br>';
	  	return;
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>ID</th><th>Nombre</th><th>Nombre Usuario</th><th>Email</th><th>Ip</th><th>Fecha Registro</th><th>Cargo</th><th>Eliminar</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
      	if($CInfo['rank'] == 1){
      		$carg = "Admin";
      	}
      	else{
      		$carg = "Dueño";
      	}
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['id'] ."</td>";
       $TCodes .= "<td>". $CInfo['name'] ."</td>";
       $TCodes .= "<td>". $CInfo['user'] ."</td>";
       $TCodes .= "<td>". $CInfo['email'] ."</td>";
       $TCodes .= "<td>". $CInfo['ip'] ."</td>";
       $TCodes .= "<td>". date("Y-m-d (H:i:s)", $CInfo['day_reg']) ."</td>";
       $TCodes .= "<td>". $carg ."</td>";    
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idadm" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_adm" value="">
       </form></td>';
       $TCodes .= "</tr>";
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}

	function AllPlayers($search) {     

      $Q = MYSQL_::Bits("SELECT * FROM jugadores WHERE nombre LIKE '".$search."%' ");

      $xlS 	=	mysqli_num_rows($Q);
	  if($xlS <= 0){
	  	echo '<br><center><b style="color:red;">No se encontraron jugadores con ese nombre.</b></center><br>';
	  	return;
	  }

      $TCodes = "<table style='width: 100%;'><tr><th>ID</th><th>Nombre</th><th>Ap. Paterno</th><th>Ap. Materno</th><th>Equipo</th><th>N&uacute;mero</th><th>Posici&oacute;n</th><th>Edad</th><th>Peso</th><th>Estatura</th><th>Capitan</th><th>Goles</th><th>Faltas</th><th>Tarj. A</th><th>Tarj. R</th><th>Foto</th><th>Eliminar</th><th>Editar</th></tr>";

      while($CInfo = mysqli_fetch_assoc($Q)):
       $TCodes .= "<tr>";
       $TCodes .= "<td>". $CInfo['id'] ."</td>";
       $TCodes .= "<td>". $CInfo['nombre'] ."</td>";
       $TCodes .= "<td>". $CInfo['ap_pa'] ."</td>";
       $TCodes .= "<td>". $CInfo['ap_ma'] ."</td>";
       $TCodes .= "<td>". $CInfo['equip_id'] ."</td>";
       $TCodes .= "<td>". $CInfo['num'] ."</td>";
       $TCodes .= "<td>". $CInfo['pos'] ."</td>";
       $TCodes .= "<td>". $CInfo['edad'] ."</td>";
       $TCodes .= "<td>". $CInfo['peso'] ."</td>";
       $TCodes .= "<td>". $CInfo['estatura'] ."</td>";
       $TCodes .= "<td>". $CInfo['capitan'] ."</td>";
       $TCodes .= "<td>". $CInfo['goles'] ."</td>";
       $TCodes .= "<td>". $CInfo['faltas'] ."</td>";
       $TCodes .= "<td>". $CInfo['tar_am'] ."</td>";
       $TCodes .= "<td>". $CInfo['tar_r'] ."</td>";
       $TCodes .= "<td><img src='". $CInfo['photo'] ."' width='50' height='50' style='border:solid 1px;border-color:#d0d1d4;'/></td>";       
       $TCodes .= '<td><form method="POST">
       	<input type="text" name="idjug" value="'.$CInfo['id'].'" style="display: none;">
       	<input style="background-image:url(/bmpanel/images/icn_alert_error.png);background-position:1px 1px;" type="submit" name="del_jug" value="">
       </form></td>';
       $TCodes .= '<td><a href="/bmpanel/newplayer.php?id='.$CInfo['id'].'"><input style="background-image:url(/bmpanel/images/icn_edit_article.png);background-position:1px 1px;" type="submit" name="goto" value=""></a></td>';
       $TCodes .= "</tr>";
       $TCodes .= "</tr>";
      endwhile;
      $TCodes .= "</table>";
      return $TCodes;

	}
	if(isset($_POST['search_player']))
	{
		#Post variables
		$search		=	($_POST['name']);
		$usName 		=	userD($USERID,'user');

		echo '<script language="javascript">window.location="jugadores.php?id='.$search.'"</script>';
	}
	if(isset($_POST['search_adm']))
	{
		#Post variables
		$search		=	($_POST['name']);
		$usName 		=	userD($USERID,'user');

		echo '<script language="javascript">window.location="administradores.php?id='.$search.'"</script>';
	}
	if(isset($_POST['add_player']))
	{
		#Post variables
		$id 		=	SLS3($_POST['equip']).'_'.SLS3($_POST['num']);
		$name 		=	SLS3($_POST['name']);
		$ap1 		=	SLS3($_POST['ap1']);
		$ap2 		=	SLS3($_POST['ap2']);
		$equip 		=	SLS3($_POST['equip']);
		$num 		=	SLS3($_POST['num']);
		$pos 		=	SLS3($_POST['pos']);
		$edad 		=	SLS3($_POST['edad']);
		$peso 		=	SLS3($_POST['peso']);
		$estatura 	=	SLS3($_POST['estatura']);
		$cap 		=	SLS3($_POST['cap']);
		$foto 		=	SLS3($_POST['foto']);
		$usName 	=	userD($USERID,'user');

		if($id == null || $name == null || $ap1 == null || $ap2 == null || $num == null|| $pos == null|| $edad == null|| $peso == null|| $estatura == null|| $cap == null || $equip == "no"){
			xlAlert('Debe rellenar los campos obligatorios indicados con un (*).');
			return;
		}
		else if(strlen($id) <= 2 || strlen($id) >= 8){
			xlAlert('El ID debe ser mayor a 3 y menor a 7 Caracteres.');
			return;
		}
		else if(strlen($name) <= 3){
			xlAlert('El nombre del Jugador debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(strlen($ap1) <= 3){
			xlAlert('El apellido paterno debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(strlen($ap1) <= 3){
			xlAlert('El apellido materno debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(!is_numeric($num)){
			xlAlert('El n&uacute;mero debe ser Entero.');
			return;
		}
		else if(!is_numeric($edad)){
			xlAlert('La edad debe ser un n&uacute;mero Entero.');
			return;
		}
		else if(!is_numeric($estatura)){
			xlAlert('El valor de la estatura debe ser num&eacute;rico.');
			return;
		}
		
		$xlSQ1 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$equip' AND vacantes >= '1'");
		$xlS1	=	mysqli_num_rows($xlSQ1);
		if($xlS1 < 1)
		{
			xlAlert('Lo sentimos, pero ya no hay Vacantes para ese Equipo.');
			return;
		}
		

		if($cap == "NO")
			$capitan = 0;
		else
			$capitan = 1;

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM jugadores WHERE id = '$id'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Jugador con el mismo n&uacute;mero en el mismo Equipo.');
		}
		else
		{
			if($capitan == 1){
				MYSQL_::Bits("UPDATE `jugadores` SET `capitan` = '0' WHERE equip_id = '$equip'");
			}

			MYSQL_::Bits("UPDATE `equipos` SET `vacantes` = vacantes-1 WHERE id = '$equip'");

			$SQL1 = MYSQL_::Bits("INSERT INTO `jugadores` (`id`, `nombre`, `ap_pa`, `ap_ma`, `equip_id`, `num`, `pos`, `edad`, `peso`, `estatura`, `capitan`, `goles`, `faltas`, `tar_r`, `tar_am`, `photo`) VALUES ('$id', '$name', '$ap1', '$ap2', '$equip', '$num', '$pos', '$edad', '$peso', '$estatura', '$capitan', '0', '0', '0', '0', '$foto');");
			if($SQL1)
				xlSuccess('Jugador registrado correctamente');
			else
				xlAlert('No se ha podido Registrar al Jugador. Asegurese de ingresar información válida en todos los campos.');
		}
	}
	if(isset($_POST['save_player']))
	{
		#Post variables
		$lastid		=	SLS3($_POST['lastid']);
		$id 		=	SLS3($_POST['equip']).'_'.SLS3($_POST['num']);
		$name 		=	SLS3($_POST['name']);
		$ap1 		=	SLS3($_POST['ap1']);
		$ap2 		=	SLS3($_POST['ap2']);
		$equip 		=	SLS3($_POST['equip']);
		$lastequip	=	SLS3($_POST['lastequip']);
		$num 		=	SLS3($_POST['num']);
		$pos 		=	SLS3($_POST['pos']);
		$edad 		=	SLS3($_POST['edad']);
		$peso 		=	SLS3($_POST['peso']);
		$estatura 	=	SLS3($_POST['estatura']);
		$cap 		=	SLS3($_POST['cap']);
		$foto 		=	SLS3($_POST['foto']);
		$usName 	=	userD($USERID,'user');

		if($id == null || $name == null || $ap1 == null || $ap2 == null || $num == null|| $pos == null|| $edad == null|| $peso == null|| $estatura == null  || $cap == null || $lastid == null || $equip == "no"){
			xlAlert('Debe rellenar los campos obligatorios indicados con un (*).');
			return;
		}
		else if(strlen($id) <= 2 || strlen($id) >= 8){
			xlAlert('El ID debe ser mayor a 3 y menor a 7 Caracteres.');
			return;
		}
		else if(strlen($name) <= 3){
			xlAlert('El nombre del Jugador debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(strlen($ap1) <= 3){
			xlAlert('El apellido paterno debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(strlen($ap1) <= 3){
			xlAlert('El apellido materno debe contener m&aacute;s de 3 Caracteres.');
			return;
		}
		else if(!is_numeric($num)){
			xlAlert('El n&uacute;mero debe ser Entero.');
			return;
		}
		else if(!is_numeric($edad)){
			xlAlert('La edad debe ser un n&uacute;mero Entero.');
			return;
		}
		else if(!is_numeric($estatura)){
			xlAlert('El valor de la estatura debe ser num&eacute;rico.');
			return;
		}

		if($equip != $lastequip){
			// Si hay cambio de Equipo
			$xlSQ1 	=	MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$equip' AND vacantes >= '1'");
			$xlS1	=	mysqli_num_rows($xlSQ1);
			if($xlS1 < 1)
			{
				xlAlert('Lo sentimos, pero ya no hay Vacantes para ese Equipo.');
				return;
			}
			else
			{
				MYSQL_::Bits("UPDATE `equipos` SET `vacantes` = vacantes-1 WHERE id = '$equip'");
				MYSQL_::Bits("UPDATE `equipos` SET `vacantes` = vacantes+1 WHERE id = '$lastequip'");
			}

		}

		if($cap == "NO")
			$capitan = 0;
		else
			$capitan = 1;

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM jugadores WHERE id = '$id' AND id != '$lastid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS > 0)
		{
			xlAlert('Lo sentimos pero ya existe un Jugador con el mismo n&uacute;mero en el mismo Equipo.');
		}
		else
		{
			if($capitan == 1){
				MYSQL_::Bits("UPDATE `jugadores` SET `capitan` = '0'");
			}

			$SQL11 = MYSQL_::Bits("UPDATE `jugadores` SET id = '$id', nombre = '$name', ap_pa = '$ap1', ap_ma = '$ap2', equip_id = '$equip', num = '$num', pos = '$pos', edad = '$edad', peso = '$peso', estatura = '$estatura', capitan = '$capitan', photo = '$foto' WHERE id = '$lastid'");
			if($SQL11)
				xlSuccess('Jugador editado correctamente');
			else
				xlAlert('No se ha podido editar al Jugador. Asegurese de ingresar información válida en todos los campos.'.$edad);
		}
	}
	if(isset($_POST['del_adm']))
	{
		#Post variables
		$tempid 		=	($_POST['idadm']);
		$usID 		=	userD($USERID,'id');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM users WHERE id = '$tempid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else if($tempid == $usID){
			xlAlert('No puede eliminar a su propio usuario.');
		}
		else
		{
			$xlSQ1 	=	MYSQL_::Bits("DELETE FROM `users` WHERE `id` = '$tempid'");
			xlSuccess('El Jugador ha sido borrado correctamente');
		}
	}
	if(isset($_POST['del_jug']))
	{
		#Post variables
		$tempid 		=	($_POST['idjug']);
		$usName 		=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM jugadores WHERE id = '$tempid'");
		$xlS 	=	mysqli_num_rows($xlSQ);

		if($xlS <= 0)
		{
			xlAlert('Ha ocurrido un error indeterminado.');
		}
		else
		{
			$CInfo = mysqli_fetch_assoc($xlSQ);
			MYSQL_::Bits("UPDATE `equipos` SET `vacantes` = vacantes+1 WHERE id = '$CInfo[equip_id]'");
			$xlSQ1 	=	MYSQL_::Bits("DELETE FROM `jugadores` WHERE `id` = '$tempid'");
			xlSuccess('El Jugador ha sido borrado correctamente');
		}
	}

	// Matches
	if(isset($_POST['match_goals']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=goals"</script>';
	}
	if(isset($_POST['match_faltas']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=faltas"</script>';
	}
	if(isset($_POST['match_comments']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=comments"</script>';
	}
	// SUB MATCHES
	if(isset($_POST['match_goals_eq']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$eq 		=	($_POST['equipo']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=goals&eq='.$eq.'"</script>';
	}
	if(isset($_POST['report_goal']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$jugid 		=	($_POST['jugid']);
		$minut 		=	($_POST['minut']);
		$eq 		=	($_POST['equipo']);
		$usName 	=	userD($USERID,'user');

		MYSQL_::Bits("INSERT INTO goals (juego_id,jugador_id,minut) VALUES ('$idgame','$jugid','$minut') ");

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame' AND equip1 = '$eq' ");
		$xlS 	=	mysqli_num_rows($xlSQ);
		if($xlS > 0){
			MYSQL_::Bits("UPDATE `juegos` SET goals1 = goals1+1 WHERE id = '$idgame'");
		}
		else{
			MYSQL_::Bits("UPDATE `juegos` SET goals2 = goals2+1 WHERE id = '$idgame'");
		}
		
		MYSQL_::Bits("UPDATE `jugadores` SET goles = goles+1 WHERE id = '$jugid'");

		// Agregar Comentario Automático
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame'");
		$usR = mysqli_fetch_assoc($xlSQ);

		if($eq == $usR["equip1"]){
			$eqRiv = $usR["equip2"];
		}
		else{
			$eqRiv = $usR["equip1"];
		}

		$tcomment = $usR["comments"] . "<br>Gol del Equipo ".Get('equipos', 'id', $eq, 'name')." por parte del Jugador ".Get('jugadores', 'id', $jugid, 'nombre').". En el minuto ".$minut;

		MYSQL_::Bits("UPDATE `juegos` SET comments = '$tcomment' WHERE id = '$idgame'");

		MYSQL_::Bits("UPDATE `equipos` SET gf = gf+1 WHERE id = '$eq'");
		MYSQL_::Bits("UPDATE `equipos` SET gc = gc+1 WHERE id = '$eqRiv'");
		// End Comment

		echo '<script language="javascript">alert("Reporte de Gol Guardado correctamente");</script>';
		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'"</script>';
	}
	// Sub Faltas
	if(isset($_POST['match_faltas_eq']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$eq 		=	($_POST['equipo']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=faltas&eq='.$eq.'"</script>';
	}
	if(isset($_POST['report_falta']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$jugid 		=	($_POST['jugid']);
		$minut 		=	($_POST['minut']);
		$eq 		=	($_POST['equipo']);
		$tarj 		=	($_POST['tarj']);
		$usName 	=	userD($USERID,'user');
		$tarjname = "Ninguna";

		MYSQL_::Bits("INSERT INTO faltas (juego_id,jugador_id,tarjeta,minut) VALUES ('$idgame','$jugid','$tarj','$minut') ");

		if($tarj == "a"){
			MYSQL_::Bits("UPDATE `jugadores` SET tar_am = tar_am+1 WHERE id = '$jugid'");
			$tarjname = "Amarilla";
		}
		else if($tarj == "r"){
			MYSQL_::Bits("UPDATE `jugadores` SET tar_r = tar_r+1 WHERE id = '$jugid'");
			$tarjname = "Roja";
		}
		
		MYSQL_::Bits("UPDATE `jugadores` SET faltas = faltas+1 WHERE id = '$jugid'");

		// Agregar Comentario Automático
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame'");
		$usR = mysqli_fetch_assoc($xlSQ);

		$tcomment = $usR["comments"] . "<br>Falta del Equipo ".Get('equipos', 'id', $eq, 'name')." por parte del Jugador ".Get('jugadores', 'id', $jugid, 'nombre').". Tarjeta: ".$tarjname.". En el minuto ".$minut;

		MYSQL_::Bits("UPDATE `juegos` SET comments = '$tcomment' WHERE id = '$idgame'");
		// End Comment

		echo '<script language="javascript">alert("Reporte de Falta guardado correctamente");</script>';
		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'"</script>';
	}
	// Sub Comentarios
	if(isset($_POST['match_comments']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$usName 	=	userD($USERID,'user');

		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'&type=comments"</script>';
	}
	if(isset($_POST['report_comment']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$eq 		=	($_POST['equipo']);
		$comment 		=	'<br>'.$_POST['comment'];
		$usName 	=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame'");
		$usR = mysqli_fetch_assoc($xlSQ);

		$tcomment = $usR["comments"] . $comment;

		MYSQL_::Bits("UPDATE `juegos` SET comments = '$tcomment' WHERE id = '$idgame'");

		echo '<script language="javascript">alert("Comentario Guardado correctamente");</script>';
		echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'"</script>';
	}
	// Sub end match
	if(isset($_POST['match_end']))
	{
		#Post variables
		$temp		=	($_POST['tempo']);
		$jorn		=	($_POST['jorna']);
		$idgame	=	($_POST['matchid']);
		$eq 		=	($_POST['equipo']);
		$usName 	=	userD($USERID,'user');

		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM juegos WHERE id = '$idgame'");
		$usR = mysqli_fetch_assoc($xlSQ);

		if($usR["played"] == '1'){
			echo '<script language="javascript">alert("AVISO: Este juego ya ha sido declarado Finalizado. No se hicieron cambios.");</script>';
		}
		else{
			if($usR["goals1"] > $usR["goals2"]){
				// Gana eq1
				MYSQL_::Bits("UPDATE `equipos` SET vics = vics+1 WHERE id = '$usR[equip1]'");
				MYSQL_::Bits("UPDATE `equipos` SET ders = ders+1 WHERE id = '$usR[equip2]'");
			}
			else if($usR["goals1"] > $usR["goals2"]){
				// Gana eq2
				MYSQL_::Bits("UPDATE `equipos` SET vics = vics+1 WHERE id = '$usR[equip2]'");
				MYSQL_::Bits("UPDATE `equipos` SET ders = ders+1 WHERE id = '$usR[equip1]'");
			}
			else{
				// Empate
				MYSQL_::Bits("UPDATE `equipos` SET emps = emps+1 WHERE id = '$usR[equip1]'");
				MYSQL_::Bits("UPDATE `equipos` SET emps = emps+1 WHERE id = '$usR[equip2]'");
			}

			MYSQL_::Bits("UPDATE `juegos` SET played = '1' WHERE id = '$idgame'");


			MYSQL_::Bits("UPDATE `equipos` SET jj = jj+1 WHERE id = '$usR[equip1]'");
			MYSQL_::Bits("UPDATE `equipos` SET jj = jj+1 WHERE id = '$usR[equip2]'");

			echo '<script language="javascript">alert("El Juego ha sido declarado como Finalizado exitosamente.");</script>';
			echo '<script language="javascript">window.location="reports.php?t='.$temp.'&j='.$jorn.'&m='.$idgame.'"</script>';
		}		
	}
	#MANT
	if(isset($_POST['turn_mant']))
	{
		#Post variables
		$tovalue	=	($_POST['tovalue']);
		$usName 	=	userD($USERID,'user');

		MYSQL_::Bits("UPDATE `config_site` SET mant = '$tovalue'");
		xlSuccess('Mantenimiento modificado correctamente');
	}
	#REGS
	if(isset($_POST['turn_regs']))
	{
		#Post variables
		$tovalue	=	($_POST['tovalue']);
		$usName 	=	userD($USERID,'user');

		MYSQL_::Bits("UPDATE `config_site` SET regs = '$tovalue'");
		xlSuccess('Registros modificado correctamente');
	}

	#Total de usuarios con rango
	function xlRanks()
	{
		$xlSQ 	=	MYSQL_::Bits("SELECT * FROM users WHERE rank >= 2 ");
		$xlS 	=	mysqli_num_rows($xlSQ);
		return $xlS;
	}

	#Funcion para mostrar alerta en la administración
	function xlAlert($alert)
	{
		$text =	$alert;
		echo '<h4 class="alert_error">'.$text.'</h4>';
	}

	#Funcion para mostrar alerta susesiva (verde) en la administración
	function xlSuccess($alert)
	{
		$text 	=	$alert;
		echo '<h4 class="alert_success">'.$text.'</h4>';
	}

	#Agregando una nueva noticia
	if(isset($_POST['xl_art_add']))
	{
		#Post variables
		$title 		=	SLS3($_POST['xl_art_title']);
		$content 	=	SLS3($_POST['xl_art_content']);
		$fecha 		=	timeD();
		$usID 		=	$USERID;

		$addSQ 		=	MYSQL_::Bits("INSERT INTO articles_news (title,content,time,userid) VALUES ('$title','$content','$fecha','$usID') ");
		xlSuccess('La noticia ha sido creada correctamente');
		Refresh();
	}
	
	#Cerrando sesión
	if(isset($_POST['xl_logout']))
	{
		if($_SESSION == TRUE)
		{
			session_start();
			session_destroy();
			xlSuccess('Haz cerrado tu sesión correctamente, ahora espera la reedirección automatica');
        	echo '<meta http-equiv="Refresh" content="2;url='.Site.'/inicio">';
		}
		else
		{
			xlAler('Lo sentimos pero no puedes cerrar sesión, ha ocurrido algún error interno');
		}

	}

	# Genera code de registro
	if(isset($_POST['add_access_code'])){
		$_SESSION['NewCode'] = CreateBCodes($_POST['username']);
		//gO(''.Site.'/bmpanel/newcode.php','1');
	}

?>
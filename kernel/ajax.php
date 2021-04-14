<?php
	# Login
	if(isset($_POST['login_user'])){
		//Limpiamos variables
		$user 	=	SLS3($_POST['login_user']);
		$pass 	=	SLS3($_POST['login_pass']);

		//Verificamos que no se dejen campos vacios
		if($user == NULL || $pass == NULL)
		{
			Alertas('dangers','Lo sentimos pero no puedes dejar campos vacios');
		}
		else
		{
			//Encriptamos contraseña
			$pas4 	=	SLS4($pass);

			//Realizamos consulta a los usuarios registrados
			$userAcc 	=	MYSQL_::Bits("SELECT * FROM users WHERE user = '$user' ");
			$userA 		=	mysqli_fetch_assoc($userAcc);
			$userS 		=   mysqli_num_rows($userAcc);

			//Verificamos existencia de usuario
			if($userS >= 1)
			{
				//Verificamos contraseña && usuario
				if($user == $userA['user'] AND $pas4 == $userA['pass'])
				{
					//Encriptamos usuario
					$use4 	=	SLS4($user);
					//Iniciamos sesión
					session_start();
					//Almacenamos sesiones de ID & RANK
					$_SESSION['ID'] = $userA['id'];
					$_SESSION['RK'] = $userA['rank'];
					//Alertamos de que ha iniciado sesión
					Alertas('succes','Haz iniciado sesión en '.BN('title').' como '.$userA['user'].' ');
					gO(''.Site.'/inicio?loged='.$use4.'','1');
				}
				else
				{
					Alertas('dangers','Lo sentimos pero la contraseña no es correcta');
				}
			}
			else
			{
				Alertas('dangers','Lo sentimos pero este nombre de usuario no existe');
			}
		}
	}

	# Registro de usuario
	if(isset($_POST['reg_user']))
	{
		//Limpiamos variables
		$user = SLS3($_POST['reg_user']);
		$name = SLS3($_POST['reg_name']);
		$pass = SLS3($_POST['reg_pass']);
		$pas2 = SLS3($_POST['reg_pas2']);
		$emal = SLS3($_POST['reg_emal']);
		$clv = SLS3($_POST['reg_clv']);

		//Establecemos datos privados
		$usip = iP();
		$dreg = timeD();

		//Verificamos que no se dejen campos vacios
		if($user == NULL || $name == NULL || $pass == NULL || $pas2 == NULL || $emal == NULL || $clv == NULL)
		{
			Alertas('dangers','Lo sentimos pero no puedes dejar campos vacios');
		}
		else
		{
			//No existen campos vacios & verificamos que no exista otro nombre de usuario igual
			$userComp = MYSQL_::Bits("SELECT * FROM users");
			$userC 	  = mysqli_fetch_assoc($userComp);
			if($user == $userC['user'])
			{
				Alertas('dangers','Lo sentimos pero este nombre de usuario no esta disponible');
			}
			else
			{
				//No existe otro usuario con ese mismo nombre & verificamos que las contraseñas coincidan
				if($pass != $pas2)
				{
					Alertas('dangers','Lo sentimos pero las contraseñas no coinciden');
				}
				else if(!IsCode($clv)){
					Alertas('dangers','La clave ingresada no es valida');
				}
				else
				{
					//Las contraseñas son las mismas & encriptamos la contraseña & procedemos a grabar datos
					
					//Encriptamos la contraseña en SLS4
					$pas4 = SLS4($pass);
					//Encriptamos nombre de usuario
					$use4 = SLS4($user);
					//Grabamos los datos en la base
					$userAdd = MYSQL_::Bits("INSERT INTO users (user,name,pass,email,habbo,ip,day_reg) VALUES ('$user','$name','$pas4','$emal','$clv','$usip','$dreg') ");
					Alertas('succes','Tu cuenta ha sido creada con éxito en '.BN('title').' como '.$user.'');
					UpdateBCodes($clv, $user);
					//Reedireccionamos al usuario
					gO(''.Site.'/inicio?registed='.$use4.'','1');

				}
			}
		}
	}
?>
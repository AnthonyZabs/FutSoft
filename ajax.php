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
?>
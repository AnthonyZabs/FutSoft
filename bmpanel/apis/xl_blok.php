<?php 
	// Aseguramos que exista una session

	if($_SESSION == FALSE){
		Headers(Site.'/inicio?notsesion');
	}

	if(userD($USERID,'rank') < 1){
		Headers(Site.'/inicio?notrank');
	}

?>
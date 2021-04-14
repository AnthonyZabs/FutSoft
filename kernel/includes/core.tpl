<?php 

	function sON()
	{
		if($_SESSION['ID'] == TRUE)
		{
			Headers(Site."/inicio?sessionactive");
		}
	}

	function sOF()
	{
		if($_SESSION['ID'] == FALSE)
		{
			Headers(Site."/inicio?nosession");
		}
	}

?>
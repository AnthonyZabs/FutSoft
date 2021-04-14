<?php 
	function Headers($header)
	{
		header("location: ".$header."");
	}

    function Alertas($var1,$var2)
    {
        $tipo   =   $var1;
        $text   =   $var2;
        echo '<div id="Alerta"><div class="Alerta '.$tipo.'"><span onclick="document.getElementById(\'Alerta\').style.display = \'none\'">X</span>'.$text.'</div></div> ';
    }

    # Recibe parámetros de los mensajes en validaciones para enviarlo vía AJAX.
    function Alert($type, $text, $js=null)
    {
        $Alert['status'] = $type;
        $Alert['msg'] = $text;

        $Alert['js'] = $js;

        // Mandamos respuesta AJAX
        header('Content-type: application/json');
        echo json_encode($Alert);
    }

    function onSES()
    {
        if($_SESSION == TRUE)
        {
            Headers(Site.'/inicio');
        }
    }

    function ofSES()
    {
        if($_SESSION == FALSE)
        {
            Headers(Site.'/inicio');
        }
    }
?>
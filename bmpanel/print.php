<?php
	require '../init.php';
	require('../bmpanel/js/fpdf/fpdf.php');

	class PDF extends FPDF
	{
		// Cabecera de página
		function Header()
		{
		    // Logo
		    $this->Image(BN('www') . '/resources/wp-content/themes/futsoft/images/logo1.png',10,10,10);
		    // Arial bold 15
		    $this->SetFont('Arial','B',15);
		    // Movernos a la derecha
		    $this->Cell(-2);
		    // Título
		    $this->Cell(195,14,'FutSoft',1,1,'C');
		    $this->Cell(-2);
		    $this->SetFont('Arial','',10);
		    $this->Cell(195,5,utf8_decode('Generación de reportes estadísticos de Jornadas por Temporada'),1,1,'C');
		    $this->Ln(5);
		}

		// Pie de página
		function Footer()
		{
		    // Posición: a 1,5 cm del final
		    $this->SetY(-15);
		    // Arial italic 8
		    $this->SetFont('Arial','I',8);
		    // Número de página
		    $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
		}
	}

	$pdf = new PDF();
	$pdf->AddPage();

	$Q = MYSQL_::Bits('SELECT * FROM temporadas');
    $xlS  = mysqli_num_rows($Q);

    if($xlS <= 0){
      $pdf->Cell(190,6,utf8_decode('No hay temporadas generadas aún'),0,1,'C');
    }
    else{
      	while($CInfo = mysqli_fetch_assoc($Q)){
			$pdf->Cell(190,6,utf8_decode('Jornadas para la ' . $CInfo["name"]),0,1,'C');
			$pdf->Ln(5);

	      	$xlSQ3  = MYSQL_::Bits("SELECT * FROM jornadas WHERE temporada = '$CInfo[name]'");
	      	$xlS3   = mysqli_num_rows($xlSQ3);
	      	if($xlS3 > 0){ 
	        	while($Inf2 = mysqli_fetch_assoc($xlSQ3)){
					// Cabecera
					$pdf->SetFillColor(51,51,51);
					$pdf->SetTextColor(255,255,255);
					$pdf->SetFont('Arial','B',15);
					$pdf->Cell(190,6,utf8_decode('Jornada ' . $Inf2["num"]),1,1,'C', true);

					$pdf->SetFont('Arial','B',10);
					$pdf->Cell(45,6,utf8_decode('Fecha & Horario'),1,0,'C', true);
					$pdf->Cell(30,6,utf8_decode('Equipo Local'),1,0,'C', true);
					$pdf->Cell(15,6,utf8_decode('Goles'),1,0,'C', true);
					$pdf->Cell(30,6,utf8_decode('Equipo Visitante'),1,0,'C', true);
					$pdf->Cell(15,6,utf8_decode('Goles'),1,0,'C', true);
					$pdf->Cell(55,6,utf8_decode('Arbitro'),1,1,'C', true);

					// Filas
					$pdf->SetFont('Arial','',10);
					$pdf->SetTextColor(0,0,0);

					$xlSQ4  = MYSQL_::Bits("SELECT * FROM juegos WHERE fkjornid = '$Inf2[id]'");
			        while($Inf3 = mysqli_fetch_assoc($xlSQ4)){
			        	$xlSQ5  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$Inf3[equip1]'");
			          	$E1 = mysqli_fetch_assoc($xlSQ5);
			          	$xlSQ6  = MYSQL_::Bits("SELECT * FROM equipos WHERE id = '$Inf3[equip2]'");
			          	$E2 = mysqli_fetch_assoc($xlSQ6);

						$pdf->Cell(45,10,utf8_decode($Inf3["fech"] . ' (' .$Inf3["hour"]. ')'),1,0,'C');
						$pdf->Cell(30,10,utf8_decode($E1["name"]),1,0,'C');
						$pdf->Cell(15,10,$Inf3["goals1"],1,0,'C');
						$pdf->Cell(30,10,utf8_decode($E2["name"]),1,0,'C');
						$pdf->Cell(15,10,$Inf3["goals2"],1,0,'C');
						$pdf->Cell(55,10,utf8_decode($Inf3["arb"]),1,1,'C');
					}
					$pdf->Ln(5);
				}
			}
			else{
				$pdf->Cell(190,6,utf8_decode('No hay jornadas para esta temporada'),0,1,'C');
			}
		}
	}

	$pdf->Output();
?>
SELECT * FROM TablaISR

SELECT CONCAT('{',
			   tb.LimInf,'m', 
			  ',', tb.LimSup, 'm', 
			  ',', tb.cuotaFija, 'm',  
			  ',', tb.ExedLimInf, 'm', 
			  ',',tb.Subsidio, 'm', 
			  '}',',')
FROM TablaISR tb



SELECT CONCAT('{new itemISR {',
			   'LimInf=',tb.LimInf, 
			  ',','LimSup=', tb.LimSup,
			  ',', 'CuotaFija=',tb.cuotaFija, 
			  ',', 'ExedLimInf=',tb.ExedLimInf, 
			  ',','Subsidio=',tb.Subsidio, 
			  '}',',')
FROM TablaISR tb
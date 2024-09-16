<div class="container-info-resumo d-flex flex-column justify-content-center align-items-center mx-auto px-2 px-md-3 py-3 py-md-5" style= "background-color: ${Color50897339.getData()};">
   <span class="mb-2 info-title text-ms-nowrap">
	   <#if (Text17017996.getData())??>
	     ${Text17017996.getData()}
     </#if>
	 </span>
	 <div class="d-flex align-items-end">
	   <span class="info-number d-flex align-items-end mr-1">
	      ${fetchedData.USDBRL.high}
	   </span>
		 <span class="info-text d-flex align-items-end mb-1">
	      reais
	   </span>
	 </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
        fetch('https://economia.awesomeapi.com.br/json/last/USD-BRL')
            .then(response => response.json())
            .then(data => {
                fetchedData = data;
                var highUSD = data.USDBRL.high;
                var infoNumberElements = document.querySelectorAll('.info-number');
                infoNumberElements.forEach(element => {
                element.innerText = highUSD;
            });
            })
            .catch(error => console.error('Error fetching API:', error));
      });

</script>

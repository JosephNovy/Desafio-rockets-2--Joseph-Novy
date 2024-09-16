<div class="contanier-grafico-mychart d-flex flex-column justify-content-center align-items-center px-2 px-md-4 py-1 py-md-3 mx-auto" onclick="openModalbar()">
  <h2 class="mb-3">
	  <#if (Text15948324.getData())??>
	    ${Text15948324.getData()}
    </#if>
 </h2>
  <canvas id="myChartbar-${Text15948324.getData()}" class="chart-bar"></canvas>
</div>
<!-- Modal -->
<div id="myModal-barra-${Text15948324.getData()}" class="modal">
  <div class="modal-content">
    <span class="close close-btn" onclick="closeModalbar()">&times;</span>
    <canvas id="modalChartbar-${Text15948324.getData()}"></canvas>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
      function fetchDataAndCreateChartBar() {
        fetch('https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL')
            .then(response => response.json())
            .then(data => {
                fetchedData = data;
                createBarChart(fetchedData);
            })
            .catch(error => console.error('Error fetching API:', error));
      };
  function createBarChart() {
    const ctxb = document.getElementById('myChartbar-${Text15948324.getData()}').getContext('2d');
    var barChart = new Chart(ctxb, {
      type: 'bar',
      data: {
        labels: ['Dólar', 'Euro'],
        datasets: [{
				  label: 'Cotação do Dolar', 
          data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
					backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
           ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
  function openModalbar() {
	  document.getElementById('myModal-barra-${Text15948324.getData()}').style.display = 'block';
    document.body.classList.add('modalOpen');
	  const ctxb = document.getElementById('modalChartbar-${Text15948324.getData()}').getContext('2d');
    var barChart = new Chart(ctxb, {
      type: 'bar',
      data: {
        labels: ['Dólar', 'Euro'],
        datasets: [{
          label: 'Cotação do Dolar',
          data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
					backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
           ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
   }

   function closeModalbar() {
       document.getElementById('myModal-barra-${Text15948324.getData()}').style.display = 'none';
       document.body.classList.remove('modalOpen');
   }
   fetchDataAndCreateChartBar()
	 createBarChart()
</script>


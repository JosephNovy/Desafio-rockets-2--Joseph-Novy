<div class="contanier-grafico-doughnut d-flex flex-column justify-content-center mx-auto px-2 px-md-4 py-1 py-md-3 align-items-center" onclick="openModalDoughnut()">
  <h2 class="mb-3">
	  <#if (Text15948324.getData())??>
	    ${Text15948324.getData()}
    </#if>
 </h2>
  <canvas id="doughnut-chart-${Text15948324.getData()}" class="chart-doughnut"></canvas>
</div>
<div id="myModal-doughnut-${Text15948324.getData()}" class="modal">
  <div class="modal-content">
    <span class="close close-btn" onclick="closeModalDoughnut()">&times;</span>
    <canvas id="modaldoughnut-${Text15948324.getData()}"></canvas>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    function fechtdataRosca() {
    fetch('https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL')
        .then(response => response.json())
        .then(data => {
            fetchedData = data;
            createDoughnutChart(fetchedData);
        })
        .catch(error => console.error('Error fetching API:', error));
    };
   function createDoughnutChart() {
    var ctxd = document.getElementById('doughnut-chart-${Text15948324.getData()}').getContext('2d');
    var doughnutChart = new Chart(ctxd, {
        type: 'doughnut',
        data: {
            labels: [ 'Dólar', 'Euro'],
            datasets: [{
                
                data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                ]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: false,
                    text: 'Custom Doughnut Chart'
                }
            }
        }
    });
}
     function openModalDoughnut() {
       document.getElementById('myModal-doughnut-${Text15948324.getData()}').style.display = 'block';
       document.body.classList.add('modalOpen');
       var modalCtxd = document.getElementById('modaldoughnut-${Text15948324.getData()}').getContext('2d');
       var doughnutChart = new Chart(modalCtxd, {
        type: 'doughnut',
        data: {
            labels: [ 'Dólar', 'Euro'],
            datasets: [{
                
                data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                ]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: false,
                    text: 'Custom Doughnut Chart'
                }
            }
        }
    });
   }

   function closeModalDoughnut() {
       document.getElementById('myModal-doughnut-${Text15948324.getData()}').style.display = 'none';
       document.body.classList.remove('modalOpen');
   }
	 fechtdataRosca()
	 createDoughnutChart()
</script>

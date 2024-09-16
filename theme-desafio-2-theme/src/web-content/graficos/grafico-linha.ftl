<div class="contanier-grafico-mychartline d-flex flex-column justify-content-center align-items-center px-2 px-md-4 py-1 py-md-3 mx-auto" onclick="openModalline()">
  <h2 class="mb-3">
	  <#if (Text15948324.getData())??>
	    ${Text15948324.getData()}
    </#if>
 </h2>
  <canvas id="myChartLine-${Text15948324.getData()}"></canvas>
</div>

<!-- Modal -->
<div id="myModal-${Text15948324.getData()}" class="modal">
  <div class="modal-content">
    <span class="close close-btn" onclick="closeModalline()">&times;</span>
    <canvas id="modalChartLine-${Text15948324.getData()}"></canvas>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function fetchDataAndCreateChart() {
    fetch('https://economia.awesomeapi.com.br/json/daily/USD-BRL/30')
        .then(response => response.json())
        .then(data => {
            fetchedDataLinha = data;
            createLinhaChart(fetchedDataLinha);
        })
        .catch(error => console.error('Error fetching API:', error));
}

function createLinhaChart(fetchedDataLinha) {
  const numbersArray = Array.from({ length: 30 }, (_, index) => index + 1);
  if (fetchedDataLinha) {
   var ctxz = document.getElementById('myChartLine-${Text15948324.getData()}').getContext('2d');
   var myChart = new Chart(ctxz, {
       type: 'line',
       data: {
           labels: numbersArray,
           datasets: [{
               label: 'Dolar',
               data: fetchedDataLinha.map(item => parseFloat(item.high)),
               backgroundColor: 'rgba(255, 99, 132, 0.2)',
               borderColor: 'rgba(255, 99, 132, 1)',
               borderWidth: 1
           }]
       },
       options: {
           scales: {
               y: {
                    beginAtZero: false,
                    min: 5.3,
                    ticks: {
                    stepSize: 0.1 
                }
               }
           }
       }
   });
   
  }
}
   function openModalline() {
    document.getElementById('myModal-${Text15948324.getData()}').style.display = 'block';
    document.body.classList.add('modalOpen');
    const numbersArray = Array.from({ length: 30 }, (_, index) => index + 1);
    if (fetchedDataLinha) {
        var ctxz = document.getElementById('modalChartLine-${Text15948324.getData()}').getContext('2d');
        var myChart = new Chart(ctxz, {
            type: 'line',
            data: {
                labels: numbersArray,
                datasets: [{
                    label: 'Dolar',
                    data: fetchedDataLinha.map(item => parseFloat(item.high)),
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: false,
                        min: 5.3,
                        ticks: {
                            stepSize: 0.1
                        }
                    }
                }
            }
        });
    }
   
}

   function closeModalline() {
       document.getElementById('myModal-${Text15948324.getData()}').style.display = 'none';
       document.body.classList.remove('modalOpen');
   }
   fetchDataAndCreateChart()
   createLinhaChart(fetchedDataLinha)
</script>

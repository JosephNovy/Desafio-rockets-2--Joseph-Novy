<div class="contanier-grafico-doughnut d-flex flex-column justify-content-center px-2 px-md-4 py-1 py-md-3 align-items-center w-100" onclick="openModalpolar()">
  <h2 class="mb-3">
    <#if (Text15948324.getData())??>
      ${Text15948324.getData()}
    </#if>
  </h2>
  <canvas id="polar-chart-${Text15948324.getData()}"></canvas>
</div>
<!-- Modal -->
<div id="myModal-polar-${Text15948324.getData()}" class="modal">
  <div class="modal-content polar">
    <span class="close close-btn" onclick="closeModalpolar()">&times;</span>
    <canvas id="modalChartpolar-${Text15948324.getData()}"></canvas>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
    fetch('https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL')
        .then(response => response.json())
        .then(data => {
            fetchedData = data;
            var high = data.USDBRL.high;
            var low = data.USDBRL.low;
            var varBid = data.USDBRL.varBid;
            var high = data.EURBRL.high;
            var low = data.EURBRL.low;
            var varBid = data.EURBRL.varBid;
            createPolarChart();
        })
        .catch(error => console.error('Error fetching API:', error));
});

function createPolarChart() {
    var ctxp = document.getElementById('polar-chart-${Text15948324.getData()}').getContext('2d');
    var polarChart = new Chart(ctxp, {
        type: 'polarArea',
        data: {
            labels: ['Variação do Dolar', 'Variação do Euro'],
            datasets: [{
                data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)'
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
                    text: 'Custom Polar Area Chart'
                }
            }
        }
    });
}
    function openModalpolar() {
    document.getElementById('myModal-polar-${Text15948324.getData()}').style.display = 'block';
    document.body.classList.add('modalOpen');
    var modalCtxp = document.getElementById('modalChartpolar-${Text15948324.getData()}').getContext('2d');
    var polarChart = new Chart(modalCtxp, {
        type: 'polarArea',
        data: {
            labels: ['Variação do Dolar', 'Variação do Euro'],
            datasets: [{
                data: [fetchedData.USDBRL.high, fetchedData.EURBRL.high],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)'
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
                    text: 'Custom Polar Area Chart'
                }
            }
        }
    });
}

   function closeModalpolar() {
       document.getElementById('myModal-polar-${Text15948324.getData()}').style.display = 'none';
       document.body.classList.remove('modalOpen');
   }
   createPolarChart()
</script>
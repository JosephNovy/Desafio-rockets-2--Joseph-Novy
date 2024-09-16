<div class="contanier-grafico-mixed-chart d-flex flex-column justify-content-center align-items-center px-2 px-md-4 py-1 py-md-3 mx-auto" onclick="openModal()">
  <h2 class="mb-3">
	  <#if (Text15948324.getData())??>
	    ${Text15948324.getData()}
    </#if>
 </h2>
  <canvas id="mixed-chart" class="chart-mixed"></canvas>
</div>
<!-- Modal -->
<div id="myModal-mixed" class="modal" class="modal">
  <div class="modal-content">
    <span class="close close-btn" onclick="closeModal()">&times;</span>
    <canvas id="modalChartmixed"></canvas>
  </div>
</div>
<script>
    var ctxm = document.getElementById('mixed-chart').getContext('2d');
    var mixedChart = new Chart(ctxm, {
        type: 'bar',
        data: {
            datasets: [{
                label: 'Bar Dataset',
                data: [10, 20, 30, 40, 50],
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }, {
                label: 'Line Dataset',
                data: [30, 30, 30, 30, 30],
                type: 'line',
                fill: false,
                borderColor: 'rgba(54, 162, 235, 1)',
                tension: 0.1
            }],
            labels: ['A', 'B', 'C', 'D', 'E']
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    function openModal() {
       document.getElementById('myModal-mixed').style.display = 'block';
       document.body.classList.add('modalOpen');
       var modalCtxm = document.getElementById('modalChartmixed').getContext('2d');
       new Chart(modalCtxm, mixedChart.config);
   }

   function closeModal() {
      document.getElementById('myModal-mixed').style.display = 'none';
      document.body.classList.remove('modalOpen');
   }
</script>


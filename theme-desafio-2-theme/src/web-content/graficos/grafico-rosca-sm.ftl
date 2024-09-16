<div class="contanier-grafico-doughnut-small d-flex flex-column justify-content-center align-items-center ">
  <canvas id="doughnut-chart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    var ctxd = document.getElementById('doughnut-chart').getContext('2d');
    var doughnutChart = new Chart(ctxd, {
        type: 'doughnut',
        data: {
            labels: ['Red', 'Blue', 'Yellow'],
            datasets: [{
                label: 'My Doughnut Chart',
                data: [30, 20, 50],
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
                    display: true,
                    text: 'Custom Doughnut Chart'
                }
            }
        }
    });
</script>

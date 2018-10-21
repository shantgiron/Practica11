<#include "header.ftl">
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <div class="profile-sidebar">
        <div class="profile-userpic">
            <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
        </div>
        <div class="profile-usertitle">
            <div class="profile-usertitle-name"></em><@spring.message "index.usuario"/></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="divider"></div>
    <ul class="nav menu">
        <li class=""><a href="/index"><em class="fa fa-dashboard">&nbsp;</em><@spring.message "index.inicio"/></a></li>
        <li><a href="/clientes"><em class="fa fa-users">&nbsp;</em></em><@spring.message "index.clientes"/></a></li>
        <li><a href="/equipos"><em class="fa fa-gears">&nbsp;</em></em><@spring.message "index.equipos"/></a></li>
        <li><a href="/alquileres"><em class="fa fa-vcard">&nbsp;</em></em><@spring.message "index.alquileres"/></a></li>
        <li><a href="/usuarios"><em class="fa fa-users">&nbsp;</em></em><@spring.message "index.usuarios"/></a></li>
        <li><a href="/logout"><em class="fa fa-power-off">&nbsp;</em></em><@spring.message "index.cerrar_sesion"/></a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></em><@spring.message "index.dashboard"/></h1>
        </div>
    </div><!--/.row-->

    <div class="panel panel-container">
        <div class="row">
            <div class="col-xs-6 col-md-4 col-lg-4 no-padding">
                <div class="panel panel-teal panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-users color-blue"></em>
                        <div class="large">${clientes}</div>
                        <div class="text-muted"></em><@spring.message "index.clientes_registrados"/></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4 col-lg-4 no-padding">
                <div class="panel panel-blue panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-gears color-orange"></em>
                        <div class="large">${equipos}</div>
                        <div class="text-muted"></em><@spring.message "index.equipos_registrados"/></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-md-4 col-lg-4 no-padding">
                <div class="panel panel-orange panel-widget border-right">
                    <div class="row no-padding"><em class="fa fa-xl fa-vcard color-blue"></em>
                        <div class="large">${alquileres}</div>
                        <div class="text-muted"></em><@spring.message "index.alquileres_registrados"/></div>
                    </div>
                </div>
            </div>
        </div><!--/.row-->
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    </em><@spring.message "index.graficos"/>
                <div class="panel-body">
                    <canvas id="myChart"></canvas>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br><br>
                    <br>

                </div>
            </div>
        </div>
    </div><!--/.row-->
</div>	<!--/.main-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.js"></script>
<script>
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ${equipo_label},
            datasets: [{
                label: 'Total alquiler',
                data: ${historiales},
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>
<#include "footer.ftl">
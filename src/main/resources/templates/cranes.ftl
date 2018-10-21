<#include "header.ftl">
<div class="col-sm-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Equipos registrados</h3>
        </div>
        <div class="panel-body">
            <div class="form-inline">
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#registrar">Registrar nuevo equipo</button>
            </div>

            <br>

            <div>
                <table class="table">
                    <tr>
                        <th>Codigo de equipo</th>
                        <th>Nombre de equipo</th>
                        <th>Cantidad de existencia</th>
                        <th>Costo de alquiler por dia</th>
                        <th>Entregado</th>
                    </tr>
                <#list equipos as equipo>
                    <tr>
                        <td>${equipo.getCodigo()}</td>
                        <td>${equipo.getNombre()}</td>
                        <td>${equipo.getCantidadExistencia()}</td>
                        <td>${equipo.getCostoAlquilerPorDia()}</td>
                        <#if equipo.isEntregado()>
                            <td>Si</td>
                        <#else>
                            <td>No</td>
                        </#if>
                        <td>
                            <a href="/editar/equipo?id=${equipo.getId()}" class="btn btn-primary">Editar</a>
                            <a href="/borrar/equipo?id=${equipo.getId()}" class="btn btn-danger">Borrar</a>
                            <#--<a href="#" class="btn btn-warning">Visualizar</a>-->
                        </td>
                    </tr>
                </#list>
                </table>
            </div>
        </div>
    </div>
</div>

<div id="registrar" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Registrar equipo nuevo</h4>
            </div>
            <div class="modal-body">
                <form action="/registrar/equipo" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <fieldset>
                        <div class="form-group">
                            <label for="codigo" class="label-control">Codigo:</label>
                            <input type="text" class="form-control" name="codigo" id="codigo" placeholder="Codigo de equipo" autofocus required/>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="label-control">Nombre:</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre de equipo" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="cantidadexistencia" class="label-control">Cantidad de existencia:</label>
                            <input type="number" class="form-control" name="cantidadexistencia" id="cantidadexistencia" placeholder="Cantidad de existencia" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="costoalquilerpordia" class="label-control">Costo de alquiler por dia:</label>
                            <input type="number" class="form-control" name="costoalquilerpordia" id="costoalquilerpordia" placeholder="Costo de alquiler por dia" autofocus required/>
                        </div>
                    </fieldset>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Registrar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<#include "footer.ftl">
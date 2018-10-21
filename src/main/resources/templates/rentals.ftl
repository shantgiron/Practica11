<#include "header.ftl">
<div class="col-sm-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Alquileres registrados</h3>
        </div>
        <div class="panel-body">
            <div class="form-inline">
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#registrar">Registrar alquiler</button>
            </div>

            <br>

            <div>
                <table class="table">
                    <tr>
                        <th>Fecha realizado</th>
                        <th>Cliente</th>
                        <th>Fecha de entrega</th>
                        <th>Total</th>
                    </tr>
                <#list alquileres as alquiler>
                    <tr>
                        <td>${alquiler.getFechaRealizado().toString()}</td>
                        <td>${alquiler.getCliente().getNombre()}</td>
                        <td>${alquiler.getFechaEntrega().toString()}</td>
                        <td>${alquiler.getTotal()}</td>
                        <td>
                            <a href="#" class="btn btn-primary">Editar</a>
                            <a href="/borrar/alquiler?id=${alquiler.getId()}" class="btn btn-danger">Borrar</a>
                            <a href="#" class="btn btn-warning">Visualizar</a>
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
                <h4 class="modal-title">Registrar alquiler</h4>
            </div>
            <div class="modal-body">
                <form action="/registrar/alquiler" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <fieldset>
                        <div class="form-group">
                            <label for="cliente" class="label-control">Cliente:</label>
                            <select name="cliente" id="cliente" class="form-control" required autofocus>
                                <option value="">Seleccione cliente</option>
                            <#list clientes as cliente>
                                <option value="${cliente.getId()}">${cliente.getNombre()}</option>
                            </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="fechaentrega" class="label-control">Fecha de entrega:</label>
                            <input type="date" class="form-control" name="fechaentrega" id="fechaentrega" placeholder="Fecha de entrega" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="codigo" class="label-control">Equipo:</label>
                            <select name="codigo" id="codigo" class="form-control" required autofocus>
                                <option value="">Seleccione equipo</option>
                            <#list equipos as equipo>
                                <option value="${equipo.getCodigo()}">${equipo.getCodigo()}</option>
                            </#list>
                            </select>
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
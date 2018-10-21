<#include "header.ftl">
<div class="col-sm-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Clientes registrados</h3>
        </div>
        <div class="panel-body">
            <div class="form-inline">
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#registrar">Registrar nuevo cliente</button>
            </div>

            <br>

            <div class="form-group">
                <label class="label-control">${error}</label>
            </div>

            <br>

            <div>
                <table class="table">
                    <tr>
                        <th>Nombre</th>
                        <th>Cedula</th>
                        <th>Foto</th>
                        <th>Accion</th>
                    </tr>
                <#list clientes as cliente>
                    <tr>
                        <td>${cliente.getNombre()}</td>
                        <td>${cliente.getCedula()}</td>
                        <td><img src="${cliente.representacionFoto()}" alt="${cliente.getNombre()}" width="64" height="64"></td>
                        <td>
                            <a href="#" class="btn btn-primary">Editar</a>
                            <a href="/borrar/cliente?id=${cliente.getId()}" class="btn btn-danger">Borrar</a>
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
                <h4 class="modal-title">Registrar cliente nuevo</h4>
            </div>
            <div class="modal-body">
                <form action="/registrar/cliente" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <fieldset>
                        <div class="form-group">
                            <label for="nombre" class="label-control">Nombre:</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del cliente" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="cedula" class="label-control">Cedula:</label>
                            <input type="text" class="form-control" name="cedula" id="cedula" placeholder="Cedula del cliente" autofocus/>
                        </div>

                        <div class="form-group">
                            <label for="foto" class="label-control">Foto:</label>
                            <input type="file" class="form-control" name="foto" id="foto" placeholder="Foto del cliente" autofocus required/>
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
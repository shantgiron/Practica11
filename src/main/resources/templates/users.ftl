<#include "header.ftl">
<div class="col-sm-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3>Usuarios registrados</h3>
        </div>
        <div class="panel-body">
            <div class="form-inline">
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#registrar">Registrar nuevo usuario</button>
            </div>

            <br>

            <div>
                <table class="table">
                    <tr>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha de nacimiento</th>
                        <th>Nombre de usuario</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Accion</th>
                    </tr>
                    <#list usuarios as usuario>
                        <tr>
                            <td>${usuario.getNombres()}</td>
                            <td>${usuario.getApellidos()}</td>
                            <td>${usuario.getFechaNacimiento().toString()}</td>
                            <td>${usuario.getNombreUsuario()}</td>
                            <td>${usuario.getCorreo()}</td>
                            <td>${usuario.getRol()}</td>
                            <td>
                                <a href="#" class="btn btn-primary">Editar</a>
                                <a href="/borrar/usuario?id=${usuario.getId()}" class="btn btn-danger">Borrar</a>
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
                <h4 class="modal-title">Registrar usuario nuevo</h4>
            </div>
            <div class="modal-body">
                <form action="/registrar/usuario" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <fieldset>
                        <div class="form-group">
                            <label for="nombres" class="label-control">Nombres:</label>
                            <input type="text" class="form-control" name="nombres" id="nombres" placeholder="Primer y segundo nombre" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="apellidos" class="label-control">Apellidos:</label>
                            <input type="text" class="form-control" name="apellidos" id="apellidos" placeholder="Primer y segundo apellido" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="fechaNacimiento" class="label-control">Fecha de nacimiento:</label>
                            <input type="date" class="form-control" name="fechaNacimiento" id="fechaNacimiento" placeholder="Fecha de nacimiento" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="nombreUsuario" class="label-control">Nombre de usuario:</label>
                            <input type="text" class="form-control" name="nombreUsuario" id="nombreUsuario" placeholder="Nombre de usuario" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="contrasena" class="label-control">Contrasena:</label>
                            <input type="password" class="form-control" name="contrasena" id="contrasena" placeholder="Contrasena de usuario" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="correo" class="label-control">Correo:</label>
                            <input type="email" class="form-control" name="correo" id="correo" placeholder="Correo electronico" autofocus required/>
                        </div>

                        <div class="form-group">
                            <label for="rol" class="label-control">Roles:</label>
                            <select name="rol" id="rol" class="form-control" required autofocus>
                                <option value="">Seleccione rol</option>
                                <#list roles as rol>
                                    <option value="${rol.getNombre()}">${rol.getNombre()}</option>
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
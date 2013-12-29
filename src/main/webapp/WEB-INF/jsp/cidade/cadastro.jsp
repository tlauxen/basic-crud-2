<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 40px;" data-ng-controller="ControllerCadastroCidade">
	<div class="row-fluid">
		<div class="span12">

			<section>

				<div class="page-header">
					<h1>Cadastro de cidades</h1>
				</div>
					
				<form class="form-horizontal well well-large" name="frm">
					<div class="control-group">
						<label class="control-label" for="nome">Nome *:</label>
						<div class="controls">
							<input type="text" id="nome" name="nome" placeholder="Nome" data-ng-model="model.nome" required maxlength="100">
							<span data-ng-show="frm.nome.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="nome">Estado *:</label>
						<div class="controls">
							<select id="estado" name="estado" data-ng-model="estadoSelecionado" data-ng-options="p.nome for p in estados" data-ng-change="onChangeEstado()" required>
								<option value="">Selecione...</option>
							</select>
							<span data-ng-show="frm.estado.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-ng-click="save()" data-ng-disabled="frm.$invalid">Gravar</button>
								<button type="button" class="btn btn-default" data-ng-click="cancel()">Cancelar</button>
							</div>
						</div>
					</div>

				</form>

			</section>

		</div>
	</div>
</div>

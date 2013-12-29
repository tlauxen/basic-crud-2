<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 40px;" data-ng-controller="ControllerCadastroEstado">
	<div class="row-fluid">
		<div class="span12">

			<section>

				<div class="page-header">
					<h1>Cadastro de estados</h1>
				</div>
					
				<form class="form-horizontal well well-large" name="frm">
					<div class="control-group">
						<label class="control-label" for="sigla">Sigla *:</label>
						<div class="controls">
							<input type="text" id="sigla" name="sigla" placeholder="sigla" data-ng-model="model.sigla" required maxlength="3">
							<span data-ng-show="frm.sigla.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nome">Nome *:</label>
						<div class="controls">
							<input type="text" id="nome" name="nome" placeholder="Nome" data-ng-model="model.nome" required maxlength="100">
							<span data-ng-show="frm.nome.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="nome">País *:</label>
						<div class="controls">
							<select id="pais" name="pais" data-ng-model="paisSelecionado" data-ng-options="p.nome for p in paises" data-ng-change="onChangePais()" required>
								<option value="">Selecione...</option>
							</select>
							<span data-ng-show="frm.pais.$error.required" class="help-inline">Campo obrigatório</span>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 40px;" data-ng-controller="Controller">
	<div class="row-fluid">
		<div class="span12">

			<section>

				<div class="page-header">
					<h1>Cadastro de estados</h1>
				</div>
					
				<form class="form-horizontal well well-large">
					<div class="control-group">
						<label class="control-label" for="sigla">Sigla:</label>
						<div class="controls">
							<input type="text" id="sigla" placeholder="sigla" data-ng-model="model.sigla">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nome">Nome</label>
						<div class="controls">
							<input type="text" id="nome" placeholder="Nome" data-ng-model="model.nome">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="nome">País</label>
						<div class="controls">
							<select data-ng-model="paisSelecionado" data-ng-options="p.nome for p in paises" data-ng-change="onChangePais()">
								<option value="">Selecione...</option>
							</select>
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-ng-click="save()">Gravar</button>
								<button type="button" class="btn btn-default" data-ng-click="cancel()">Cancelar</button>
							</div>
						</div>
					</div>

				</form>

			</section>

		</div>
	</div>
</div>

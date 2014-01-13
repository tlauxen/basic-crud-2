<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 40px;" data-ng-controller="ControllerCadastroFeriado">
	<div class="row-fluid">
		<div class="span12">

			<section>

				<div class="page-header">
					<h1>Cadastro de feriados</h1>
				</div>
					
				<form class="form-horizontal well well-large" name="frm">
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
						<label class="control-label" for="nome">Abrangência *:</label>
						<div class="controls">
							<select id="abrangencia" name="abrangencia" data-ng-model="abrangenciaSelecionada" data-ng-options="a for a in abrangencias" data-ng-change="onChangeAbrangencia()" required>
								<option value="">Selecione...</option>
							</select>
							<span data-ng-show="frm.abrangencia.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group" data-ng-show="isAbrangenciaMunicipal()">
						<label class="control-label" for="nome">Cidade *:</label>
						<div class="controls">
							<select id="cidade" name="cidade" data-ng-model="cidadeSelecionada" data-ng-options="c.nome for c in cidades" data-ng-change="onChangeCidade()">
								<option value="">Selecione...</option>
							</select>
							<span data-ng-show="frm.cidade.$error.required" class="help-inline">Campo obrigatório</span>
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
						<label class="control-label" for="nome">Período *:</label>
						<div class="controls">
							<select id="periodo" name="periodo" data-ng-model="periodoSelecionado" data-ng-options="p for p in periodos" data-ng-change="onChangePeriodo()" required>
								<option value="">Selecione...</option>
							</select>
							<span data-ng-show="frm.periodo.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group" data-ng-show="isPeriodoVariavel()">
						<label class="control-label" for="nome">Data *:</label>
						<div class="controls">
							<input type="date" id="data" name="data" placeholder="Data" data-ng-model="model.data">
							<span data-ng-show="frm.data.$error.required" class="help-inline">Campo obrigatório</span>
						</div>
					</div>
					
					<div class="control-group" data-ng-show="isPeriodoFixo()">
						<label class="control-label" for="nome">Data *:</label>
						<div class="controls">
							<input type="number" id="dia" name="dia" placeholder="Dia" data-ng-model="model.dia" maxlength="2" class="input-small">
							<input type="number" id="mes" name="mes" placeholder="Mês" data-ng-model="model.mes" maxlength="2" class="input-small">
							<span data-ng-show="frm.dia.$error.required" class="help-inline">Campo obrigatório</span>
							<span data-ng-show="frm.mes.$error.required" class="help-inline">Campo obrigatório</span>
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

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 60px;" data-ng-controller="ControllerListagem">
	<div class="row-fluid">
		<div class="span12">
			<section>

				<div class="page-header">
					<h1>Listagem de feriados</h1>
				</div>
					
				<div class="btn-group">
					<button type="button" class="btn btn-default" data-ng-click="novo()">Novo</button>
				</div>
				
				<form class="form-horizontal well well-large">
					<div class="control-group">
						<label class="control-label" for="sigla">Buscar:</label>
						<div class="controls">
							<input type="text" class="search-query" placeholder="Busca" data-ng-model="search">
						</div>
					</div>
				</form>
				
				<table class="table">
					<thead>
						<tr>
							<th>País</th>
							<th>Nome</th>
							<th>Abrangência</th>
							<th>Cidade</th>
							<th>Data</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="o in list | filter:search">
							<td><a href="#" data-ng-click="edit(o)">{{ o.pais.nome }}</a></td>
							<td><a href="#" data-ng-click="edit(o)">{{ o.nome }}</a></td>
							<td><a href="#" data-ng-click="edit(o)">{{ o.tpAbrangencia }}</a></td>
							<td><a href="#" data-ng-click="edit(o)">{{ o.cidade.nome }}</a></td>
							<td><a href="#" data-ng-click="edit(o)">{{ o.dia + "/" + o.mes }}</a></td>
							<td><a href="#" data-ng-click="remove(o)">Remover</a></td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</div>

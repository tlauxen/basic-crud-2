<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container" style="margin-top: 60px;" data-ng-controller="Controller">
	<div class="row-fluid">
		<div class="span12">
			<section>

				<div class="page-header">
					<h1>Listagem de países</h1>
				</div>
					
				<div class="btn-group">
					<button type="button" class="btn btn-default" data-ng-click="novo()">Novo</button>
				</div>
				
				<form class="form-horizontal well well-large">
					<div class="control-group">
						<label class="control-label" for="sigla">Sigla:</label>
						<div class="controls">
							<input type="text" id="sigla" placeholder="sigla" data-ng-model="filter.sigla">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="nome">Nome</label>
						<div class="controls">
							<input type="text" id="nome" placeholder="Nome" data-ng-model="filter.nome">
						</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
							<div class="btn-group">
								<button type="button" class="btn btn-default" data-ng-click="find()">Buscar</button>
							</div>
						</div>
					</div>

				</form>
				
				<table class="table">
					<thead>
						<tr>
							<th>Sigla</th>
							<th>Nome</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="o in list">
							<td><a href="#" data-ng-click="edit(o)">{{ o.sigla }}</a></td>
							<td>{{ o.nome }}</td>
							<td><a href="#" data-ng-click="remove(o)">Remover</a></td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</div>

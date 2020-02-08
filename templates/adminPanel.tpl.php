<?php 

session_start();

 
require_once __DIR__ . '/../templates/components/adminPanelHeader.cmp.php' ?>
<div class="container-fluid">
  <div class="row">
  
    <div class="col-4">
        <h4>Categories</h4>
        <div class="btn-group" role="group" aria-label="Basic example">
            <button type="button" class="btn btn-secondary">Add</button>
        </div>
        <div>
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Имя</th>
      <th scope="col">Фамилия</th>
      <th scope="col">Username</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
        </div>
    </div>
    
    <div class="col-8">
    <h4>Goods of category   </h4>
        <div class="btn-group" role="group" aria-label="Basic example">
            <button type="button" class="btn btn-secondary">Add</button>
        </div>
        <div>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, maiores deserunt amet ut nihil adipisci, eligendi odio maxime eos cupiditate iusto? Esse, eum! Eveniet quasi tempora sed impedit fugit ea cumque accusamus ducimus laboriosam ipsum beatae, nisi cupiditate obcaecati corporis repudiandae minima saepe delectus mollitia ratione harum praesentium quisquam! Minus.
        </div>
    </div>
  
  </div>

</div>
<?php require_once __DIR__ . '/../templates/components/adminPanelFooter.cmp.php' ?>

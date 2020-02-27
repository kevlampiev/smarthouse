<?php

session_start();
require_once __DIR__ . '/../templates/components/adminPanelHeader.cmp.php' ?>


<div class="container-fluid">
  <div class="row">

    <div class="col-12">
      <h4>goods</h4>
      <div class="btn-group" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary">
          <i class="fa fa-plus-circle" aria-hidden="true"></i>
          Add
        </button>
      </div>
      <div>
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">Photo</th>
              <th scope="col">Name</th>
              <th scope="col">Category</th>
              <th scope="col">Description</th>
              <th scope="col">--</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($goods as $key => $good) : ?>
              <tr>
                <td>
                  <img src="../img/goods/<?= $good['img'] ?>" alt="good image" class="small-picture">
                </td>
                <td><?= $good['name'] ?></td>
                <td><?= $good['category'] ?></td>
                <td><?= $good['description'] ?></td>
                <td> <a href="/adminEditGood.php?id=<?= $good['id'] ?>">
                    <i class="fa fa-pencil" aria-hidden="true"></i>
                  </a>
                  <a href="/adminDeleteGood.php?id=<?= $good['id'] ?>">
                    <i class="fa fa-trash" aria-hidden="true"></i>
                  </a>
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>


  </div>

</div>
<?php require_once __DIR__ . '/../templates/components/adminPanelFooter.cmp.php' ?>
<?php

session_start();
require_once __DIR__ . '/../templates/components/adminPanelHeader.cmp.php' ?>


<div class="container-fluid" style="padding-left:50px;">
  <div class="row">
    <h3>Edit good's info</h3>
    <div class="col-12">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">General Info</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Additional photos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Prices</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

          <!-- Редактирование основной информации о товаре -->
          <form method="POST" action="adminEditGoodPost.php" enctype="multipart/form-data">
            <div class="form-group hidden">
              <input type="text" class="form-control hidden" name="action" value="edit">
            </div>
            <div class="form-group">
              <label for="nameInput">Name</label>
              <input type="text" class="form-control" id="nameInput" name="goodname" value="<?= $good['name'] ?>">
            </div>
            <div class="form-group">
              <label for="categorySelect">Category</label>
              <select class="form-control" id="categorySelect" name="category" value="<?= $good['category'] ?>">
                <?php foreach ($categories as $key => $category) : ?>
                  <option><?= $category['name'] ?></option>
                <?php endforeach; ?>
              </select>
            </div>

            <div class="form-group">
              <label for="Description">Description</label>
              <textarea class="form-control" name="Description" id="Description" rows="3"> <?= $good['description'] ?></textarea>
            </div>

            <div class="form-group">
              <img src="img/goods/<?= $good['img'] ?>" alt="" class="small-picture">
              <label for="pictureInput">Main image</label>
              <input type="file" class="form-control-file" id="pictureInput">
            </div>

            <input class="btn btn-primary" type="submit" value="Submit">
            <input class="btn btn-primary" type="reset" value="Reset">

          </form>


        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">11111</div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">#######</div>
      </div>
    </div>
  </div>


</div>

</div>
<?php require_once __DIR__ . '/../templates/components/adminPanelFooter.cmp.php' ?>
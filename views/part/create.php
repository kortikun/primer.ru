<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Part $model */

$this->title = 'Заказать комплектующие';
?>
<div class="part-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

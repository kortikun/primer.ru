<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\PartRequest $model */

$this->title = 'Update Part Request: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Part Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="part-request-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

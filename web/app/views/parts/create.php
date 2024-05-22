<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\PartRequest $model */

$this->title = 'Create Part Request';
$this->params['breadcrumbs'][] = ['label' => 'Part Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="part-request-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Request $model */

$this->title = 'Изменение статуса заявки';
?>
<div class="request-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="request-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'problem_description')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'priority_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\RequestPriority::find()->all(), 'id', 'name')) ?>

        <?= $form->field($model, 'master_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\User::findAll(['role_id' => 2]), 'id', 'lastname')) ?>

        <div class="form-group">
            <?= Html::submitButton('Перевести в статус "В процессе ремонта" и сохранить', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>

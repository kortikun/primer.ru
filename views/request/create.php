<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Request $model */

$this->title = 'Создать заявку';
?>
<div class="request-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="request-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'device_type_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\DeviceType::find()->all(), 'id', 'name')) ?>

        <?= $form->field($model, 'device_model')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'problem_description')->textarea() ?>

        <div class="form-group">
            <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
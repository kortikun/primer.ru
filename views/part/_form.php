<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Part $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="part-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'request_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Request::find()->all(), 'id', 'device_model')) ?>

    <?= $form->field($model, 'part_id')->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Part::find()->all(), 'id', 'name')) ?>

    <?= $form->field($model, 'amount')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

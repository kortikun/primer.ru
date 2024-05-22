<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "part_request".
 *
 * @property int $id
 * @property int $request_id
 * @property int $part_id
 * @property int $amount
 * @property int $status_id
 *
 * @property PartType $part
 * @property PartRequestStatus $status
 */
class Part extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'part_request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['request_id', 'part_id', 'amount', 'status_id'], 'required'],
            [['request_id', 'part_id', 'amount', 'status_id'], 'integer'],
            [['part_id'], 'exist', 'skipOnError' => true, 'targetClass' => PartType::class, 'targetAttribute' => ['part_id' => 'id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => PartRequestStatus::class, 'targetAttribute' => ['status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'request_id' => 'Заявка',
            'part_id' => 'Тип комплектующего',
            'amount' => 'Количество',
            'status_id' => 'Статус',
        ];
    }

    /**
     * Gets query for [[Part]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPart()
    {
        return $this->hasOne(PartType::class, ['id' => 'part_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(PartRequestStatus::class, ['id' => 'status_id']);
    }
}

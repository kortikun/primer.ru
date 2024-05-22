<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "part_type".
 *
 * @property int $id
 * @property string $name
 * @property float $price
 *
 * @property PartRequest[] $partRequests
 */
class PartType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'part_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'price'], 'required'],
            [['price'], 'number'],
            [['name'], 'string', 'max' => 256],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'price' => 'Price',
        ];
    }

    /**
     * Gets query for [[PartRequests]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartRequests()
    {
        return $this->hasMany(PartRequest::class, ['part_id' => 'id']);
    }
}

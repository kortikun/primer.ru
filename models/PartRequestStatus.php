<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "part_request_status".
 *
 * @property int $id
 * @property string $name
 *
 * @property PartRequest[] $partRequests
 */
class PartRequestStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'part_request_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
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
        ];
    }

    /**
     * Gets query for [[PartRequests]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPartRequests()
    {
        return $this->hasMany(PartRequest::class, ['status_id' => 'id']);
    }
}

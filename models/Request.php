<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "request".
 *
 * @property int $id
 * @property int $client_id
 * @property string $start_date
 * @property int $device_type_id
 * @property string $device_model
 * @property string $problem_description
 * @property int $status_id
 * @property int|null $priority_id
 * @property int|null $operator_id
 * @property int|null $master_id
 * @property string|null $completion_date
 * @property float|null $total_price
 *
 * @property User $client
 * @property Comment[] $comments
 * @property DeviceType $deviceType
 * @property User $master
 * @property User $operator
 * @property RequestPriority $priority
 * @property RequestStatus $status
 */
class Request extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['device_type_id', 'device_model', 'problem_description'], 'required'],
            [['client_id', 'device_type_id', 'status_id', 'priority_id', 'operator_id', 'master_id'], 'integer'],
            [['total_price'], 'number'],
            [['device_model'], 'string', 'max' => 256],
            [['problem_description'], 'string', 'max' => 512],
            [['device_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => DeviceType::class, 'targetAttribute' => ['device_type_id' => 'id']],
            [['priority_id'], 'exist', 'skipOnError' => true, 'targetClass' => RequestPriority::class, 'targetAttribute' => ['priority_id' => 'id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => RequestStatus::class, 'targetAttribute' => ['status_id' => 'id']],
            [['operator_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['operator_id' => 'id']],
            [['client_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['client_id' => 'id']],
            [['master_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['master_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'client_id' => 'Client ID',
            'start_date' => 'Start Date',
            'device_type_id' => 'Тип устройства',
            'device_model' => 'Модель устройства',
            'problem_description' => 'Описание проблемы',
            'status_id' => 'Status ID',
            'priority_id' => 'Priority ID',
            'operator_id' => 'Operator ID',
            'master_id' => 'Master ID',
            'completion_date' => 'Completion Date',
            'total_price' => 'Total Price',
        ];
    }

    /**
     * Gets query for [[Client]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(User::class, ['id' => 'client_id']);
    }

    /**
     * Gets query for [[Comments]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::class, ['request_id' => 'id']);
    }

    /**
     * Gets query for [[DeviceType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDeviceType()
    {
        return $this->hasOne(DeviceType::class, ['id' => 'device_type_id']);
    }

    /**
     * Gets query for [[Master]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMaster()
    {
        return $this->hasOne(User::class, ['id' => 'master_id']);
    }

    /**
     * Gets query for [[Operator]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOperator()
    {
        return $this->hasOne(User::class, ['id' => 'operator_id']);
    }

    /**
     * Gets query for [[Priority]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPriority()
    {
        return $this->hasOne(RequestPriority::class, ['id' => 'priority_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(RequestStatus::class, ['id' => 'status_id']);
    }
}

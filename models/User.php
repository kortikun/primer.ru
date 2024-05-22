<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property string $lastname
 * @property string $firstname
 * @property string|null $patronymic
 * @property string $phone
 * @property string $login
 * @property string $password
 * @property int $role_id
 *
 * @property Comment[] $comments
 * @property Request[] $requests
 * @property Request[] $requests0
 * @property Request[] $requests1
 * @property Role $role
 */
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lastname', 'firstname', 'phone', 'login', 'password', 'role_id'], 'required'],
            [['role_id'], 'integer'],
            [['lastname', 'firstname', 'patronymic', 'login', 'password'], 'string', 'max' => 256],
            [['phone'], 'string', 'max' => 11],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::class, 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'lastname' => 'Lastname',
            'firstname' => 'Firstname',
            'patronymic' => 'Patronymic',
            'phone' => 'Phone',
            'login' => 'Login',
            'password' => 'Password',
            'role_id' => 'Role ID',
        ];
    }

    /**
     * Gets query for [[Comments]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::class, ['employee_id' => 'id']);
    }

    /**
     * Gets query for [[Requests]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequests()
    {
        return $this->hasMany(Request::class, ['operator_id' => 'id']);
    }

    /**
     * Gets query for [[Requests0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequests0()
    {
        return $this->hasMany(Request::class, ['client_id' => 'id']);
    }

    /**
     * Gets query for [[Requests1]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequests1()
    {
        return $this->hasMany(Request::class, ['master_id' => 'id']);
    }

    /**
     * Gets query for [[Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::class, ['id' => 'role_id']);
    }

    public static function findIdentity($id)
    {
        return User::findOne(['id' => $id]);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getAuthKey()
    {
        return null;
    }

    public function validateAuthKey($authKey)
    {
        return false;
    }

    public static function findByUsername($username)
    {
        return User::findOne(['login' => $username]);
    }

    public function validatePassword($password)
    {
        return $this->password === $password;
    }
}

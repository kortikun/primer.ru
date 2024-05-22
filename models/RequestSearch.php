<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Request;

/**
 * RequestSearch represents the model behind the search form of `app\models\Request`.
 */
class RequestSearch extends Request
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'client_id', 'device_type_id', 'status_id', 'priority_id', 'operator_id', 'master_id'], 'integer'],
            [['start_date', 'device_model', 'problem_description', 'completion_date'], 'safe'],
            [['total_price'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Request::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'client_id' => $this->client_id,
            'start_date' => $this->start_date,
            'device_type_id' => $this->device_type_id,
            'status_id' => $this->status_id,
            'priority_id' => $this->priority_id,
            'operator_id' => $this->operator_id,
            'master_id' => $this->master_id,
            'completion_date' => $this->completion_date,
            'total_price' => $this->total_price,
        ]);

        $query->andFilterWhere(['like', 'device_model', $this->device_model])
            ->andFilterWhere(['like', 'problem_description', $this->problem_description]);

        $query->andWhere(['like', 'client_id', Yii::$app->user->id])
            ->orWhere(['operator_id' => NULL])
            ->orWhere(['like', 'master_id', Yii::$app->user->id])
            ->orWhere(['=', TRUE, Yii::$app->user->identity->role_id === 1]);
        ;

        return $dataProvider;
    }
}

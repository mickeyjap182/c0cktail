# motion メモ
https://api.unrealengine.com/JPN/Engine/Blueprints/index.html

道具
- VRHMD
- モーションコントローラ

### ポイント
頭と手のモーションしか取れない場合は、
間の動き（関節など）を補正する必要がある。
## animation blueprintを使う
IKは違和感がある動きを回避するため、挙動を制限する制御を加える。
- 先端の延長をend effectorに設定して向きや挙動を調整する。
- Tip Boneで被写体に動作先端に設定する。
- Root Boneで軸を設定する。
### 用語
- FK...Forward Kinematics...先端センサーの動きを元に、ボーンの回転で向き、位置が決定する。
- IK...Inverse Kinematics、逆運動学...先にジョイントの向き位置が決まっていて、それに合わせる。

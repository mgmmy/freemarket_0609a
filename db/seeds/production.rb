#レディースの子カテゴリー配列
lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
#レディースの孫カテゴリー配列
lady_grandchild_array = [['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'], ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'], ['すべて','デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], ['すべて','ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], ['すべて','ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], ['すべて','ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], ['すべて','パジャマ','ルームウェア'], ['すべて','ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], ['すべて','ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], ['すべて','ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], ['すべて','ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], ['すべて','長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], ['すべて','前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], ['すべて','浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], ['すべて','スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], ['すべて','トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], ['すべて','コスプレ','下着','その他']]

parent = Category.create(name: 'レディース')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

#メンズブロック

#メンズの子カテゴリー配列
mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他',]
#メンズの孫カテゴリー配列
mens_grandchild_array = [['すべて','Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他'], ['すべて','テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ナイロンジャケット','フライトジャケット','ダッフルコート','ピーコート','ステンカラーコート','トレンチコート','モッズコート','チェスターコート','スタジャン','スカジャン','ブルゾン','マウンテンパーカー','ダウンベスト','ポンチョ','カバーオール','その他'], ['すべて','デニム/ジーンズ','ワークパンツ/カーゴパンツ','スラックス','チノパン','ショートパンツ','ペインターパンツ','サルエルパンツ','オーバーオール','その他'], ['すべて','スニーカー','サンダル','ブーツ','モカシン','ドレス/ビジネス','長靴/レインシューズ','デッキシューズ','その他'], ['すべて','ショルダーバッグ','トートバッグ','ボストンバッグ','リュック/バックパック','ウエストポーチ','ボディーバッグ','ドラムバッグ','ビジネスバッグ','トラベルバッグ','メッセンジャーバッグ','エコバッグ','その他'], ['すべて','スーツジャケット','スーツベスト','スラックス','セットアップ','その他'], ['すべて','キャップ','ハット','ニットキャップ/ビーニー','ハンチング/ベレー帽','キャスケット','サンバイザー','その他'], ['すべて','ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','アンクレット','その他'], ['すべて','長財布','折り財布','マネークリップ','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','ネクタイ','手袋','ハンカチ','ベルト','マフラー','ストール','バンダナ','ネックウォーマー','サスペンダー','ウォレットチェーン','サングラス/メガネ','モバイルケース/カバー','手帳','ストラップ','ネクタイピン','カフリンクス','イヤマフラー','傘','レインコート','ミラー','タバコグッズ','その他'], ['すべて','腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], ['すべて','一般水着','スポーツ用','アクセサリー','その他'], ['すべて','ソックス','レギンス/スパッツ','レッグウォーマー','その他'], ['すべて','トランクス','ボクサーパンツ','その他'], ['すべて']]

parent = Category.create(name: 'メンズ')
mens_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  mens_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#ベビー・キッズブロック

#ベビー・キッズの子カテゴリー配列
kids_child_array = ['ベビー服(女の子用) ~95cm','ベビー服(男の子用) ~95cm','ベビー服(男女兼用) ~95cm','キッズ服(女の子用) 100cm~','キッズ服(男の子用) 100cm~','キッズ服(男女兼用) 100cm~','キッズ靴','子ども用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/室内用品','おもちゃ','行事/記念品','その他',]
#ベビー・キッズの孫カテゴリー配列
kids_grandchild_array = [['すべて','トップス','アウター','パンツ','スカート','ワンピース','ベビードレス','おくるみ','下着/肌着','パジャマ','ロンパース','その他'],['すべて','トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他'],['すべて','トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他'], ['すべて','コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(チュニック)','トップス(タンクトップ)','トップス(その他)','スカート','パンツ','ワンピース','セットアップ','パジャマ','フォーマル/ドレス','和服','浴衣','甚平','水着','その他'], ['すべて','コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(その他)','パンツ','セットアップ','パジャマ','フォーマル/ドレス','和服','浴衣','甚平','水着','その他'], ['すべて','コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(その他)','ボトムス','パジャマ','その他'], ['すべて','スニーカー','サンダル','ブーツ','長靴','その他'], ['すべて','靴下/スパッツ','帽子','エプロン','サスペンダー','タイツ','ハンカチ','バンダナ','ベルト','マフラー','傘','手袋','スタイ','バッグ','その他'], ['すべて','おむつ用品','おまる/補助便座','トレーニングパンツ','ベビーバス','お風呂用品','その他'], ['すべて','ベビーカー','抱っこひも/スリング','チャイルドシート','その他'], ['すべて','ミルク','ベビーフード','ベビー用食器','その他'], ['すべて','ベッド','布団/毛布','イス','たんす','その他'], ['すべて','おふろのおもちゃ','がらがら','オルゴール','ベビージム','手押し車/カタカタ','知育玩具','その他'],['すべて','お宮参り用品','お食い初め用品','アルバム','手形/足形','その他'],['すべて','母子手帳用品','その他'], ['すべて']]

parent = Category.create(name: 'ベビー・キッズ')
kids_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  kids_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#コスメ・香水・美容ブロック

#コスメ・香水・美容の子カテゴリー配列
cosme_child_array = ['ベースメイク','メイクアップ','ネイルケア','香水','スキンケア/基礎化粧品','ヘアケア','ボディケア','オーラルケア','リラクゼーション','ダイエット','その他',]
#コスメ・香水・美容の孫カテゴリー配列
cosme_grandchild_array = [['すべて','ファンデーション','化粧下地','コントロールカラー','BBクリーム','CCクリーム','コンシーラー','フェイスパウダー','トライアルセット/サンプル','その他'],['すべて','アイシャドウ','口紅','リップグロス','リップライナー','チーク','フェイスカラー','マスカラ','アイライナー','つけまつげ','アイブロウペンシル','パウダーアイブロウ','眉マスカラ','トライアルセット/サンプル','メイク道具/化粧小物','美顔用品/美顔ローラー','その他'],['すべて','ネイルカラー','カラージェル','ネイルベースコート/トップコート','ネイルアート用品','ネイルパーツ','ネイルチップ/付け爪','手入れ用具','除光液','その他'], ['すべて','香水(女性用)','香水(男性用)','ユニセックス','ボディミスト','その他'], ['すべて','化粧水/ローション','乳液/ミルク','美容液','フェイスクリーム','洗顔料','クレンジング/メイク落とし','パック/フェイスマスク','ジェル/ゲル','ブースター/導入液','アイケア','リップケア','トライアルセット/サンプル','洗顔グッズ','その他'], ['すべて','シャンプー','トリートメント','コンディショナー','リンス','スタイリング剤','カラーリング剤','ブラシ','その他'], ['すべて','オイル/クリーム','ハンドクリーム','ローション','日焼け止め/サンオイル','ボディソープ','入浴剤','制汗/デオドラント','フットケア','その他'], ['すべて','口臭防止/エチケット用品','歯ブラシ','その他'], ['すべて','エッセンシャルオイル','芳香器','お香/香炉','キャンドル','リラクゼーショングッズ','その他'], ['すべて','ダイエット食品','エクササイズ用品','体重計','体脂肪計','その他'], ['すべて','健康用品','看護/介護用品','救急/衛生用品','その他'], ['すべて']]

parent = Category.create(name: 'コスメ・香水')
cosme_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  cosme_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#その他ブロック

#その他の子カテゴリー配列
other_child_array = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']
#その他の孫カテゴリー配列
other_grandchild_array = [['すべて'], ['すべて','ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他'], ['すべて','菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他'], ['すべて','コーヒー','ソフトドリンク','ミネラルウォーター','茶','ウイスキー','ワイン','ブランデー','焼酎','日本酒','ビール、発泡酒','その他'], ['すべて','タオル/バス用品','日用品/生活雑貨','洗剤/柔軟剤','旅行用品','防災関連グッズ','その他'], ['すべて','雑貨','工芸品','家具','印刷物','その他'], ['すべて','筆記具','ノート/メモ帳','テープ/マスキングテープ','カレンダー/スケジュール','アルバム/スクラップ','ファイル/バインダー','はさみ/カッター','カードホルダー/名刺管理','のり/ホッチキス','その他'], ['すべて','オフィス用品一般','オフィス家具','店舗用品','OA機器','ラッピング/包装','その他'], ['すべて']]

parent = Category.create(name: 'その他')
  other_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  other_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

clothes_child_array = ['XXS以下', 'XS(SS)', 'S', 'M', 'L', 'XL(LL)', '2XL(3L)', '3XL(4L)', '4XL(5L以上)', 'FREE SIZE']

parent = Size.create(size: 'clothes_size')
clothes_child_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end

ladies_shoes_array = ['20cm以下', '20.5cm', '21cm', '21.5cm', '22cm', '22.5cm', '23cm', '23.5cm', '24cm', '24.5cm', '25cm', '25.5cm', '26cm', '26.5cm', '27cm', '27.5cm以上']

parent = Size.create(size: 'ladies_shoes')
ladies_shoes_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end

mens_shoes_array = ['23.5cm以下', '24cm', '24.5cm', '25cm', '25.5cm', '26cm', '26.5cm', '27cm', '27.5cm', '28cm', '28.5cm', '29cm', '29.5cm', '30cm', '30.5cm', '31cm以上']

parent = Size.create(size: 'mens_shoes')
mens_shoes_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end

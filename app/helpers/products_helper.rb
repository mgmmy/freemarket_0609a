module ProductsHelper
  def get_size_search
    { 'すべて':'0', '洋服のサイズ':'1', 'メンズ靴のサイズ':'2', 'レディース靴のサイズ':'3', 'スカートのサイズ':'4', 'キッズ服のサイズ':'5', 'ベビー・キッズ靴のサイズ':'6', 'ベビー服のサイズ':'7', 'テレビのサイズ':'8', 'カメラレンズのサイズ':'9', 'オートバイのサイズ':'10', 'ヘルメットのサイズ':'11', 'タイヤのサイズ':'12', 'スキーのサイズ':'13', 'スノーボードのサイズ':'14'}
  end

  def get_price_search
    { '300 ~ 1000':'0', '1000 ~ 5000':'1', '5000 ~ 10000':'2', '10000 ~ 30000':'3', '30000 ~ 50000':'4', '50000 ~':'5' }
  end
end

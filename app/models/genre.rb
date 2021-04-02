class Genre < ActiveHash::Base
  self.date = [
      { id: 1, category_id: 'カテゴリー'}
      { id: 2, product_status_id: '商品の状態'}
      { id: 3, shipping_charge_id: '配送料の負担'}
      { id: 4, prefecture_id: '発送元の地域'}
      { id: 5, days_to_idea_id: '発送までの日数'}
  ]
  end
ActiveRecord::Base.transaction do
  user = User.create!(
    nickname: "さかい",
    email: "aaa@example.com",
    password: "password1",
    profile: "たまにチケットを出品してます。
    sumikaが大好きです。
    何卒、よろしくお願いします＼(^o^)／"
  )

  user2 = User.create!(
    nickname: "木内",
    email: "bbb@example.com",
    password: "password1",
    profile: "行けなくなったチケットを出品しようと思っています。
    miwaをよく聴きます。
    よろしくお願いします😄"
  )

  user3 = User.create!(
    nickname: "たろう",
    email: "ccc@example.com",
    password: "password1",
    profile: "RADWIMPSが大好きです。
    毎日聴いています。
    RAD好きの方いらっしゃったらフォローお願いします！
    https://twitter.com/taro1234"
  )

  Ticket.create!(
    thumbnail: File.open("#{Rails.root}/app/assets/images/radwimps.png"),
    event_name: "RADWIMPS ファン感謝祭",
    event_date: "2021-05-31",
    venue: "三重県営サンアリーナ",
    shipping: rand(3) + 1,
    delivery_method: "チケット郵送",
    number_of_sheets: rand(4) + 1,
    price: (rand(10)+1) * 1000,
    description: "複数チケットが当たったので、出品します。\nできればいつもRADを応援しているファンに譲りたいです。\nよろしくお願いします！！",
    seller: user
  )

  Ticket.create!(
    thumbnail: File.open("#{Rails.root}/app/assets/images/miwa.png"),
    event_name: "miwa ドームツアー2021",
    event_date: "2021-06-03",
    venue: "ナゴヤドーム",
    shipping: rand(3) + 1,
    delivery_method: "現地で手渡し",
    number_of_sheets: rand(4) + 1,
    price: (rand(10)+1) * 1000,
    description: "友人が行けなくなったため、一緒に参戦してくれる方を募集します。\nmiwa好きの方だとうれしいです😊\nよろしくお願いします！",
    seller: user2
  )


  Ticket.create!(
    thumbnail: File.open("#{Rails.root}/app/assets/images/yonfes.png"),
    event_name: "YONFES 2022",
    event_date: "2021-04-03",
    venue: "愛知県長久手市茨ケ廻間乙1533-1 モリコロパーク",
    shipping: rand(3) + 1,
    delivery_method: "名古屋駅手渡し",
    number_of_sheets: rand(4) + 1,
    price: (rand(10)+1) * 1000,
    description: "仕事で行けなくなりました。無念です。\nどなたか代わりに楽しんでください。\nチケットは最初に購入希望してくださった方にお譲りします。",
    seller: user
  )

  room = Room.create!
  Entry.create!(
    user: user,
    room: room
  )
  Entry.create!(
    user: user2,
    room: room
  )
  100.times do |n|
    Message.create!(
      user: user2,
      room: room,
      content: "Hello, World #{n}回目"
    )
  end
end

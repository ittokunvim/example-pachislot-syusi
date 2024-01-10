# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

blance = Blance.create!(
  date: Date.parse("2023-10-27"),
  category: "スロット",
  name: "スマスロ北斗の拳",
  investment_money: 40000,
  recovery_money: 10000,
  investment_saving: nil,
  recovery_saving: 4000,
  rate: 21.73,
  store: "マルハン",
  note: "北斗の拳の台が空いていたので座った。",
)
puts "Blance count: #{Blance.count}"

Blance.create!(
  date: Date.parse("2023-10-27"),
  category: "パチンコ",
  name: "新世紀エヴァンゲリオン〜未来への咆哮〜",
  investment_money: 20000,
  recovery_money: nil,
  investment_saving: nil,
  recovery_saving: 2000,
  rate: 4.0,
  store: "スーパーコスモプレミアム",
  note: "エヴァの台が空いていたので座った。",
)
puts "Blance count: #{Blance.count}"

blance.create_history_order!
puts "HistoryOrder count: #{HistoryOrder.count}"

blance.images.attach(
  io: File.open(Rails.root.join("test/fixtures/files/300x300.png")),
  filename: "blance.png"
)
puts "blance images count: #{blance.images.count}"

history1 = blance.histories.create!(
  game_count: 3,
  chance: "BB",
  investment: "3000円",
  memo: "ボーナス3回",
)
puts "History count: #{History.count}"

history2 = blance.histories.create!(
  game_count: 2,
  chance: "RB",
  investment: "2000円",
  memo: "ボーナス2回",
)
puts "History count: #{History.count}"

history3 = blance.histories.create!(
  game_count: 1,
  chance: "BB",
  investment: "1000円",
  memo: "ボーナス1回",
)
puts "History count: #{History.count}"

history_ids = [history3.id, history2.id, history1.id]
blance.history_order.order = history_ids.join(",")
blance.history_order.save!
puts "history_order updated"

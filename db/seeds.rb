# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Blance.create!(
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

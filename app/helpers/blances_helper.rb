module BlancesHelper
  def display_money(money)
    return "0円" if money.nil?

    ActionController::Base.helpers.number_to_currency(money, unit: '円', precision: 0)
  end

  def show_display_saving(saving, rate)
    return "0玉/枚 (0円)" if saving.nil?
    return "#{saving}玉/枚 (0円)" if rate.nil?

    "#{saving}玉/枚 (#{ActionController::Base.helpers.number_to_currency(saving * rate, unit: '円', precision: 0)})"
  end

  def show_display_rate(rate)
    case rate
    when 4.0 then "25玉/枚 (4円)"
    when 1.0 then "100玉/枚 (1円)"
    when 21.73 then "4.6玉/枚 (21.73円)"
    when 5.43 then "18.4玉/枚 (5.43円)"
    else "-"
    end
  end
end

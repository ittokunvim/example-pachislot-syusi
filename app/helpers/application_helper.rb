module ApplicationHelper
  def page_title(page_title = "")
    base_title = ConstantParameters::SITENAME

    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  def default_meta_tags
    {
      site: "パチスロ収支アプリ",
      title: "パチスロの収支を記録するサービス",
      description: "パチスロ収支アプリを使えば、パチスロの収支を記録することができます。",
      keywords: "パチスロ,パチンコ,スロット,収支",
      charset: "utf-8",
      separator: "|",
      canonical: request.original_url,
      og: {
        title: :title,
        type: "website",
        url: request.original_url,
        image: image_url("ogp.png"),
        locale: "ja_JP"
      },
      twitter: {
        card: "summary",
        site: "@ittokunvim",
        image: image_url("ogp.png")
      }
    }
  end
end

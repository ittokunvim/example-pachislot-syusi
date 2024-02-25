module ApplicationHelper
  def default_meta_tags
    sitename = ConstantParameters::SITENAME

    {
      site: sitename,
      title: "パチスロの収支を記録するサービス",
      description: "#{sitename}を使えば、パチスロの収支を記録することができます。",
      keywords: "#{sitename},パチスロ,パチンコ,スロット,収支",
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

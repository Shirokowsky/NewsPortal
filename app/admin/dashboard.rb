ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section 'Recent articles' do
      h1 'Total articles ' + Article.all.size.to_s
      table_for Article.all.limit(5) do
        column :title
        column :description
      end
      strong { link_to 'All articles', admin_articles_path }
    end

    hr
    h1 'Total users ' + User.all.size.to_s + ' and today registered ' + User.created_today.size.to_s

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Articles" do
    #       ul do
    #         Article.recent(5).map do |article|
    #           li link_to(article.title, admin_post_path(article))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

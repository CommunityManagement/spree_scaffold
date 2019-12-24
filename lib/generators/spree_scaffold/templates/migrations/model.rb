class CreateSpree<%= class_name.pluralize %> < SpreeExtension::Migration[4.2]
  def up
    create_table :spree_<%= table_name %> do |t|
<% attributes.each do |attribute| -%>
<% next if attribute.type == :image || attribute.type == :file -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
<% unless options[:skip_timestamps] -%>
      t.timestamps
<% end -%>
    end
  end

  def down
    drop_table :spree_<%= table_name %>
  end
end

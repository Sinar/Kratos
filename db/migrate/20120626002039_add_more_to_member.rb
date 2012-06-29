class AddMoreToMember < ActiveRecord::Migration
  def change
    add_column :members, :more, :text, :after => :birthday
  end
end

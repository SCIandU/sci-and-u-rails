class AddPaperclipToHealthResource < ActiveRecord::Migration
  def change
  	add_attachment :health_resources, :thumbnail  	
  end
end

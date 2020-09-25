class AddSurveysNewTwo < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :survey_id, :integer
  end
end

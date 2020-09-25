RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model BlogPost do
    edit do
      field :title, :string
      field :user_id, :enum do
        enum do
          User.all.collect { |p| [p.email, p.id] }
        end
      end
      #field :content, :ck_editor
      field :content, :text
      field :department_id, :enum do
        enum do
          Department.all.collect { |p| [p.name, p.id] }
        end
      end
      field :sponsor_id, :enum do
        enum do
          Sponsor.all.collect { |p| [p.name, p.id] }
        end
      end
      field :attachment, :carrierwave
      field :published, :boolean
    end
  end

  # config.model Survey do
  #   edit do
  #     field :department_id, :enum do
  #       enum do
  #         Department.all.collect { |p| [p.name, p.id] }
  #       end
  #     end
  #     field :name, :string      
  #     field :description, :ck_editor
  #     field :survey_total, :integer            
  #     field :published, :boolean
  #   end
  # end  

  config.model HealthResource do
    edit do
      field :title, :string
      #field :description, :ck_editor
      field :description, :text
      field :url, :string
      field :for_coaching, :boolean      
      field :us, :boolean       
      field :published, :boolean
      field :user_id, :enum do
        enum do
          User.all.collect { |p| [p.email, p.id] }
        end
      end
      field :department_id, :enum do
        enum do
          Department.all.collect { |p| [p.name, p.id] }
        end
      end
      field :problem_id, :enum do
        enum do
          Problem.all.collect { |p| [p.name, p.id] }
        end
      end
      field :solution_category_id, :enum do
        enum do
          SolutionCategory.all.collect { |p| [p.name, p.id] }
        end
      end
      field :sponsor_id, :enum do
        enum do
          Sponsor.all.collect { |p| [p.name, p.id] }
        end
      end
      field :attachment, :carrierwave
    end
  end

  config.model ScriptsAndTip do
    edit do
      field :script, :text
      field :repeat_script, :text      
      field :tip, :text
      field :us, :boolean         
      #field :script, :ck_editor
      #field :tip, :ck_editor
      field :department_id, :enum do
        enum do
          Department.all.collect { |p| [p.name, p.id] }
        end
      end
      field :solution_category_id, :enum do
        enum do
          SolutionCategory.all.collect { |p| [p.name, p.id] }
        end
      end
    end
  end
end

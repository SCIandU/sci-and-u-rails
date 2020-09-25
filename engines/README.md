How to Install Plugins

Creating a plugin from scratch:

Instructions gathered from https://guides.rubyonrails.org/engines.html
1. Generate the engine with the following command:
    rails plugin new NAME —mountable
the mountable is KEY - it will provide the full folders for MVC
2. Navigate to the engine’s gemspec file 
    1. Remove any instance of TODO:homepage = “”summery = “Summary of engine"description = “Description of Engine”
    2. This is going to create the lib files that will tell the rails app that there’s an engine there:
        - lib/engine_name.rb
        - lib/engine_name/engine.rb
        - define a module with the same name as the engine
Now you may insert your engine with name 'engine_name' as a gem in your app's Gemfile:
    gem 'engine_name', path: 'path/to/engine_name'
3. Notice the app/controllers dir 
    1. The file application_controller, provides common functionality for the controller of the engine 
    2. Put all your controllers in this directory
4. Functionality 
    1. This can be implemented like 
5. Hooking it into the application
    1. Mounting the engine
        ensure the engine is specified as a gem, and the bundler installs correctly
    2. Engine setup
        if there are any database migrations, you will need to also create them in the main applications database
        Run this command:
        rails engine_name:install:migrations

Other notes to clean up your code (inheritance, optimizing modules) are at the link!
    
Transforming monolithic Rails apps into Engines
All instructions can be found at https://medium.com/@dineshpanda92/how-i-created-engines-from-monolithic-ruby-on-rails-application-698574565698


1.  Make a new engines directory (if it doesn’t already exist)
2. create a new engine to move your app over into!
    to create a new rails engine named engine_name:
    rails plugin new engine_name --mountable 
2. In the file’s gem spec:
    1. Edit the gem spec to customize the homepage, summary
    2. If your app has dependencies, move all of them to the gem spec 
        1. e.g. s.add_dependency 'rails', '>=5.0'
        2. any 'gem' in the app's gemfile needs to be in the respective engine's gemspec
3. Add the new engine as a gem to the main app’s Gemfile
    rails 'new_engine', path:'path/to/engine'
4. Extracting configurations 
    1. All dependent config files moved to the new engine
5. Extracting routes 
    1. Copy the relevant routes for the engine
    2. Since you can't declare a "root" in the engine without conflicting with the app's root, I suggest declaring it explicitly 

    get "/", to: "home#new"
6.   Copy all relevant controller classes into the engine/app/controller/engine_name directory 
    1. when copying the controllers over, ensure they are under the module specified in lib/engine_name/engine.rb (parameter of isolate_namespace)
    
    e.g.
    require_dependency "engine_name/application_controller"
    module EngineName
        class ExampleController > Application Controller
        end

7. Moving all the related views folders from the app to the engine directory app/views/engine_name directory (except layout, which is moved into app/views)
    1. If you want to edit the dropdown menu, you need to go into the main app
8. Moving all models from the app to the engine 
    1. you must not rewrite associations in engine_name models to establish the connectin between engine_name and your main app
        (to see the full instructions on this challenge, view the link provided)
9. install all migrations from the new engine into the main app 
10. mount the engine in your applications routes.rb
      mount engine_name::Engine => "/path"
      - then, when entering localhost/path, it will display your application
      - all of the subsequent paths in your engine will have the prefix of /path

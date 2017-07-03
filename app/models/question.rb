class Question < ActiveRecord::Base
    def index
      @questions  = Question.all
    end
    
    def show
        
    end
    
    def new
    end
    
    def edit
        
    end
end

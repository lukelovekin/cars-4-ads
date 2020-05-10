class ApplicationController < ActionController::Base
    # remove below asap
    def index
        render plain: param
    end
end

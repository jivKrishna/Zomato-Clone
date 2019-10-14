class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def signed_in?
      !!current_user
    end

    def is_admin?
      if current_user != nil
        current_user.admin
      else
        false
      end
    end

    def authenticate_user!
      redirection_path unless signed_in?
    end

    def authenticate_admin!
      redirection_path unless is_admin? 
    end

    def redirection_path
      if is_admin?
        redirect_to current_user
      else
        redirect_to root_path
      end
    end

    def current_order
      if session[:order_id].present? 
        @current_order ||=  current_user.orders.find_by(
                        id: session[:order_id], restaurant_id: params[:restaurant_id], status: 0
                      )
        if @current_order.nil?
          @current_order ||= current_user.orders.find_by(restaurant_id: params[:restaurant_id], status: 0)

          if @current_order.nil?
            @current_order = current_user.orders.create(restaurant_id: params[:restaurant_id])
          end

          session[:order_id] = @current_order.id
        end
        return @current_order
      elsif session[:order_id].nil? && current_user
        @current_order = current_user.orders.create(restaurant_id: params[:restaurant_id])
        session[:order_id] = @current_order.id
        return @current_order
      end
    end

    # def current_order
    #   if session[:order_id]
    #     @current_order ||= current_user.orders.find_by(id: session[:order_id])
    #     return @current_order

    #   elsif session[:order_id].nil? || current_user.orders.find_by(id: session[:order_id]).restaurant_id != params[:restaurant_id]
    #     @current_order = current_user.orders.create(restaurant_id: params[:restaurant_id])
    #     session[:order_id] = @current_order.id
    #     return @current_order

    #   end
    # end

    # def current_order
    #   if session[:order_id]
    #     @current_order ||= Order.find_by_id(session[:order_id])

    #     return @current_order

    #   elsif session[:order_id].nil?

    #     @current_order = current_user.orders.build
    #     @current_order.restaurant_id = params[:restaurant_id]

    #     if @current_order.save
    #       session[:order_id] = @current_order.id
    #     end
    #     return @current_order

    #   end
    # end

  helper_method :current_user, :current_order, :signed_in?, :is_admin?, :authenticate_user!, :authenticate_admin!, :redirection_path
end